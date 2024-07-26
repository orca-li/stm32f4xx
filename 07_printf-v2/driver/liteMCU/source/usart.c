#include "include/usart.h"
#include "include/rcc.h"

static void usart_send_byte(uint32_t usart, const uint8_t data);
static uint8_t usart_get_byte(uint32_t usart);

uint8_t usart_buffer[] = " ";

void usart_enable (uint32_t usart)
{
    USART_CR1(usart) |= USART_CR1_UE;
}

void usart_set_mode (uint32_t usart, uint32_t mode)
{
    USART_CR1(usart) |= mode;
}

void usart_set_baudrate (uint32_t usart, uint32_t baud)
{
    uint32_t reg32;

    reg32 = USART_BRR(usart);
    reg32 = (uint32_t)(cpu_freq / (16 * baud)) << 4;

    USART_BRR(usart) = reg32;
}

void usart_transmit (uint32_t usart, const uint32_t length, uint8_t *data)
{
    uint32_t i;
    uint8_t *pdata = data;
    
    for (i = 0; i < length; i++)
    {
        usart_send_byte(usart, *pdata++);
    }
}

static void usart_send_byte (uint32_t usart, const uint8_t data)
{
    USART_DR(usart) = data;
    while((USART_SR(usart) & USART_SR_TC) == 0);
}

void usart_receive (uint32_t usart, const uint32_t limit, uint8_t *data)
{
    uint32_t i;
    uint8_t *ptr = data;

    for (i = 0; i < limit; i++)
    {
        *ptr++ = usart_get_byte(usart);
    }
}

static uint8_t usart_get_byte (uint32_t usart)
{
    while ((USART_SR(usart) & USART_SR_RXNE) == 0);
    return USART_DR(usart);
}

void usart_irq_enable (uint32_t usart)
{
    USART_CR1(usart) |= USART_CR1_RXNEIE;
}

void usart_init_send (uint32_t usart)
{
    usart_send_byte(usart, 0);
}