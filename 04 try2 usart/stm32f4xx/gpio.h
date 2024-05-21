#ifndef STM32F4XX_INC_GPIO_H
#define STM32F4XX_INC_GPIO_H

#include "common.h"
#include "memory.h"

#define GPIOA GPIOA_BASE
#define GPIOB GPIOB_BASE
#define GPIOC GPIOC_BASE

/* RM0368 8.4.1 GPIO port mode register (GPIOx_MODER) (x = A..E and H) */
#define GPIO_MODER(gpio) MMIO32(gpio + 0x00u)
/* modes */
#define MODE_INPUT  (0x0u)
#define MODE_OUPUT  (0x1u)
#define MODE_AF     (0x2u)
#define MODE_ANALOG (0x3u)
/* values */
#define GPIO_MODE(mode, pin)    (mode << (2 * pin))

/* RM0368 8.4.6 GPIO port output data register (GPIOx_ODR) (x = A..E and H) */
#define GPIO_ODR(gpio) MMIO32(gpio + 0x14u)
/* values */
#define GPIO0				(1 << 0)
#define GPIO1				(1 << 1)
#define GPIO2				(1 << 2)
#define GPIO3				(1 << 3)
#define GPIO4				(1 << 4)
#define GPIO5				(1 << 5)
#define GPIO6				(1 << 6)
#define GPIO7				(1 << 7)
#define GPIO8				(1 << 8)
#define GPIO9				(1 << 9)
#define GPIO10				(1 << 10)
#define GPIO11				(1 << 11)
#define GPIO12				(1 << 12)
#define GPIO13				(1 << 13)
#define GPIO14				(1 << 14)
#define GPIO15				(1 << 15)


#endif /* STM32F4XX_INC_GPIO_H */