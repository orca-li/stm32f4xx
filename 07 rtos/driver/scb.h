#ifndef _DRIVER_SCB_H
#define _DRIVER_SCB_H

#include "bridge/scb.h"

void scb_set_priority(uint32_t priority, uint32_t level);
void scb_set_pendsv(void);

#endif /* _DRIVER_SCB_H */