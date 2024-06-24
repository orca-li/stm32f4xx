#include <stdio.h>
#include <stddef.h>
#include <stdint.h>

#include "scb_list.h"
#include "intrinsics/stm32f4asm.h"
#include "debug/logger.h"
#include "rtos/threads.h"

#include "software/red_blink.h"

volatile uint32_t ticks;

void systick_handler (void)
{
    ticks++;
    printf("t");

    __disable_irq();
    OS_Sheduler();
    __enable_irq();
}

void pendsv_handler (void)
{
    printf("Current: %p\tNext: %p\n", Current_Thread, Next_Thread);
    asm volatile(
        /* __disable_irq(); */
        "cpsid i                \n"

        /* if (Current_Thread != NULL) { */
        "ldr r1,=Current_Thread \n"
        "ldr r1,[r1,#0x00]      \n"
        "cbz r1,pendsv_restore  \n"

        /* push registers r4-r11 on the stack */
        "push {r4-r11}          \n"

        /* Current_Thread->sp = sp; */
        "ldr r1,=Current_Thread \n"
        "ldr r1,[r1,#0x00]      \n"
        "ldr sp,[r1,#0x00]      \n"
        /* } */

    "pendsv_restore:            \n"
        /* sp = Next_Thread->sp; */
        "ldr r1,=Next_Thread    \n"
        "ldr r1,[r1,#0x00]      \n"
        "ldr sp,[r1,#0x00]      \n"

        /* Current_Thread = Next_Thread */
        "ldr r1,=Next_Thread    \n"
        "ldr r1,[r1,#0x00]      \n"
        "ldr r2,=Current_Thread \n"
        "str r1,[r2,#0x00]      \n"

        /* pop registers r4-r11 */
        "pop {r4-r11}           \n"

        /* __enable_irq() */
        "cpsie i                \n"

        /* return to the next thread */
        "bx lr                  \n"
    );
}