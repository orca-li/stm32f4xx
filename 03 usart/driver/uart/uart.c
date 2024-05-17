#include "uart.h"

#include "../../featherlib/fl_uart.h"
#include "../../featherlib/fl_nvic.h"

static void u_transmit_byte(uint8_t data);

void init_uart(void) {
    rcc_periph_clock_enable(RCC_USART2);

    // usart_set_flow_control(USART2, USART_FLOW_CONTROL_NONE);
    usart_set_databits(USART2, 8);
    usart_set_baudrate(USART2, 115200);
    usart_set_parity(USART2, USART_PARITY_NONE);
    usart_set_stopbits(USART2, 1);

    usart_set_mode(USART2, USART_MODE_TX_RX);
    usart_enable_rx_interrupt(USART2);
    nvic_enable_irq(NVIC_USART2_IRQ);

    usart_enable(USART2);
}

void u_transmit (uint8_t *data, const uint32_t length) {
    for (int i = 0; i < length; i++) {
        u_transmit_byte(data[i]);
    }
}

static void u_transmit_byte (uint8_t data) {
    usart_send_blocking(USART2, (uint16_t)data);
}