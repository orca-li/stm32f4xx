#include "stm32f4asm.h"

static inline void __enable_irq(void);
static inline void __disable_irq(void);

void _enable_irq (void)
{
    __enable_irq();
}

void __disable_irq (void)
{
    __disable_irq();
}

__attribute__((always_inline)) static inline void __enable_irq (void)
{
    __asm volatile ("cpsie i" : : : "memory");
}

__attribute__((always_inline)) static inline void __disable_irq (void)
{
    __asm volatile ("cpsie d" : : : "memory");
}