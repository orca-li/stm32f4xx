#ifndef MORSE_H
#define MORSE_H

#include <stdint.h>

#include "../../driver/clock/clock.h"
#include "../blink/blink.h"

#define STEP_MORSE_MS               (250)
#define STEP_ERROR_MS               (250)
#define STEP_DOT_MS                 (1 * STEP_MORSE_MS)
#define STEP_DASH_MS                (3 * STEP_MORSE_MS)
#define STEP_NETX_LETTER_MS         (2 * STEP_MORSE_MS)
#define STEP_WORD_MS                (7 * STEP_MORSE_MS)

/*--------------------------------CTYPE--------------------------------*/
#define OFFSET(VALUE)       (+ VALUE)
#define UPPER_ASCII         (-32)

#define ISLOWER(LETTER)\
    (LETTER >= 'a' && LETTER <= 'z')
#define GETSIZE(ARRAY)\
    (sizeof(ARRAY) / sizeof(ARRAY[0]))
/*---------------------------------------------------------------------*/

typedef enum 
{
    begin = 0,
    end,
    error,
    wait,
} morse_cmd;

typedef uint16_t letter_mt;
typedef uint8_t index_mt;
typedef char* letter_code_mt;
typedef char* text_mt;

letter_mt filter_letter(const letter_mt letter);
letter_code_mt get_morse_letter(const letter_mt letter);
void play_letter(letter_code_mt letter);
void play_morse(text_mt message);

#endif /* MORSE_H */