#ifndef STM32F4XX_INC_USART_H
#define STM32F4XX_INC_USART_H

#include "common.h"
#include "memory.h"

#define USART2 USART2_BASE

/* RM0368 19.6.1 Status register (USART_SR) */
#define USART_SR(usart) MMIO32(usart + 0x00u)
#define USART_SR_TXE    (1 << 7)    /* Bit 7 TXE: Transmit data register empty */
#define USART_SR_TC     (1 << 6)    /* Bit 6 TC: Transmission complete */

/* RM0368 19.6.2 Data register (USART_DR) */
#define USART_DR(usart) MMIO32(usart + 0x04u)

/* RM0368 19.6.3 Baud rate register (USART_BRR) */
#define USART_BRR(usart) MMIO32(usart + 0x08u)

/* RM0368 19.6.4 Control register 1 (USART_CR1) */
#define USART_CR1(usart) MMIO32(usart + 0x0Cu)
/* values */
#define USART_CR1_UE        (1 << 13)   /* Bit 13 UE: Usart enable */
#define USART_CR1_M         (1 << 12)   /* Bit 12 M: Word length */
#define USART_CR1_PCE       (1 << 10)   /* Bit 10 PCE: Parity control enable */
#define USART_CR1_TE        (1 << 3)    /* Bit 3 TE: Transmitter enable */
#define USART_CR1_RE        (1 << 2)    /* Bit 2 RE: Read enable */
#define USART_CR1_SBK       (1 << 0)    /* Bit 0 SBK: Send break */

/* RM0368 19.6.5 Control register 2 (USART_CR2) */
#define USART_CR2(usart) MMIO32(usart + 0x10u)
/* values */
/*subvalues */
#define CR_STOP_ONE     (0u)
#define CR_STOP_HALF    (1u)
#define CR_STOP_TWO     (2u)
#define CR_STOP_1HALF   (3u)
#define USART_CR2_STOP_ONE  (3u << 12) /* &= */
#define USART_CR2_STOP(value) (value << 12) /* Bit 13:12 STOP: Stop bits */

/* RM0368 19.6.6 Control register 3 (USART_CR3) */
#define USART_CR3(usart) MMIO32(usart + 0x14u)
/* values */
#define USART_CR3_CTSE  (1 << 9)    /* Bit 9 CTSE: CTS enable */
#define USART_CR3_RTSE  (1 << 8)    /* Bit 8 RTSE: RTS enable */

#endif /* STM32F4XX_INC_USART_H */