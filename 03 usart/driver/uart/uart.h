#ifndef DRIVER_INC_UART_H
#define DRIVER_INC_UART_H

#include "../../featherlib/fl_rcc.h"
#include "../../featherlib/fl_uart.h"

#define USART2 (USART2_BASE)

void init_uart(void);
void u_transmit();
void u_byte_transmit();
void u_receive();
void u_byte_receive();
void u_data_available();

#endif /* DRIVER_INC_UART_H */