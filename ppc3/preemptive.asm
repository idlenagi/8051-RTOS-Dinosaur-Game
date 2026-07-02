;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module preemptive
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _previousEA
	.globl _threadMask
	.globl _functionHigh
	.globl _functionLow
	.globl _temporarySP
	.globl _newThread
	.globl _threadBitmap
	.globl _currentThread
	.globl _savedSP
	.globl _Bootstrap
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
	.globl _myTimer0Handler
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_savedSP	=	0x0020
_currentThread	=	0x0024
_threadBitmap	=	0x0025
_newThread	=	0x0026
_temporarySP	=	0x0027
_functionLow	=	0x0028
_functionHigh	=	0x0029
_threadMask	=	0x002a
_previousEA	=	0x002b
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:63: void Bootstrap(void)
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:65: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:67: threadBitmap = 0;
	mov	_threadBitmap,#0x00
;	preemptive.c:68: currentThread = 0;
	mov	_currentThread,#0x00
;	preemptive.c:69: TMOD = 0x00;
	mov	_TMOD,#0x00
;	preemptive.c:70: currentThread = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThread,dpl
;	preemptive.c:71: IE = 0x82;
	mov	_IE,#0x82
;	preemptive.c:72: TR0 = 1;
;	assignBit
	setb	_TR0
;	preemptive.c:73: RESTORESTATE;
	MOV A, _currentThread 
	ADD A, #_savedSP 
	MOV R0, A 
	MOV SP, @R0 
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	MOV R0, A 
	POP ACC 
;	preemptive.c:74: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp            Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:77: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:82: __endasm;
	MOV	_functionLow, DPL
	MOV	_functionHigh, DPH
;	preemptive.c:84: previousEA = EA;
	mov	c,_EA
	clr	a
	rlc	a
	mov	_previousEA,a
;	preemptive.c:85: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:86: if ((threadBitmap & 0x0F) == 0x0F)
	mov	r7,_threadBitmap
	anl	ar7,#0x0f
	cjne	r7,#0x0f,00102$
;	preemptive.c:88: EA = previousEA;
;	assignBit
	mov	a,_previousEA
	add	a,#0xff
	mov	_EA,c
;	preemptive.c:89: return (ThreadID)-1;
	mov	dpl, #0xff
	ret
00102$:
;	preemptive.c:91: newThread = 0;
	mov	_newThread,#0x00
;	preemptive.c:92: threadMask = 0x01;
	mov	_threadMask,#0x01
;	preemptive.c:94: while (threadBitmap & threadMask)
00103$:
	mov	a,_threadMask
	anl	a,_threadBitmap
	jz	00105$
;	preemptive.c:96: newThread++;
	mov	a,_newThread
	inc	a
	mov	_newThread,a
;	preemptive.c:97: threadMask <<= 1;
	mov	a,_threadMask
	add	a,acc
	mov	_threadMask,a
	sjmp	00103$
00105$:
;	preemptive.c:99: threadBitmap |= threadMask;
	mov	a,_threadMask
	orl	_threadBitmap,a
;	preemptive.c:100: temporarySP = SP;
	mov	_temporarySP,_SP
;	preemptive.c:101: SP = 0x3F + (((unsigned char)newThread) << 4);
	mov	a,_newThread
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	preemptive.c:105: __endasm;
	PUSH	_functionLow
	PUSH	_functionHigh
;	preemptive.c:114: __endasm;
	CLR	A
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:116: ACC = ((unsigned char)newThread) << 3;
	mov	a,_newThread
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_ACC,a
;	preemptive.c:119: __endasm;
	PUSH	ACC
;	preemptive.c:120: savedSP[newThread] = SP;
	mov	a,_newThread
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:121: SP = temporarySP;
	mov	_SP,_temporarySP
;	preemptive.c:122: EA = previousEA;
;	assignBit
	mov	a,_previousEA
	add	a,#0xff
	mov	_EA,c
;	preemptive.c:124: return newThread;
	mov	dpl, _newThread
;	preemptive.c:125: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:127: void ThreadYield(void) __naked
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	naked function: no prologue.
;	preemptive.c:191: __endasm;
	CLR	_EA
	PUSH	ACC
	MOV	A, R0
	PUSH	ACC
	PUSH	B
	PUSH	DPL
	PUSH	DPH
	PUSH	PSW
	MOV	A, _currentThread
	ADD	A, #_savedSP
	MOV	R0, A
	MOV	@R0, SP
TY_FIND_NEXT:
	INC	_currentThread
	MOV	A, _currentThread
	ANL	A, #0x03
	MOV	_currentThread, A
	JZ	TY_CHECK_THREAD0
	CJNE	A, #0x01, TY_CHECK_THREAD2
	MOV	A, _threadBitmap
	ANL	A, #0x02
	JZ	TY_FIND_NEXT
	SJMP	TY_RESTORE
TY_CHECK_THREAD2:
	CJNE	A, #0x02, TY_CHECK_THREAD3
	MOV	A, _threadBitmap
	ANL	A, #0x04
	JZ	TY_FIND_NEXT
	SJMP	TY_RESTORE
TY_CHECK_THREAD3:
	MOV	A, _threadBitmap
	ANL	A, #0x08
	JZ	TY_FIND_NEXT
	SJMP	TY_RESTORE
TY_CHECK_THREAD0:
	MOV	A, _threadBitmap
	ANL	A, #0x01
	JZ	TY_FIND_NEXT
TY_RESTORE:
	MOV	A, _currentThread
	ADD	A, #_savedSP
	MOV	R0, A
	MOV	SP, @R0
	POP	PSW
	POP	DPH
	POP	DPL
	POP	B
	POP	ACC
	MOV	R0, A
	POP	ACC
	SETB	_EA
	RET
;	preemptive.c:192: }
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:196: void ThreadExit(void) __naked
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	naked function: no prologue.
;	preemptive.c:275: __endasm;
	CLR	_EA
	MOV	A, _currentThread
	JZ	TE_REMOVE_THREAD0
	CJNE	A, #0x01, TE_CHECK_REMOVE2
	ANL	_threadBitmap, #0xFD
	SJMP	TE_TEST_EMPTY
TE_CHECK_REMOVE2:
	CJNE	A, #0x02, TE_REMOVE_THREAD3
	ANL	_threadBitmap, #0xFB
	SJMP	TE_TEST_EMPTY
TE_REMOVE_THREAD3:
	ANL	_threadBitmap, #0xF7
	SJMP	TE_TEST_EMPTY
TE_REMOVE_THREAD0:
	ANL	_threadBitmap, #0xFE
TE_TEST_EMPTY:
	MOV	A, _threadBitmap
	ANL	A, #0x0F
	JNZ	TE_FIND_NEXT
TE_NO_THREADS:
	SJMP	TE_NO_THREADS
TE_FIND_NEXT:
	INC	_currentThread
	MOV	A, _currentThread
	ANL	A, #0x03
	MOV	_currentThread, A
	JZ	TE_CHECK_THREAD0
	CJNE	A, #0x01, TE_CHECK_THREAD2
	MOV	A, _threadBitmap
	ANL	A, #0x02
	JZ	TE_FIND_NEXT
	SJMP	TE_RESTORE
TE_CHECK_THREAD2:
	CJNE	A, #0x02, TE_CHECK_THREAD3
	MOV	A, _threadBitmap
	ANL	A, #0x04
	JZ	TE_FIND_NEXT
	SJMP	TE_RESTORE
TE_CHECK_THREAD3:
	MOV	A, _threadBitmap
	ANL	A, #0x08
	JZ	TE_FIND_NEXT
	SJMP	TE_RESTORE
TE_CHECK_THREAD0:
	MOV	A, _threadBitmap
	ANL	A, #0x01
	JZ	TE_FIND_NEXT
TE_RESTORE:
	MOV	A, _currentThread
	ADD	A, #_savedSP
	MOV	R0, A
	MOV	SP, @R0
	POP	PSW
	POP	DPH
	POP	DPL
	POP	B
	POP	ACC
	MOV	R0, A
	POP	ACC
	SETB	_EA
	RET
;	preemptive.c:276: }
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:278: void myTimer0Handler(void) __naked
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	naked function: no prologue.
;	preemptive.c:340: __endasm;
	PUSH	ACC
	MOV	A, R0
	PUSH	ACC
	PUSH	B
	PUSH	DPL
	PUSH	DPH
	PUSH	PSW
	MOV	A, _currentThread
	ADD	A, #_savedSP
	MOV	R0, A
	MOV	@R0, SP
T0_FIND_NEXT:
	INC	_currentThread
	MOV	A, _currentThread
	ANL	A, #0x03
	MOV	_currentThread, A
	JZ	T0_CHECK_THREAD0
	CJNE	A, #0x01, T0_CHECK_THREAD2
	MOV	A, _threadBitmap
	ANL	A, #0x02
	JZ	T0_FIND_NEXT
	SJMP	T0_RESTORE
T0_CHECK_THREAD2:
	CJNE	A, #0x02, T0_CHECK_THREAD3
	MOV	A, _threadBitmap
	ANL	A, #0x04
	JZ	T0_FIND_NEXT
	SJMP	T0_RESTORE
T0_CHECK_THREAD3:
	MOV	A, _threadBitmap
	ANL	A, #0x08
	JZ	T0_FIND_NEXT
	SJMP	T0_RESTORE
T0_CHECK_THREAD0:
	MOV	A, _threadBitmap
	ANL	A, #0x01
	JZ	T0_FIND_NEXT
T0_RESTORE:
	MOV	A, _currentThread
	ADD	A, #_savedSP
	MOV	R0, A
	MOV	SP, @R0
	POP	PSW
	POP	DPH
	POP	DPL
	POP	B
	POP	ACC
	MOV	R0, A
	POP	ACC
	RETI
;	preemptive.c:341: }
;	naked function: no epilogue.
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
