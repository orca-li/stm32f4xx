#ifndef INC_SYSTEM_H
#define INC_SYSTEM_H

static volatile uint32_t ticks = 0;

void systick_handler (void);
void sleep (uint32_t ticks);

#endif /* INC_SYSTEM_H */