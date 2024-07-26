#include <stdio.h>

#include "systick.h"
#include "debug/logger.h"

static inline void SysTick_Config (uint32_t ticks);

void systick_init (uint32_t ticks)
{
    SysTick_Config(ticks);
}

static inline void SysTick_Config (uint32_t ticks)
{
    if ((ticks - 1) > 0xFFFFFF) { /* systick timer 24bit */
        return;
    }

    STK_LOAD = ticks - 1;
    STK_VAL = 0;
    STK_CTRL = CLKSOURCE | TICKINT | COUNTENABLE;
    RCC_APB2ENR |= SYSCFGEN;
}

void delay_ms (uint32_t millieconds)
{
    uint32_t start = ticks;
    uint32_t end = start + millieconds;

    if (end < start) {
        while(ticks > start);
    }

    while (ticks < end);
}