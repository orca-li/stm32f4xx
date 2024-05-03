#ifndef CLOCK_H
#define CLOCK_H

#include <stdint.h>

typedef uint32_t ms_clock_ct;
typedef uint32_t mcs_clock_ct;

void ms_delay_cf(ms_clock_ct milliseconds);
void mcs_delay_cf(mcs_clock_ct microseconds);

#endif /* CLOCK_H */