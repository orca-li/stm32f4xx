#ifndef STM32F4XX_INC_RCC_H
#define STM32F4XX_INC_RCC_H

#include "common.h"
#include "memory.h"

/* RM0368 6.3.9 RCC AHB1 peripheral clock enable register (RCC_AHB1ENR) */
#define RCC_AHB1ENR MMIO32(RCC_BASE + 0x30u)
/* values */
#define USART2EN (1 << 17)

/* RM0368 6.3.11 RCC APB1 peripheral clock enable register (RCC_APB1ENR) */
#define RCC_APB1ENR MMIO32(RCC_BASE + 0x40u)
/* values */
#define GPIOAEN (1 << 0)
#define GPIOBEN (1 << 1)
#define GPIOCEN (1 << 2)

#endif /* STM32F4XX_INC_RCC_H */