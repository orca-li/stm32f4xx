#ifndef INIT_H
#define INIT_H

#include <stdint.h>

#define BASE_PERIPHERAL         (0x40000000U)
#define BASE_AHB1               (BASE_PERIPHERAL + 0x20000U)
#define BASE_RCC                (BASE_PERIPHERAL + 0x23800U)
#define BASE_GPIOC              (BASE_PERIPHERAL + 0x20800U)

#define RCC_AHB1ENR_OFFSET      (0x30U)
#define RCC_AHB1ENR_GPIOC       (0x02U)
#define RCC_AHB1ENR             ((volatile uint32_t*) (BASE_RCC + RCC_AHB1ENR_OFFSET))

#define GPIOx_MODER_OFFSET      (0x00U)
#define GPIOC_GPOM_13           (26U)
#define GPIOC_MODER             ((volatile uint32_t*) (BASE_GPIOC + GPIOx_MODER_OFFSET))

#define GPIOx_ODR_OFFSET        (0x14U)
#define GPIOC_ODR               ((volatile uint32_t*) (BASE_GPIOC + GPIOx_ODR_OFFSET))

#define GPIOC_PIN13             (13)

#endif /* INIT_H */