#include <stdbool.h>

#include "debug/logger.h"
#include "fusecore/fusecore.h"
#include "software/capslock.h"

static const logstring_t TAG = "firmware";

int main (void) {
    fusecore();

    // uint8_t key[] = " ";

    while (true) {
        gpio_toggle_pin(GPIOC, PIN13);
        for(uint32_t i = 0; i < 1000000; i++);

        tags_log(USART1, TAG, "LOG OK");

        // usart_receive(USART1, 1, key);
        // key[0] = capslock(key[0]);
        // usart_transmit(USART1, 1, key);
    }

    return 0;
}