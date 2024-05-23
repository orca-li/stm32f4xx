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
#define GPIO_MODE_INPUT      (0x0u)
#define GPIO_MODE_OUTPUT     (0x1u)
#define GPIO_MODE_AF         (0x2u)
#define GPIO_MODE_ANALOG     (0x3u)
#define GPIO_MODE_CLEAN_MASK (0x3u)
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

/* DS9716 - Table 9. Alternate function mapping */
/* alternate function mapping */
/* RM0368 8.4.9 GPIO alternate function low register (GPIOx_AFRL) (x = A..E and H) */
#define GPIO_AFRL(gpio) MMIO32(gpio + 0x20u)
/* RM0368 8.4.10 GPIO alternate function high register (GPIOx_AFRH) (x = A..E and H)*/
#define GPIO_AFRH(gpio) MMIO32(gpio + 0x24u)
/* values */
#define GPIO_SET_AFR(af, pin) (af << 4 * pin)
#define GPIO_AFR_AF0    (0x0u) /* SYS_AF */
#define GPIO_AFR_AF1    (0x1u) /* TIM1 | TIM2 */
#define GPIO_AFR_AF2    (0x2u)
#define GPIO_AFR_AF3    (0x3u)
#define GPIO_AFR_AF4    (0x4u) /* I2C1 | I2C2 | I2C3 */
#define GPIO_AFR_AF5    (0x5u)
#define GPIO_AFR_AF6    (0x6u)
#define GPIO_AFR_AF7    (0x7u) /* USART1 | USART2 | SPI3 | I2S3 */
#define GPIO_AFR_AF8    (0x8u) /* USART6 */
#define GPIO_AFR_AF9    (0x9u)
#define GPIO_AFR_AF10   (0xAu)
#define GPIO_AFR_AF11   (0xBu)
#define GPIO_AFR_AF12   (0xCu) /* SDIO6 */
#define GPIO_AFR_AF13   (0xDu)
#define GPIO_AFR_AF14   (0xEu)
#define GPIO_AFR_AF15   (0xFu)
#define GPIO_AFR_CLEAN_MASK (0xFu)

#endif /* STM32F4XX_INC_GPIO_H */