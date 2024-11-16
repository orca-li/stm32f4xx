#include "include/systick.h"

volatile uint32_t ticks;

void delay_ms (uint32_t millieconds)
{
    uint32_t start = ticks;
    uint32_t end = start + millieconds;

    if (end < start) {
        while(ticks > start);
    }

    while (ticks < end);
}