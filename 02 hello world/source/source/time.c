#include "../include/time.h"

void sec_delay_t(sec_time_tt seconds){
    ms_delay_t(seconds * 1000);
}

void ms_delay_t(ms_time_tt milliseconds){
    mcs_delay_t(milliseconds * 1000);
}

void mcs_delay_t(mcs_time_tt microseconds){
    for (mcs_time_tt i = 0; i < microseconds; i++);
}
