#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "logger.h"

static void tag_send(uint32_t channel, tagstring_t tag, logstring_t msg);
static void channel_send(uint32_t channel);
static char *get_channel_name(uint32_t channel);

logger_config logcnfg = {
    .channel_tag = false,
    .channel_out = USART1,
    .dump_offset = 20,
    .dump_size = 20,
};

void tags_log (uint32_t channel, tagstring_t tag, logstring_t msg)
{
    if(channel == USART1 || channel == USART2) {
        tag_send(channel, tag, msg);
    }
}

void dump_sram (uint8_t *addr)
{
    uint32_t i;
    char buffer[64];
    uint8_t *dump = addr;
    dump -= logcnfg.dump_offset;

    for (i = 0; i < logcnfg.dump_size; i++) {
        snprintf(buffer, 64, "addr: %p\tdecm: %d\tchar: %c", (void*)dump, (int)*dump, (char)*dump);
        tags_log(logcnfg.channel_out, "DUMP", buffer);
        dump++;
    }
}

static void tag_send (uint32_t channel, tagstring_t tag, logstring_t msg)
{
    static char *shortstr = ": ";
    usart_transmit(channel, strlen(tag), (char*)tag);
    usart_transmit(channel, strlen(shortstr), shortstr);
    if (logcnfg.channel_tag) {
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