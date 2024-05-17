#ifndef FEATHERLIB_INC_NVIC_H
#define FEATHERLIB_INC_NVIC_H

#include "fl_define.h"

/* откуда значение, возможно номер бита для NVIC_ISER*/
#define NVIC_USART2_IRQ 38

/* PM0214 4.3 - 4.3.2 Interrupt set-enable register x */
#define NVIC_ISER(iser_id) MMIO32(NVIC_BASE + (iser_id * 4))

void nvic_enable_irq (uint8_t irqn);

#endif /*FEATHERLIB_INC_NVIC_H */