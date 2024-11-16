#include <CMWrap.h>
#include <include/threads.h>
#include <include/kernel.h>
#include <stdio.h>

/* remove BEGIN */
extern tcb tcbGreenBlink;
extern tcb tcbRedBlink;
/* remove END */

tcb * volatile next_thread = NULL;
tcb * volatile current_thread = NULL;

void rtos_start(void)
{
    NVIC_EnableIRQ(PendSV_IRQn);
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    NVIC_SetPriority(SysTick_IRQn, 0x00);
}

void kernel_sheduler(void)
{
    next_thread = (current_thread == &tcbGreenBlink) ? &tcbRedBlink : &tcbGreenBlink;

    if (current_thread != next_thread)
    {
        __pendsv_ipt();
    }
}

extern uint32_t aThreadGreenBlinkStack[];
extern uint32_t aThreadRedBlinkStack[];

#define DUMP_LENGTH (32 + 32)
void stack_dump(void)
{
    uint32_t *sp1 = &aThreadRedBlinkStack[0];
    sp1 -= 16;

    uint32_t *sp2 = &aThreadGreenBlinkStack[0];
    sp2 -= 16;

    printf("Red Stack(%p)\tGreen Stack(%p)\r\n", aThreadRedBlinkStack, aThreadGreenBlinkStack);
    for(uint32_t i = 0; i < DUMP_LENGTH; i++)
    {
        printf("&%p: %8lx\t:: &%p %8lx\r\n", sp1, *sp1, sp2, *sp2);
        sp1 += 1;
        sp2 += 1;

        if (i == 16 || i == (DUMP_LENGTH - 16)) printf("\n");
    }

    for(uint8_t i = 0; i < 3; i++)
    {
        printf("=========================================\n");
    }
    printf("\n\n");
}


#if 0
void PendSV_Handler(void)
{
    __disable_irq();

    if (current_thread != NULL)
    {
        /* current_thread->sp = sp */
        __asm volatile (
            "ldr r1,=current_thread     \n"
            "ldr r1,[r1,#0x00]          \n"
            "mov r0,sp                  \n"
            "str r0,[r1,#0x00]          \n"
        );

        /* push registers r4-r11 on the stack */
        __asm volatile (
            "push {r4-r11}              \n"
        );
    }

    /* sp = next_thread->sp */
    __asm volatile (
        "ldr r1,=next_thread        \n"
        "ldr r1,[r1,#0x00]          \n"
        "ldr r0,[r1,#0x00]          \n"
        "mov sp,r0                  \n"
    );

    /* current_thread = next_thread */
    __asm volatile (
        "ldr r1,=next_thread        \n"
        "ldr r1,[r1,#0x00]          \n"
        "ldr r2,=current_thread     \n"
        "str r1,[r2,#0x00]          \n"
    );

    /* pop registers r4-r11 */
    __asm volatile (
        "pop {r4-r11}               \n"
    );

    __enable_irq();

    __asm volatile(
        "bx lr                      \n"
    );
}
#endif

void PendSV_Handler(void)
{
__asm volatile (
    /* __disable_irq(); */
    "  CPSID         I                 \n"

    /* if (OS_curr != (OSThread *)0) { */
    "  LDR           r1,=current_thread       \n"
    "  LDR           r1,[r1,#0x00]     \n"
    "  CMP           r1,#0             \n"
    "  BEQ           pendsv_restore    \n"

    /*     push registers r4-r11 on the stack */
#if (__ARM_ARCH == 6)               // if ARMv6-M...
    "  SUB           sp,sp,#(8*4)     \n" // make room for 8 registers r4-r11
    "  MOV           r0,sp            \n" // r0 := temporary stack pointer
    "  STMIA         r0!,{r4-r7}      \n" // save the low registers
    "  MOV           r4,r8            \n" // move the high registers to low registers...
    "  MOV           r5,r9            \n"
    "  MOV           r6,r10           \n"
    "  MOV           r7,r11           \n"
    "  STMIA         r0!,{r4-r7}      \n" // save the high registers
#else                               // ARMv7-M or higher
    "  PUSH          {r4-r11}          \n"
#endif                              // ARMv7-M or higher

    /*     OS_curr->sp = sp; */
    "  LDR           r1,=current_thread    \n"
    "  LDR           r1,[r1,#0x00]     \n"
    "  MOV           r0,sp             \n"
    "  STR           r0,[r1,#0x00]     \n"
    /* } */

    "pendsv_restore:                   \n"
    /* sp = OS_next->sp; */
    "  LDR           r1,=next_thread       \n"
    "  LDR           r1,[r1,#0x00]     \n"
    "  LDR           r0,[r1,#0x00]     \n"
    "  MOV           sp,r0             \n"

    /* OS_curr = OS_next; */
    "  LDR           r1,=next_thread       \n"
    "  LDR           r1,[r1,#0x00]     \n"
    "  LDR           r2,=current_thread    \n"
    "  STR           r1,[r2,#0x00]     \n"

    /* pop registers r4-r11 */
#if (__ARM_ARCH == 6)               // if ARMv6-M...
    "  MOV           r0,sp             \n" // r0 := top of stack
    "  MOV           r2,r0             \n"
    "  ADD           r2,r2,#(4*4)      \n" // point r2 to the 4 high registers r7-r11
    "  LDMIA         r2!,{r4-r7}       \n" // pop the 4 high registers into low registers
    "  MOV           r8,r4             \n" // move low registers into high registers
    "  MOV           r9,r5             \n"
    "  MOV           r10,r6            \n"
    "  MOV           r11,r7            \n"
    "  LDMIA         r0!,{r4-r7}       \n" // pop the low registers
    "  ADD           sp,sp,#(8*4)      \n" // remove 8 registers from the stack
#else                               // ARMv7-M or higher
    "  POP           {r4-r11}          \n"
#endif                              // ARMv7-M or higher

    /* __enable_irq(); */
    "  CPSIE         I                 \n"

    /* return to the next thread */
    "  BX            lr                \n"
    );
}

extern uint32_t ticks;

volatile uint32_t kernel_ipt = 0;

void SysTick_Handler(void)
{
    ticks++;

    if (kernel_ipt != 0)
    {
        kernel_sheduler();
    }
}