#include <stdio.h>

#include "irq_list.h"

#include "debug/logger.h"
#include "driver/usart.h"
#include "driver/gpio.h"
#include "software/capslock.h"

#undef TAG 
#define TAG "irq_list"
#define CHANNEL USART1

extern uint32_t isr_vector[54];

void nmi_handler (void)
{
    tags_log(CHANNEL, TAG, "nmi_handler");
    while(true);
}

void hardfault_handler (void)
{
    char get_address[64];
    tags_log(CHANNEL, TAG, "hardfault_handler");
    for (uint32_t i = 0; i < 54; i++) {
        snprintf(get_address, 64, "flash -> sram: 0x%08lX -> 0x%8lX", i*4, isr_vector[i]);
        tags_log(CHANNEL, TAG, get_address);
    }

    while(true);
}

void usart1_IRQhandler (void)
{
    if(USART_SR(USART1) & USART_SR_RXNE) {
        capslock(USART1);
    }
}

void usart2_IRQhandler (void)
{
    if(USART_SR(USART2) & USART_SR_RXNE) {
        capslock(USART2);
    }
}