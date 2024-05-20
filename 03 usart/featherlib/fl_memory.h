#ifndef FEATHERLIB_INC_MEMORYMAP_H
#define FEATHERLIB_INC_MEMORYMAP_H

/* Memory map for all busses */
#define FLASH_BASE  (0x08000000u)
#define PERIPH_BASE (0x40000000u)
#define PERIPH_BASE_APB1 (PERIPH_BASE + 0x00000)
#define PERIPH_BASE_APB2 (PERIPH_BASE + 0x10000)
#define PERIPH_BASE_AHB1 (PERIPH_BASE + 0x20000)

/* Register boundary addresses */

/* APB1 */
#define USART2_BASE (PERIPH_BASE_APB1 + 0x4400)

/* APB2 */
#define USART1_BASE (PERIPH_BASE_APB2 + 0x1000)
#define USART6_BASE (PERIPH_BASE_APB2 + 0x1400)

/* AHB1 */
/* DS9716 5 Memory mapping - table 10. STM32F401xB/STM32F401xC register boundary addresses */
#define GPIO_PORT_A_BASE (PERIPH_BASE_AHB1 + 0x0000)
#define GPIO_PORT_B_BASE (PERIPH_BASE_AHB1 + 0x0400)
#define GPIO_PORT_C_BASE (PERIPH_BASE_AHB1 + 0x0800)
#define RCC_BASE (PERIPH_BASE_AHB1 + 0x23800)

/* --- ARM Cortex-M0, M3 and M4 specific definitions ----------------------- */
/* Private peripheral bus - Internal */
/* PM0214 2.2 Memory model - Figure 8. Memory map */
#define PPBI_BASE (0xE0000000u) 

/* Core peripheral register regions */
/* PM0214 4.1 - Table 37. STM32 core peripheral register regions */
#define CPR_BASE (PPBI_BASE + 0xE000u) 

/* NVIC: Nested Vector Interrupt Controller */
/* PM0214 4.1 - Table 37. STM32 core peripheral register regions */
#define NVIC_BASE (CPR_BASE + 0x0100u) 

#endif /* FEATHERLIB_INC_MEMORYMAP_H */