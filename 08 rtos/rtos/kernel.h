#ifndef _RTOS_KERNEL_H
#define _RTOS_KERNEL_H


typedef struct rtos_tasks{
    void (*run)();
} tasks_os;

typedef struct struct_rtoscalls {
    tasks_os task;
} rtos_os;

extern rtos_os rtos;

#endif /* _RTOS_KERNEL_H */