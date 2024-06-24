#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include "red_blink.h"
#include "driver/systick.h"
#include "rtos/threads.h"

struct body_thread Red_Blink;

void body_red_blink (void)
{
    while(true) {
        printf("hello\n");
        delay_ms(1000);
    }
}