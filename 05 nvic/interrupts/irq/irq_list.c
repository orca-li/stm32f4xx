#include "irq_list.h"

#include "driver/usart.h"
#include "driver/gpio.h"

/* software list */
#include "software/capslock.h"
/* count: 1 */

void hardfault_handler (void)
{
    while (1) {
        gpio_toggle_pin(GPIOC, PIN13);
        for(uint32_t i = 0; i < 1000000; i++);
    }
}

void usart2_IRQhandler (void)
{

    while (1) {
        gpio_toggle_pin(GPIOC, PIN13);
        for(uint32_t i = 0; i < 1000000; i++);
    }

    if(USART_SR(USART2) & USART_SR_RXNE)
    {
        usart_receive(USART2, 1, usart_buffer);
        usart_buffer[0] = capslock(usart_buffer[0]);
        usart_transmit(USART2, 1, usart_buffer);
    }
}