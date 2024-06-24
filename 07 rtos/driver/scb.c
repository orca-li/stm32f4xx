#include <stdio.h>

#include "driver/scb.h"
#include "driver/systick.h"

void scb_set_priority (uint32_t priority, uint32_t level)
{
    SCB_SHPR3 &= ~(SCB_PRI_CLEAN_MSK << priority);
    SCB_SHPR3 |= (level << priority);
}

void scb_set_pendsv(void)
{
    SCB_ICSR &= ~(PENDSVSET);
    SCB_ICSR |= PENDSVSET;
}