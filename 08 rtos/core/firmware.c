#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "debug/logger.h"
#include "fusecore/fusecore.h"
#include "software/capslock.h"

#undef TAG
#define TAG "firmware"

int main (void) {
    fusecore();

    while (true) {
        printf("hello world\n");
        delay_ms(1000);
    }

    return 0;
}

