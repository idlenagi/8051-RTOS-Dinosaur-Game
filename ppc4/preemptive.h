#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4

typedef char ThreadID;
typedef char Semaphore;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr fp);
void ThreadYield(void);
void ThreadExit(void);
void Bootstrap(void);
void myTimer0Handler(void);
#define CNAME_HELPER(s) _ ## s
#define CNAME(s) CNAME_HELPER(s)
#define SemaphoreCreate(s, n) \
    do {                      \
        (s) = (n);             \
    } while (0)

#define SemaphoreSignal(s) \
    do {                   \
        __asm              \
            INC CNAME(s)   \
        __endasm;          \
    } while (0)
#define SemaphoreWait(s)          \
    do {                          \
        while (1) {                \
            while ((s) <= 0) {     \
            }                      \
                                   \
            EA = 0;                \
                                   \
            if ((s) > 0) {         \
                (s)--;             \
                EA = 1;            \
                break;             \
            }                      \
                                   \
            EA = 1;                \
        }                          \
    } while (0)

#endif

