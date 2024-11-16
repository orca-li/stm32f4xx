#include <CMWrap.h>
#include <stdio.h>
#include <rtos.h>

extern volatile uint32_t ticks;
extern uint32_t isr_vector[54];

void NMI_Handler(void)
{
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN_Msk;
    GPIOB->MODER |= (1 << GPIO_MODER_MODER10_Pos);

    // stack_dump();

    while (1)
    {
        GPIOB->ODR ^= GPIO_ODR_OD10_Msk;
        for (uint32_t i = 0; i < 1000000; i++)
            ;
    }
}

void Hardfault_Handler(void)
{
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN_Msk;
    GPIOB->MODER |= (1 << GPIO_MODER_MODER2_Pos);

    // stack_dump();

    while (1)
    {
        GPIOB->ODR ^= GPIO_ODR_OD2_Msk;
        for (uint32_t i = 0; i < 1000000; i++)
            ;
    }
}

__attribute__((weak)) void PendSV_Handler(void)
{
    // printf("PendSV Handler\r\n");
}

__attribute__((weak)) void SysTick_Handler(void)
{
    ticks++;
}

void usart1_IRQhandler(void)
{
    if ((USART1->SR & USART_SR_RXNE) != 0)
    { // Проверяем флаг приема

        USART1->SR &= ~USART_SR_RXNE; // Сбрасываем флаг приема
    }
}

void usart2_IRQhandler(void)
{
}