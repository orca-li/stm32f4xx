#ifndef _BRIDGE_MACROS_H
#define _BRIDGE_MACROS_H

#include <stdint.h>

#define MMIO32(address) (*(volatile uint32_t *)(address))

#endif /* _BRIDGE_MACROS_H */