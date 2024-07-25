#if !defined (STM32F401)
#define STM32F401

#include "core/Cortex-M4.h"

/* scack pointer init address */
#define SRAM_SIZE_KB (64u)
#define SRAM_SIZE (SRAM_SIZE_KB * 1024)
#define SRAM_END (SRAM_START + SRAM_SIZE)
#define SP_INIT_ADDRESS (SRAM_END)

#define APB1_BASE (PERIPHERALS_BASE + 0x00000u)
#define APB2_BASE (PERIPHERALS_BASE + 0x10000u)
#define AHB1_BASE (PERIPHERALS_BASE + 0x20000u)

/* DS9716 5 Memory mapping - Table 10. STM32F401xB/STM32F401xC register boundary addresses*/
/* AHB1 */
#define GPIOA_BASE  (AHB1_BASE + 0x0000u)
#define GPIOB_BASE  (AHB1_BASE + 0x0400u)
#define GPIOC_BASE  (AHB1_BASE + 0x0800u)
#define RCC_BASE    (AHB1_BASE + 0x3800u)
/* APB1 */
#define USART2_BASE (APB1_BASE + 0x4400u)
/* APB2 */
#define USART1_BASE (APB2_BASE + 0x1000u)

#endif /* STM32F401 */