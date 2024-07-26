#ifndef _DRIVER_USART_H
#define _DRIVER_USART_H

#include "bridge/usart.h"
#include "rcc.h"

typedef uint32_t dt_usart;

#define USART_MODE_TX       (USART_CR1_TE)
#define USART_MODE_RX       (USART_CR1_RE)
#define USART_MODE_TX_RX    (USART_MODE_RX | USART_MODE_TX)

void usart_enable(dt_usart usart);
void usart_set_mode(dt_usart usart, dt_usart mode);
void usart_set_baudrate(dt_usart usart, dt_usart baud);
void usart_transmit(dt_usart usart, const dt_usart length, char *data);
void usart_receive(dt_usart usart, const dt_usart limit, char *data);

#endif /* _DRIVER_USART_H */