#include <stdbool.h>

#include "fl_uart.h"

void usart_set_databits (uint32_t usart, uint32_t bits) {
    if (bits == 8) {
        USART_CR1(usart) &= ~USART_CR1_M;
    } else {
        USART_CR1(usart) |= USART_CR1_M; 
    }
}

void usart_set_baudrate (uint32_t usart, uint32_t baud) {
    uint32_t clock = rcc_get_usart_clk_freq(usart);
    USART_BRR(usart) = (clock + baud / 2) / baud;
}

void usart_set_parity (uint32_t usart, uint32_t parity) {
    uint32_t reg32 = USART_CR1(usart);
    reg32 = (reg32 & ~USART_PARITY_MASK) | parity;
    USART_CR1(usart) = reg32;
}

void usart_set_stopbits (uint32_t usart, uint32_t stopbits) {
    uint32_t reg32 = USART_CR2(usart);
    reg32 = (reg32 & ~USART_CR2_STOPBITS_MASK) | stopbits;
    USART_CR2(usart) = reg32;
}

void usart_set_mode (uint32_t usart, uint32_t mode) {
    uint32_t reg32 = USART_CR1(usart);
    reg32 = (reg32 & ~USART_MODE_MASK) | mode;
    USART_CR1(usart) = reg32;
}

void usart_enable_rx_interrupt (uint32_t usart) {
    USART_CR1(usart) |= USART_CR1_RXNEIE;
}

void usart_enable(uint32_t usart) {
    USART_CR1(usart) |= USART_CR1_UE;
}

void usart_send_blocking(uint32_t usart, uint16_t data) {
    usart_wait_send_ready(usart);
	usart_send(usart, data);
}

void usart_wait_send_ready(uint32_t usart) {
    while (0 == ((USART_SR_TXE & USART_SR(usart))));
}

void usart_send (uint32_t usart, uint16_t data) {
    USART_DR(usart) = (data & USART_DR_MASK);
}

bool usart_get_flag(uint32_t usart, uint32_t flag) {
	return ((USART_SR(usart) & flag) != 0);
}

uint16_t usart_recv(uint32_t usart) {
	/* Receive data. */
	return USART_DR(usart) & USART_DR_MASK;
}