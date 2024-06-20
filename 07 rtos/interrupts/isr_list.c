#include <stdint.h>

#include "bridge/memory.h"
#include "interrupts/isr_list.h"
#include "interrupts/scb/scb_list.h"

uint32_t isr_vector[] __attribute__((section(".isr_vector"))) = {
    SP_INIT_ADDRESS,
    (uint32_t)&reset_handler,
    (uint32_t)&nmi_handler,
    (uint32_t)&hardfault_handler,
    /* SCB - system control block */
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
    (uint32_t)&pendsv_handler,
    (uint32_t)&systick_handler,
    /* IRQ - interrupt request */
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