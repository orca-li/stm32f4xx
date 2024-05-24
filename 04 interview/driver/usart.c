#include "usart.h"

static void usart_send_byte (dt_usart usart, const char data);

void usart_enable (dt_usart usart) {
    USART_CR1(usart) |= USART_CR1_UE;
}

void usart_set_mode (dt_usart usart, dt_usart mode) {
    USART_CR1(usart) |= mode;
}

void usart_set_baudrate (dt_usart usart, dt_usart baud) {
    USART_BRR(usart) = (uint32_t)(cpu_freq / (16 * baud)) << 4;
}

void usart_transmit (dt_usart usart, dt_usart length, char *data) {
    dt_usart i;
    char *pdata = data;
    
    for (i = 0; i < length; i++) {
        usart_send_byte(usart, *pdata++);
    }
}

static void usart_send_byte (dt_usart usart, const char data) {
    USART_DR(usart) = data;
    while((USART_SR(usart) & USART_SR_TC) == 0);
}