#ifndef _BRIDGE_USART_H
#define _BRIDGE_USART_H

#include "bridge/macros.h"
#include "bridge/memory.h"

#define USART2 USART2_BASE

/* RM0368 19.6.8 USART register map - Table 89. USART register map and reset values */
#define USART_SR(usart) MMIO32(usart + 0x00u)
#define USART_DR(usart) MMIO32(usart + 0x04u)
#define USART_BRR(usart) MMIO32(usart + 0x08u)
#define USART_CR1(usart) MMIO32(usart + 0x0Cu)
#define USART_CR2(usart) MMIO32(usart + 0x10u)
#define USART_CR3(usart) MMIO32(usart + 0x14u)

/* RM0368 19.6.1 Status register (USART_SR) */
#define USART_SR_TXE (1 << 7)  /* Bit 7 TXE: Transmit data register empty */
#define USART_SR_TC  (1 << 6)  /* Bit 6 TC: Transmission complete */
#define USART_SR_RXNE (1 << 5) /* Bit 5 RXNE: Read data register not empty */
/* RM0368 19.6.2 Data register (USART_DR) */

/* RM0368 19.6.3 Baud rate register (USART_BRR) */
/**
 *                      frequency
 * baudrate = ------------------------------
 *              8 x (2 - OVER8) x USARTDIV
 */

/* RM0368 19.6.4 Control register 1 (USART_CR1) */
#define USART_CR1_UE       (1 << 13) /* Bit 13 UE: Usart enable */
#define USART_CR1_M        (1 << 12) /* Bit 12 M: Word length */
#define USART_CR1_PCE      (1 << 10) /* Bit 10 PCE: Parity control enable */
#define USART_CR1_RXNEIE   (1 << 5) /* Bit 5 RXNEIE: RXNE interrupt enable */
#define USART_CR1_TE       (1 << 3) /* Bit 3 TE: Transmitter enable */
#define USART_CR1_RE       (1 << 2) /* Bit 2 RE: Read enable */
#define USART_CR1_SBK      (1 << 0) /* Bit 0 SBK: Send break */

/* RM0368 19.6.5 Control register 2 (USART_CR2) */
#define USART_CR2_STOP_MASK (3u)
#define USART_CR2_ONE   (0u) /* 1 stop bit */
#define USART_CR2_HALF  (1u) /* 0.5 stop bit */
#define USART_CR2_TWO   (2u) /* 2 stop bit */
#define USART_CR2_1HALF (3u) /* 1.5 stop bit */

/* RM0368 19.6.6 Control register 3 (USART_CR3) */
#define USART_CR3_CTSE  (1 << 9) /* Bit 9 CTSE: CTS enable */
#define USART_CR3_RTSE  (1 << 8) /* Bit 8 RTSE: RTS enable */

#endif /* _BRIDGE_USART_H */

/** tutorial
 * 
 * 1. TRANSFER RULES
 * 
 * 
 * 
 * 2. TRANSMIT DATA
 * 
 * build order
    * 0. if necessary, set up the transfer rules
    * 1. enable bus clocking
    * 2. configure the pin mode
    * 3. set up an alternative function
    * 4. enable usart and transmit
    * 5. set up baudrate
    * 6. put a byte in the data register
    * 7. wait the transmit complete
 * 
 * example
 * general rule --> {
 * RCC_AHB1ENR |= GPIOx;
 * (RCC_APB1ENR or RCC_AHB1ENR or OTHERBUS) |= USARTn; <-- see datasheet
 * (GPIO_AFRL or GPIO_AFRH) &= ~MASK; <-- reset the previous settings 
 * (GPIO_AFRL or GPIO_AFRH) |= AFxx; <-- see datasheet
 * }
 * 
 * USART_CR1(USARTn) |= USART_CR1_UE | USART_CR1_TE
 * USART_BRR(USARTn) = baudrate; <-- read the formula at the beginning of the usart.h file about this register
 * 
 * USART_DR(USARTn) = data;
 * while((USART_SR(USART2) & USART_SR_TC) == 0); <--  wait the transmit complete
 * 
 * 3. RECEIVE DATA
 * see the general rule in section 2 in the example
 * 
 * build order
 * 
 * 
 * example
 * 
 * 
 */