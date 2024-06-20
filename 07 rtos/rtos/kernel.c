#include <stdio.h>

#include "bridge/scb.h"
#include "rtos/kernel.h"
#include "rtos/threads.h"
#include "software/thread1.h"
#include "software/thread2.h"

void task_manager(void);

void rtos (void)
{
    printf("rtos - ok\n");
    scb_set_priority(PRI_PENDSV, 0xFFu);
    scb_set_priority(PRI_SYSTICK, 0x00u);
    printf("scb - ok\n");

    task_manager();
    printf("task_manager - ok\n");
}

void task_manager (void)
{
    New_Thread((thread*)&th_body_1);
    New_Thread((thread*)&th_body_2);
}