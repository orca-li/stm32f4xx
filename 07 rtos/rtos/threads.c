#include <stdio.h>
#include <stdbool.h>

#include "rtos/threads.h"
#include "driver/systick.h"
#include "software/thread1.h"
#include "software/thread2.h"

/* pointer to the threads */
th_tcb * volatile Current_Thread;
th_tcb * volatile Next_Thread; /* next thread to run */

void Thread_Scheduler (void) 
{
    // printf("sheduler\n");
    /* Next_Thread = ... */
    if (Current_Thread == th_body_1.Thread_Control_Block.sp) {
        printf("swap {if}\n");
        Current_Thread = th_body_2.Thread_Control_Block.sp;
    } else if (Current_Thread == th_body_1.Thread_Control_Block.sp) {
        printf("swap {else}\n");
        Current_Thread = th_body_2.Thread_Control_Block.sp;
    }

    if (Next_Thread != Current_Thread) {
        *(uint32_t volatile *)0xE000ED04 = (1u << 28);
    }
}

void New_Thread (thread *new_thread)
{
    printf("Task Manager:%s launched\n", new_thread->Name);
    const uint32_t align = 8;
    uint32_t *stack_limit;
    uint32_t *sp = 
    (uint32_t*)(
        (
            (
                (uint32_t)new_thread->Thread_Control_Block.sp + new_thread->Stack_Size
            ) / align
        ) * align
    );

    *(--sp) = (1 << 24); /* xPSR */
    *(--sp) = (uint32_t)new_thread->Handler; /* PC */
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
    new_thread->Thread_Control_Block.sp = sp;

    /* round up the bottom of the stack to the 8-byte boundary */
    stack_limit = (uint32_t*)(
        (
            (
                (
                    (uint32_t)new_thread->Thread_Control_Block.sp - 1u
                ) / align
            ) + 1u
        ) * align
    );

    /* pre-fill the unused part of the stack with 0xDEADBEEFu */
    for (sp = sp - 1u; sp >= stack_limit; --sp) {
        *sp = 0xDEADBEEFu;
    }

    printf("Task Manager:%s launched\n", new_thread->Name);
}