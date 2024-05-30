#ifndef _DRIVER_GPIO_H
#define _DRIVER_GPIO_H

#include "bridge/gpio.h"

typedef uint32_t dt_gpio;

#define AFRLOW (0)
#define AFRHIGH (1)

void gpio_mode_setup (dt_gpio port, dt_gpio pin, dt_gpio mode);
void gpio_af_setup (dt_gpio port, dt_gpio pin, dt_gpio af);
void gpio_toggle_pin (dt_gpio port, dt_gpio pin);

#endif  /* _DRIVER_GPIO_H */