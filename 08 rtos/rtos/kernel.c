#include "kernel.h"

static void run();

rtos_os rtos = {
    .task.run = &run,
};

static void run()
{
    rtos.task.run();
}