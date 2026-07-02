#include <8051.h>
#include "buttonlib.h"



char AnyButtonPressed(void)
{
    return (P2 != 0xFF);
}

char ButtonToChar(void)
{
    unsigned char pressed = ~P2;

    if (pressed & 0x80) return '7';
    if (pressed & 0x40) return '6';
    if (pressed & 0x20) return '5';
    if (pressed & 0x10) return '4';
    if (pressed & 0x08) return '3';
    if (pressed & 0x04) return '2';
    if (pressed & 0x02) return '1';
    if (pressed & 0x01) return '0';

    return '\0';
}