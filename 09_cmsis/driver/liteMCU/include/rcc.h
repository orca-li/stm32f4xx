#if !defined(LITEMCU_RCC_H)
#define LITEMCU_RCC_H

#include "lmcuCONFIG.h"

#if 0
/* RM0368 6.3.22 RCC register map - Table 22. RCC register map and reset values for STM32F401xB/C and STM32F401xD/E */
#define RCC_AHB1ENR MMIO32(RCC_BASE + 0x30u)
#define RCC_APB1ENR MMIO32(RCC_BASE + 0x40u)
#define RCC_APB2ENR MMIO32(RCC_BASE + 0x44u)

/* RM0368 6.3.9 RCC AHB1 peripheral clock enable register (RCC_AHB1ENR) */
#define USART2EN (1 << 17)

/* RM0368 6.3.11 RCC APB1 peripheral clock enable register (RCC_APB1ENR) */
#define GPIOAEN (1 << 0)
#define GPIOBEN (1 << 1)
#define GPIOCEN (1 << 2)

/* RM0368 6.3.12 RCC APB2 peripheral clock enable register (RCC_APB2ENR) */
#define USART1EN (1 << 4)
#define SYSCFGEN (1 << 14)

#define AHBUS1 0
#define APBUS1 1
#define APBUS2 2
#endif

extern uint32_t cpu_freq;

void rcc_periph_clock_enable(uint32_t bus, uint32_t periph);

#endif /* LITEMCU_RCC_H */