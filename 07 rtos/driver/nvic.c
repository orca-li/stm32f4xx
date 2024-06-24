#include "nvic.h"

extern void __enable_irq(void);

void nvic_irq_setup (irqn_t irqn)
{
    uint32_t index = irqn / 32;
    uint32_t bit = irqn % 32;

    NVIC_ISER(index) |= 1 << bit;
}

void nvic_global_enable (void)
{
    __enable_irq();
}