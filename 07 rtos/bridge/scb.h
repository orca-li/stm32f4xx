#ifndef _BRIDGE_SCB_H
#define _BRIDGE_SCB_H

#include "bridge/macros.h"
#include "bridge/memory.h"

/* PM0214 4.4.19 SCB register map - Table 53. SCB register map and reset values*/
#define SCB_ICSR    MMIO32(SCB_BASE + 0x04u)
#define SCB_SHPR3   MMIO32(SCB_BASE + 0x20u)

/* PM0214 4.4.3 Interrupt control and state register (ICSR) */
#define PENDSVSET (1 << 28)

/* PM0214 4.4.8 System handler priority registers (SHPRx) */
/* Table 52. System fault handler priority fields  */
#define PRI_4   (0)
#define PRI_5   (8)
#define PRI_6   (16)
#define PRI_11  (24)
#define PRI_14  (16)
#define PRI_15  (24)
#define PRI_MMFAULT     PRI_4
#define PRI_BUSFAULT    PRI_5
#define PRI_USAGEFAULT  PRI_6
#define PRI_SVCALL      PRI_11
#define PRI_PENDSV      PRI_14
#define PRI_SYSTICK     PRI_15
#define SCB_PRI_CLEAN_MSK (0xFFu)


#endif /* _BRIDGE_SCB_H */