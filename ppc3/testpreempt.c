#include <8051.h>
#include "preemptive.h"
#define BUFFER_SIZE 3

__data __at (0x30) char buffer[BUFFER_SIZE];

__data __at (0x33) char head;
__data __at (0x34) char tail;
__data __at (0x35) char nextCharacter;
__data __at (0x36) char consumerCharacter;

__data __at (0x37) Semaphore mutex;
__data __at (0x38) Semaphore empty;
__data __at (0x39) Semaphore full;
void Producer(void)
{
    nextCharacter = 'A';

    while (1)
    {
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        buffer[tail] = nextCharacter;
        tail++;
        if (tail == BUFFER_SIZE)
        {
            tail = 0;
        }
        if (nextCharacter == 'Z')
        {
            nextCharacter = 'A';
        }
        else
        {
            nextCharacter++;
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
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
    nextCharacter = 'A';
    consumerCharacter = 0;
    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(empty, BUFFER_SIZE);
    SemaphoreCreate(full, 0);
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

