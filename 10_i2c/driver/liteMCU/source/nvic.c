#include "include/nvic.h"

void nvic_irq_setup (uint32_t irqn)
{
    uint32_t index = irqn / 32;
    uint32_t bit = irqn % 32;

    NVIC_ISER(index) |= (1 << bit);
}