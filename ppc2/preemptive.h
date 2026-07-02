#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr fp);
void ThreadYield(void);
void ThreadExit(void);
void Bootstrap(void);
void myTimer0Handler(void);

#endif