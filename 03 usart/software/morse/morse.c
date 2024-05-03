#include "morse.h"

const letter_mt morse_alphabet[] = {
    '0', '1', '2', '3', '4',
    '5', '6', '7', '8', '9',

    'A', 'B', 'C', 'D',
    'E', 'F', 'G', 'H', 
    'I', 'J', 'K', 'L',
    'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X',
    'Y', 'Z', 

    '.', ',', '?', '\'',
    '!', '/', '(', ')',
    '&', ':', ';', '=',
    '+', '-', '_', '\"',
    '$', '@', 

    ' ',

    begin, end, error, wait,
};

const letter_code_mt morse_code[] = {
    "*----", "**---", "***--", "****-", "*****",
    "-****", "--***", "---**", "----*", "-----",

    "*-", "-***", "-*-*", "--**",
    "*", "**-*", "--*", "****",
    "**", "*---", "-*-", "*-**",
    "--", "-*", "---", "*--*",
    "--*-", "-*-", "***", "-",
    "**-", "***-", "*--", "-**-",
    "-*--", "--**",

    "*-*-*-", "--**--", "**--**", "*----*",
    "-*-*--", "-**-*", "-*--*", "-*--*-",
    "*-***", "---***", "-*-*-*", "-***-",
    "*-*-*", "-****-", "**--*-", "*-**-*",
    "***-**-", "*--*-*",

    " ",

    "-*-*-", "***-*-", "********", "*-***",
};

letter_mt filter_letter(const letter_mt letter){
    if(ISLOWER(letter))
        return letter + OFFSET(UPPER_ASCII);
    
    return letter;
}

letter_code_mt get_morse_letter(const letter_mt letter){
    for(index_mt i = 0; i < (index_mt)GETSIZE(morse_alphabet); i++)
        if(letter == morse_alphabet[i])
            return morse_code[i];

    return " * ";
}

void play_letter(letter_code_mt letter){
    while(*letter){
        switch(*letter){
            case '*':
                blink(MODE_DOT);
                break;
            case '-':
                blink(MODE_DASH);
                break;
            case ' ':
                blink(MODE_BIT_RESET);
                ms_delay_cf(STEP_WORD_MS);
                break;
            default:
                ms_delay_cf(STEP_ERROR_MS);
                break;
        }
        ms_delay_cf(STEP_MORSE_MS);
        letter++;
    }
    ms_delay_cf(STEP_NETX_LETTER_MS);
}

void play_morse(text_mt message){
    while(*message != '\0')
        play_letter(get_morse_letter(filter_letter(*message++)));
}