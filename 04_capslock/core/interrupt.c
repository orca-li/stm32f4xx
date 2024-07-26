#include <stdint.h>

#include "bridge/memory.h"

void reset_handler(void);

uint32_t isr_vector[] __attribute__((section(".isr_vector"))) = {
    SP_INIT_ADDRESS,
    (uint32_t)&reset_handler,
}; /* count interrupts: 2 */