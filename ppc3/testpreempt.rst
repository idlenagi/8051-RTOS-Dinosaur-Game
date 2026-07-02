                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _full
                                    117 	.globl _empty
                                    118 	.globl _mutex
                                    119 	.globl _consumerCharacter
                                    120 	.globl _nextCharacter
                                    121 	.globl _tail
                                    122 	.globl _head
                                    123 	.globl _buffer
                                    124 ;--------------------------------------------------------
                                    125 ; special function registers
                                    126 ;--------------------------------------------------------
                                    127 	.area RSEG    (ABS,DATA)
      000000                        128 	.org 0x0000
                           000080   129 _P0	=	0x0080
                           000081   130 _SP	=	0x0081
                           000082   131 _DPL	=	0x0082
                           000083   132 _DPH	=	0x0083
                           000087   133 _PCON	=	0x0087
                           000088   134 _TCON	=	0x0088
                           000089   135 _TMOD	=	0x0089
                           00008A   136 _TL0	=	0x008a
                           00008B   137 _TL1	=	0x008b
                           00008C   138 _TH0	=	0x008c
                           00008D   139 _TH1	=	0x008d
                           000090   140 _P1	=	0x0090
                           000098   141 _SCON	=	0x0098
                           000099   142 _SBUF	=	0x0099
                           0000A0   143 _P2	=	0x00a0
                           0000A8   144 _IE	=	0x00a8
                           0000B0   145 _P3	=	0x00b0
                           0000B8   146 _IP	=	0x00b8
                           0000D0   147 _PSW	=	0x00d0
                           0000E0   148 _ACC	=	0x00e0
                           0000F0   149 _B	=	0x00f0
                                    150 ;--------------------------------------------------------
                                    151 ; special function bits
                                    152 ;--------------------------------------------------------
                                    153 	.area RSEG    (ABS,DATA)
      000000                        154 	.org 0x0000
                           000080   155 _P0_0	=	0x0080
                           000081   156 _P0_1	=	0x0081
                           000082   157 _P0_2	=	0x0082
                           000083   158 _P0_3	=	0x0083
                           000084   159 _P0_4	=	0x0084
                           000085   160 _P0_5	=	0x0085
                           000086   161 _P0_6	=	0x0086
                           000087   162 _P0_7	=	0x0087
                           000088   163 _IT0	=	0x0088
                           000089   164 _IE0	=	0x0089
                           00008A   165 _IT1	=	0x008a
                           00008B   166 _IE1	=	0x008b
                           00008C   167 _TR0	=	0x008c
                           00008D   168 _TF0	=	0x008d
                           00008E   169 _TR1	=	0x008e
                           00008F   170 _TF1	=	0x008f
                           000090   171 _P1_0	=	0x0090
                           000091   172 _P1_1	=	0x0091
                           000092   173 _P1_2	=	0x0092
                           000093   174 _P1_3	=	0x0093
                           000094   175 _P1_4	=	0x0094
                           000095   176 _P1_5	=	0x0095
                           000096   177 _P1_6	=	0x0096
                           000097   178 _P1_7	=	0x0097
                           000098   179 _RI	=	0x0098
                           000099   180 _TI	=	0x0099
                           00009A   181 _RB8	=	0x009a
                           00009B   182 _TB8	=	0x009b
                           00009C   183 _REN	=	0x009c
                           00009D   184 _SM2	=	0x009d
                           00009E   185 _SM1	=	0x009e
                           00009F   186 _SM0	=	0x009f
                           0000A0   187 _P2_0	=	0x00a0
                           0000A1   188 _P2_1	=	0x00a1
                           0000A2   189 _P2_2	=	0x00a2
                           0000A3   190 _P2_3	=	0x00a3
                           0000A4   191 _P2_4	=	0x00a4
                           0000A5   192 _P2_5	=	0x00a5
                           0000A6   193 _P2_6	=	0x00a6
                           0000A7   194 _P2_7	=	0x00a7
                           0000A8   195 _EX0	=	0x00a8
                           0000A9   196 _ET0	=	0x00a9
                           0000AA   197 _EX1	=	0x00aa
                           0000AB   198 _ET1	=	0x00ab
                           0000AC   199 _ES	=	0x00ac
                           0000AF   200 _EA	=	0x00af
                           0000B0   201 _P3_0	=	0x00b0
                           0000B1   202 _P3_1	=	0x00b1
                           0000B2   203 _P3_2	=	0x00b2
                           0000B3   204 _P3_3	=	0x00b3
                           0000B4   205 _P3_4	=	0x00b4
                           0000B5   206 _P3_5	=	0x00b5
                           0000B6   207 _P3_6	=	0x00b6
                           0000B7   208 _P3_7	=	0x00b7
                           0000B0   209 _RXD	=	0x00b0
                           0000B1   210 _TXD	=	0x00b1
                           0000B2   211 _INT0	=	0x00b2
                           0000B3   212 _INT1	=	0x00b3
                           0000B4   213 _T0	=	0x00b4
                           0000B5   214 _T1	=	0x00b5
                           0000B6   215 _WR	=	0x00b6
                           0000B7   216 _RD	=	0x00b7
                           0000B8   217 _PX0	=	0x00b8
                           0000B9   218 _PT0	=	0x00b9
                           0000BA   219 _PX1	=	0x00ba
                           0000BB   220 _PT1	=	0x00bb
                           0000BC   221 _PS	=	0x00bc
                           0000D0   222 _P	=	0x00d0
                           0000D1   223 _F1	=	0x00d1
                           0000D2   224 _OV	=	0x00d2
                           0000D3   225 _RS0	=	0x00d3
                           0000D4   226 _RS1	=	0x00d4
                           0000D5   227 _F0	=	0x00d5
                           0000D6   228 _AC	=	0x00d6
                           0000D7   229 _CY	=	0x00d7
                                    230 ;--------------------------------------------------------
                                    231 ; overlayable register banks
                                    232 ;--------------------------------------------------------
                                    233 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        234 	.ds 8
                                    235 ;--------------------------------------------------------
                                    236 ; internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area DSEG    (DATA)
                           000030   239 _buffer	=	0x0030
                           000033   240 _head	=	0x0033
                           000034   241 _tail	=	0x0034
                           000035   242 _nextCharacter	=	0x0035
                           000036   243 _consumerCharacter	=	0x0036
                           000037   244 _mutex	=	0x0037
                           000038   245 _empty	=	0x0038
                           000039   246 _full	=	0x0039
                                    247 ;--------------------------------------------------------
                                    248 ; overlayable items in internal ram
                                    249 ;--------------------------------------------------------
                                    250 ;--------------------------------------------------------
                                    251 ; Stack segment in internal ram
                                    252 ;--------------------------------------------------------
                                    253 	.area SSEG
      000008                        254 __start__stack:
      000008                        255 	.ds	1
                                    256 
                                    257 ;--------------------------------------------------------
                                    258 ; indirectly addressable internal ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area ISEG    (DATA)
                                    261 ;--------------------------------------------------------
                                    262 ; absolute internal ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area IABS    (ABS,DATA)
                                    265 	.area IABS    (ABS,DATA)
                                    266 ;--------------------------------------------------------
                                    267 ; bit data
                                    268 ;--------------------------------------------------------
                                    269 	.area BSEG    (BIT)
                                    270 ;--------------------------------------------------------
                                    271 ; paged external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area PSEG    (PAG,XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; uninitialized external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XSEG    (XDATA)
                                    278 ;--------------------------------------------------------
                                    279 ; absolute external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area XABS    (ABS,XDATA)
                                    282 ;--------------------------------------------------------
                                    283 ; initialized external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area XISEG   (XDATA)
                                    286 	.area HOME    (CODE)
                                    287 	.area GSINIT0 (CODE)
                                    288 	.area GSINIT1 (CODE)
                                    289 	.area GSINIT2 (CODE)
                                    290 	.area GSINIT3 (CODE)
                                    291 	.area GSINIT4 (CODE)
                                    292 	.area GSINIT5 (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area CSEG    (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; interrupt vector
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
      000000                        300 __interrupt_vect:
      000000 02 01 54         [24]  301 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  302 	reti
      000004                        303 	.ds	7
      00000B 02 01 5B         [24]  304 	ljmp	_timer0_ISR
                                    305 ; restartable atomic support routines
      00000E                        306 	.ds	2
      000010                        307 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  308 	nop
      000011 00               [12]  309 	nop
      000012                        310 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  311 	movx	a, @r0
      000013 FB               [12]  312 	mov	r3, a
      000014 EA               [12]  313 	mov	a, r2
      000015 F2               [24]  314 	movx	@r0, a
      000016 80 2C            [24]  315 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  316 	nop
      000019 00               [12]  317 	nop
      00001A                        318 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  319 	movx	a, @dptr
      00001B FB               [12]  320 	mov	r3, a
      00001C EA               [12]  321 	mov	a, r2
      00001D F0               [24]  322 	movx	@dptr, a
      00001E 80 24            [24]  323 	sjmp	sdcc_atomic_exchange_exit
      000020                        324 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  325 	mov	a, @r0
      000021 B5 02 02         [24]  326 	cjne	a, ar2, .+#5
      000024 EB               [12]  327 	mov	a, r3
      000025 F6               [12]  328 	mov	@r0, a
      000026 22               [24]  329 	ret
      000027 00               [12]  330 	nop
      000028                        331 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  332 	movx	a, @r0
      000029 B5 02 02         [24]  333 	cjne	a, ar2, .+#5
      00002C EB               [12]  334 	mov	a, r3
      00002D F2               [24]  335 	movx	@r0, a
      00002E 22               [24]  336 	ret
      00002F 00               [12]  337 	nop
      000030                        338 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  339 	movx	a, @dptr
      000031 B5 02 02         [24]  340 	cjne	a, ar2, .+#5
      000034 EB               [12]  341 	mov	a, r3
      000035 F0               [24]  342 	movx	@dptr, a
      000036 22               [24]  343 	ret
      000037                        344 sdcc_atomic_exchange_rollback_end::
                                    345 
      000037                        346 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  347 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  348 	mov	r0, dpl
      00003C 20 F5 D3         [24]  349 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        350 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  351 	mov	a, r2
      000040 C6               [12]  352 	xch	a, @r0
      000041 F5 82            [12]  353 	mov	dpl, a
      000043 22               [24]  354 	ret
      000044                        355 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  356 	mov	dpl, r3
      000046 22               [24]  357 	ret
      000047                        358 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  359 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  360 	mov	r0, dpl
      00004C 20 F5 D9         [24]  361 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  362 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    363 ;--------------------------------------------------------
                                    364 ; global & static initialisations
                                    365 ;--------------------------------------------------------
                                    366 	.area HOME    (CODE)
                                    367 	.area GSINIT  (CODE)
                                    368 	.area GSFINAL (CODE)
                                    369 	.area GSINIT  (CODE)
                                    370 	.globl __sdcc_gsinit_startup
                                    371 	.globl __sdcc_program_startup
                                    372 	.globl __start__stack
                                    373 	.globl __mcs51_genXINIT
                                    374 	.globl __mcs51_genXRAMCLEAR
                                    375 	.globl __mcs51_genRAMCLEAR
                                    376 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  377 	ljmp	__sdcc_program_startup
                                    378 ;--------------------------------------------------------
                                    379 ; Home
                                    380 ;--------------------------------------------------------
                                    381 	.area HOME    (CODE)
                                    382 	.area HOME    (CODE)
      000051                        383 __sdcc_program_startup:
      000051 02 01 36         [24]  384 	ljmp	_main
                                    385 ;	return from main will return to caller
                                    386 ;--------------------------------------------------------
                                    387 ; code
                                    388 ;--------------------------------------------------------
                                    389 	.area CSEG    (CODE)
                                    390 ;------------------------------------------------------------
                                    391 ;Allocation info for local variables in function 'Producer'
                                    392 ;------------------------------------------------------------
                                    393 ;	testpreempt.c:31: void Producer(void)
                                    394 ;	-----------------------------------------
                                    395 ;	 function Producer
                                    396 ;	-----------------------------------------
      000081                        397 _Producer:
                           000007   398 	ar7 = 0x07
                           000006   399 	ar6 = 0x06
                           000005   400 	ar5 = 0x05
                           000004   401 	ar4 = 0x04
                           000003   402 	ar3 = 0x03
                           000002   403 	ar2 = 0x02
                           000001   404 	ar1 = 0x01
                           000000   405 	ar0 = 0x00
                                    406 ;	testpreempt.c:33: nextCharacter = 'A';
      000081 75 35 41         [24]  407 	mov	_nextCharacter,#0x41
                                    408 ;	testpreempt.c:40: SemaphoreWait(empty);
      000084                        409 00101$:
      000084 E5 38            [12]  410 	mov	a,_empty
      000086 60 FC            [24]  411 	jz	00101$
                                    412 ;	assignBit
      000088 C2 AF            [12]  413 	clr	_EA
      00008A E5 38            [12]  414 	mov	a,_empty
      00008C 60 09            [24]  415 	jz	00105$
      00008E E5 38            [12]  416 	mov	a,_empty
      000090 14               [12]  417 	dec	a
      000091 F5 38            [12]  418 	mov	_empty,a
                                    419 ;	assignBit
      000093 D2 AF            [12]  420 	setb	_EA
      000095 80 04            [24]  421 	sjmp	00112$
      000097                        422 00105$:
                                    423 ;	assignBit
      000097 D2 AF            [12]  424 	setb	_EA
                                    425 ;	testpreempt.c:45: SemaphoreWait(mutex);
      000099 80 E9            [24]  426 	sjmp	00101$
      00009B                        427 00112$:
      00009B E5 37            [12]  428 	mov	a,_mutex
      00009D 60 FC            [24]  429 	jz	00112$
                                    430 ;	assignBit
      00009F C2 AF            [12]  431 	clr	_EA
      0000A1 E5 37            [12]  432 	mov	a,_mutex
      0000A3 60 09            [24]  433 	jz	00116$
      0000A5 E5 37            [12]  434 	mov	a,_mutex
      0000A7 14               [12]  435 	dec	a
      0000A8 F5 37            [12]  436 	mov	_mutex,a
                                    437 ;	assignBit
      0000AA D2 AF            [12]  438 	setb	_EA
      0000AC 80 04            [24]  439 	sjmp	00121$
      0000AE                        440 00116$:
                                    441 ;	assignBit
      0000AE D2 AF            [12]  442 	setb	_EA
      0000B0 80 E9            [24]  443 	sjmp	00112$
      0000B2                        444 00121$:
                                    445 ;	testpreempt.c:50: buffer[tail] = nextCharacter;
      0000B2 E5 34            [12]  446 	mov	a,_tail
      0000B4 24 30            [12]  447 	add	a, #_buffer
      0000B6 F8               [12]  448 	mov	r0,a
      0000B7 A6 35            [24]  449 	mov	@r0,_nextCharacter
                                    450 ;	testpreempt.c:55: tail++;
      0000B9 E5 34            [12]  451 	mov	a,_tail
      0000BB 04               [12]  452 	inc	a
      0000BC F5 34            [12]  453 	mov	_tail,a
                                    454 ;	testpreempt.c:56: if (tail == BUFFER_SIZE)
      0000BE 74 03            [12]  455 	mov	a,#0x03
      0000C0 B5 34 03         [24]  456 	cjne	a,_tail,00124$
                                    457 ;	testpreempt.c:58: tail = 0;
      0000C3 75 34 00         [24]  458 	mov	_tail,#0x00
      0000C6                        459 00124$:
                                    460 ;	testpreempt.c:64: if (nextCharacter == 'Z')
      0000C6 74 5A            [12]  461 	mov	a,#0x5a
      0000C8 B5 35 05         [24]  462 	cjne	a,_nextCharacter,00126$
                                    463 ;	testpreempt.c:66: nextCharacter = 'A';
      0000CB 75 35 41         [24]  464 	mov	_nextCharacter,#0x41
      0000CE 80 05            [24]  465 	sjmp	00128$
      0000D0                        466 00126$:
                                    467 ;	testpreempt.c:70: nextCharacter++;
      0000D0 E5 35            [12]  468 	mov	a,_nextCharacter
      0000D2 04               [12]  469 	inc	a
      0000D3 F5 35            [12]  470 	mov	_nextCharacter,a
                                    471 ;	testpreempt.c:76: SemaphoreSignal(mutex);
      0000D5                        472 00128$:
      0000D5 05 37            [12]  473 	INC _mutex 
                                    474 ;	testpreempt.c:81: SemaphoreSignal(full);
      0000D7 05 39            [12]  475 	INC _full 
                                    476 ;	testpreempt.c:83: }
      0000D9 80 A9            [24]  477 	sjmp	00101$
                                    478 ;------------------------------------------------------------
                                    479 ;Allocation info for local variables in function 'Consumer'
                                    480 ;------------------------------------------------------------
                                    481 ;	testpreempt.c:90: void Consumer(void)
                                    482 ;	-----------------------------------------
                                    483 ;	 function Consumer
                                    484 ;	-----------------------------------------
      0000DB                        485 _Consumer:
                                    486 ;	testpreempt.c:96: TMOD |= 0x20;
      0000DB 43 89 20         [24]  487 	orl	_TMOD,#0x20
                                    488 ;	testpreempt.c:101: TH1 = (unsigned char)-6;
      0000DE 75 8D FA         [24]  489 	mov	_TH1,#0xfa
                                    490 ;	testpreempt.c:109: SCON = 0x50;
      0000E1 75 98 50         [24]  491 	mov	_SCON,#0x50
                                    492 ;	testpreempt.c:114: TI = 0;
                                    493 ;	assignBit
      0000E4 C2 99            [12]  494 	clr	_TI
                                    495 ;	testpreempt.c:115: TR1 = 1;
                                    496 ;	assignBit
      0000E6 D2 8E            [12]  497 	setb	_TR1
                                    498 ;	testpreempt.c:122: SemaphoreWait(full);
      0000E8                        499 00101$:
      0000E8 E5 39            [12]  500 	mov	a,_full
      0000EA 60 FC            [24]  501 	jz	00101$
                                    502 ;	assignBit
      0000EC C2 AF            [12]  503 	clr	_EA
      0000EE E5 39            [12]  504 	mov	a,_full
      0000F0 60 09            [24]  505 	jz	00105$
      0000F2 E5 39            [12]  506 	mov	a,_full
      0000F4 14               [12]  507 	dec	a
      0000F5 F5 39            [12]  508 	mov	_full,a
                                    509 ;	assignBit
      0000F7 D2 AF            [12]  510 	setb	_EA
      0000F9 80 04            [24]  511 	sjmp	00112$
      0000FB                        512 00105$:
                                    513 ;	assignBit
      0000FB D2 AF            [12]  514 	setb	_EA
                                    515 ;	testpreempt.c:127: SemaphoreWait(mutex);
      0000FD 80 E9            [24]  516 	sjmp	00101$
      0000FF                        517 00112$:
      0000FF E5 37            [12]  518 	mov	a,_mutex
      000101 60 FC            [24]  519 	jz	00112$
                                    520 ;	assignBit
      000103 C2 AF            [12]  521 	clr	_EA
      000105 E5 37            [12]  522 	mov	a,_mutex
      000107 60 09            [24]  523 	jz	00116$
      000109 E5 37            [12]  524 	mov	a,_mutex
      00010B 14               [12]  525 	dec	a
      00010C F5 37            [12]  526 	mov	_mutex,a
                                    527 ;	assignBit
      00010E D2 AF            [12]  528 	setb	_EA
      000110 80 04            [24]  529 	sjmp	00121$
      000112                        530 00116$:
                                    531 ;	assignBit
      000112 D2 AF            [12]  532 	setb	_EA
      000114 80 E9            [24]  533 	sjmp	00112$
      000116                        534 00121$:
                                    535 ;	testpreempt.c:132: consumerCharacter = buffer[head];
      000116 E5 33            [12]  536 	mov	a,_head
      000118 24 30            [12]  537 	add	a, #_buffer
      00011A F9               [12]  538 	mov	r1,a
      00011B 87 36            [24]  539 	mov	_consumerCharacter,@r1
                                    540 ;	testpreempt.c:137: head++;
      00011D E5 33            [12]  541 	mov	a,_head
      00011F 04               [12]  542 	inc	a
      000120 F5 33            [12]  543 	mov	_head,a
                                    544 ;	testpreempt.c:138: if (head == BUFFER_SIZE)
      000122 74 03            [12]  545 	mov	a,#0x03
      000124 B5 33 03         [24]  546 	cjne	a,_head,00125$
                                    547 ;	testpreempt.c:140: head = 0;
      000127 75 33 00         [24]  548 	mov	_head,#0x00
                                    549 ;	testpreempt.c:146: SemaphoreSignal(mutex);
      00012A                        550 00125$:
      00012A 05 37            [12]  551 	INC _mutex 
                                    552 ;	testpreempt.c:151: SemaphoreSignal(empty);
      00012C 05 38            [12]  553 	INC _empty 
                                    554 ;	testpreempt.c:156: SBUF = consumerCharacter;
      00012E 85 36 99         [24]  555 	mov	_SBUF,_consumerCharacter
                                    556 ;	testpreempt.c:162: while (!TI)
      000131                        557 00131$:
                                    558 ;	testpreempt.c:169: TI = 0;
                                    559 ;	assignBit
      000131 10 99 B4         [24]  560 	jbc	_TI,00101$
                                    561 ;	testpreempt.c:171: }
      000134 80 FB            [24]  562 	sjmp	00131$
                                    563 ;------------------------------------------------------------
                                    564 ;Allocation info for local variables in function 'main'
                                    565 ;------------------------------------------------------------
                                    566 ;	testpreempt.c:180: void main(void)
                                    567 ;	-----------------------------------------
                                    568 ;	 function main
                                    569 ;	-----------------------------------------
      000136                        570 _main:
                                    571 ;	testpreempt.c:185: head = 0;
      000136 75 33 00         [24]  572 	mov	_head,#0x00
                                    573 ;	testpreempt.c:186: tail = 0;
      000139 75 34 00         [24]  574 	mov	_tail,#0x00
                                    575 ;	testpreempt.c:187: nextCharacter = 'A';
      00013C 75 35 41         [24]  576 	mov	_nextCharacter,#0x41
                                    577 ;	testpreempt.c:188: consumerCharacter = 0;
      00013F 75 36 00         [24]  578 	mov	_consumerCharacter,#0x00
                                    579 ;	testpreempt.c:197: SemaphoreCreate(mutex, 1);
      000142 75 37 01         [24]  580 	mov	_mutex,#0x01
                                    581 ;	testpreempt.c:198: SemaphoreCreate(empty, BUFFER_SIZE);
      000145 75 38 03         [24]  582 	mov	_empty,#0x03
                                    583 ;	testpreempt.c:199: SemaphoreCreate(full, 0);
      000148 75 39 00         [24]  584 	mov	_full,#0x00
                                    585 ;	testpreempt.c:204: ThreadCreate(Producer);
      00014B 90 00 81         [24]  586 	mov	dptr,#_Producer
      00014E 12 01 8F         [24]  587 	lcall	_ThreadCreate
                                    588 ;	testpreempt.c:209: Consumer();
                                    589 ;	testpreempt.c:210: }
      000151 02 00 DB         [24]  590 	ljmp	_Consumer
                                    591 ;------------------------------------------------------------
                                    592 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    593 ;------------------------------------------------------------
                                    594 ;	testpreempt.c:216: void _sdcc_gsinit_startup(void)
                                    595 ;	-----------------------------------------
                                    596 ;	 function _sdcc_gsinit_startup
                                    597 ;	-----------------------------------------
      000154                        598 __sdcc_gsinit_startup:
                                    599 ;	testpreempt.c:220: __endasm;
      000154 02 01 61         [24]  600 	LJMP	_Bootstrap
                                    601 ;	testpreempt.c:221: }
      000157 22               [24]  602 	ret
                                    603 ;------------------------------------------------------------
                                    604 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    605 ;------------------------------------------------------------
                                    606 ;	testpreempt.c:227: void _mcs51_genRAMCLEAR(void) {}
                                    607 ;	-----------------------------------------
                                    608 ;	 function _mcs51_genRAMCLEAR
                                    609 ;	-----------------------------------------
      000158                        610 __mcs51_genRAMCLEAR:
      000158 22               [24]  611 	ret
                                    612 ;------------------------------------------------------------
                                    613 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    614 ;------------------------------------------------------------
                                    615 ;	testpreempt.c:228: void _mcs51_genXINIT(void) {}
                                    616 ;	-----------------------------------------
                                    617 ;	 function _mcs51_genXINIT
                                    618 ;	-----------------------------------------
      000159                        619 __mcs51_genXINIT:
      000159 22               [24]  620 	ret
                                    621 ;------------------------------------------------------------
                                    622 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    623 ;------------------------------------------------------------
                                    624 ;	testpreempt.c:229: void _mcs51_genXRAMCLEAR(void) {}
                                    625 ;	-----------------------------------------
                                    626 ;	 function _mcs51_genXRAMCLEAR
                                    627 ;	-----------------------------------------
      00015A                        628 __mcs51_genXRAMCLEAR:
      00015A 22               [24]  629 	ret
                                    630 ;------------------------------------------------------------
                                    631 ;Allocation info for local variables in function 'timer0_ISR'
                                    632 ;------------------------------------------------------------
                                    633 ;	testpreempt.c:237: void timer0_ISR(void) __interrupt(1)
                                    634 ;	-----------------------------------------
                                    635 ;	 function timer0_ISR
                                    636 ;	-----------------------------------------
      00015B                        637 _timer0_ISR:
                                    638 ;	testpreempt.c:241: __endasm;
      00015B 02 02 CC         [24]  639 	LJMP	_myTimer0Handler
                                    640 ;	testpreempt.c:242: }
      00015E 02 00 54         [24]  641 	ljmp	sdcc_atomic_maybe_rollback
                                    642 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    643 ;	eliminated unneeded push/pop not_psw
                                    644 ;	eliminated unneeded push/pop dpl
                                    645 ;	eliminated unneeded push/pop dph
                                    646 ;	eliminated unneeded push/pop b
                                    647 ;	eliminated unneeded push/pop acc
                                    648 	.area CSEG    (CODE)
                                    649 	.area CONST   (CODE)
                                    650 	.area XINIT   (CODE)
                                    651 	.area CABS    (ABS,CODE)
