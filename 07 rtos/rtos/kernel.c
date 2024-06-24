#include <stdio.h>

#include "kernel.h"
#include "threads.h"
#include "driver/scb.h"

#include "software/green_blink.h"
#include "software/red_blink.h"

void rtos (void)
{
    *(uint32_t volatile *)0xE000ED20 = (0xFFu << 16); /* SHPR3 PendSV */
    *(uint32_t volatile *)0xE000ED20 = (0x00u << 24); /* SHPR3 SysTick */

    OS_Start_Thread(
        &Green_Blink.sp,
        &body_green_blink,
        Green_Blink.stack, sizeof(Green_Blink.stack)
    );

    OS_Start_Thread(
        &Red_Blink.sp,
        &body_red_blink,
        Red_Blink.stack, sizeof(Red_Blink.stack)
    );

    scb_set_pendsv();
}