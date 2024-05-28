#ifndef _INCLUDE_STDIO_H
#define _INCLUDE_STDIO_H

#include <stdarg.h>

int snprintf(char *str, size_t size, const char *format, ...);
int vsnprintf(char *str, size_t size, const char *format, va_list args);

#endif /*  */