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

void dump_sram (void)
{
    uint32_t *dump_stack = (uint32_t*)0x2000FFFCu;
    uint32_t *dump_heap = (uint32_t*)0x20000000u;

    do {
        printf("stack: %p\tdata: %10lx\t", dump_stack, *dump_stack);
        printf("heap:%p\tdata: %10lx\n", dump_heap, *dump_heap);
        dump_stack--; 
        dump_heap++;
    } while (dump_heap <= (uint32_t*)0x2000999C); /* SRAM */
}

void dump_section (uint8_t *addr)
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

void dump_CortexM4 (void)
{
    uint32_t *dump_cortex = (uint32_t*)0xE0000000u;
    do {
        printf("private peripheral bus: %p\tdata: %10lx\n", dump_cortex, *dump_cortex);
    } while(dump_cortex++ <= (uint32_t*)0xE00FFFFCu);
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