#include "uart.h"

void init_uart(void) {
    rcc_periph_clock_enable(RCC_USART2);

    // usart_set_flow_control(USART2, USART_FLOW_CONTROL_NONE);
    usart_set_databits(USART2, 8);
    usart_set_baudrate(USART2, 115200);
    usart_set_parity(USART2, USART_PARITY_NONE);
    usart_set_stopbits(USART2, 1);
}