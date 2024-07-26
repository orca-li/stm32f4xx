#if !defined(LITEMCU_CONFIG_H)
#define LITEMCU_CONFIG_H

#include "lmcudef.h"

/* --- USER CODE BEGIN ----------------------------- */

#include "device/stm32f401.h"

#define LMCU_CPU_FREQ           SET_VALUE(16000000)

/* --- USER CODE END ------------------------------- */

#define SET_VALUE(_value) _value

#endif /* LITEMCU_CONFIG_H */