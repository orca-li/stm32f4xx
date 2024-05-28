#ifndef _DRIVER_NVIC_H
#define _DRIVER_NVIC_H

#include "intrinsics/stm32f4asm.h"
#include "bridge/nvic.h"

typedef uint32_t irqn_t;

void nvic_irq_setup(irqn_t irqn);
void nvic_global_enable(void);

#endif /* _DRIVER_NVIC_H */