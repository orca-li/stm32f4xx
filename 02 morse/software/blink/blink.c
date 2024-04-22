#include "../../driver/gpio/gpio.h"
#include "../../driver/clock/clock.h"
#include "../morse/morse.h"
#include "blink.h"

void blink(mode_bt mode){
    switch(mode){
        case MODE_BIT_SET:
            *GPIOC_ODR &= (MODE_BIT_SET << GPIOC_PIN13);
            break;

        case MODE_BIT_RESET:
            *GPIOC_ODR |= (MODE_BIT_RESET << GPIOC_PIN13);
            break;

        case MODE_BLINK:
            *GPIOC_ODR ^= (1 << GPIOC_PIN13);
            ms_delay_cf(250);
            break;

        case MODE_DOT:
            blink(MODE_BIT_SET);
            ms_delay_cf(STEP_DOT_MS);
            blink(MODE_BIT_RESET);
            break;

        case MODE_DASH:
            blink(MODE_BIT_SET);
            ms_delay_cf(STEP_DASH_MS);
            blink(MODE_BIT_RESET);
            break;

        default:
            break;
    }

}