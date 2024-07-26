#include "usart.h"

static void usart_send_byte(dt_usart usart, const char data);
static char usart_get_byte(dt_usart usart);

char usart_buffer[] = " ";

void usart_enable (dt_usart usart)
{
    USART_CR1(usart) |= USART_CR1_UE;
}

void usart_set_mode (dt_usart usart, dt_usart mode)
{
    USART_CR1(usart) |= mode;
}

void usart_set_baudrate (dt_usart usart, dt_usart baud)
{
    uint32_t reg32;

    reg32 = USART_BRR(usart);
    reg32 = (uint32_t)(cpu_freq / (16 * baud)) << 4;

    USART_BRR(usart) = reg32;
}

void usart_transmit (dt_usart usart, const dt_usart length, char *data)
{
    uint32_t i;
    char *pdata = data;
    
    for (i = 0; i < length; i++)
    {
        usart_send_byte(usart, *pdata++);
    }
}

static void usart_send_byte (dt_usart usart, const char data)
{
    USART_DR(usart) = data;
    while((USART_SR(usart) & USART_SR_TC) == 0);
}

void usart_receive (dt_usart usart, const dt_usart limit, char *data)
{
    uint32_t i;
    char *ptr = data;

    for (i = 0; i < limit; i++)
    {
        *ptr++ = usart_get_byte(usart);
    }
}

static char usart_get_byte (dt_usart usart)
{
    while ((USART_SR(usart) & USART_SR_RXNE) == 0);
    return USART_DR(usart);
}

void usart_irq_enable (dt_usart usart)
{
    USART_CR1(usart) |= USART_CR1_RXNEIE;
}

void usart_init_send (dt_usart usart)
{
    usart_send_byte(usart, 0);
}