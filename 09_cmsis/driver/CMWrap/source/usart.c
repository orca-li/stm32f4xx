#include <CMWrap.h>

static void usart_send_byte(USART_TypeDef *usart, const uint8_t data);
static uint8_t usart_get_byte(USART_TypeDef *usart);

void usart_set_baudrate(USART_TypeDef *usart, uint32_t baud)
{
    uint32_t reg32;

    reg32 = (uint32_t)(F_CPU / (16 * baud)) << 4;
    usart->BRR = reg32;
}

void usart_transmit(USART_TypeDef *usart, const uint32_t length, uint8_t *data)
{
    uint32_t i = 0;
    uint8_t *pdata = data;

    for (i = 0; i < length; i++)
    {
        usart_send_byte(usart, *pdata++);
    }
}

static void usart_send_byte(USART_TypeDef *usart, const uint8_t data)
{
    usart->DR = data;
    while((usart->SR & USART_SR_TC) == 0);
}

void usart_receive(USART_TypeDef *usart, const uint32_t limit, uint8_t *data)
{
    uint32_t i;
    uint8_t *pdata = data;

    for (i = 0; i < limit; i++)
    {
        *pdata = usart_get_byte(usart);
    }
}

static uint8_t usart_get_byte(USART_TypeDef *usart)
{
    while((usart->SR & USART_SR_RXNE) == 0);
    return usart->DR;
}

void usart_init_send(USART_TypeDef *usart)
{
    usart_send_byte(usart, 0x00);
}