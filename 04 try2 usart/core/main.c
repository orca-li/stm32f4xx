#include <string.h>

#include "rcc.h"
#include "gpio.h"
#include "usart.h"

char *message = "hello usart, i hate you xD <3\r\n";
uint32_t endmsg = 31;

int main (void) {
    RCC_AHB1ENR |= (GPIOAEN | GPIOCEN);
    RCC_APB1ENR |= USART2EN;
    
    GPIO_MODER(GPIOC) &= ~(1 << 13);
    GPIO_MODER(GPIOC) |= (1 << 26);

    /* перепроверить для usart2 */
    GPIO_MODER(GPIOA)   |= (2 << 4);
    // GPIO_OTYPER(GPIOA)  |= (0 << 9)  | (0 << 10);
    // GPIO_OSPEEDR(GPIOA) |= (3 << 9)  | (3 << 10);
    // GPIO_PUPDR(GPIOA)   |= (0 << 18) | (0 << 20);
    GPIO_AFRL(GPIOA)    |= (0x0700);
    /*  */

    USART_CR1(USART2) |= USART_CR1_UE;
    USART_BRR(USART2) = 0x0681;
    USART_CR2(USART2) &= ~(3 << 12);
    USART_CR3(USART2) &= ~(1 << 3);
    USART_CR1(USART2) |= USART_CR1_TE | USART_CR1_RE;

    
    while (true) {
        GPIO_ODR(GPIOC) ^= GPIO13;
        for (uint32_t i = 0; i < 1000000; i++);
        
        
        for (uint32_t i = 0; i < endmsg; i++) {
            USART_DR(USART2) = message[i];
            USART_CR1(USART2) |= USART_CR1_SBK;
            while((USART_SR(USART2) & 0x0080) == 0);
            
        }
    }

    return 0;
}