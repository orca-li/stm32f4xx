#ifndef _DRIVER_TICKS_H
#define _DRIVER_TICKS_H

#include "bridge/systick.h"
#include "bridge/rcc.h"
#include "interrupts/irq/irq_list.h"

void systick_init(uint32_t ticks);
void delay_ms(uint32_t millieconds);

#endif /* _DRIVER_TICKS_H */