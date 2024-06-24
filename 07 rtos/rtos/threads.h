#ifndef _RTOS_THREADS_H
#define _RTOS_THREADS_H

#include <stdint.h>

/* Thread Control Block (TCB) */
typedef struct {
    void *sp; /* stack pointer */
} OS_Thread;

typedef void (*OS_Thread_Handler)(void);

struct body_thread {
    uint32_t stack[40];
    OS_Thread sp;
};

void OS_Start_Thread (
    OS_Thread *me,
    OS_Thread_Handler handler,
    void *stkSto, uint32_t stkSize);

void OS_Sheduler(void);

extern OS_Thread * volatile Current_Thread;
extern OS_Thread * volatile Next_Thread;

#endif /* _RTOS_THREADS_H */