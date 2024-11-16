#if !defined(LITEMCU_NVIC_H)
#define LITEMCU_NVIC_H

#include "lmcuCONFIG.h"

/* PM0214 4.3.11 NVIC register map - Table 49. NVIC register map and reset values  */
#define NVIC_ISER(index) MMIO32(NVIC_BASE + 4 * index)
#define NVIC_ICER(index) MMIO32(NVIC_BASE + 4 * index)

/* RM0368 10.2 External interrupt/event controller (EXTI) - Table 38. Vector table for STM32F401xB/CSTM32F401xD/E */
#define IRQN_USART1 (37)
#define IRQN_USART2 (38)

void nvic_irq_setup(uint32_t irqn);

#endif /* LITEMCU_NVIC_H */

/** tutorial
 * nvic guide: https://arm-software.github.io/CMSIS_6/main/Core/group__NVIC__gr.html#0
 * 
 */