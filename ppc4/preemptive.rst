                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _CY
                                     13 	.globl _AC
                                     14 	.globl _F0
                                     15 	.globl _RS1
                                     16 	.globl _RS0
                                     17 	.globl _OV
                                     18 	.globl _F1
                                     19 	.globl _P
                                     20 	.globl _PS
                                     21 	.globl _PT1
                                     22 	.globl _PX1
                                     23 	.globl _PT0
                                     24 	.globl _PX0
                                     25 	.globl _RD
                                     26 	.globl _WR
                                     27 	.globl _T1
                                     28 	.globl _T0
                                     29 	.globl _INT1
                                     30 	.globl _INT0
                                     31 	.globl _TXD
                                     32 	.globl _RXD
                                     33 	.globl _P3_7
                                     34 	.globl _P3_6
                                     35 	.globl _P3_5
                                     36 	.globl _P3_4
                                     37 	.globl _P3_3
                                     38 	.globl _P3_2
                                     39 	.globl _P3_1
                                     40 	.globl _P3_0
                                     41 	.globl _EA
                                     42 	.globl _ES
                                     43 	.globl _ET1
                                     44 	.globl _EX1
                                     45 	.globl _ET0
                                     46 	.globl _EX0
                                     47 	.globl _P2_7
                                     48 	.globl _P2_6
                                     49 	.globl _P2_5
                                     50 	.globl _P2_4
                                     51 	.globl _P2_3
                                     52 	.globl _P2_2
                                     53 	.globl _P2_1
                                     54 	.globl _P2_0
                                     55 	.globl _SM0
                                     56 	.globl _SM1
                                     57 	.globl _SM2
                                     58 	.globl _REN
                                     59 	.globl _TB8
                                     60 	.globl _RB8
                                     61 	.globl _TI
                                     62 	.globl _RI
                                     63 	.globl _P1_7
                                     64 	.globl _P1_6
                                     65 	.globl _P1_5
                                     66 	.globl _P1_4
                                     67 	.globl _P1_3
                                     68 	.globl _P1_2
                                     69 	.globl _P1_1
                                     70 	.globl _P1_0
                                     71 	.globl _TF1
                                     72 	.globl _TR1
                                     73 	.globl _TF0
                                     74 	.globl _TR0
                                     75 	.globl _IE1
                                     76 	.globl _IT1
                                     77 	.globl _IE0
                                     78 	.globl _IT0
                                     79 	.globl _P0_7
                                     80 	.globl _P0_6
                                     81 	.globl _P0_5
                                     82 	.globl _P0_4
                                     83 	.globl _P0_3
                                     84 	.globl _P0_2
                                     85 	.globl _P0_1
                                     86 	.globl _P0_0
                                     87 	.globl _B
                                     88 	.globl _ACC
                                     89 	.globl _PSW
                                     90 	.globl _IP
                                     91 	.globl _P3
                                     92 	.globl _IE
                                     93 	.globl _P2
                                     94 	.globl _SBUF
                                     95 	.globl _SCON
                                     96 	.globl _P1
                                     97 	.globl _TH1
                                     98 	.globl _TH0
                                     99 	.globl _TL1
                                    100 	.globl _TL0
                                    101 	.globl _TMOD
                                    102 	.globl _TCON
                                    103 	.globl _PCON
                                    104 	.globl _DPH
                                    105 	.globl _DPL
                                    106 	.globl _SP
                                    107 	.globl _P0
                                    108 	.globl _previousEA
                                    109 	.globl _threadMask
                                    110 	.globl _functionHigh
                                    111 	.globl _functionLow
                                    112 	.globl _temporarySP
                                    113 	.globl _newThread
                                    114 	.globl _threadBitmap
                                    115 	.globl _currentThread
                                    116 	.globl _savedSP
                                    117 	.globl _Bootstrap
                                    118 	.globl _ThreadCreate
                                    119 	.globl _ThreadYield
                                    120 	.globl _ThreadExit
                                    121 	.globl _myTimer0Handler
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000020   237 _savedSP	=	0x0020
                           000024   238 _currentThread	=	0x0024
                           000025   239 _threadBitmap	=	0x0025
                           000026   240 _newThread	=	0x0026
                           000027   241 _temporarySP	=	0x0027
                           000028   242 _functionLow	=	0x0028
                           000029   243 _functionHigh	=	0x0029
                           00002A   244 _threadMask	=	0x002a
                           00002B   245 _previousEA	=	0x002b
                                    246 ;--------------------------------------------------------
                                    247 ; overlayable items in internal ram
                                    248 ;--------------------------------------------------------
                                    249 	.area	OSEG    (OVR,DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; indirectly addressable internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area ISEG    (DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; absolute internal ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area IABS    (ABS,DATA)
                                    258 	.area IABS    (ABS,DATA)
                                    259 ;--------------------------------------------------------
                                    260 ; bit data
                                    261 ;--------------------------------------------------------
                                    262 	.area BSEG    (BIT)
                                    263 ;--------------------------------------------------------
                                    264 ; paged external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area PSEG    (PAG,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; uninitialized external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XSEG    (XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; absolute external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XABS    (ABS,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; initialized external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XISEG   (XDATA)
                                    279 	.area HOME    (CODE)
                                    280 	.area GSINIT0 (CODE)
                                    281 	.area GSINIT1 (CODE)
                                    282 	.area GSINIT2 (CODE)
                                    283 	.area GSINIT3 (CODE)
                                    284 	.area GSINIT4 (CODE)
                                    285 	.area GSINIT5 (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area CSEG    (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; global & static initialisations
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; Home
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
                                    300 	.area HOME    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; code
                                    303 ;--------------------------------------------------------
                                    304 	.area CSEG    (CODE)
                                    305 ;------------------------------------------------------------
                                    306 ;Allocation info for local variables in function 'Bootstrap'
                                    307 ;------------------------------------------------------------
                                    308 ;	preemptive.c:63: void Bootstrap(void)
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      0001FC                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:65: EA = 0;
                                    322 ;	assignBit
      0001FC C2 AF            [12]  323 	clr	_EA
                                    324 ;	preemptive.c:67: threadBitmap = 0;
      0001FE 75 25 00         [24]  325 	mov	_threadBitmap,#0x00
                                    326 ;	preemptive.c:68: currentThread = 0;
      000201 75 24 00         [24]  327 	mov	_currentThread,#0x00
                                    328 ;	preemptive.c:69: TMOD = 0x00;
      000204 75 89 00         [24]  329 	mov	_TMOD,#0x00
                                    330 ;	preemptive.c:70: currentThread = ThreadCreate(main);
      000207 90 01 C2         [24]  331 	mov	dptr,#_main
      00020A 12 02 2A         [24]  332 	lcall	_ThreadCreate
      00020D 85 82 24         [24]  333 	mov	_currentThread,dpl
                                    334 ;	preemptive.c:71: IE = 0x82;
      000210 75 A8 82         [24]  335 	mov	_IE,#0x82
                                    336 ;	preemptive.c:72: TR0 = 1;
                                    337 ;	assignBit
      000213 D2 8C            [12]  338 	setb	_TR0
                                    339 ;	preemptive.c:73: RESTORESTATE;
      000215 E5 24            [12]  340 	MOV A, _currentThread 
      000217 24 20            [12]  341 	ADD A, #_savedSP 
      000219 F8               [12]  342 	MOV R0, A 
      00021A 86 81            [24]  343 	MOV SP, @R0 
      00021C D0 D0            [24]  344 	POP PSW 
      00021E D0 83            [24]  345 	POP DPH 
      000220 D0 82            [24]  346 	POP DPL 
      000222 D0 F0            [24]  347 	POP B 
      000224 D0 E0            [24]  348 	POP ACC 
      000226 F8               [12]  349 	MOV R0, A 
      000227 D0 E0            [24]  350 	POP ACC 
                                    351 ;	preemptive.c:74: }
      000229 22               [24]  352 	ret
                                    353 ;------------------------------------------------------------
                                    354 ;Allocation info for local variables in function 'ThreadCreate'
                                    355 ;------------------------------------------------------------
                                    356 ;fp            Allocated to registers 
                                    357 ;------------------------------------------------------------
                                    358 ;	preemptive.c:77: ThreadID ThreadCreate(FunctionPtr fp)
                                    359 ;	-----------------------------------------
                                    360 ;	 function ThreadCreate
                                    361 ;	-----------------------------------------
      00022A                        362 _ThreadCreate:
                                    363 ;	preemptive.c:82: __endasm;
      00022A 85 82 28         [24]  364 	MOV	_functionLow, DPL
      00022D 85 83 29         [24]  365 	MOV	_functionHigh, DPH
                                    366 ;	preemptive.c:84: previousEA = EA;
      000230 A2 AF            [12]  367 	mov	c,_EA
      000232 E4               [12]  368 	clr	a
      000233 33               [12]  369 	rlc	a
      000234 F5 2B            [12]  370 	mov	_previousEA,a
                                    371 ;	preemptive.c:85: EA = 0;
                                    372 ;	assignBit
      000236 C2 AF            [12]  373 	clr	_EA
                                    374 ;	preemptive.c:86: if ((threadBitmap & 0x0F) == 0x0F)
      000238 AF 25            [24]  375 	mov	r7,_threadBitmap
      00023A 53 07 0F         [24]  376 	anl	ar7,#0x0f
      00023D BF 0F 0A         [24]  377 	cjne	r7,#0x0f,00102$
                                    378 ;	preemptive.c:88: EA = previousEA;
                                    379 ;	assignBit
      000240 E5 2B            [12]  380 	mov	a,_previousEA
      000242 24 FF            [12]  381 	add	a,#0xff
      000244 92 AF            [24]  382 	mov	_EA,c
                                    383 ;	preemptive.c:89: return (ThreadID)-1;
      000246 75 82 FF         [24]  384 	mov	dpl, #0xff
      000249 22               [24]  385 	ret
      00024A                        386 00102$:
                                    387 ;	preemptive.c:91: newThread = 0;
      00024A 75 26 00         [24]  388 	mov	_newThread,#0x00
                                    389 ;	preemptive.c:92: threadMask = 0x01;
      00024D 75 2A 01         [24]  390 	mov	_threadMask,#0x01
                                    391 ;	preemptive.c:94: while (threadBitmap & threadMask)
      000250                        392 00103$:
      000250 E5 2A            [12]  393 	mov	a,_threadMask
      000252 55 25            [12]  394 	anl	a,_threadBitmap
      000254 60 0D            [24]  395 	jz	00105$
                                    396 ;	preemptive.c:96: newThread++;
      000256 E5 26            [12]  397 	mov	a,_newThread
      000258 04               [12]  398 	inc	a
      000259 F5 26            [12]  399 	mov	_newThread,a
                                    400 ;	preemptive.c:97: threadMask <<= 1;
      00025B E5 2A            [12]  401 	mov	a,_threadMask
      00025D 25 E0            [12]  402 	add	a,acc
      00025F F5 2A            [12]  403 	mov	_threadMask,a
      000261 80 ED            [24]  404 	sjmp	00103$
      000263                        405 00105$:
                                    406 ;	preemptive.c:99: threadBitmap |= threadMask;
      000263 E5 2A            [12]  407 	mov	a,_threadMask
      000265 42 25            [12]  408 	orl	_threadBitmap,a
                                    409 ;	preemptive.c:100: temporarySP = SP;
      000267 85 81 27         [24]  410 	mov	_temporarySP,_SP
                                    411 ;	preemptive.c:101: SP = 0x3F + (((unsigned char)newThread) << 4);
      00026A E5 26            [12]  412 	mov	a,_newThread
      00026C C4               [12]  413 	swap	a
      00026D 54 F0            [12]  414 	anl	a,#0xf0
      00026F FF               [12]  415 	mov	r7,a
      000270 24 3F            [12]  416 	add	a,#0x3f
      000272 F5 81            [12]  417 	mov	_SP,a
                                    418 ;	preemptive.c:105: __endasm;
      000274 C0 28            [24]  419 	PUSH	_functionLow
      000276 C0 29            [24]  420 	PUSH	_functionHigh
                                    421 ;	preemptive.c:114: __endasm;
      000278 E4               [12]  422 	CLR	A
      000279 C0 E0            [24]  423 	PUSH	ACC
      00027B C0 E0            [24]  424 	PUSH	ACC
      00027D C0 E0            [24]  425 	PUSH	ACC
      00027F C0 E0            [24]  426 	PUSH	ACC
      000281 C0 E0            [24]  427 	PUSH	ACC
                                    428 ;	preemptive.c:116: ACC = ((unsigned char)newThread) << 3;
      000283 E5 26            [12]  429 	mov	a,_newThread
      000285 C4               [12]  430 	swap	a
      000286 03               [12]  431 	rr	a
      000287 54 F8            [12]  432 	anl	a,#0xf8
      000289 F5 E0            [12]  433 	mov	_ACC,a
                                    434 ;	preemptive.c:119: __endasm;
      00028B C0 E0            [24]  435 	PUSH	ACC
                                    436 ;	preemptive.c:120: savedSP[newThread] = SP;
      00028D E5 26            [12]  437 	mov	a,_newThread
      00028F 24 20            [12]  438 	add	a, #_savedSP
      000291 F8               [12]  439 	mov	r0,a
      000292 A6 81            [24]  440 	mov	@r0,_SP
                                    441 ;	preemptive.c:121: SP = temporarySP;
      000294 85 27 81         [24]  442 	mov	_SP,_temporarySP
                                    443 ;	preemptive.c:122: EA = previousEA;
                                    444 ;	assignBit
      000297 E5 2B            [12]  445 	mov	a,_previousEA
      000299 24 FF            [12]  446 	add	a,#0xff
      00029B 92 AF            [24]  447 	mov	_EA,c
                                    448 ;	preemptive.c:124: return newThread;
      00029D 85 26 82         [24]  449 	mov	dpl, _newThread
                                    450 ;	preemptive.c:125: }
      0002A0 22               [24]  451 	ret
                                    452 ;------------------------------------------------------------
                                    453 ;Allocation info for local variables in function 'ThreadYield'
                                    454 ;------------------------------------------------------------
                                    455 ;	preemptive.c:127: void ThreadYield(void) __naked
                                    456 ;	-----------------------------------------
                                    457 ;	 function ThreadYield
                                    458 ;	-----------------------------------------
      0002A1                        459 _ThreadYield:
                                    460 ;	naked function: no prologue.
                                    461 ;	preemptive.c:191: __endasm;
      0002A1 C2 AF            [12]  462 	CLR	_EA
      0002A3 C0 E0            [24]  463 	PUSH	ACC
      0002A5 E8               [12]  464 	MOV	A, R0
      0002A6 C0 E0            [24]  465 	PUSH	ACC
      0002A8 C0 F0            [24]  466 	PUSH	B
      0002AA C0 82            [24]  467 	PUSH	DPL
      0002AC C0 83            [24]  468 	PUSH	DPH
      0002AE C0 D0            [24]  469 	PUSH	PSW
      0002B0 E5 24            [12]  470 	MOV	A, _currentThread
      0002B2 24 20            [12]  471 	ADD	A, #_savedSP
      0002B4 F8               [12]  472 	MOV	R0, A
      0002B5 A6 81            [24]  473 	MOV	@R0, SP
      0002B7                        474 TY_FIND_NEXT:
      0002B7 05 24            [12]  475 	INC	_currentThread
      0002B9 E5 24            [12]  476 	MOV	A, _currentThread
      0002BB 54 03            [12]  477 	ANL	A, #0x03
      0002BD F5 24            [12]  478 	MOV	_currentThread, A
      0002BF 60 1E            [24]  479 	JZ	TY_CHECK_THREAD0
      0002C1 B4 01 08         [24]  480 	CJNE	A, #0x01, TY_CHECK_THREAD2
      0002C4 E5 25            [12]  481 	MOV	A, _threadBitmap
      0002C6 54 02            [12]  482 	ANL	A, #0x02
      0002C8 60 ED            [24]  483 	JZ	TY_FIND_NEXT
      0002CA 80 19            [24]  484 	SJMP	TY_RESTORE
      0002CC                        485 TY_CHECK_THREAD2:
      0002CC B4 02 08         [24]  486 	CJNE	A, #0x02, TY_CHECK_THREAD3
      0002CF E5 25            [12]  487 	MOV	A, _threadBitmap
      0002D1 54 04            [12]  488 	ANL	A, #0x04
      0002D3 60 E2            [24]  489 	JZ	TY_FIND_NEXT
      0002D5 80 0E            [24]  490 	SJMP	TY_RESTORE
      0002D7                        491 TY_CHECK_THREAD3:
      0002D7 E5 25            [12]  492 	MOV	A, _threadBitmap
      0002D9 54 08            [12]  493 	ANL	A, #0x08
      0002DB 60 DA            [24]  494 	JZ	TY_FIND_NEXT
      0002DD 80 06            [24]  495 	SJMP	TY_RESTORE
      0002DF                        496 TY_CHECK_THREAD0:
      0002DF E5 25            [12]  497 	MOV	A, _threadBitmap
      0002E1 54 01            [12]  498 	ANL	A, #0x01
      0002E3 60 D2            [24]  499 	JZ	TY_FIND_NEXT
      0002E5                        500 TY_RESTORE:
      0002E5 E5 24            [12]  501 	MOV	A, _currentThread
      0002E7 24 20            [12]  502 	ADD	A, #_savedSP
      0002E9 F8               [12]  503 	MOV	R0, A
      0002EA 86 81            [24]  504 	MOV	SP, @R0
      0002EC D0 D0            [24]  505 	POP	PSW
      0002EE D0 83            [24]  506 	POP	DPH
      0002F0 D0 82            [24]  507 	POP	DPL
      0002F2 D0 F0            [24]  508 	POP	B
      0002F4 D0 E0            [24]  509 	POP	ACC
      0002F6 F8               [12]  510 	MOV	R0, A
      0002F7 D0 E0            [24]  511 	POP	ACC
      0002F9 D2 AF            [12]  512 	SETB	_EA
      0002FB 22               [24]  513 	RET
                                    514 ;	preemptive.c:192: }
                                    515 ;	naked function: no epilogue.
                                    516 ;------------------------------------------------------------
                                    517 ;Allocation info for local variables in function 'ThreadExit'
                                    518 ;------------------------------------------------------------
                                    519 ;	preemptive.c:196: void ThreadExit(void) __naked
                                    520 ;	-----------------------------------------
                                    521 ;	 function ThreadExit
                                    522 ;	-----------------------------------------
      0002FC                        523 _ThreadExit:
                                    524 ;	naked function: no prologue.
                                    525 ;	preemptive.c:275: __endasm;
      0002FC C2 AF            [12]  526 	CLR	_EA
      0002FE E5 24            [12]  527 	MOV	A, _currentThread
      000300 60 15            [24]  528 	JZ	TE_REMOVE_THREAD0
      000302 B4 01 05         [24]  529 	CJNE	A, #0x01, TE_CHECK_REMOVE2
      000305 53 25 FD         [24]  530 	ANL	_threadBitmap, #0xFD
      000308 80 10            [24]  531 	SJMP	TE_TEST_EMPTY
      00030A                        532 TE_CHECK_REMOVE2:
      00030A B4 02 05         [24]  533 	CJNE	A, #0x02, TE_REMOVE_THREAD3
      00030D 53 25 FB         [24]  534 	ANL	_threadBitmap, #0xFB
      000310 80 08            [24]  535 	SJMP	TE_TEST_EMPTY
      000312                        536 TE_REMOVE_THREAD3:
      000312 53 25 F7         [24]  537 	ANL	_threadBitmap, #0xF7
      000315 80 03            [24]  538 	SJMP	TE_TEST_EMPTY
      000317                        539 TE_REMOVE_THREAD0:
      000317 53 25 FE         [24]  540 	ANL	_threadBitmap, #0xFE
      00031A                        541 TE_TEST_EMPTY:
      00031A E5 25            [12]  542 	MOV	A, _threadBitmap
      00031C 54 0F            [12]  543 	ANL	A, #0x0F
      00031E 70 02            [24]  544 	JNZ	TE_FIND_NEXT
      000320                        545 TE_NO_THREADS:
      000320 80 FE            [24]  546 	SJMP	TE_NO_THREADS
      000322                        547 TE_FIND_NEXT:
      000322 05 24            [12]  548 	INC	_currentThread
      000324 E5 24            [12]  549 	MOV	A, _currentThread
      000326 54 03            [12]  550 	ANL	A, #0x03
      000328 F5 24            [12]  551 	MOV	_currentThread, A
      00032A 60 1E            [24]  552 	JZ	TE_CHECK_THREAD0
      00032C B4 01 08         [24]  553 	CJNE	A, #0x01, TE_CHECK_THREAD2
      00032F E5 25            [12]  554 	MOV	A, _threadBitmap
      000331 54 02            [12]  555 	ANL	A, #0x02
      000333 60 ED            [24]  556 	JZ	TE_FIND_NEXT
      000335 80 19            [24]  557 	SJMP	TE_RESTORE
      000337                        558 TE_CHECK_THREAD2:
      000337 B4 02 08         [24]  559 	CJNE	A, #0x02, TE_CHECK_THREAD3
      00033A E5 25            [12]  560 	MOV	A, _threadBitmap
      00033C 54 04            [12]  561 	ANL	A, #0x04
      00033E 60 E2            [24]  562 	JZ	TE_FIND_NEXT
      000340 80 0E            [24]  563 	SJMP	TE_RESTORE
      000342                        564 TE_CHECK_THREAD3:
      000342 E5 25            [12]  565 	MOV	A, _threadBitmap
      000344 54 08            [12]  566 	ANL	A, #0x08
      000346 60 DA            [24]  567 	JZ	TE_FIND_NEXT
      000348 80 06            [24]  568 	SJMP	TE_RESTORE
      00034A                        569 TE_CHECK_THREAD0:
      00034A E5 25            [12]  570 	MOV	A, _threadBitmap
      00034C 54 01            [12]  571 	ANL	A, #0x01
      00034E 60 D2            [24]  572 	JZ	TE_FIND_NEXT
      000350                        573 TE_RESTORE:
      000350 E5 24            [12]  574 	MOV	A, _currentThread
      000352 24 20            [12]  575 	ADD	A, #_savedSP
      000354 F8               [12]  576 	MOV	R0, A
      000355 86 81            [24]  577 	MOV	SP, @R0
      000357 D0 D0            [24]  578 	POP	PSW
      000359 D0 83            [24]  579 	POP	DPH
      00035B D0 82            [24]  580 	POP	DPL
      00035D D0 F0            [24]  581 	POP	B
      00035F D0 E0            [24]  582 	POP	ACC
      000361 F8               [12]  583 	MOV	R0, A
      000362 D0 E0            [24]  584 	POP	ACC
      000364 D2 AF            [12]  585 	SETB	_EA
      000366 22               [24]  586 	RET
                                    587 ;	preemptive.c:276: }
                                    588 ;	naked function: no epilogue.
                                    589 ;------------------------------------------------------------
                                    590 ;Allocation info for local variables in function 'myTimer0Handler'
                                    591 ;------------------------------------------------------------
                                    592 ;	preemptive.c:278: void myTimer0Handler(void) __naked
                                    593 ;	-----------------------------------------
                                    594 ;	 function myTimer0Handler
                                    595 ;	-----------------------------------------
      000367                        596 _myTimer0Handler:
                                    597 ;	naked function: no prologue.
                                    598 ;	preemptive.c:340: __endasm;
      000367 C0 E0            [24]  599 	PUSH	ACC
      000369 E8               [12]  600 	MOV	A, R0
      00036A C0 E0            [24]  601 	PUSH	ACC
      00036C C0 F0            [24]  602 	PUSH	B
      00036E C0 82            [24]  603 	PUSH	DPL
      000370 C0 83            [24]  604 	PUSH	DPH
      000372 C0 D0            [24]  605 	PUSH	PSW
      000374 E5 24            [12]  606 	MOV	A, _currentThread
      000376 24 20            [12]  607 	ADD	A, #_savedSP
      000378 F8               [12]  608 	MOV	R0, A
      000379 A6 81            [24]  609 	MOV	@R0, SP
      00037B                        610 T0_FIND_NEXT:
      00037B 05 24            [12]  611 	INC	_currentThread
      00037D E5 24            [12]  612 	MOV	A, _currentThread
      00037F 54 03            [12]  613 	ANL	A, #0x03
      000381 F5 24            [12]  614 	MOV	_currentThread, A
      000383 60 1E            [24]  615 	JZ	T0_CHECK_THREAD0
      000385 B4 01 08         [24]  616 	CJNE	A, #0x01, T0_CHECK_THREAD2
      000388 E5 25            [12]  617 	MOV	A, _threadBitmap
      00038A 54 02            [12]  618 	ANL	A, #0x02
      00038C 60 ED            [24]  619 	JZ	T0_FIND_NEXT
      00038E 80 19            [24]  620 	SJMP	T0_RESTORE
      000390                        621 T0_CHECK_THREAD2:
      000390 B4 02 08         [24]  622 	CJNE	A, #0x02, T0_CHECK_THREAD3
      000393 E5 25            [12]  623 	MOV	A, _threadBitmap
      000395 54 04            [12]  624 	ANL	A, #0x04
      000397 60 E2            [24]  625 	JZ	T0_FIND_NEXT
      000399 80 0E            [24]  626 	SJMP	T0_RESTORE
      00039B                        627 T0_CHECK_THREAD3:
      00039B E5 25            [12]  628 	MOV	A, _threadBitmap
      00039D 54 08            [12]  629 	ANL	A, #0x08
      00039F 60 DA            [24]  630 	JZ	T0_FIND_NEXT
      0003A1 80 06            [24]  631 	SJMP	T0_RESTORE
      0003A3                        632 T0_CHECK_THREAD0:
      0003A3 E5 25            [12]  633 	MOV	A, _threadBitmap
      0003A5 54 01            [12]  634 	ANL	A, #0x01
      0003A7 60 D2            [24]  635 	JZ	T0_FIND_NEXT
      0003A9                        636 T0_RESTORE:
      0003A9 E5 24            [12]  637 	MOV	A, _currentThread
      0003AB 24 20            [12]  638 	ADD	A, #_savedSP
      0003AD F8               [12]  639 	MOV	R0, A
      0003AE 86 81            [24]  640 	MOV	SP, @R0
      0003B0 D0 D0            [24]  641 	POP	PSW
      0003B2 D0 83            [24]  642 	POP	DPH
      0003B4 D0 82            [24]  643 	POP	DPL
      0003B6 D0 F0            [24]  644 	POP	B
      0003B8 D0 E0            [24]  645 	POP	ACC
      0003BA F8               [12]  646 	MOV	R0, A
      0003BB D0 E0            [24]  647 	POP	ACC
      0003BD 32               [24]  648 	RETI
                                    649 ;	preemptive.c:341: }
                                    650 ;	naked function: no epilogue.
                                    651 	.area CSEG    (CODE)
                                    652 	.area CONST   (CODE)
                                    653 	.area XINIT   (CODE)
                                    654 	.area CABS    (ABS,CODE)
