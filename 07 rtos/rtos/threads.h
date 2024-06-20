#ifndef _RTOS_THREADS_H
#define _RTOS_THREADS_H

typedef void (*th_handler)(void);

/* Thread Control Block (TCB) */
typedef struct {
    void *sp; /* stack pointer */
    /* ... other attributes associated with a thread */
} th_tcb;

typedef struct {
    th_tcb Thread_Control_Block;
    th_handler Handler;
    char *Name;
    uint32_t Stack_Size;
} thread;

void Thread_Scheduler(void);
void New_Thread(thread *new_thread);

extern th_tcb * volatile Current_Thread; 
extern th_tcb * volatile Next_Thread;

#endif /* _RTOS_THREADS_H */