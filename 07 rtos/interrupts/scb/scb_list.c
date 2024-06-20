#include <stdio.h>
#include <stddef.h>
#include <stdint.h>

#include "scb_list.h"
#include "intrinsics/stm32f4asm.h"
#include "rtos/threads.h"

volatile uint32_t ticks;

void pendsv_restore(void);

void systick_handler (void)
{
    ticks++;
    _disable_irq();
    Thread_Scheduler();
    _enable_irq();
}

void pendsv_handler (void)
{
    _disable_irq();

    if (Current_Thread != (th_tcb *)0) {
        __asm ("push {r4-r11}");

        /* Current_Thread->sp = sp */
        __asm (
            "ldr r1,=Current_Thread     \n"
            "ldr r1,[r1,#00]            \n"
            "str sp,[r1,#00]            \n"
        );

        pendsv_restore();
        __asm ("push {r4-r11}");
    }

    _enable_irq();
    __asm ("bx lr");
}

void pendsv_restore (void)
{
    __asm (
            "ldr r1,=Next_Thread    \n"
            "ldr r1,[r1,#00]        \n"
            "ldr r2,=Current_Thread  \n"
            "str r1,[r2,#00]        \n"
    );
}
// /* inline assembly syntax for GNU-ARM */
// __attribute__ ((naked, optimize("-fno-stack-protector")))
// void pendsv_handler (void)
// {
//     __asm  volatile (
//     /* __disable_irq() */
//     "cpsid i                \n"

//     /* if (Current_Thread != (thread *)0) { */
//     "ldr r1,=Current_Thread     \n"
//     "ldr r1,[r1,#0x00]      \n"
//     "cbz r1,pendsv_restore  \n"

//     /* push registers r4-r11 on the stack */
    // "push {r4-r11}          \n"

//     /* Current_Thread->sp = sp */
//     "ldr r1,=Current_Thread     \n"
//     "ldr r1,[r1,#00]        \n"
//     "str sp,[r1,#00]        \n"
    
//     "pendsv_restore:        \n"
//     /* sp = Next_Thread->sp */
//     "ldr r1,=Next_Thread        \n"
//     "ldr r1,[r1,#00]        \n"
//     "ldr r2,Current_Thread      \n"
//     "str r1,[r2,#00]        \n"

//     /* pop registers r4-r11 on the stack */
//     "pop {r4-r11}           \n"

//     /* __enable_irq(); */
//     "cpsie i                \n"

//     /* return to the next thread */
//     "bx lr                  \n"
//     );
// }

// /* inline assembly syntax for GNU-ARM */
// __attribute__ ((naked, optimize("-fno-stack-protector")))
// void pendsv_handler(void) {
// __asm volatile (
//     /* __disable_irq(); */
//     "  CPSID         I                 \n"

//     /* if (OS_curr != (OSThread *)0) { */
//     "  LDR           r1,=th_current       \n"
//     "  LDR           r1,[r1,#0x00]     \n"
//     "  CMP           r1,#0             \n"
//     "  BEQ           pendsv_restore    \n"

//     /*     push registers r4-r11 on the stack */
// #if (__ARM_ARCH == 6)               // if ARMv6-M...
//     "  SUB           sp,sp,#(8*4)     \n" // make room for 8 registers r4-r11
//     "  MOV           r0,sp            \n" // r0 := temporary stack pointer
//     "  STMIA         r0!,{r4-r7}      \n" // save the low registers
//     "  MOV           r4,r8            \n" // move the high registers to low registers...
//     "  MOV           r5,r9            \n"
//     "  MOV           r6,r10           \n"
//     "  MOV           r7,r11           \n"
//     "  STMIA         r0!,{r4-r7}      \n" // save the high registers
// #else                               // ARMv7-M or higher
//     "  PUSH          {r4-r11}          \n"
// #endif                              // ARMv7-M or higher

//     /*     OS_curr->sp = sp; */
//     "  LDR           r1,=th_current    \n"
//     "  LDR           r1,[r1,#0x00]     \n"
//     "  MOV           r0,sp             \n"
//     "  STR           r0,[r1,#0x00]     \n"
//     /* } */

//     "pendsv_restore:                   \n"
//     /* sp = OS_next->sp; */
//     "  LDR           r1,=th_next       \n"
//     "  LDR           r1,[r1,#0x00]     \n"
//     "  LDR           r0,[r1,#0x00]     \n"
//     "  MOV           sp,r0             \n"

//     /* OS_curr = OS_next; */
//     "  LDR           r1,=th_next       \n"
//     "  LDR           r1,[r1,#0x00]     \n"
//     "  LDR           r2,=th_current    \n"
//     "  STR           r1,[r2,#0x00]     \n"

//     /* pop registers r4-r11 */
// #if (__ARM_ARCH == 6)               // if ARMv6-M...
//     "  MOV           r0,sp             \n" // r0 := top of stack
//     "  MOV           r2,r0             \n"
//     "  ADD           r2,r2,#(4*4)      \n" // point r2 to the 4 high registers r7-r11
//     "  LDMIA         r2!,{r4-r7}       \n" // pop the 4 high registers into low registers
//     "  MOV           r8,r4             \n" // move low registers into high registers
//     "  MOV           r9,r5             \n"
//     "  MOV           r10,r6            \n"
//     "  MOV           r11,r7            \n"
//     "  LDMIA         r0!,{r4-r7}       \n" // pop the low registers
//     "  ADD           sp,sp,#(8*4)      \n" // remove 8 registers from the stack
// #else                               // ARMv7-M or higher
//     "  POP           {r4-r11}          \n"
// #endif                              // ARMv7-M or higher

//     /* __enable_irq(); */
//     "  CPSIE         I                 \n"

//     /* return to the next thread */
//     "  BX            lr                \n"
//     );
// }