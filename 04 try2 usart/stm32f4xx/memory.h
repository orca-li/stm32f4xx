#ifndef STM32F4XX_INC_MEMORY_H
#define STM32F4XX_INC_MEMORY_H

/* RM0368 5 Memory mapping - Figure 15. Memory map */
#define BLOCK2_BASE 0x40000000u

#define PERIPHERALS_BASE (BLOCK2_BASE)

#define APB1_BASE (PERIPHERALS_BASE + 0x00000u)
#define APB2_BASE (PERIPHERALS_BASE + 0x10000u)
#define AHB1_BASE (PERIPHERALS_BASE + 0x20000u)

/* RM0368 5 Memory mapping - Table 10. STM32F401xB/STM32F401xC register boundary addresses */
#define GPIOA_BASE  (AHB1_BASE + 0x0000u)
#define GPIOB_BASE  (AHB1_BASE + 0x0400u)
#define GPIOC_BASE  (AHB1_BASE + 0x0800u)
/* ... */
#define RCC_BASE    (AHB1_BASE + 0x3800u)



#endif /* STM32F4XX_INC_MEMORY_H */