#include "nvic.h"

extern void __enable_irq(void);

void nvic_irq_enable (irqn_t irqn)
{ /* проверить */
    uint32_t reg32;
    uint32_t index = irqn % 32;

    reg32 = NVIC_ISER(index);
    reg32 |= index;
    NVIC_ISER(index) = reg32;
}

void nvic_global_enable (void)
{
    __enable_irq();
}