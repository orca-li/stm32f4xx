#ifndef FEATHERLIB_INC_RCC_H
#define FEATHERLIB_INC_RCC_H

#include "fl_define.h"

#define RCC_AHB1ENR MMIO32(RCC_BASE + 0x30)
#define RCC_APB1ENR MMIO32(RCC_BASE + 0x40)

/* RCC_AHB1ENR */
#define FL_BIT_GPIOA ( 0u)
#define FL_BIT_GPIOB ( 1u)
#define FL_BIT_GPIOC ( 2u)
#define FL_BIT_GPIOD ( 3u)
#define FL_BIT_GPIOE ( 4u)
#define FL_BIT_GPIOH ( 7u)
#define FL_BIT_CRC   (12u)

/* RCC_APB1ENR */
#define FL_BIT_TIM2   ( 0u)
#define FL_BIT_TIM3   ( 1u)
#define FL_BIT_TIM4   ( 2u)
#define FL_BIT_TIM5   ( 3u)
#define FL_BIT_WWDG   (11u)
#define FL_BIT_SPI2   (14u)
#define FL_BIT_SPI3   (15u)
#define FL_BIT_USART2 (17u)

enum rcc_periph_clken {
    /* Cortex-M4 */
    /* AHB2 */
    /* AHB1 */
        RCC_GPIOA,
        RCC_GPIOB,
        RCC_GPIOC,
        RCC_GPIOD,
        RCC_GPIOE,
        /* reserved */
        RCC_GPIOH,
        /* reserved */
        RCC_CRC,
        /* reserved */
    /* APB2 */
    /* APB1 */
        RCC_TIM2,
        RCC_TIM3,
        RCC_TIM4,
        RCC_TIM5,
        RCC_WWDG,
        RCC_SPI2,
        RCC_SPI3,
        RCC_USART2,
};

void deep_rcc_perclk_enable(enum rcc_periph_clken clken);
void rcc_periph_clock_enable(enum rcc_periph_clken clken);
uint32_t rcc_get_usart_clk_freq(uint32_t usart);

#endif /* FEATHERLIB_INC_RCC_H */