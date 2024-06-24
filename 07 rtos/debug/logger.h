#ifndef _DEBUG_LOGGER_H
#define _DEBUG_LOGGER_H

#include <stdbool.h>

#include "driver/usart.h"

typedef char *tagstring_t;
typedef char *logstring_t;

typedef struct struct_logger_config {
    bool channel_tag;
    uint32_t channel_out;
    uint32_t dump_offset;
    uint32_t dump_size;
} logger_config;

void dump_sram(void);
void tags_log(uint32_t channel, tagstring_t tag, logstring_t msg);
void dump_section(uint8_t *addr);
void dump_CortexM4(void);

extern logger_config logcnfg;

#endif /* _DEBUG_LOGGER_H */