#include <stdbool.h>
#include <stdio.h>

#include "green_blink.h"
#include "driver/systick.h"
#include "rtos/threads.h"

struct body_thread Green_Blink;

void body_green_blink (void)
{
    while(true) {
        printf("hello\n");
        delay_ms(1000);
    }
}