#include "rcc.h"
#include "gpio.h"

#define LEDPIN GPIO13
#define N_LEDPIN 13

void gpio_init(void);

int main (void) {
    gpio_init();

    while (true) {
        GPIO_ODR(GPIOC) ^= GPIO13;
        for (uint32_t i = 0; i < 1000000; i++);
    }

    return 0;
}

void gpio_init(void) {
    RCC_AHB1ENR |= (GPIOAEN | GPIOCEN);

    GPIO_MODER(GPIOC) |= GPIO_MODE(MODE_OUPUT, N_LEDPIN);
}