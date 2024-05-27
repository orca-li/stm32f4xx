#ifndef _DRIVER_NVIC_H
#define _DRIVER_NVIC_H

#include "bridge/why.h"

typedef uint32_t irqn_t;

void nvic_irq_enable(irqn_t irqn);
void nvic_global_enable(void);

#endif /* _DRIVER_NVIC_H */