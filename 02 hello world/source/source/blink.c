#include "../include/blink.h"
#include "../include/init.h"

void gpio_init(void){
    *RCC_AHB1ENR |= (1 << RCC_AHB1ENR_GPIOC);
    *GPIOC_MODER |= (1 << GPIOC_GPOM_13);
}

void blink(gpiox_bt gpio_n, mode_bt mode, ms_time_tt ms_delay){
    mcs_delay_t(gpio_n);
    gpio_init();

    switch(mode){
        case MODE_RESET:
            *GPIOC_ODR &= (0 << GPIOC_PIN13);
            return;
        case MODE_SET:
            *GPIOC_ODR &= (1 << GPIOC_PIN13);
            return;
        case MODE_BLINK:
            *GPIOC_ODR &= (0 << GPIOC_PIN13);

            *GPIOC_ODR ^= (1 << GPIOC_PIN13);
            ms_delay_t(ms_delay);
            *GPIOC_ODR ^= (1 << GPIOC_PIN13);
            return;
        default:
            return;
    }
}