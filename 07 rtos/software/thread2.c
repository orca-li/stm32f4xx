#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include "thread2.h"
#include "driver/systick.h"

static uint32_t th_stack[40];

thread th_body_2 = {
    .Name = "delay 3500ms",
    .Handler = &body2_handler,
    .Thread_Control_Block = {
        .sp = &th_stack
    },
    .Stack_Size = sizeof(th_stack)
};

void body2_handler(void)
{
    while(true) {
        printf("thread 2: delay 3500ms\n");
        delay_ms(3500);
    }
}