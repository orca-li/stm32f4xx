#ifndef TIME_H
#define TIME_H

#include <stdint.h>

typedef uint64_t sec_time_tt;
typedef uint64_t ms_time_tt;
typedef uint64_t mcs_time_tt;

void sec_delay_t(sec_time_tt seconds);
void ms_delay_t(ms_time_tt milliseconds);
void mcs_delay_t(mcs_time_tt microseconds);

#endif /* TIME_H */