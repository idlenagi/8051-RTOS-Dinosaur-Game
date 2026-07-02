#include <8051.h>
#include "preemptive.h"

#ifndef MAXTHREADS
#define MAXTHREADS 4
#endif


__data __at (0x20) unsigned char savedSP[MAXTHREADS];
__data __at (0x24) ThreadID currentThread;
__data __at (0x25) unsigned char threadBitmap;
__data __at (0x26) ThreadID newThread;
__data __at (0x27) unsigned char temporarySP;
__data __at (0x28) unsigned char functionLow;
__data __at (0x29) unsigned char functionHigh;
__data __at (0x2A) unsigned char threadMask;
__data __at (0x2B) unsigned char previousEA;


#define SAVESTATE                         \
{                                         \
    __asm                                 \
        PUSH ACC                          \
        MOV  A, R0                        \
        PUSH ACC                          \
        PUSH B                            \
        PUSH DPL                          \
        PUSH DPH                          \
        PUSH PSW                          \
                                          \
        MOV  A, _currentThread            \
        ADD  A, #_savedSP                 \
        MOV  R0, A                        \
        MOV  @R0, SP                      \
    __endasm;                             \
}



#define RESTORESTATE                      \
{                                         \
    __asm                                 \
        MOV  A, _currentThread            \
        ADD  A, #_savedSP                 \
        MOV  R0, A                        \
        MOV  SP, @R0                      \
                                          \
        POP  PSW                          \
        POP  DPH                          \
        POP  DPL                          \
        POP  B                            \
        POP  ACC                          \
        MOV  R0, A                        \
        POP  ACC                          \
    __endasm;                             \
}


extern void main(void);



void Bootstrap(void)
{
    EA = 0;

    threadBitmap = 0;
    currentThread = 0;
    TMOD = 0x00;
    currentThread = ThreadCreate(main);
    IE = 0x82;
    TR0 = 1;
    RESTORESTATE;
}


ThreadID ThreadCreate(FunctionPtr fp)
{
    __asm
        MOV _functionLow, DPL
        MOV _functionHigh, DPH
    __endasm;
    (void)fp;
    previousEA = EA;
    EA = 0;
    if ((threadBitmap & 0x0F) == 0x0F)
    {
        EA = previousEA;
        return (ThreadID)-1;
    }
    newThread = 0;
    threadMask = 0x01;

    while (threadBitmap & threadMask)
    {
        newThread++;
        threadMask <<= 1;
    }
    threadBitmap |= threadMask;
    temporarySP = SP;
    SP = 0x3F + (((unsigned char)newThread) << 4);
    __asm
        PUSH _functionLow
        PUSH _functionHigh
    __endasm;

    __asm
        CLR A
        PUSH ACC
        PUSH ACC
        PUSH ACC
        PUSH ACC
        PUSH ACC
    __endasm;

    ACC = ((unsigned char)newThread) << 3;
    __asm
        PUSH ACC
    __endasm;
    savedSP[newThread] = SP;
    SP = temporarySP;
    EA = previousEA;

    return newThread;
}

void ThreadYield(void) __naked
{
    __asm
        CLR _EA
        PUSH ACC
        MOV  A, R0
        PUSH ACC
        PUSH B
        PUSH DPL
        PUSH DPH
        PUSH PSW

        MOV  A, _currentThread
        ADD  A, #_savedSP
        MOV  R0, A
        MOV  @R0, SP

TY_FIND_NEXT:
        INC  _currentThread
        MOV  A, _currentThread
        ANL  A, #0x03
        MOV  _currentThread, A
        JZ   TY_CHECK_THREAD0

        CJNE A, #0x01, TY_CHECK_THREAD2
        MOV  A, _threadBitmap
        ANL  A, #0x02
        JZ   TY_FIND_NEXT
        SJMP TY_RESTORE

TY_CHECK_THREAD2:
        CJNE A, #0x02, TY_CHECK_THREAD3
        MOV  A, _threadBitmap
        ANL  A, #0x04
        JZ   TY_FIND_NEXT
        SJMP TY_RESTORE

TY_CHECK_THREAD3:
        MOV  A, _threadBitmap
        ANL  A, #0x08
        JZ   TY_FIND_NEXT
        SJMP TY_RESTORE

TY_CHECK_THREAD0:
        MOV  A, _threadBitmap
        ANL  A, #0x01
        JZ   TY_FIND_NEXT

TY_RESTORE:
        MOV  A, _currentThread
        ADD  A, #_savedSP
        MOV  R0, A
        MOV  SP, @R0

        POP  PSW
        POP  DPH
        POP  DPL
        POP  B
        POP  ACC
        MOV  R0, A
        POP  ACC

        SETB _EA
        RET
    __endasm;
}



void ThreadExit(void) __naked
{
    __asm
        CLR _EA
        MOV  A, _currentThread
        JZ   TE_REMOVE_THREAD0

        CJNE A, #0x01, TE_CHECK_REMOVE2
        ANL  _threadBitmap, #0xFD
        SJMP TE_TEST_EMPTY

TE_CHECK_REMOVE2:
        CJNE A, #0x02, TE_REMOVE_THREAD3
        ANL  _threadBitmap, #0xFB
        SJMP TE_TEST_EMPTY

TE_REMOVE_THREAD3:
        ANL  _threadBitmap, #0xF7
        SJMP TE_TEST_EMPTY

TE_REMOVE_THREAD0:
        ANL  _threadBitmap, #0xFE

TE_TEST_EMPTY:
        MOV  A, _threadBitmap
        ANL  A, #0x0F
        JNZ  TE_FIND_NEXT

TE_NO_THREADS:
        SJMP TE_NO_THREADS

TE_FIND_NEXT:
        INC  _currentThread
        MOV  A, _currentThread
        ANL  A, #0x03
        MOV  _currentThread, A

        JZ   TE_CHECK_THREAD0

        CJNE A, #0x01, TE_CHECK_THREAD2
        MOV  A, _threadBitmap
        ANL  A, #0x02
        JZ   TE_FIND_NEXT
        SJMP TE_RESTORE

TE_CHECK_THREAD2:
        CJNE A, #0x02, TE_CHECK_THREAD3
        MOV  A, _threadBitmap
        ANL  A, #0x04
        JZ   TE_FIND_NEXT
        SJMP TE_RESTORE

TE_CHECK_THREAD3:
        MOV  A, _threadBitmap
        ANL  A, #0x08
        JZ   TE_FIND_NEXT
        SJMP TE_RESTORE

TE_CHECK_THREAD0:
        MOV  A, _threadBitmap
        ANL  A, #0x01
        JZ   TE_FIND_NEXT

TE_RESTORE:
        MOV  A, _currentThread
        ADD  A, #_savedSP
        MOV  R0, A
        MOV  SP, @R0

        POP  PSW
        POP  DPH
        POP  DPL
        POP  B
        POP  ACC
        MOV  R0, A
        POP  ACC

        SETB _EA
        RET
    __endasm;
}

void myTimer0Handler(void) __naked
{
    __asm
        PUSH ACC
        MOV  A, R0
        PUSH ACC
        PUSH B
        PUSH DPL
        PUSH DPH
        PUSH PSW

        MOV  A, _currentThread
        ADD  A, #_savedSP
        MOV  R0, A
        MOV  @R0, SP

T0_FIND_NEXT:
        INC  _currentThread
        MOV  A, _currentThread
        ANL  A, #0x03
        MOV  _currentThread, A

        JZ   T0_CHECK_THREAD0

        CJNE A, #0x01, T0_CHECK_THREAD2
        MOV  A, _threadBitmap
        ANL  A, #0x02
        JZ   T0_FIND_NEXT
        SJMP T0_RESTORE

T0_CHECK_THREAD2:
        CJNE A, #0x02, T0_CHECK_THREAD3
        MOV  A, _threadBitmap
        ANL  A, #0x04
        JZ   T0_FIND_NEXT
        SJMP T0_RESTORE

T0_CHECK_THREAD3:
        MOV  A, _threadBitmap
        ANL  A, #0x08
        JZ   T0_FIND_NEXT
        SJMP T0_RESTORE

T0_CHECK_THREAD0:
        MOV  A, _threadBitmap
        ANL  A, #0x01
        JZ   T0_FIND_NEXT

T0_RESTORE:
        MOV  A, _currentThread
        ADD  A, #_savedSP
        MOV  R0, A
        MOV  SP, @R0

        POP  PSW
        POP  DPH
        POP  DPL
        POP  B
        POP  ACC
        MOV  R0, A
        POP  ACC
        RETI
    __endasm;
}

