#include "fl_uart.h"

void usart_set_databits(uint32_t usart, uint32_t bits) {
    if (bits == 8) {
        USART_CR1(usart) &= ~USART_CR1_M;
    } else {
        USART_CR1(usart) |= USART_CR1_M; 
    }
}

void usart_set_baudrate(uint32_t usart, uint32_t baud) {
    uint32_t clock = rcc_get_usart_clk_freq(usart);
}

void usart_set_parity(uint32_t usart, uint32_t parity) {
    uint32_t reg32 = USART_CR1(usart);
    reg32 = (reg32 & ~USART_PARITY_MASK) | parity;
    USART_CR1(usart) = reg32;
}

void usart_set_stopbits(uint32_t usart, uint32_t stopbits) {
    uint32_t reg32 = USART_CR2(usart);
    reg32 = (reg32 & ~USART_CR_STOPBITS_MASK) | stopbits;
    USART_CR2(usart) = reg32;
}