#ifndef DRIVER_INC_UART_H
#define DRIVER_INC_UART_H

#include <stdbool.h>

#include "../../featherlib/fl_rcc.h"

void init_uart(void);
void u_transmit(uint8_t *data, const uint32_t length);
uint32_t u_receive (uint8_t *data, const uint32_t length);
bool u_data_available(void);

#endif /* DRIVER_INC_UART_H */