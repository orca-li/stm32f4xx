#if !defined(__CMWRAP_SISTICK_H__)
#define __CMWRAP_SISTICK_H__

#include <CMWrap.h>
#include <stdint.h>
#include "configCMW.h"

void delay_ms(uint32_t millieconds);

static inline void __pendsv_ipt(void)
{
    SCB->ICSR = SCB_ICSR_PENDSVSET_Msk;
}

#endif /* __CMWRAP_SISTICK_H__ */