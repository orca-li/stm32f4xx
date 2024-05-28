#include <stdlib.h>

#include "stdio.h"

int snprintf(char *str, size_t size, const char *format, ...) {
    int chars_written;
    va_list args;

    va_start(args, format);
    chars_written = vsnprintf(str, size, format, args);
    va_end(args);

    return chars_written;
}

/* char gpt */
int vsnprintf(char *str, size_t size, const char *format, va_list args) {
    int chars_written = 0;

    while (*format && size > 1) {
        if (*format == '%') {
            // Обработка спецификаторов формата
            format++;
            if (*format == '\0') break;  // Если % находится в конце строки, выходим
            switch (*format) {
                case 's': {
                    const char *s = va_arg(args, const char *);
                    while (*s && size > 1) {
                        *str++ = *s++;
                        size--;
                        chars_written++;
                    }
                    break;
                }
                case 'd': {
                    int num = va_arg(args, int);
                    char buf[20]; // Буфер для хранения числа как строки
                    int len = 0;
                    do {
                        buf[len++] = '0' + num % 10;
                        num /= 10;
                    } while (num);
                    while (len > 0 && size > 1) {
                        *str++ = buf[--len];
                        size--;
                        chars_written++;
                    }
                    break;
                }
                // Добавьте обработку других спецификаторов по мере необходимости
                default:
                    *str++ = *format;
                    size--;
                    chars_written++;
                    break;
            }
        } else {
            *str++ = *format;
            size--;
            chars_written++;
        }
        format++;
    }

    if (size > 0) *str = '\0'; // Завершаем строку
    return chars_written;
}