#include <stdint.h>
#include <stdio.h>

#include "threads.h"
#include "software/red_blink.h"
#include "software/green_blink.h"

OS_Thread * volatile Current_Thread;
OS_Thread * volatile Next_Thread;

void OS_Sheduler (void)
{
    printf("Sheduler\n");
    if (Current_Thread == &Red_Blink.sp) {
        Next_Thread = &Green_Blink.sp;
    } else {
        Next_Thread = &Red_Blink.sp;
    }

    if (Next_Thread != Current_Thread) {
        /* System handler priority register 3 (SHPR3) */
        /* PM0214 */
        /* Set very low priority pendsv */
        *(uint32_t volatile *)0xE000ED20 = (0xFFu << 16);
        
    }
}

void OS_Start_Thread (OS_Thread *me, OS_Thread_Handler handler, void *stkSto, uint32_t stkSize)
{
    const uint32_t align = 8;
    uint32_t *stk_limit;

    uint32_t *sp = (uint32_t*)(
        (
            (
                (uint32_t)stkSto + stkSize
            ) / align
        ) * align
    );
    *(--sp) = (1u << 24); /* xPSR */
    *(--sp) = (uint32_t)handler; /* PC */
    *(--sp) = 0x0000000Eu; /* LR */
    *(--sp) = 0x0000000Cu; /* R12 */
    *(--sp) = 0x00000003u; /* R3 */
    *(--sp) = 0x00000002u; /* R2 */
    *(--sp) = 0x00000001u; /* R1 */
    *(--sp) = 0x00000000u; /* R0 */
    /* additionally, fake registers R4-R11 */
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
    stk_limit = (uint32_t*)(
        (
            (
                (
                    ((uint32_t)stkSto - 1u)
                ) / align
            ) + 1u
        ) * align
    );

    /* pre-fill the unused part of the stack with 0xDEADBEEF */
    for (sp = sp - 1u; sp >= stk_limit; --sp) {
        *sp = 0xDEADBEEFu;
    }
}