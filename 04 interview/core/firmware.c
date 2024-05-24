#include <stdbool.h>
#include <string.h>

#include "fusecore/fusecore.h"

int main (void) {
    fusecore();

    char message[] = "hello usart, i hate you xD <3\n";
    uint32_t endmsg = sizeof(message) / sizeof(message[0]);

    while (true) {
        gpio_toggle_pin(GPIOC, PIN13);
        for (uint32_t i = 0; i < 1000000; i++);
        
        usart_transmit(USART2, endmsg - 1, message);
    }

    return 0;
}