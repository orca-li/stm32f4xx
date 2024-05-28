#ifndef _DEBUG_LOGGER_H
#define _DEBUG_LOGGER_H

#include <stdbool.h>

#include "driver/usart.h"

typedef char *logstring_t;

void tags_log(uint32_t channel, __attribute__((unused)) logstring_t tag, logstring_t msg);

#endif /* _DEBUG_LOGGER_H */