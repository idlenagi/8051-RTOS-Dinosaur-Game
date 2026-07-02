#include <8051.h>
#include "preemptive.h"

#define BUFFER_SIZE 3
__data __at (0x30) char buffer[BUFFER_SIZE];

__data __at (0x33) char head;
__data __at (0x34) char tail;

__data __at (0x35) char nextLetter;
__data __at (0x36) char nextDigit;
__data __at (0x37) char consumerCharacter;

__data __at (0x38) Semaphore mutex;
__data __at (0x39) Semaphore empty;
__data __at (0x3A) Semaphore full;
__data __at (0x3B) Semaphore letterTurn;
__data __at (0x3C) Semaphore digitTurn;
void Producer1(void)
{
    nextLetter = 'A';

    while (1)
    {
        SemaphoreWait(letterTurn);
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        buffer[tail] = nextLetter;

        tail++;
        if (tail == BUFFER_SIZE)
        {
            tail = 0;
        }

        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        if (nextLetter == 'Z')
        {
            nextLetter = 'A';
        }
        else
        {
            nextLetter++;
        }
        SemaphoreSignal(digitTurn);
    }
}
void Producer2(void)
{
    nextDigit = '0';

    while (1)
    {
        SemaphoreWait(digitTurn);
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        buffer[tail] = nextDigit;

        tail++;
        if (tail == BUFFER_SIZE)
        {
            tail = 0;
        }

        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        if (nextDigit == '9')
        {
            nextDigit = '0';
        }
        else
        {
            nextDigit++;
        }
       SemaphoreSignal(letterTurn);
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
        SemaphoreWait(full);
        SemaphoreWait(mutex);
        consumerCharacter = buffer[head];

        head++;
        if (head == BUFFER_SIZE)
        {
            head = 0;
        }

        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);
        SBUF = consumerCharacter;

        while (!TI)
        {
        }

        TI = 0;
    }
}
void main(void)
{
    head = 0;
    tail = 0;

    nextLetter = 'A';
    nextDigit = '0';
    consumerCharacter = 0;
    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(empty, BUFFER_SIZE);
    SemaphoreCreate(full, 0);
    SemaphoreCreate(letterTurn, 1);
    SemaphoreCreate(digitTurn, 0);

    ThreadCreate(Producer1);
    ThreadCreate(Producer2);

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