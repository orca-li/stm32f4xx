#include <stdbool.h>

#include "debug/logger.h"
#include "fusecore/fusecore.h"
#include "software/capslock.h"

#define CHANNEL USART1

#undef TAG
#define TAG "firmware"

int main (void) {
    fusecore();
    
    while (true) {
        gpio_toggle_pin(GPIOC, PIN13);
        delay_ms(1000);
    }

    return 0;
}

