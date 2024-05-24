#ifndef _BRIDGE_RCC_H
#define _BRIDGE_RCC_H

#include "bridge/macros.h"
#include "bridge/memory.h"

/* RM0368 6.3.22 RCC register map - Table 22. RCC register map and reset values for STM32F401xB/C and STM32F401xD/E */
#define RCC_AHB1ENR MMIO32(RCC_BASE + 0x30u)
#define RCC_APB1ENR MMIO32(RCC_BASE + 0x40u)

/* RM0368 6.3.9 RCC AHB1 peripheral clock enable register (RCC_AHB1ENR) */
#define USART2EN (1 << 17)

/* RM0368 6.3.11 RCC APB1 peripheral clock enable register (RCC_APB1ENR) */
#define GPIOAEN (1 << 0)
#define GPIOBEN (1 << 1)
#define GPIOCEN (1 << 2)

#endif /* _BRIDGE_RCC_H */