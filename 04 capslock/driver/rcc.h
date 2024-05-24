#ifndef _DRIVER_RCC_H
#define _DRIVER_RCC_H

#include "bridge/rcc.h"

typedef uint32_t dt_rcc;

#define AHBUS1 0
#define APBUS1 1

extern dt_rcc cpu_freq;

void rcc_periph_clock_enable(dt_rcc bus, dt_rcc periph);

#endif /* _DRIVER_RCC_H */