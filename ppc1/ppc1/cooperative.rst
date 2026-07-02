                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _threadMask
                                    110 	.globl _functionHigh
                                    111 	.globl _functionLow
                                    112 	.globl _temporarySP
                                    113 	.globl _newThread
                                    114 	.globl _threadBitmap
                                    115 	.globl _currentThread
                                    116 	.globl _savedSP
                                    117 	.globl _ThreadCreate
                                    118 	.globl _ThreadYield
                                    119 	.globl _ThreadExit
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000081   126 _SP	=	0x0081
                           000082   127 _DPL	=	0x0082
                           000083   128 _DPH	=	0x0083
                           000087   129 _PCON	=	0x0087
                           000088   130 _TCON	=	0x0088
                           000089   131 _TMOD	=	0x0089
                           00008A   132 _TL0	=	0x008a
                           00008B   133 _TL1	=	0x008b
                           00008C   134 _TH0	=	0x008c
                           00008D   135 _TH1	=	0x008d
                           000090   136 _P1	=	0x0090
                           000098   137 _SCON	=	0x0098
                           000099   138 _SBUF	=	0x0099
                           0000A0   139 _P2	=	0x00a0
                           0000A8   140 _IE	=	0x00a8
                           0000B0   141 _P3	=	0x00b0
                           0000B8   142 _IP	=	0x00b8
                           0000D0   143 _PSW	=	0x00d0
                           0000E0   144 _ACC	=	0x00e0
                           0000F0   145 _B	=	0x00f0
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           000080   151 _P0_0	=	0x0080
                           000081   152 _P0_1	=	0x0081
                           000082   153 _P0_2	=	0x0082
                           000083   154 _P0_3	=	0x0083
                           000084   155 _P0_4	=	0x0084
                           000085   156 _P0_5	=	0x0085
                           000086   157 _P0_6	=	0x0086
                           000087   158 _P0_7	=	0x0087
                           000088   159 _IT0	=	0x0088
                           000089   160 _IE0	=	0x0089
                           00008A   161 _IT1	=	0x008a
                           00008B   162 _IE1	=	0x008b
                           00008C   163 _TR0	=	0x008c
                           00008D   164 _TF0	=	0x008d
                           00008E   165 _TR1	=	0x008e
                           00008F   166 _TF1	=	0x008f
                           000090   167 _P1_0	=	0x0090
                           000091   168 _P1_1	=	0x0091
                           000092   169 _P1_2	=	0x0092
                           000093   170 _P1_3	=	0x0093
                           000094   171 _P1_4	=	0x0094
                           000095   172 _P1_5	=	0x0095
                           000096   173 _P1_6	=	0x0096
                           000097   174 _P1_7	=	0x0097
                           000098   175 _RI	=	0x0098
                           000099   176 _TI	=	0x0099
                           00009A   177 _RB8	=	0x009a
                           00009B   178 _TB8	=	0x009b
                           00009C   179 _REN	=	0x009c
                           00009D   180 _SM2	=	0x009d
                           00009E   181 _SM1	=	0x009e
                           00009F   182 _SM0	=	0x009f
                           0000A0   183 _P2_0	=	0x00a0
                           0000A1   184 _P2_1	=	0x00a1
                           0000A2   185 _P2_2	=	0x00a2
                           0000A3   186 _P2_3	=	0x00a3
                           0000A4   187 _P2_4	=	0x00a4
                           0000A5   188 _P2_5	=	0x00a5
                           0000A6   189 _P2_6	=	0x00a6
                           0000A7   190 _P2_7	=	0x00a7
                           0000A8   191 _EX0	=	0x00a8
                           0000A9   192 _ET0	=	0x00a9
                           0000AA   193 _EX1	=	0x00aa
                           0000AB   194 _ET1	=	0x00ab
                           0000AC   195 _ES	=	0x00ac
                           0000AF   196 _EA	=	0x00af
                           0000B0   197 _P3_0	=	0x00b0
                           0000B1   198 _P3_1	=	0x00b1
                           0000B2   199 _P3_2	=	0x00b2
                           0000B3   200 _P3_3	=	0x00b3
                           0000B4   201 _P3_4	=	0x00b4
                           0000B5   202 _P3_5	=	0x00b5
                           0000B6   203 _P3_6	=	0x00b6
                           0000B7   204 _P3_7	=	0x00b7
                           0000B0   205 _RXD	=	0x00b0
                           0000B1   206 _TXD	=	0x00b1
                           0000B2   207 _INT0	=	0x00b2
                           0000B3   208 _INT1	=	0x00b3
                           0000B4   209 _T0	=	0x00b4
                           0000B5   210 _T1	=	0x00b5
                           0000B6   211 _WR	=	0x00b6
                           0000B7   212 _RD	=	0x00b7
                           0000B8   213 _PX0	=	0x00b8
                           0000B9   214 _PT0	=	0x00b9
                           0000BA   215 _PX1	=	0x00ba
                           0000BB   216 _PT1	=	0x00bb
                           0000BC   217 _PS	=	0x00bc
                           0000D0   218 _P	=	0x00d0
                           0000D1   219 _F1	=	0x00d1
                           0000D2   220 _OV	=	0x00d2
                           0000D3   221 _RS0	=	0x00d3
                           0000D4   222 _RS1	=	0x00d4
                           0000D5   223 _F0	=	0x00d5
                           0000D6   224 _AC	=	0x00d6
                           0000D7   225 _CY	=	0x00d7
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable register banks
                                    228 ;--------------------------------------------------------
                                    229 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        230 	.ds 8
                                    231 ;--------------------------------------------------------
                                    232 ; internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DSEG    (DATA)
                           000020   235 _savedSP	=	0x0020
                           000024   236 _currentThread	=	0x0024
                           000025   237 _threadBitmap	=	0x0025
                           000026   238 _newThread	=	0x0026
                           000027   239 _temporarySP	=	0x0027
                           000028   240 _functionLow	=	0x0028
                           000029   241 _functionHigh	=	0x0029
                           00002A   242 _threadMask	=	0x002a
                                    243 ;--------------------------------------------------------
                                    244 ; overlayable items in internal ram
                                    245 ;--------------------------------------------------------
                                    246 	.area	OSEG    (OVR,DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
                                    260 ;--------------------------------------------------------
                                    261 ; paged external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area PSEG    (PAG,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; uninitialized external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XSEG    (XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XABS    (ABS,XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; initialized external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XISEG   (XDATA)
                                    276 	.area HOME    (CODE)
                                    277 	.area GSINIT0 (CODE)
                                    278 	.area GSINIT1 (CODE)
                                    279 	.area GSINIT2 (CODE)
                                    280 	.area GSINIT3 (CODE)
                                    281 	.area GSINIT4 (CODE)
                                    282 	.area GSINIT5 (CODE)
                                    283 	.area GSINIT  (CODE)
                                    284 	.area GSFINAL (CODE)
                                    285 	.area CSEG    (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; global & static initialisations
                                    288 ;--------------------------------------------------------
                                    289 	.area HOME    (CODE)
                                    290 	.area GSINIT  (CODE)
                                    291 	.area GSFINAL (CODE)
                                    292 	.area GSINIT  (CODE)
                                    293 ;--------------------------------------------------------
                                    294 ; Home
                                    295 ;--------------------------------------------------------
                                    296 	.area HOME    (CODE)
                                    297 	.area HOME    (CODE)
                                    298 ;--------------------------------------------------------
                                    299 ; code
                                    300 ;--------------------------------------------------------
                                    301 	.area CSEG    (CODE)
                                    302 ;------------------------------------------------------------
                                    303 ;Allocation info for local variables in function 'Bootstrap'
                                    304 ;------------------------------------------------------------
                                    305 ;	cooperative.c:95: void Bootstrap(void)
                                    306 ;	-----------------------------------------
                                    307 ;	 function Bootstrap
                                    308 ;	-----------------------------------------
      0000BB                        309 _Bootstrap:
                           000007   310 	ar7 = 0x07
                           000006   311 	ar6 = 0x06
                           000005   312 	ar5 = 0x05
                           000004   313 	ar4 = 0x04
                           000003   314 	ar3 = 0x03
                           000002   315 	ar2 = 0x02
                           000001   316 	ar1 = 0x01
                           000000   317 	ar0 = 0x00
                                    318 ;	cooperative.c:109: threadBitmap = 0;
      0000BB 75 25 00         [24]  319 	mov	_threadBitmap,#0x00
                                    320 ;	cooperative.c:110: currentThread = 0;
      0000BE 75 24 00         [24]  321 	mov	_currentThread,#0x00
                                    322 ;	cooperative.c:111: SP = 0x3F;
      0000C1 75 81 3F         [24]  323 	mov	_SP,#0x3f
                                    324 ;	cooperative.c:112: currentThread = ThreadCreate(main);
      0000C4 90 00 A2         [24]  325 	mov	dptr,#_main
      0000C7 12 00 DF         [24]  326 	lcall	_ThreadCreate
      0000CA 85 82 24         [24]  327 	mov	_currentThread,dpl
                                    328 ;	cooperative.c:113: RESTORESTATE;
      0000CD E5 24            [12]  329 	mov	a,_currentThread
      0000CF 24 20            [12]  330 	add	a, #_savedSP
      0000D1 F9               [12]  331 	mov	r1,a
      0000D2 87 81            [24]  332 	mov	_SP,@r1
      0000D4 D0 D0            [24]  333 	POP PSW 
      0000D6 D0 83            [24]  334 	POP DPH 
      0000D8 D0 82            [24]  335 	POP DPL 
      0000DA D0 F0            [24]  336 	POP B 
      0000DC D0 E0            [24]  337 	POP ACC 
                                    338 ;	cooperative.c:114: }
      0000DE 22               [24]  339 	ret
                                    340 ;------------------------------------------------------------
                                    341 ;Allocation info for local variables in function 'ThreadCreate'
                                    342 ;------------------------------------------------------------
                                    343 ;fp            Allocated to registers 
                                    344 ;------------------------------------------------------------
                                    345 ;	cooperative.c:122: ThreadID ThreadCreate(FunctionPtr fp)
                                    346 ;	-----------------------------------------
                                    347 ;	 function ThreadCreate
                                    348 ;	-----------------------------------------
      0000DF                        349 _ThreadCreate:
                                    350 ;	cooperative.c:171: __endasm;
      0000DF 85 82 28         [24]  351 	MOV	0x28, DPL
      0000E2 85 83 29         [24]  352 	MOV	0x29, DPH
                                    353 ;	cooperative.c:173: if ((threadBitmap & 0x0F) == 0x0F) { 
      0000E5 AF 25            [24]  354 	mov	r7,_threadBitmap
      0000E7 53 07 0F         [24]  355 	anl	ar7,#0x0f
      0000EA BF 0F 04         [24]  356 	cjne	r7,#0x0f,00102$
                                    357 ;	cooperative.c:174: return (ThreadID)-1; 
      0000ED 75 82 FF         [24]  358 	mov	dpl, #0xff
      0000F0 22               [24]  359 	ret
      0000F1                        360 00102$:
                                    361 ;	cooperative.c:176: newThread = 0; 
      0000F1 75 26 00         [24]  362 	mov	_newThread,#0x00
                                    363 ;	cooperative.c:177: threadMask = 0x01;
      0000F4 75 2A 01         [24]  364 	mov	_threadMask,#0x01
                                    365 ;	cooperative.c:178: while (threadBitmap & threadMask) { 
      0000F7                        366 00103$:
      0000F7 E5 2A            [12]  367 	mov	a,_threadMask
      0000F9 55 25            [12]  368 	anl	a,_threadBitmap
      0000FB 60 0D            [24]  369 	jz	00105$
                                    370 ;	cooperative.c:179: newThread++; threadMask <<= 1; 
      0000FD E5 26            [12]  371 	mov	a,_newThread
      0000FF 04               [12]  372 	inc	a
      000100 F5 26            [12]  373 	mov	_newThread,a
      000102 E5 2A            [12]  374 	mov	a,_threadMask
      000104 25 E0            [12]  375 	add	a,acc
      000106 F5 2A            [12]  376 	mov	_threadMask,a
      000108 80 ED            [24]  377 	sjmp	00103$
      00010A                        378 00105$:
                                    379 ;	cooperative.c:181: threadBitmap |= threadMask;
      00010A E5 2A            [12]  380 	mov	a,_threadMask
      00010C 42 25            [12]  381 	orl	_threadBitmap,a
                                    382 ;	cooperative.c:182: temporarySP = SP;
      00010E 85 81 27         [24]  383 	mov	_temporarySP,_SP
                                    384 ;	cooperative.c:183: SP = 0x3F + (((unsigned char)newThread) << 4);
      000111 E5 26            [12]  385 	mov	a,_newThread
      000113 C4               [12]  386 	swap	a
      000114 54 F0            [12]  387 	anl	a,#0xf0
      000116 FF               [12]  388 	mov	r7,a
      000117 24 3F            [12]  389 	add	a,#0x3f
      000119 F5 81            [12]  390 	mov	_SP,a
                                    391 ;	cooperative.c:187: __endasm;
      00011B C0 28            [24]  392 	PUSH	0x28
      00011D C0 29            [24]  393 	PUSH	0x29
                                    394 ;	cooperative.c:194: __endasm;
      00011F E4               [12]  395 	CLR	A
      000120 C0 E0            [24]  396 	PUSH	ACC
      000122 C0 E0            [24]  397 	PUSH	ACC
      000124 C0 E0            [24]  398 	PUSH	ACC
      000126 C0 E0            [24]  399 	PUSH	ACC
                                    400 ;	cooperative.c:195: ACC = ((unsigned char)newThread) << 3; 
      000128 E5 26            [12]  401 	mov	a,_newThread
      00012A C4               [12]  402 	swap	a
      00012B 03               [12]  403 	rr	a
      00012C 54 F8            [12]  404 	anl	a,#0xf8
      00012E F5 E0            [12]  405 	mov	_ACC,a
                                    406 ;	cooperative.c:198: __endasm;
      000130 C0 E0            [24]  407 	PUSH	ACC
                                    408 ;	cooperative.c:199: savedSP[newThread] = SP;
      000132 E5 26            [12]  409 	mov	a,_newThread
      000134 24 20            [12]  410 	add	a, #_savedSP
      000136 F8               [12]  411 	mov	r0,a
      000137 A6 81            [24]  412 	mov	@r0,_SP
                                    413 ;	cooperative.c:200: SP = temporarySP;
      000139 85 27 81         [24]  414 	mov	_SP,_temporarySP
                                    415 ;	cooperative.c:201: return newThread;
      00013C 85 26 82         [24]  416 	mov	dpl, _newThread
                                    417 ;	cooperative.c:202: }
      00013F 22               [24]  418 	ret
                                    419 ;------------------------------------------------------------
                                    420 ;Allocation info for local variables in function 'ThreadYield'
                                    421 ;------------------------------------------------------------
                                    422 ;	cooperative.c:211: void ThreadYield(void)
                                    423 ;	-----------------------------------------
                                    424 ;	 function ThreadYield
                                    425 ;	-----------------------------------------
      000140                        426 _ThreadYield:
                                    427 ;	cooperative.c:213: SAVESTATE;
      000140 C0 E0            [24]  428 	PUSH ACC 
      000142 C0 F0            [24]  429 	PUSH B 
      000144 C0 82            [24]  430 	PUSH DPL 
      000146 C0 83            [24]  431 	PUSH DPH 
      000148 C0 D0            [24]  432 	PUSH PSW 
      00014A E5 24            [12]  433 	mov	a,_currentThread
      00014C 24 20            [12]  434 	add	a, #_savedSP
      00014E F8               [12]  435 	mov	r0,a
      00014F A6 81            [24]  436 	mov	@r0,_SP
                                    437 ;	cooperative.c:214: do
      000151                        438 00105$:
                                    439 ;	cooperative.c:226: currentThread++; if (currentThread >= MAXTHREADS) { 
      000151 E5 24            [12]  440 	mov	a,_currentThread
      000153 04               [12]  441 	inc	a
      000154 F5 24            [12]  442 	mov	_currentThread,a
      000156 74 FC            [12]  443 	mov	a,#0x100 - 0x04
      000158 25 24            [12]  444 	add	a,_currentThread
      00015A 50 03            [24]  445 	jnc	00102$
                                    446 ;	cooperative.c:227: currentThread = 0; 
      00015C 75 24 00         [24]  447 	mov	_currentThread,#0x00
      00015F                        448 00102$:
                                    449 ;	cooperative.c:229: threadMask = ((unsigned char)1) << currentThread; 
      00015F 85 24 F0         [24]  450 	mov	b,_currentThread
      000162 05 F0            [12]  451 	inc	b
      000164 74 01            [12]  452 	mov	a,#0x01
      000166 80 02            [24]  453 	sjmp	00130$
      000168                        454 00129$:
      000168 25 E0            [12]  455 	add	a,acc
      00016A                        456 00130$:
      00016A D5 F0 FB         [24]  457 	djnz	b,00129$
      00016D F5 2A            [12]  458 	mov	_threadMask,a
                                    459 ;	cooperative.c:230: if (threadBitmap & threadMask) { 
      00016F E5 2A            [12]  460 	mov	a,_threadMask
      000171 55 25            [12]  461 	anl	a,_threadBitmap
      000173 60 DC            [24]  462 	jz	00105$
                                    463 ;	cooperative.c:234: RESTORESTATE;
      000175 E5 24            [12]  464 	mov	a,_currentThread
      000177 24 20            [12]  465 	add	a, #_savedSP
      000179 F9               [12]  466 	mov	r1,a
      00017A 87 81            [24]  467 	mov	_SP,@r1
      00017C D0 D0            [24]  468 	POP PSW 
      00017E D0 83            [24]  469 	POP DPH 
      000180 D0 82            [24]  470 	POP DPL 
      000182 D0 F0            [24]  471 	POP B 
      000184 D0 E0            [24]  472 	POP ACC 
                                    473 ;	cooperative.c:235: }
      000186 22               [24]  474 	ret
                                    475 ;------------------------------------------------------------
                                    476 ;Allocation info for local variables in function 'ThreadExit'
                                    477 ;------------------------------------------------------------
                                    478 ;	cooperative.c:242: void ThreadExit(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function ThreadExit
                                    481 ;	-----------------------------------------
      000187                        482 _ThreadExit:
                                    483 ;	cooperative.c:250: threadBitmap &= ~(((unsigned char)1) << currentThread);
      000187 85 24 F0         [24]  484 	mov	b,_currentThread
      00018A 05 F0            [12]  485 	inc	b
      00018C 74 01            [12]  486 	mov	a,#0x01
      00018E 80 02            [24]  487 	sjmp	00127$
      000190                        488 00126$:
      000190 25 E0            [12]  489 	add	a,acc
      000192                        490 00127$:
      000192 D5 F0 FB         [24]  491 	djnz	b,00126$
      000195 F4               [12]  492 	cpl	a
      000196 52 25            [12]  493 	anl	_threadBitmap,a
                                    494 ;	cooperative.c:252: do
      000198                        495 00103$:
                                    496 ;	cooperative.c:254: currentThread++;
      000198 E5 24            [12]  497 	mov	a,_currentThread
      00019A 04               [12]  498 	inc	a
      00019B F5 24            [12]  499 	mov	_currentThread,a
                                    500 ;	cooperative.c:256: if (currentThread >= MAXTHREADS)
      00019D 74 FC            [12]  501 	mov	a,#0x100 - 0x04
      00019F 25 24            [12]  502 	add	a,_currentThread
      0001A1 50 03            [24]  503 	jnc	00104$
                                    504 ;	cooperative.c:258: currentThread = 0;
      0001A3 75 24 00         [24]  505 	mov	_currentThread,#0x00
      0001A6                        506 00104$:
                                    507 ;	cooperative.c:261: while (!(threadBitmap & (((unsigned char)1) << currentThread)));
      0001A6 85 24 F0         [24]  508 	mov	b,_currentThread
      0001A9 05 F0            [12]  509 	inc	b
      0001AB 7E 01            [12]  510 	mov	r6,#0x01
      0001AD 7F 00            [12]  511 	mov	r7,#0x00
      0001AF 80 06            [24]  512 	sjmp	00130$
      0001B1                        513 00129$:
      0001B1 EE               [12]  514 	mov	a,r6
      0001B2 2E               [12]  515 	add	a,r6
      0001B3 FE               [12]  516 	mov	r6,a
      0001B4 EF               [12]  517 	mov	a,r7
      0001B5 33               [12]  518 	rlc	a
      0001B6 FF               [12]  519 	mov	r7,a
      0001B7                        520 00130$:
      0001B7 D5 F0 F7         [24]  521 	djnz	b,00129$
      0001BA AC 25            [24]  522 	mov	r4,_threadBitmap
      0001BC 7D 00            [12]  523 	mov	r5,#0x00
      0001BE EC               [12]  524 	mov	a,r4
      0001BF 52 06            [12]  525 	anl	ar6,a
      0001C1 ED               [12]  526 	mov	a,r5
      0001C2 52 07            [12]  527 	anl	ar7,a
      0001C4 EE               [12]  528 	mov	a,r6
      0001C5 4F               [12]  529 	orl	a,r7
      0001C6 60 D0            [24]  530 	jz	00103$
                                    531 ;	cooperative.c:262: RESTORESTATE;
      0001C8 E5 24            [12]  532 	mov	a,_currentThread
      0001CA 24 20            [12]  533 	add	a, #_savedSP
      0001CC F9               [12]  534 	mov	r1,a
      0001CD 87 81            [24]  535 	mov	_SP,@r1
      0001CF D0 D0            [24]  536 	POP PSW 
      0001D1 D0 83            [24]  537 	POP DPH 
      0001D3 D0 82            [24]  538 	POP DPL 
      0001D5 D0 F0            [24]  539 	POP B 
      0001D7 D0 E0            [24]  540 	POP ACC 
                                    541 ;	cooperative.c:263: }
      0001D9 22               [24]  542 	ret
                                    543 	.area CSEG    (CODE)
                                    544 	.area CONST   (CODE)
                                    545 	.area XINIT   (CODE)
                                    546 	.area CABS    (ABS,CODE)
