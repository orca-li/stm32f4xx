#include <stdbool.h>

#include "fusecore/fusecore.h"
#include "software/capslock.h"

int main (void) {
    fusecore();

    char key[] = " ";

    while (true) {
        usart_receive(USART2, 1, key);
        key[0] = capslock(key[0]);
        gpio_toggle_pin(GPIOC, PIN13);
        usart_transmit(USART2, 1, key);
    }

    return 0;
}