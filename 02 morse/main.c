#include "driver/gpio/gpio.h"
#include "driver/clock/clock.h"
#include "software/morse/morse.h"

void main(void){
    init_gpio();
    
    while(1){
        play_morse("a1b2 c3d4 e5f6");
    }
}