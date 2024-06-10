#include <stdio.h>
#include <stdbool.h>

#include "rtos/threads.h"
#include "driver/systick.h"

/* pointer to the threads */
thread * volatile th_current; 
thread * volatile th_next; /* next thread to run */

/* thread body 1 */
uint32_t th_stack_loop1[40];
thread th_loop1;
static void handler_loop1(void);

/* thread body 2 */
uint32_t th_stack_loop2[40];
thread th_loop2;
static void handler_loop2(void);

/* api */
static void new_thread(thread *me, th_handler handler, void *th_stack, uint32_t stack_size);

void th_body (void)
{
    new_thread(
        &th_loop1,
        &handler_loop1,
        th_stack_loop1, sizeof(th_stack_loop1)
    );
    new_thread(
        &th_loop2,
        &handler_loop2,
        th_stack_loop2, sizeof(th_stack_loop2)
    );
}

/* bodys */
void handler_loop1 (void)
{
    while(true) {
        printf("threads: loop 1: delay 2000ms\n");
        delay_ms(2000);
    }
}

void handler_loop2 (void)
{
    while(true) {
        printf("threads: loop 2: delay 3500ms\n");
        delay_ms(3500);
    }
}

/* api */
static void new_thread (thread *me, th_handler handler, void *th_stack, uint32_t stack_size)
{
    const uint32_t align = 8;
    uint32_t *sp = (uint32_t*)((((uint32_t)th_stack + stack_size) / align) * align);
    uint32_t *stack_limit;

    *(--sp) = (1 << 24); /* xPSR */
    *(--sp) = (uint32_t)handler; /* PC */
    *(--sp) = 0x0000000Eu; /* LR */
    *(--sp) = 0x0000000Cu; /* R12 */
    *(--sp) = 0x00000003u; /* R3 */
    *(--sp) = 0x00000002u; /* R2 */
    *(--sp) = 0x00000001u; /* R1 */
    *(--sp) = 0x00000000u; /* R0 */
    /* additionaly, fake registers R4-R11 */
    *(--sp) = 0x0000000Bu; /* R11 */
    *(--sp) = 0x0000000Au; /* R10 */
    *(--sp) = 0x00000009u; /* R9 */
    *(--sp) = 0x00000008u; /* R8 */
    *(--sp) = 0x00000007u; /* R7 */
    *(--sp) = 0x00000006u; /* R6 */
    *(--sp) = 0x00000005u; /* R5 */
    *(--sp) = 0x00000004u; /* R4 */

    /* save the top of the stack in the thread's attribute */
    me->sp = sp;

    /* round up the bottom of the stack to the 8-byte boundary */
    stack_limit = (uint32_t*)(((((uint32_t)th_stack - 1u) / align) + 1u) * align);

    /* pre-fill the unused part of the stack with 0xDEADBEEFu */
    for (sp = sp - 1u; sp >= stack_limit; --sp) {
        *sp = 0xDEADBEEFu;
    }
}

void th_schedule (void)
{
    /* th_next = ... */
    if (th_current == &th_loop1) {
        th_current = &th_loop2;
    } else if (th_current == &th_loop1) {
        th_current = &th_loop2;
    }

    if (th_next != th_current) {
        *(uint32_t volatile *)0xE000ED04 = (1u << 28);
    }
}