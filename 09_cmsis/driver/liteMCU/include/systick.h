#if !defined (LITEMCU_SYSTICK_H)
#define LITEMCU_SYSTICK_H

#include "lmcuCONFIG.h"

#if 0
/* PM0214 4.5.6 SysTick register map - Table 55. SysTick register map and reset values */
#define STK_CTRL MMIO32(SYSTICK_BASE + 0x00u)
#define STK_LOAD MMIO32(SYSTICK_BASE + 0x04u)
#define STK_VAL MMIO32(SYSTICK_BASE + 0x08u)
#define STK_CALIB MMIO32(SYSTICK_BASE + 0x0Cu)

/* PM0214 4.5.1 SysTick control and status register (STK_CTRL) */
#define COUNTENABLE (1 << 0)
#define TICKINT     (1 << 1)
#define CLKSOURCE   (1 << 2)
#endif

void delay_ms (uint32_t millieconds);
void systick_init (void);

#endif /* LITEMCU_SYSTICK_H */

/** tutorial
 * 
 */