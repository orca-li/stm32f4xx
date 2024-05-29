#include <ctype.h>
#include <stdint.h>

#include "capslock.h"
#include "driver/usart.h"

#define CAPSBIT (1 << 5)

static char_ct capsbit (char_ct c);

void capslock (uint32_t channel)
{
    char_ct character;

    usart_receive(channel, 1, (char*)&character);
    character = capsbit(character);
    usart_transmit(channel, 1, (char*)&character);
}

static char_ct capsbit (char_ct c) 
{
    return (isalpha(c)) ? c ^ CAPSBIT : c;
}