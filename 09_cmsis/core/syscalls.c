#include <liteMCU.h>
#include <stdio.h>
#include <string.h>

#include <sys/stat.h>
#include <sys/unistd.h>

int _fstat(int fd, struct stat *st) {
  (void) fd, (void) st;
  return -1;
}

int _isatty(int fd) {
  (void) fd;
  return 1;
}

int _close(int file __attribute__((unused)))
{
    /* We're lying */
	return -1;
}

int _lseek(int file __attribute__((unused)), int ptr __attribute__((unused)), int dir __attribute__((unused)))
{
    /* We're lying */
	return 0;
}

void _exit (int status __attribute__((unused)))
{
    /* We're lying */
	while(1);
}

__attribute__((weak)) int _read(int file __attribute__((unused)), char *ptr __attribute__((unused)), int len)
{
    /* We're lying */
    return len;
}

int _write(int fd, char *ptr, int len) 
{
    if (fd == 1) {
        usart_transmit(USART1, len, (uint8_t*)ptr);     
    }
    return -1;
}

register char * stack_ptr asm("sp");

caddr_t _sbrk(int incr) {
    extern char __bss_end__;		/* Defined by the linker */
    static char *heap_end;
    char *prev_heap_end;

    if (heap_end == 0) {
        heap_end = &__bss_end__;
    }
    prev_heap_end = heap_end;
    if (heap_end + incr > stack_ptr) {
        while (1); // Heap and stack collision
    }

    heap_end += incr;
    return (caddr_t) prev_heap_end;
}