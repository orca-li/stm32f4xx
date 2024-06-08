#include <stdint.h>

#include "scb_list.h"

volatile uint32_t ticks;

void systick_handler (void)
{
    ticks++;
}

void pendsv_handler (void)
{

}