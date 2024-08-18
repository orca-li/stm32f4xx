#if !defined(__CMWRAP_H__)
#define __CMWRAP_H__

/* USER CODE BEGIN */
#include "stm32f4xx.h"

#define SP_INIT_ADDRESS (0x2000FFFC)
#define F_CPU (16000000)
/* USER CODE END */

#include <stdint.h>
#include "include/systick.h"

#endif /* __CMWRAP_H__ */