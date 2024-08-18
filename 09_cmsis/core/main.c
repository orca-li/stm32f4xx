#include <CMWrap.h>

#define LED_PIN 13

static void gpio_init (void);
static void interrupt_init(void);

int main (void) {
    gpio_init();
    interrupt_init();

    while (1) {
        GPIOC->ODR ^= (1 << LED_PIN);
        delay_ms(1000);
    }

    return 0;
}

static void gpio_init (void)
{
    RCC->AHB1ENR |= (1 << RCC_AHB1ENR_GPIOCEN_Pos);
    GPIOC->MODER |= (1 << GPIO_MODER_MODER13_Pos);
}

static void interrupt_init(void)
{
    SysTick_Config(F_CPU / 1000);
    __enable_irq();
}