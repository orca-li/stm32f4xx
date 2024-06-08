#ifndef _RTOS_THREADS_H
#define _RTOS_THREADS_H

/* Thread Control Block (TCB) */
typedef struct rtos_thread {
    void *sp; /* stack pointer */
    /* ... other attributes associated with a thread */
} thread;

typedef void (*th_handler)(void);

void th_body(void);

#endif /* _RTOS_THREADS_H */