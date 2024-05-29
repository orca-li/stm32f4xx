#ifndef _DEBUG_LOGGER_H
#define _DEBUG_LOGGER_H

#include <stdbool.h>

#include "driver/usart.h"

typedef char *tagstring_t;
typedef char *logstring_t;

typedef struct struct_logger_config {
    bool tag_channel;
} logger_config;

void tags_log(uint32_t channel, tagstring_t tag, logstring_t msg);

extern logger_config logcnfg;

#endif /* _DEBUG_LOGGER_H */