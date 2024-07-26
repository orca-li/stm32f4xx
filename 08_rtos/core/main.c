#include <liteMCU.h>

#include <stdio.h>

static void gpio_init (void);
static void usart1_init(void);
static void usart2_init(void);
static void nvic_init(void);

int main (void) {
    gpio_init();
    usart1_init();
    usart2_init();
    nvic_init();
    systick_init();

    while (1) {
        gpio_toggle_pin(GPIOC, GPIO13);
        printf("hello world!\r\n");
        delay_ms(1000);
    }

    return 0;
}

static void gpio_init (void)
{
    rcc_periph_clock_enable(AHBUS1, GPIOCEN);
    gpio_mode_setup(GPIOC, GPIO_PIN_13, GPIO_MODE_OUTPUT);
}

static void nvic_init (void)
{
    nvic_irq_setup(IRQN_USART2);
    nvic_irq_setup(IRQN_USART1);
    __enable_irq();
}

static void usart1_init (void)
{
    rcc_periph_clock_enable(AHBUS1, GPIOAEN);

    gpio_mode_setup(GPIOA, GPIO_PIN_9, GPIO_MODE_AF);
    gpio_mode_setup(GPIOA, GPIO_PIN_10, GPIO_MODE_AF);
    gpio_af_setup(GPIOA, GPIO_PIN_9, GPIO_AF07);
    gpio_af_setup(GPIOA, GPIO_PIN_10, GPIO_AF07);

    rcc_periph_clock_enable(APBUS2, USART1EN);

    usart_set_baudrate(USART1, 9600);
    usart_set_mode(USART1, USART_MODE_TX_RX);
    usart_irq_enable(USART1);
    usart_enable(USART1);

    usart_init_send(USART1);
}

static void usart2_init (void)
{
    rcc_periph_clock_enable(AHBUS1, GPIOAEN);
    
    gpio_mode_setup(GPIOA, GPIO_PIN_2, GPIO_MODE_AF);
    gpio_mode_setup(GPIOA, GPIO_PIN_3, GPIO_MODE_AF);
    gpio_af_setup(GPIOA, GPIO_PIN_2, GPIO_AF07);
    gpio_af_setup(GPIOA, GPIO_PIN_3, GPIO_AF07);

    rcc_periph_clock_enable(APBUS1, USART2EN);

    usart_set_baudrate(USART2, 9600);
    usart_set_mode(USART2, USART_MODE_TX_RX);
    usart_irq_enable(USART2);
    usart_enable(USART2);

    usart_init_send(USART2);
}