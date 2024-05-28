#include <stdlib.h>
#include <string.h>

#include "include/stdio.h"
#include "logger.h"

void tags_log (uint32_t channel, logstring_t tag, logstring_t msg)
{
    size_t tag_size = strlen(tag);
    size_t msg_size = strlen(msg);

    if(channel == USART1 || channel == USART2) {
        char *shortbuf = ": ";
        usart_transmit(channel, tag_size, tag);
        usart_transmit(channel, strlen(shortbuf), shortbuf);
        usart_transmit(channel, msg_size, msg);
        usart_transmit(channel, 1, "\n");
    }

}