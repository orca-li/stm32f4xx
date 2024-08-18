#if !defined(__CMWRAP_USART_H__)
#define __CMWRAP_USART_H__

#include "configCMW.h"
#include "stm32f4xx.h"
#include <stdint.h>

void usart_init_send(USART_TypeDef *usart);
void usart_transmit(USART_TypeDef *usart, const uint32_t length, uint8_t *data);
void usart_receive(USART_TypeDef *usart, const uint32_t limit, uint8_t *data);
void usart_set_baudrate(USART_TypeDef *usart, uint32_t baud);

#endif /* __CMWRAP_USART_H__ */