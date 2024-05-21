#ifndef FEATHERLIB_INC_UART_H
#define FEATHERLIB_INC_UART_H

#include "fl_define.h"
#include "fl_nvic.h"
#include "fl_rcc.h"

#define USART2 (USART2_BASE)

/* --- USART registers ----------------------------------------------------- */
/* RM0368 19.6.1 Status register (USART_SR)*/
#define USART_SR(usart_base)    MMIO32((usart_base) + 0x00)
/* RM0368 19.6.2 Data register (USART_DR) */
#define USART_DR(usart_base)    MMIO32((usart_base) + 0x04)
/* RM0368 19.6.3 Baud rate register (USARTx_BRR) */
#define USART_BRR(usart_base)	MMIO32((usart_base) + 0x08)
/* RM0368 19.6.4 Control register 1 (USART_CR1) */
#define USART_CR1(usart_base)   MMIO32((usart_base) + 0x0C)
/* RM0368 19.6.5 Control register 2 (USART_CR2) */
#define USART_CR2(usart_base)   MMIO32((usart_base) + 0x10)



/* --- USART_SR values ----------------------------------------------------- */
/* CTS:  */
#define USART_SR_CTS        (1 << 9)

/** LBD: LIN break detection flag */
#define USART_SR_LBD        (1 << 8)

/** TXE: Transmit data buffer empty */
#define USART_SR_TXE        (1 << 7)

/** TC: Transmission complete */
#define USART_SR_TC			(1 << 6)

/** RXNE: Read data register not empty */
#define USART_SR_RXNE       (1 << 5)

/** IDLE: Idle line detected */
#define USART_SR_IDLE       (1 << 4)

/** ORE: Overrun error */
#define USART_SR_ORE        (1 << 3)

/** NF: Noise detected flag */
#define USART_SR_NF			(1 << 2)

/** FE: Framing error */
#define USART_SR_FE			(1 << 1)

/** PE: Parity error */
#define USART_SR_PE         (1 << 0)

#define USART_FLAG_PE	USART_SR_PE
#define USART_FLAG_FE	USART_SR_FE
#define USART_FLAG_NF	USART_SR_NF
#define USART_FLAG_ORE	USART_SR_ORE
#define USART_FLAG_IDLE	USART_SR_IDLE
#define USART_FLAG_RXNE	USART_SR_RXNE
#define USART_FLAG_TC	USART_SR_TC
#define USART_FLAG_TXE	USART_SR_TXE

/* --- USART_DR values ----------------------------------------------------- */
/* USART_DR[8:0]: DR[8:0]: Data value */
#define USART_DR_MASK           (0x1FF)

/* --- USART_CR1 values ---------------------------------------------------- */
/* UE: USART enable */
#define USART_CR1_UE            (1 << 13)

/* M: Word length */
#define USART_CR1_M             (1 << 12)

/* PCE: Parity control enable */
#define USART_CR1_PCE           (1 << 10)

/* PS: Parity selection */
#define USART_CR1_PS            (1 << 9)

/* RXNEIE: RXNE interrupt enable */
#define USART_CR1_RXNEIE        (1 << 5)

/* TE: Transmitter enable */
#define USART_CR1_TE            (1 << 3)

/* RE: Receiver enable */
#define USART_CR1_RE            (1 << 2)

/* --- USART_CR2 values ---------------------------------------------------- */
/* STOP[13:12]: STOP bits */
#define USART_CR2_STOPBITS_1		(0x00 << 12)     /* 1 stop bit */
#define USART_CR2_STOPBITS_0_5		(0x01 << 12)     /* 0.5 stop bits */
#define USART_CR2_STOPBITS_2		(0x02 << 12)     /* 2 stop bits */
#define USART_CR2_STOPBITS_1_5		(0x03 << 12)     /* 1.5 stop bits */
#define USART_CR2_STOPBITS_MASK		(0x03 << 12)

/* --- Convenience defines ------------------------------------------------- */

/* CR1_PCE / CR1_PS combined values */
/****************************************************************************/
#define USART_PARITY_NONE		(0x00)
#define USART_PARITY_EVEN		(USART_CR1_PCE)
#define USART_PARITY_ODD		(USART_CR1_PS | USART_CR1_PCE)
#define USART_PARITY_MASK		(USART_CR1_PS | USART_CR1_PCE)

/* CR1_TE/CR1_RE combined values */
/****************************************************************************/
#define USART_MODE_RX           (USART_CR1_RE)
#define USART_MODE_TX           (USART_CR1_TE)
#define USART_MODE_TX_RX        (USART_CR1_TE | USART_CR1_RE)
#define USART_MODE_MASK         (USART_CR1_TE | USART_CR1_RE)

void usart_set_databits(uint32_t usart, uint32_t bits);
void usart_set_baudrate(uint32_t usart, uint32_t baud);
void usart_set_parity(uint32_t usart, uint32_t parity);
void usart_set_stopbits(uint32_t usart, uint32_t stopbits);
void usart_set_mode(uint32_t usart, uint32_t mode);
void usart_enable_rx_interrupt(uint32_t usart);
void usart_send_blocking(uint32_t usart, uint16_t data);
void usart_wait_send_ready(uint32_t usart);
void usart_send(uint32_t usart, uint16_t data);
bool usart_get_flag(uint32_t usart, uint32_t flag);
uint16_t usart_recv(uint32_t usart);
void usart_enable(uint32_t usart);

#endif /* FEATHERLIB_INC_UART_H */