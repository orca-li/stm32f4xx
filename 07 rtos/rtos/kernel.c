#include "rtos/kernel.h"
#include "rtos/threads.h"
#include "bridge/scb.h"

void rtos (void)
{
    scb_set_priority(PRI_PENDSV, 0xFFu);
    scb_set_priority(PRI_SYSTICK, 0x00u);
    th_body();
}