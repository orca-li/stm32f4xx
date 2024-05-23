#include <stdbool.h>
#include <string.h>

#include "bridge/rcc.h"
#include "bridge/gpio.h"
#include "bridge/usart.h"

char *message = "hello usart, i hate you xD <3\n";
uint32_t endmsg = 31;

int main (void) {
    RCC_AHB1ENR |= (GPIOAEN | GPIOCEN);
    RCC_APB1ENR |= USART2EN;
    
    GPIO_MODER(GPIOC) &= ~(GPIO_MODE_MASK << (2 * PIN13));
    GPIO_MODER(GPIOC) |= (GPIO_MODE_OUTPUT << (2 * PIN13));

    GPIO_MODER(GPIOA) &= ~(GPIO_MODE_MASK << (2 * PIN2));
    GPIO_MODER(GPIOA) |= (GPIO_MODE_AF << (2 * PIN2));
    GPIO_AFRL(GPIOA)  |= (GPIO_AF07 << (4 * PIN2));

    USART_CR1(USART2) |= USART_CR1_UE | USART_CR1_TE /* | USART_CR1_RE */; /* enable */
    // USART_CR1(USART2) &= ~USART_CR1_M & ~USART_CR1_PCE;  /* length 8 bit | parity: none*/
    // USART_CR2(USART2) &= ~USART_CR2_STOP_MASK; /* 1 stop-bit */
    // USART_CR3(USART2) &= ~USART_CR3_CTSE & ~USART_CR3_RTSE; /* flow controle: none */
    USART_BRR(USART2) = 0x0683; /* 681 or 682 or 683 */

    
    while (true) {
        GPIO_ODR(GPIOC) ^= GPIO13;
        for (uint32_t i = 0; i < 1000000; i++);
        
        
        for (uint32_t i = 0; i < endmsg; i++) {
            USART_DR(USART2) = message[i];
            // USART_CR1(USART2) |= USART_CR1_SBK;
            while((USART_SR(USART2) & USART_SR_TC) == 0);
        }
    }

    return 0;
}