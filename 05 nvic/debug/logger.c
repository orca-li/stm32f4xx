#include <stdlib.h>
#include <string.h>

#include "logger.h"

static void tag_send(uint32_t channel, logstring_t tag, logstring_t msg);
static void channel_send(uint32_t channel);
static char *get_channel_name(uint32_t channel);

logger_config logcnfg = {
    .tag_channel = false
};

void tags_log (uint32_t channel, logstring_t tag, logstring_t msg)
{
    if(channel == USART1 || channel == USART2) {
        tag_send(channel, tag, msg);
    }
}

static void tag_send (uint32_t channel, logstring_t tag, logstring_t msg)
{
    static char *shortstr = ": ";
    usart_transmit(channel, strlen(tag), tag);
    usart_transmit(channel, strlen(shortstr), shortstr);
    if (logcnfg.tag_channel) {
         channel_send(channel);
        usart_transmit(channel, strlen(shortstr), shortstr);
    }
    usart_transmit(channel, strlen(msg), msg);
    usart_transmit(channel, 1, "\n");
}

static void channel_send (uint32_t channel)
{
    char *name = get_channel_name(channel);
    usart_transmit(channel, strlen(name), name);
}

static char *get_channel_name (uint32_t channel)
{
    switch (channel) {
    case USART1:
        return "USART1";

    case USART2:
        return "USART2";
    
    default:
        return "UNKNOWN CHANNEL";
    }
}