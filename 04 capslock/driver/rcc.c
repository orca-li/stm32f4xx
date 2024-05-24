#include "rcc.h"

dt_rcc cpu_freq = 16000000;

void rcc_periph_clock_enable (dt_rcc bus, dt_rcc periph) {
    if (bus == AHBUS1)  {
        RCC_AHB1ENR |= periph;
    } else if (bus == APBUS1) {
        RCC_APB1ENR |= periph;
    }
}