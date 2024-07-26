#include <sys/stat.h>
#include <sys/unistd.h>

int _close(int file __attribute__((unused))) {
    /* We're lying */
	return -1;
}

int _lseek(int file __attribute__((unused)), int ptr __attribute__((unused)), int dir __attribute__((unused))) {
    /* We're lying */
	return 0;
}

void _exit (int status __attribute__((unused))) {
    /* We're lying */
	while(1);
}

__attribute__((weak)) int _read(int file __attribute__((unused)), char *ptr __attribute__((unused)), int len) {
    /* We're lying */
    return len;
}

__attribute__((weak)) int _write(int file __attribute__((unused)), char *ptr __attribute__((unused)), int len) {
	/* We're lying */
	return len;
}

caddr_t _sbrk(int incr) {
    extern char end;
    static char *heap_end;
    char *prev_heap_end;

    if (heap_end == 0) {
        heap_end = &end;
    }
    prev_heap_end = heap_end;

    heap_end += incr;
    return (caddr_t) prev_heap_end;
}