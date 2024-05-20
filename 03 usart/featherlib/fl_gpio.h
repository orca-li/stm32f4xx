#ifndef FEATHERLIB_INC_GPIO_H
#define FEATHERLIB_INC_GPIO_H

#include "fl_define.h"

void gpio_mode_setup (uint32_t gpioport, uint8_t mode, uint8_t pull_up_down, uint16_t gpios);

#define GPIOA           GPIO_PORT_A_BASE
#define GPIOB           GPIO_PORT_B_BASE
#define GPIOC           GPIO_PORT_C_BASE

/* Port mode register (GPIOx_MODER) */
/* RM0368 8.4.1 GPIO port mode register (GPIOx_MODER) (x = A..E and H) */
#define GPIO_MODER(port)    MMIO32((port) + 0x00)
#define GPIOA_MODER			GPIO_MODER(GPIOA)
#define GPIOB_MODER			GPIO_MODER(GPIOB)
#define GPIOC_MODER			GPIO_MODER(GPIOC)

/* Port pull-up/pull-down register (GPIOx_PUPDR) */
/* RM0368 8.4.4 GPIO port pull-up/pull-down register (GPIOx_PUPDR) (x = A..E and H) */
#define GPIO_PUPDR(port)	MMIO32((port) + 0x0c)
#define GPIOA_PUPDR			GPIO_PUPDR(GPIOA)
#define GPIOB_PUPDR			GPIO_PUPDR(GPIOB)
#define GPIOC_PUPDR			GPIO_PUPDR(GPIOC)

/* --- GPIOx_MODER values -------------------------------------------------- */
/* RM0368 8.4.1 GPIO port mode register (GPIOx_MODER) (x = A..E and H) */
#define GPIO_MODE(n, mode)		((mode) << (2 * (n)))
#define GPIO_MODE_MASK(n)		(0x3 << (2 * (n)))

#define GPIO_MODE_INPUT			0x0
#define GPIO_MODE_OUTPUT		0x1
#define GPIO_MODE_AF			0x2
#define GPIO_MODE_ANALOG		0x3

/* --- GPIOx_PUPDR values -------------------------------------------------- */
/* RM0368 8.4.4 GPIO port pull-up/pull-down register (GPIOx_PUPDR) (x = A..E and H) */
#define GPIO_PUPD(n, pupd)		((pupd) << (2 * (n)))
#define GPIO_PUPD_MASK(n)		(0x3 << (2 * (n)))

#define GPIO_PUPD_NONE			0x0
#define GPIO_PUPD_PULLUP		0x1
#define GPIO_PUPD_PULLDOWN		0x2

#endif /* FEATHERLIB_INC_GPIO_H */