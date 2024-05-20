#include <stdint.h>

#include "system.h"

void systick_handler (void) {
    ticks++;
}

void sleep (uint32_t cticks) {
    for (volatile uint32_t i = 0; i < cticks; i++);
}