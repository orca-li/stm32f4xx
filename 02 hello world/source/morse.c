#include "../include/morse.h"
#include "../include/blink.h"
#include "../include/ctype.h"

const alpha_mt morse_alphabet[] = {
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

const letter_mt morse_code[] = {
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

alpha_mt filter_letter(const alpha_mt letter){
    if(islower_c(letter))
        return letter - OFFSET_UPPER_ASCII;
    
    return letter;
}

letter_mt get_morse_letter(const alpha_mt letter){
    for(index_mt i = 0; i < (index_mt)(sizeof(morse_alphabet) / sizeof(morse_alphabet[0])); i++)
        if(letter == morse_alphabet[i])
            return morse_code[i];

    return " * ";
}

void play_letter(letter_mt letter){
    while(*letter){
        switch(*letter){
            case '*':
                blink(0, MODE_BLINK, 250);
                break;
            case '-':
                blink(0, MODE_BLINK, 750);
                break;
            default:
                ms_delay_t(250);
                break;
        }
        ms_delay_t(250);
        letter++;
    }
    ms_delay_t(1750);
}

void play_morse(text_mt message){
    while(*message != '\0')
        play_letter(get_morse_letter(filter_letter(*message++)));
}