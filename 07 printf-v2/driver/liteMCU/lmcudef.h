#if !defined(LITEMCU_LMCDEF_H)
#define LITEMCU_LMCDEF_H

#include <stdint.h>

#define MMIO32(address) (*(volatile uint32_t *)(address))

#endif /* LITEMCU_LMCDEF_H */