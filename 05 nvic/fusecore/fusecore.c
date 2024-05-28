#include "fusecore.h"

static void gpio_init(void);
static void usart1_init(void);
static void usart2_init(void);
static void nvic_init(void);

void fusecore (void)
{
    gpio_init();
    usart1_init();
    usart2_init();
    nvic_init();
}

static void usart2_init (void)
{
    rcc_periph_clock_enable(AHBUS1, GPIOAEN);
    
    gpio_mode_setup(GPIOA, PIN2, GPIO_MODE_AF);
    gpio_mode_setup(GPIOA, PIN3, GPIO_MODE_AF);
    gpio_af_setup(GPIOA, PIN2, GPIO_AF07);
    gpio_af_setup(GPIOA, PIN3, GPIO_AF07);

    rcc_periph_clock_enable(APBUS1, USART2EN);
    usart_set_baudrate(USART2, 9600);
    usart_set_mode(USART2, USART_MODE_TX_RX);
    // usart_irq_enable(USART2);
    usart_enable(USART2);
}

static void gpio_init (void)
{
    rcc_periph_clock_enable(AHBUS1, GPIOCEN);
    gpio_mode_setup(GPIOC, PIN13, GPIO_MODE_OUTPUT);
}

static void nvic_init (void)
{
    nvic_global_enable();
    // nvic_irq_setup(IRQN_USART2);
}

static void usart1_init (void)
{
    rcc_periph_clock_enable(AHBUS1, GPIOAEN);

    // GPIO_MODER(GPIOA) &= ~(GPIO_MODE_MASK << (2 * 9));
    // GPIO_MODER(GPIOA) |= GPIO_MODE_AF << (2 * 9);
    // GPIO_AFRH(GPIOA) &= ~(GPIO_AF_MASK << (4 * 2));
    // GPIO_AFRH(GPIOA) |= GPIO_AF07 << (4 * 2);

    // GPIO_MODER(GPIOA) &= ~(GPIO_MODE_MASK << (2 * 10));
    // GPIO_MODER(GPIOA) |= GPIO_MODE_AF << (2 * 10);
    // GPIO_AFRH(GPIOA) &= ~(GPIO_AF_MASK << (4 * 1));
    // GPIO_AFRH(GPIOA) |= GPIO_AF07 << (4 * 1);
    


    gpio_mode_setup(GPIOA, PIN9, GPIO_MODE_AF);
    gpio_mode_setup(GPIOA, PIN10, GPIO_MODE_AF);
    gpio_af_setup(GPIOA, PIN9, GPIO_AF07);
    gpio_af_setup(GPIOA, PIN10, GPIO_AF07);

    rcc_periph_clock_enable(APBUS2, USART1EN);
    usart_set_baudrate(USART1, 9600);
    usart_set_mode(USART1, USART_MODE_TX_RX);
    usart_enable(USART1);
}