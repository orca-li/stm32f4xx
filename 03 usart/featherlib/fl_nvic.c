#include "fl_nvic.h"

void nvic_enable_irq (uint8_t irqn) {
    NVIC_ISER(irqn / 32) = (1 << (irqn % 32));
}