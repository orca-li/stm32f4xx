#ifndef _INTERRUPTS_SCB_SCB_LIST_H
#define _INTERRUPTS_SCB_SCB_LIST_H

#include "intrinsics/stm32f4asm.h"

void systick_handler(void);
void pendsv_handler(void);

extern volatile uint32_t ticks;

#endif /* _INTERRUPTS_SCB_SCB_LIST_H */