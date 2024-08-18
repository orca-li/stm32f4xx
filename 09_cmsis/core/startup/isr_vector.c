#include <CMWrap.h>

void Reset_Handler(void);
void NMI_Handler(void);
void Hardfault_Handler(void);
void SysTick_Handler(void);
void usart1_IRQhandler(void);
void usart2_IRQhandler(void);

uint32_t isr_vector[] __attribute__((section(".isr_vector"))) = {
    SP_INIT_ADDRESS,
    (uint32_t)&Reset_Handler,
    (uint32_t)&NMI_Handler,
    (uint32_t)&Hardfault_Handler,
    0,
    0,
    0,
    0,
    0,
    0, /* 10 */
    0,
    0,
    0,
    0,
    0,
    (uint32_t)&SysTick_Handler,
    0,
    0,
    0,
    0, /* 20 */
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0, /* 30 */
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0, /* 40 */
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0, /* 50 */
    0,
    0,
    0,
    (uint32_t)&usart1_IRQhandler,
    (uint32_t)&usart2_IRQhandler,
}; /* count interrupts: 55 */