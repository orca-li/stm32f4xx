#ifndef FEATHERLIB_INC_DEFINE_H
#define FEATHERLIB_INC_DEFINE_H

#include <stdint.h>
#include "fl_memory.h"

#define _BIT_SET(reg, bit)      reg |= (1 << bit)
#define _BIT_RESET(reg, bit)    reg &= (0 << bit)

typedef volatile uint32_t * _p_register;

/* Generic memory-mapped I/O accessor functions */
#define MMIO32(addr) (*(_p_register)(addr))

#endif /* FEATHERLIB_INC_DEFINE_H */