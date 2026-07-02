#include <8051.h>
#include "preemptive.h"

__data __at (0x30) char sharedBuffer;
__data __at (0x31) char bufferFull;
__data __at (0x32) char nextCharacter;

void Producer(void)
{
    nextCharacter = 'A';

    while (1)
    {
        while (bufferFull)
        {
        }
        EA = 0;
        if (!bufferFull)
        {
            sharedBuffer = nextCharacter;
            bufferFull = 1;
            if (nextCharacter == 'Z')
            {
                nextCharacter = 'A';
            }
            else
            {
                nextCharacter++;
            }
        }
        EA = 1;
    }
}

void Consumer(void)
{
    
    TMOD |= 0x20;
    TH1 = (unsigned char)-6;
    SCON = 0x50;
    TI = 0;
    TR1 = 1;

    while (1)
    {
        while (!bufferFull)
        {
        }
        EA = 0;
        if (bufferFull)
        {
            SBUF = sharedBuffer;
            bufferFull = 0;
            EA = 1;

            while (!TI)
            {
            }
            TI = 0;
        }
        else
        {
            EA = 1;
        }
    }
}
void main(void)
{
    sharedBuffer = 0;
    bufferFull = 0;
    nextCharacter = 'A';
    ThreadCreate(Producer);
    Consumer();
}

void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}
void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1)
{
    __asm
        LJMP _myTimer0Handler
    __endasm;
}

