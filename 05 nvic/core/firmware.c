#include <stdbool.h>

#include "debug/logger.h"
#include "fusecore/fusecore.h"
#include "software/capslock.h"

#define CHANNEL USART1

#undef TAG
#define TAG "firmware"

int main (void) {
    for(uint32_t i = 0; i < 5000000; i++);
    fusecore();

    while (true) {
        gpio_toggle_pin(GPIOC, PIN13);
        for(uint32_t i = 0; i < 1000000; i++);
    }

    return 0;
}

