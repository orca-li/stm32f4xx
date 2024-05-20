#include "uart.h"

#include <stdbool.h>

#include "../../featherlib/fl_uart.h"
#include "../../featherlib/fl_nvic.h"

static void u_transmit_byte(uint8_t data);
static uint8_t u_receive_byte(void);

static uint8_t uart_buffer = 0u;
static bool data_available = false;

void usart2_isr (void) {
    const bool overrun_occurred = usart_get_flag(USART2, USART_FLAG_ORE) == 1;
    const bool received_data = usart_get_flag(USART2, USART_FLAG_RXNE) == 1;

    if (overrun_occurred || received_data) {
        uart_buffer = (uint8_t)usart_recv(USART2);
        data_available = true;
    }
}

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

uint32_t u_receive (uint8_t *data, const uint32_t length) {
    if (length > 0 && data_available) {
        *data = uart_buffer;
        data_available = false;
        return 1;
    }
    return 0;
}

static uint8_t u_receive_byte (void) {
    data_available = false;
    return uart_buffer;
}

bool u_data_available (void) {
    return data_available;
}