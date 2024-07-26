#include "irq_list.h"
#include "driver/usart.h"

/* software list */
#include "software/capslock.h"
/* count: 1 */

void usart2_IRQhandler (void)
{
    if(USART_SR(USART2) & USART_SR_RXNE)
    {
        usart_receive(USART2, 1, usart_buffer);
        usart_buffer[0] = capslock(usart_buffer[0]);
        usart_transmit(USART2, 1, usart_buffer);
    }
}