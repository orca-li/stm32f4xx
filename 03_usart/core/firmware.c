#include <stdbool.h>

#include "bridge/rcc.h"
#include "bridge/gpio.h"
#include "bridge/usart.h"

char *message = "hello usart, i hate you xD <3\n";

void main_init(void);
uint32_t ctmlen(const char *str);

int main (void) {
    main_init();

    uint32_t endmsg = ctmlen(message);

    while (true) {
        GPIO_ODR(GPIOC) ^= GPIO13;
        for (uint32_t i = 0; i < 1000000; i++);
        
        for (uint32_t i = 0; i < endmsg; i++) {
            USART_DR(USART2) = message[i];
            while((USART_SR(USART2) & USART_SR_TC) == 0);
        }
    }

    return 0;
}

void main_init(void) {
    RCC_AHB1ENR |= (GPIOAEN | GPIOCEN);
    RCC_APB1ENR |= USART2EN;
    
    /* LEDPIN */
    GPIO_MODER(GPIOC) &= ~(GPIO_MODE_MASK << (2 * PIN13));
    GPIO_MODER(GPIOC) |= (GPIO_MODE_OUTPUT << (2 * PIN13));

    /* USART2 */
    GPIO_MODER(GPIOA) &= ~(GPIO_MODE_MASK << (2 * PIN2));
    GPIO_MODER(GPIOA) |= (GPIO_MODE_AF << (2 * PIN2));
    GPIO_AFRL(GPIOA)  |= (GPIO_AF07 << (4 * PIN2));
    USART_CR1(USART2) |= USART_CR1_UE | USART_CR1_TE;
    USART_BRR(USART2) = 0x0683;
}

uint32_t ctmlen(const char *str) {
    const char *s = str;
    while (*s) s++;
    return s - str;
}