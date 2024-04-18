#include "./include/main.h"

int main(void){
    *RCC_AHB1ENR |= (1 << RCC_AHB1ENR_GPIOC);
    *GPIOC_MODER |= (1 << GPIOC_GPOM_13);
    
    while(1){
        *GPIOC_ODR ^= (1 << GPIOC_PIN13);
        for (uint32_t i = 0; i < 1000000; i++);
    }

    return 0;
}