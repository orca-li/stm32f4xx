#ifndef _INTERRUPTS_IRQ_IRQ_LIST_H
#define _INTERRUPTS_IRQ_IRQ_LIST_H

#include "bridge/usart.h"

void hardfault_handler(void);
void usart2_IRQhandler(void);

#endif /* _INTERRUPTS_IRQ_IRQ_LIST_H */