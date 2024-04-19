#ifndef MORSE_H
#define MORSE_H

#include <locale.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include "ctype.h"

#define OFFSET_UPPER_ASCII 32

typedef enum 
{
    begin = 0,
    end,
    error,
    wait,

    english,
} morse_cmd;

typedef uint16_t alpha_mt;
typedef uint8_t index_mt;
typedef char* letter_mt;
typedef char* text_mt;

alpha_mt filter_letter(const alpha_mt letter);
letter_mt get_morse_letter(const alpha_mt letter);
void play_letter(letter_mt letter);
void play_morse(text_mt message);

#endif /* MORSE_H*/