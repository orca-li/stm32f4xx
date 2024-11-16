#include "include/rcc.h"

uint32_t cpu_freq = LMCU_CPU_FREQ;

void rcc_periph_clock_enable (uint32_t bus, uint32_t periph) {
    switch (bus)
    {
    case AHBUS1:
        RCC_AHB1ENR |= periph;
        break;

    case APBUS1:
        RCC_APB1ENR |= periph;
        break;

    case APBUS2:
        RCC_APB2ENR |= periph;
        break;
    }
}