#include "fl_rcc.h"

uint32_t rcc_ahb_frequency = 16000000;
uint32_t rcc_apb1_frequency = 16000000;
uint32_t rcc_apb2_frequency = 16000000;

void deep_rcc_perclk_enable(enum rcc_periph_clken clken) {
    switch(clken)
    {
        /* AHB1 */
            case RCC_GPIOA:
                _BIT_SET(RCC_AHB1ENR, FL_BIT_GPIOA);
                break;

            case RCC_GPIOB:
                _BIT_SET(RCC_AHB1ENR, FL_BIT_GPIOB);
                break;

            case RCC_GPIOC:
                _BIT_SET(RCC_AHB1ENR, FL_BIT_GPIOC);
                break;

            case RCC_GPIOD:
                _BIT_SET(RCC_AHB1ENR, FL_BIT_GPIOD);
                break;

            case RCC_GPIOE:
                _BIT_SET(RCC_AHB1ENR, FL_BIT_GPIOE);
                break;

            /*case RESERVED:
                break;*/

            case RCC_GPIOH:
                _BIT_SET(RCC_AHB1ENR, FL_BIT_GPIOH);
                break;

            /*case RESERVED:
                break;*/

            case RCC_CRC:
                _BIT_SET(RCC_AHB1ENR, FL_BIT_CRC);
                break;

            /*case RESERVED:
                break;*/

        /* APB1 */
            case RCC_TIM2:
                _BIT_SET(RCC_APB1ENR, FL_BIT_TIM2);
                break;

            case RCC_TIM3:
                _BIT_SET(RCC_APB1ENR, FL_BIT_TIM3);
                break;

            case RCC_TIM4:
                _BIT_SET(RCC_APB1ENR, FL_BIT_TIM4);
                break;

            case RCC_TIM5:
                _BIT_SET(RCC_APB1ENR, FL_BIT_TIM5);
                break;
            
            case RCC_WWDG:
                _BIT_SET(RCC_APB1ENR, FL_BIT_WWDG);
                break;

            case RCC_SPI2:
                _BIT_SET(RCC_APB1ENR, FL_BIT_SPI2);
                break;

            case RCC_SPI3:
                _BIT_SET(RCC_APB1ENR, FL_BIT_SPI3);
                break;

            case RCC_USART2:
                _BIT_SET(RCC_APB1ENR, FL_BIT_USART2);
                break;
    
        default:
            break;
    }
}

void rcc_periph_clock_enable(enum rcc_periph_clken clken) {
    deep_rcc_perclk_enable(clken);
}

uint32_t rcc_get_usart_clk_freq(uint32_t usart) {
	/* Handle values with selectable clocks. */
	if (usart == USART1_BASE || usart == USART6_BASE) {
		return rcc_apb2_frequency;
	} else {
		return rcc_apb1_frequency;
	}
}