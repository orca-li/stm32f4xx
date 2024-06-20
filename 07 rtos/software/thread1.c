#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include "thread1.h"
#include "driver/systick.h"

static uint32_t th_stack[40];

thread th_body_1 = {
    .Name = "delay 2000ms",
    .Handler = &body1_handler,
    .Thread_Control_Block = {
        .sp = &th_stack
    },
    .Stack_Size = sizeof(th_stack)
};

void body1_handler(void)
{
    while(true) {
        printf("thread 1: delay 2000ms\n");
        delay_ms(2000);
    }
}