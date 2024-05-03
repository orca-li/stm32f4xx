#ifndef FEATHERLIB_INC_UART_H
#define FEATHERLIB_INC_UART_H

#include "fl_define.h"
#include "fl_rcc.h"

/* --- USART_CR1 values ---------------------------------------------------- */

/* PCE: Parity control enable */
#define USART_CR1_PCE (1 << 10)

/* PS: Parity selection */
#define USART_CR1_PS (1 << 9)

/* --- Convenience defines ------------------------------------------------- */

/* CR1_PCE / CR1_PS combined values */
/****************************************************************************/
#define USART_PARITY_NONE		0x00
#define USART_PARITY_EVEN		USART_CR1_PCE
#define USART_PARITY_ODD		(USART_CR1_PS | USART_CR1_PCE)
#define USART_PARITY_MASK		(USART_CR1_PS | USART_CR1_PCE)

/* --- USART_CR1 values ---------------------------------------------------- */
/* M: Word length */
#define USART_CR1_M (1 << 12)


/* Control register 1 (USARTx_CR1) */
#define USART_CR1(usart_base) MMIO32((usart_base) + 0x0C) /* RM0368 19.6.4 */


void usart_set_databits(uint32_t usart, uint32_t bits);
void usart_set_baudrate(uint32_t usart, uint32_t baud);
void usart_set_parity(uint32_t usart, uint32_t parity);

#endif /* FEATHERLIB_INC_UART_H */