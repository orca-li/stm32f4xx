#include <stdbool.h>
#include <string.h>

#include "bridge/rcc.h"
#include "bridge/gpio.h"
#include "bridge/usart.h"
#include "driver/gpio.h"
#include "driver/rcc.h"
#include "driver/usart.h"

int main (void) {
    rcc_periph_clock_enable(AHBUS1, (GPIOAEN | GPIOCEN));
    rcc_periph_clock_enable(APBUS1, (USART2EN));
    
    gpio_mode_setup(GPIOC, PIN13, GPIO_MODE_OUTPUT);
    gpio_mode_setup(GPIOA, PIN2, GPIO_MODE_AF);

    gpio_af_setup(GPIOA, AFRLOW, PIN2, GPIO_AF07);

    usart_set_baudrate(USART2, 0x0683);
    usart_set_mode(USART2, USART_MODE_TX);
    usart_enable(USART2);

    char message[] = "hello usart, i hate you xD <3\n";
    uint32_t endmsg = sizeof(message) / sizeof(message[0]);

    while (true) {
        gpio_toggle_pin(GPIOC, PIN13);
        for (uint32_t i = 0; i < 1000000; i++);
        
        usart_transmit(USART2, endmsg - 1, message);
    }

    return 0;
}