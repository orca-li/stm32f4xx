#ifndef BLINK_H
#define BLINK_H

#include <stdint.h>

typedef enum {
    MODE_BIT_SET = 0,
    MODE_BIT_RESET,
    MODE_BLINK,
    MODE_DOT,
    MODE_DASH,
} mode_bt;

void blink(mode_bt mode);

#endif /* BLINK_H */