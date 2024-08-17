#include <stdint.h>
#include "stm32f4xx.h"

#define LED_PIN 13

static void gpio_init (void);

int main (void) {
    gpio_init();

    GPIOA->MODER |= (1 << GPIO_MODER_MODER5_Pos);

    while (1) {
        GPIOA->ODR ^= (1 << LED_PIN);
        for (uint32_t i = 0; i < 1000000; i++);
    }

    return 0;
}

static void gpio_init (void)
{
    RCC->AHB1ENR |= (1 << RCC_AHB1ENR_GPIOAEN_Pos);
    
}