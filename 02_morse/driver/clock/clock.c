#include "clock.h"

void ms_delay_cf(ms_clock_ct milliseconds){
    mcs_delay_cf(milliseconds * 1000);
}

void mcs_delay_cf(mcs_clock_ct microseconds){
    for(mcs_clock_ct i = 0; i < microseconds; i++);
}