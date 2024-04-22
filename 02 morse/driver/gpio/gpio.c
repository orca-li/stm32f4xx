#include "gpio.h"

void init_gpio(void){
    *RCC_AHB1ENR |= (1 << RCC_AHB1ENR_GPIOC);
    *GPIOC_MODER |= (1 << GPIOC_GPOM_13);
}