#ifndef _INTERRUPTS_IRQ_IRQ_LIST_H
#define _INTERRUPTS_IRQ_IRQ_LIST_H

#include "bridge/usart.h"

void hardfault_handler(void);
void systick_handler(void);
void usart1_IRQhandler(void);
void usart2_IRQhandler(void);

extern volatile uint32_t ticks;

#endif /* _INTERRUPTS_IRQ_IRQ_LIST_H */