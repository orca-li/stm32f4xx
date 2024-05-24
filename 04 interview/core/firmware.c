#include <stdbool.h>

#include "fusecore/fusecore.h"
#include "software/capslock.h"

int main (void) {
    fusecore();

    while (true) {
        gpio_toggle_pin(GPIOC, PIN13);
        for (uint32_t i = 0; i < 1000000; i++);
        
        usart_transmit(USART2, 6, "hello ");
    }

    return 0;
}