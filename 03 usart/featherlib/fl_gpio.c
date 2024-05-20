#include "fl_gpio.h"

void gpio_mode_setup (uint32_t gpioport, uint8_t mode, uint8_t pull_up_down, uint16_t gpios) {
    uint32_t moder, pupd;

    moder = GPIO_MODER(gpioport);
    pupd = GPIO_PUPDR(gpioport);

    for (uint16_t i = 0; i < 16; i++) {
        if (!((1 << i) & gpios)) {
            continue;
        }

        moder &= ~GPIO_MODE_MASK(i);
        moder |= GPIO_MODE(i, mode);
        pupd &= ~GPIO_PUPD_MASK(i);
        pupd |= GPIO_PUPD(i, pull_up_down);
    }

    GPIO_MODER(gpioport) = moder;
    GPIO_PUPDR(gpioport) = pupd;
}

void gpio_set_af(uint32_t gpioport, uint8_t alt_func_num, uint16_t gpios) {
    uint16_t i;
    uint32_t afrl, afrh;

    afrl = GPIO_AFRL(gpioport);
    afrh = GPIO_AFRH(gpioport);

    for (i = 0; i < 8; i++) {
        if (!((1 << i)) & gpios) {
            continue;
        }
        afrl &= ~GPIO_AFR_MASK(i);
        afrl |= GPIO_AFR(i, alt_func_num);
    }

    for (i = 8; i < 16; i++) {
        if (!((1 << i) & gpios)) {
            continue;
        }
        afrh &= ~GPIO_AFR_MASK(i - 8);
        afrh |= GPIO_AFR(i - 8, alt_func_num);
    }

    GPIO_AFRL(gpioport) = afrl;
    GPIO_AFRH(gpioport) = afrh;
}