#ifndef FEATHERLIB_INC_GPIO_H
#define FEATHERLIB_INC_GPIO_H

#include "fl_define.h"

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

/* Alternate function low register (GPIOx_AFRL) */
/* RM0368 8.4.9 GPIO alternate function low register (GPIOx_AFRL) (x = A..E and H) */
#define GPIO_AFRL(port)		MMIO32((port) + 0x20)
#define GPIOA_AFRL			GPIO_AFRL(GPIOA)
#define GPIOB_AFRL			GPIO_AFRL(GPIOB)
#define GPIOC_AFRL			GPIO_AFRL(GPIOC)

/* Alternate function high register (GPIOx_AFRH) */
/*RM0368 8.4.10 GPIO alternate function high register (GPIOx_AFRH) (x = A..E and H) */
#define GPIO_AFRH(port)		MMIO32((port) + 0x24)
#define GPIOA_AFRH			GPIO_AFRH(GPIOA)
#define GPIOB_AFRH			GPIO_AFRH(GPIOB)
#define GPIOC_AFRH			GPIO_AFRH(GPIOC)

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

/* --- GPIOx_AFRL/H values ------------------------------------------------- */
/* RM0368 8.4.9 - 8.4.10 GPIO alternate function (GPIOx_AFRL), (GPIOx_AFRH) */
#define GPIO_AFR(n, af)         ((af) << ((n) * 4))
#define GPIO_AFR_MASK(n)        (0xf << ((n) * 4))

#define GPIO_AF0			0x0
#define GPIO_AF1			0x1
#define GPIO_AF2			0x2
#define GPIO_AF3			0x3
#define GPIO_AF4			0x4
#define GPIO_AF5			0x5
#define GPIO_AF6			0x6
#define GPIO_AF7			0x7
#define GPIO_AF8			0x8
#define GPIO_AF9			0x9
#define GPIO_AF10			0xa
#define GPIO_AF11			0xb
#define GPIO_AF12			0xc
#define GPIO_AF13			0xd
#define GPIO_AF14			0xe
#define GPIO_AF15			0xf

/* RM0368 8.4.6 GPIO port output data register (GPIOx_ODR) (x = A..E and H) */
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

void gpio_mode_setup (uint32_t gpioport, uint8_t mode, uint8_t pull_up_down, uint16_t gpios);
void gpio_set_af(uint32_t gpioport, uint8_t alt_func_num, uint16_t gpios);

#endif /* FEATHERLIB_INC_GPIO_H */