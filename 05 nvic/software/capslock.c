#include <ctype.h>

#include "capslock.h"

#define CAPSBIT (1 << 5)

char_ct capslock (char_ct c) {
    return (isalpha(c)) ? c ^ CAPSBIT : c;
}