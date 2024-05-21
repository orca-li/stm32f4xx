#ifndef STM32F4XX_INC_COMMON_H
#define STM32F4XX_INC_COMMON_H

#include <stdint.h>
#include <stdbool.h>

#define MMIO32(addr) (*(volatile uint32_t *)(addr))

#endif /* STM32F4XX_INC_COMMON_H */
