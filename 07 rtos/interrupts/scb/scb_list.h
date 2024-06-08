#ifndef _INTERRUPTS_SCB_SCB_LIST_H
#define _INTERRUPTS_SCB_SCB_LIST_H

void systick_handler(void);
void pendsv_handler(void);

extern volatile uint32_t ticks;

#endif /* _INTERRUPTS_SCB_SCB_LIST_H */