#include <CMWrap.h>
#include <stdio.h>

#define LED_PIN 13

static void gpio_init (void);
static void usart_init (void);
static void interrupt_init(void);

int main (void) {
    gpio_init();
    usart_init ();
    interrupt_init();

    while (1) {
        GPIOC->ODR ^= (1 << LED_PIN);
        printf("hello world\r\n");
        delay_ms(1000);
    }

    return 0;
}

static void gpio_init (void)
{
    RCC->AHB1ENR |= (1 << RCC_AHB1ENR_GPIOCEN_Pos);
    GPIOC->MODER |= (1 << GPIO_MODER_MODER13_Pos);
}

static void usart_init (void)
{
    RCC->AHB1ENR |= (1 << RCC_AHB1ENR_GPIOAEN_Pos);
    RCC->APB2ENR |= (1 << RCC_APB2ENR_USART1EN_Pos);

    GPIOA->MODER &= ~(GPIO_MODER_MODE9_Msk | GPIO_MODER_MODE9_Msk);
    GPIOA->MODER |= (0b10 << GPIO_MODER_MODE9_Pos) | (0b10 << GPIO_MODER_MODE10_Pos);

    GPIOA->AFR[1] &= ~(GPIO_AFRH_AFSEL9 | GPIO_AFRH_AFSEL10);
    GPIOA->AFR[1] |= (0x7 << GPIO_AFRH_AFSEL9_Pos) | (0x7 << GPIO_AFRH_AFSEL10_Pos);

    usart_set_baudrate(USART1, 9600);
    USART1->CR1 |= USART_CR1_UE | USART_CR1_TE;
    usart_init_send(USART1);
}   

static void interrupt_init(void)
{
    SysTick_Config(F_CPU / 1000);
    __enable_irq();
}