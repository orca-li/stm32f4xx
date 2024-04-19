#ifndef BLINK_H
#define BLINK_H

#include <stdint.h>
#include "time.h"

#define MODE_RESET 0
#define MODE_SET 1
#define MODE_BLINK 2

typedef uint8_t gpiox_bt;
typedef uint8_t mode_bt;

void blink(gpiox_bt gpio_n, mode_bt mode, ms_time_tt ms_delay);

#endif /* BLINK_H */