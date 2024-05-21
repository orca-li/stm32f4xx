#include <stdbool.h>
#include <stdint.h>

#include "driver/clock/clock.h"
#include "driver/uart/uart.h"
#include "featherlib/fl_gpio.h"

#define UART_PORT   (GPIOA)
#define RX_PIN      (GPIO3)
#define TX_PIN      (GPIO2)

static void gpio_setup (void) {
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_USART2);
    gpio_mode_setup(UART_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, TX_PIN | RX_PIN);
    gpio_set_af(UART_PORT, GPIO_AF7, TX_PIN | RX_PIN);
}

int main(void){
    gpio_setup();
    init_uart();

    while (true) {
        u_transmit("hello ", 6);
        ms_delay_cf(1000);
    }

    return 0;
    
}