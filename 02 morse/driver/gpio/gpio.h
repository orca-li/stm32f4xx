#ifndef GPIO_H
#define GPIO_H

#include <stdint.h>
#include "../memory.h"

#define RCC_AHB1ENR             ((volatile uint32_t*) (BASE_RCC + RCC_AHB1ENR_OFFSET))
#define GPIOC_MODER             ((volatile uint32_t*) (BASE_GPIOC + GPIOx_MODER_OFFSET))
#define GPIOC_ODR               ((volatile uint32_t*) (BASE_GPIOC + GPIOx_ODR_OFFSET))

#define GPIOC_PIN13             (13)

void init_gpio(void);

#endif /* GPIO_H */

