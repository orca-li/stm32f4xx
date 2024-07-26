#include "include/gpio.h"

void gpio_mode_setup (uint32_t port, uint32_t pin, uint32_t mode)
{
    uint32_t reg32;

    reg32 = GPIO_MODER(port);
    reg32 &= ~(GPIO_MODE_MASK << (2 * pin));
    reg32 |= mode << (2 * pin);

    GPIO_MODER(port) = reg32;
}

void gpio_af_setup (uint32_t port, uint32_t pin, uint32_t af)
{
    /* 8.4.9 GPIO alternate function low register (GPIOx_AFRL) (x = A..E and H) */
    const uint8_t in_one_register = 8;
    const uint8_t bits_for_one_pin = 4;
    uint32_t reg32;
    uint32_t pin_offset = (pin > in_one_register) ? pin % in_one_register : pin;

    reg32 = (pin < in_one_register) ? GPIO_AFRL(port) : GPIO_AFRH(port);
    reg32 &= ~(GPIO_AF_MASK << (bits_for_one_pin * pin_offset));
    reg32 |= af << (bits_for_one_pin * pin_offset);

    if (pin < in_one_register) {
        GPIO_AFRL(port) = reg32;
    } else {
        GPIO_AFRH(port) = reg32;
    }
}

void gpio_toggle_pin (uint32_t port, uint32_t gpin)
{
    GPIO_ODR(port) ^= gpin;
}