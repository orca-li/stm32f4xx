#include "./include/morse.h"
#include "./include/time.h"

int main(void){
    while(1){
        play_morse("hello world");
        sec_delay_t(1);
    }

    return 0;
}