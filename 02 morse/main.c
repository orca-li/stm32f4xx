#include "submodules/BMSIS/buss.h"
#include "submodules/BMSIS/gpio.h"
#include "driver/clock/clock.h"
#include "software/morse/morse.h"

void init_gpio(void);

void main(void){
    init_gpio();
    
    
    while(1){
        play_morse("  ");
        play_morse("hello world");
        play_morse(" ");
    }
}

void init_gpio(void){
    *RCC_AHB1ENR |= RCC_AHB1ENR_GPIOCEN_Msk;
    *GPIOC_MODER |= (MODER_OUTPUT << GPIOx_MODER13_Pos);
}