#include <stdbool.h>
#include <stdint.h>

#include "core/system.h"
#include "driver/uart/uart.h"
#include "featherlib/fl_gpio.h"

#define UART_PORT   (GPIOA)
#define RX_PIN      (GPIO3)
#define TX_PIN      (GPIO2)

static void gpio_setup (void) {
    gpio_mode_setup(UART_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, TX_PIN | RX_PIN);
    gpio_set_af(UART_PORT, GPIO_AF7, LED_PIN, TX_PIN | RX_PIN);
}

int main(void){
    init_uart();

    while (true) {
        u_transmit("hello ", 7);
        sleep(2000000);
    }

    return 0;
    
}