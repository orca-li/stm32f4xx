#include "include/systick.h"
#include "include/rcc.h"

volatile uint32_t ticks;

static inline void SysTick_Config (uint32_t ticks);

void systick_init (void)
{
    SysTick_Config(cpu_freq / 1000);
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