#include "stm32f4asm.h"

static inline void __enable_irq(void);

void _enable_irq(void)
{
    __enable_irq();
}

static inline void __enable_irq(void)
{
    __asm volatile ("cpsie i" : : : "memory");
}