#include "gpio.h"

void gpio_mode_setup (dt_gpio port, dt_gpio pin, dt_gpio mode) {
    uint32_t reg32;

    reg32 = GPIO_MODER(port);
    reg32 &= ~(GPIO_MODE_MASK << (2 * pin));
    reg32 |= mode << (2 * pin);

    GPIO_MODER(port) = reg32;
}

void gpio_af_setup (dt_gpio port, dt_gpio horl, dt_gpio pin, dt_gpio af) {
    uint32_t reg32;

    reg32 = (horl == AFRLOW) ? GPIO_AFRL(port) : GPIO_AFRH(port);
    reg32 &= ~(GPIO_AF_MASK << (4 * pin));
    reg32 |= af << (4 * pin);

    if (horl == AFRLOW) {
        GPIO_AFRL(port) = reg32;
    } else if (horl == AFRHIGH) {
        GPIO_AFRH(port) = reg32;
    }
}

void gpio_toggle_pin (dt_gpio port, dt_gpio pin) {
    GPIO_ODR(port) ^= (1 << pin);
}