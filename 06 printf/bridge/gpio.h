#ifndef _BRIDGE_GPIO_H
#define _BRIDGE_GPIO_H

#include "bridge/macros.h"
#include "bridge/memory.h"

/* GPIO ports */
#define GPIOA GPIOA_BASE
#define GPIOB GPIOB_BASE
#define GPIOC GPIOC_BASE

/* GPIO pins */
#define GPIO0 (1 << 0)
#define GPIO1 (1 << 1)
#define GPIO2 (1 << 2)
#define GPIO3 (1 << 3)
#define GPIO4 (1 << 4)
#define GPIO5 (1 << 5)
#define GPIO6 (1 << 6)
#define GPIO7 (1 << 7)
#define GPIO8 (1 << 8)
#define GPIO9 (1 << 9)
#define GPIO10 (1 << 10)
#define GPIO11 (1 << 11)
#define GPIO12 (1 << 12)
#define GPIO13 (1 << 13)
#define GPIO14 (1 << 14)
#define GPIO15 (1 << 15)
#define PIN0 (0)
#define PIN1 (1)
#define PIN2 (2)
#define PIN3 (3)
#define PIN4 (4)
#define PIN5 (5)
#define PIN6 (6)
#define PIN7 (7)
#define PIN8 (8)
#define PIN9 (9)
#define PIN10 (10)
#define PIN11 (11)
#define PIN12 (12)
#define PIN13 (13)
#define PIN14 (14)
#define PIN15 (15)

/* RM0368 8.4.11 GPIO register map - Table 27. GPIO register map and reset values */
#define GPIO_MODER(gpio) MMIO32(gpio + 0x00u)
#define GPIO_ODR(gpio) MMIO32(gpio + 0x14u)
#define GPIO_AFRL(gpio) MMIO32(gpio + 0x20u)
#define GPIO_AFRH(gpio) MMIO32(gpio + 0x24u)

/* RM0368 8.4.1 GPIO port mode register (GPIOx_MODER) (x = A..E and H) */
#define GPIO_MODE_MASK (3)
#define GPIO_MODE_INPUT (0)
#define GPIO_MODE_OUTPUT (1)
#define GPIO_MODE_AF (2)
#define GPIO_MODE_ANALOG (3)

/* RM0368 8.4.6 GPIO port output data register (GPIOx_ODR) (x = A..E and H) */
#define GPIO_OUT0 (1 << 0)
#define GPIO_OUT1 (1 << 1)
#define GPIO_OUT2 (1 << 2)
#define GPIO_OUT3 (1 << 3)
#define GPIO_OUT4 (1 << 4)
#define GPIO_OUT5 (1 << 5)
#define GPIO_OUT6 (1 << 6)
#define GPIO_OUT7 (1 << 7)
#define GPIO_OUT8 (1 << 8)
#define GPIO_OUT9 (1 << 9)
#define GPIO_OUT10 (1 << 10)
#define GPIO_OUT11 (1 << 11)
#define GPIO_OUT12 (1 << 12)
#define GPIO_OUT13 (1 << 13)
#define GPIO_OUT14 (1 << 14)
#define GPIO_OUT15 (1 << 15)

/**
 * DS9716 - Table 9. Alternate function mapping
 * RM0368 - Figure 17. Selecting an alternate function on STM32F401xB/C and STM32F401xD/E
 * RM0368 8.4.9 GPIO alternate function low register (GPIOx_AFRL) (x = A..E and H)
 * RM0368 8.4.10 GPIO alternate function high register (GPIOx_AFRH) (x = A..E and H)
 * */
#define GPIO_AF_MASK (0xFu)
#define GPIO_AF00 (0x0u) /* system */
#define GPIO_AF01 (0x1u) /* TIM1/TIM2 */
#define GPIO_AF02 (0x2u) /* TIM3..TIM5 */
#define GPIO_AF03 (0x3u) /* TIM9..TIM11 */
#define GPIO_AF04 (0x4u) /* I2C1..3 */
#define GPIO_AF05 (0x5u) /* SPI1..4 */
#define GPIO_AF06 (0x6u) /* SPI3 */
#define GPIO_AF07 (0x7u) /* USART1..USART2 */
#define GPIO_AF08 (0x8u) /* USART6 */
#define GPIO_AF09 (0x9u) /* I2C2..3*/
#define GPIO_AF10 (0xAu) /* OTG_FS */
#define GPIO_AF11 (0xBu) /* reserved */
#define GPIO_AF12 (0xCu) /* SDIO */
#define GPIO_AF13 (0xDu) /* reserved */
#define GPIO_AF14 (0xEu) /* reserved */
#define GPIO_AF15 (0xFu) /* EVENTOUT */

#endif /* _BRIDGE_GPIO_H */

/** tutorial
 * 
 * 1. OUTPUT DATA
 * 
 * build order
    * 1. enable bus clocking
    * 2. configure the pin mod
    * 3. set the bit
 * 
 * example
    * RCC_AHB1ENR |= GPIOx;
    * GPIO_MODER(GPIOx) &= ~(MODE << PIN); <-- resetting bits of the previous mod
    * GPIO_MODER(GPIOx) |= (MODE << PIN); <-- set new mode
    * while (true) {
    *      GPIO_ODR(GPIOx) ^= (1 << PIN);
    *      for(uint32_t i = 0; i < 1000000; i++); <-- sleep ~1sec
    * }
 * 
 * 2. 
 */