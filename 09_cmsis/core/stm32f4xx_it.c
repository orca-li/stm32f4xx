#include <CMWrap.h>

extern volatile uint32_t ticks;
extern uint32_t isr_vector[54];

void NMI_Handler (void)
{
    while(1);
}

void Hardfault_Handler (void)
{
    while(1);
}

void SysTick_Handler (void)
{
    ticks++;
}


void usart1_IRQhandler (void)
{

}

void usart2_IRQhandler (void)
{
    
}