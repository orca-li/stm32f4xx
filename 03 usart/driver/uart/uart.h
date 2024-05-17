#ifndef DRIVER_INC_UART_H
#define DRIVER_INC_UART_H

#include "../../featherlib/fl_rcc.h"

void init_uart(void);
void u_transmit(uint8_t *data, const uint32_t length);
void u_receive();
void u_byte_receive();
void u_data_available();

#endif /* DRIVER_INC_UART_H */