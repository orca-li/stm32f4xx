#ifndef _INTRINSICS_STM32F4ASM_H
#define _INTRINSICS_STM32F4ASM_H

/* https://github.com/ARM-software/CMSIS_4/blob/master/CMSIS/Include/cmsis_gcc.h */

__attribute__((always_inline))
inline void __enable_irq (void)
{
    __asm volatile ("cpsie i" : : : "memory");
}

__attribute__((always_inline)) 
inline void __disable_irq (void)
{
    __asm volatile ("cpsid i" : : : "memory");
}

#endif /* _INTRINSICS_STM32F4ASM_H */