                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
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
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _digitTurn
                                    118 	.globl _letterTurn
                                    119 	.globl _full
                                    120 	.globl _empty
                                    121 	.globl _mutex
                                    122 	.globl _consumerCharacter
                                    123 	.globl _nextDigit
                                    124 	.globl _nextLetter
                                    125 	.globl _tail
                                    126 	.globl _head
                                    127 	.globl _buffer
                                    128 ;--------------------------------------------------------
                                    129 ; special function registers
                                    130 ;--------------------------------------------------------
                                    131 	.area RSEG    (ABS,DATA)
      000000                        132 	.org 0x0000
                           000080   133 _P0	=	0x0080
                           000081   134 _SP	=	0x0081
                           000082   135 _DPL	=	0x0082
                           000083   136 _DPH	=	0x0083
                           000087   137 _PCON	=	0x0087
                           000088   138 _TCON	=	0x0088
                           000089   139 _TMOD	=	0x0089
                           00008A   140 _TL0	=	0x008a
                           00008B   141 _TL1	=	0x008b
                           00008C   142 _TH0	=	0x008c
                           00008D   143 _TH1	=	0x008d
                           000090   144 _P1	=	0x0090
                           000098   145 _SCON	=	0x0098
                           000099   146 _SBUF	=	0x0099
                           0000A0   147 _P2	=	0x00a0
                           0000A8   148 _IE	=	0x00a8
                           0000B0   149 _P3	=	0x00b0
                           0000B8   150 _IP	=	0x00b8
                           0000D0   151 _PSW	=	0x00d0
                           0000E0   152 _ACC	=	0x00e0
                           0000F0   153 _B	=	0x00f0
                                    154 ;--------------------------------------------------------
                                    155 ; special function bits
                                    156 ;--------------------------------------------------------
                                    157 	.area RSEG    (ABS,DATA)
      000000                        158 	.org 0x0000
                           000080   159 _P0_0	=	0x0080
                           000081   160 _P0_1	=	0x0081
                           000082   161 _P0_2	=	0x0082
                           000083   162 _P0_3	=	0x0083
                           000084   163 _P0_4	=	0x0084
                           000085   164 _P0_5	=	0x0085
                           000086   165 _P0_6	=	0x0086
                           000087   166 _P0_7	=	0x0087
                           000088   167 _IT0	=	0x0088
                           000089   168 _IE0	=	0x0089
                           00008A   169 _IT1	=	0x008a
                           00008B   170 _IE1	=	0x008b
                           00008C   171 _TR0	=	0x008c
                           00008D   172 _TF0	=	0x008d
                           00008E   173 _TR1	=	0x008e
                           00008F   174 _TF1	=	0x008f
                           000090   175 _P1_0	=	0x0090
                           000091   176 _P1_1	=	0x0091
                           000092   177 _P1_2	=	0x0092
                           000093   178 _P1_3	=	0x0093
                           000094   179 _P1_4	=	0x0094
                           000095   180 _P1_5	=	0x0095
                           000096   181 _P1_6	=	0x0096
                           000097   182 _P1_7	=	0x0097
                           000098   183 _RI	=	0x0098
                           000099   184 _TI	=	0x0099
                           00009A   185 _RB8	=	0x009a
                           00009B   186 _TB8	=	0x009b
                           00009C   187 _REN	=	0x009c
                           00009D   188 _SM2	=	0x009d
                           00009E   189 _SM1	=	0x009e
                           00009F   190 _SM0	=	0x009f
                           0000A0   191 _P2_0	=	0x00a0
                           0000A1   192 _P2_1	=	0x00a1
                           0000A2   193 _P2_2	=	0x00a2
                           0000A3   194 _P2_3	=	0x00a3
                           0000A4   195 _P2_4	=	0x00a4
                           0000A5   196 _P2_5	=	0x00a5
                           0000A6   197 _P2_6	=	0x00a6
                           0000A7   198 _P2_7	=	0x00a7
                           0000A8   199 _EX0	=	0x00a8
                           0000A9   200 _ET0	=	0x00a9
                           0000AA   201 _EX1	=	0x00aa
                           0000AB   202 _ET1	=	0x00ab
                           0000AC   203 _ES	=	0x00ac
                           0000AF   204 _EA	=	0x00af
                           0000B0   205 _P3_0	=	0x00b0
                           0000B1   206 _P3_1	=	0x00b1
                           0000B2   207 _P3_2	=	0x00b2
                           0000B3   208 _P3_3	=	0x00b3
                           0000B4   209 _P3_4	=	0x00b4
                           0000B5   210 _P3_5	=	0x00b5
                           0000B6   211 _P3_6	=	0x00b6
                           0000B7   212 _P3_7	=	0x00b7
                           0000B0   213 _RXD	=	0x00b0
                           0000B1   214 _TXD	=	0x00b1
                           0000B2   215 _INT0	=	0x00b2
                           0000B3   216 _INT1	=	0x00b3
                           0000B4   217 _T0	=	0x00b4
                           0000B5   218 _T1	=	0x00b5
                           0000B6   219 _WR	=	0x00b6
                           0000B7   220 _RD	=	0x00b7
                           0000B8   221 _PX0	=	0x00b8
                           0000B9   222 _PT0	=	0x00b9
                           0000BA   223 _PX1	=	0x00ba
                           0000BB   224 _PT1	=	0x00bb
                           0000BC   225 _PS	=	0x00bc
                           0000D0   226 _P	=	0x00d0
                           0000D1   227 _F1	=	0x00d1
                           0000D2   228 _OV	=	0x00d2
                           0000D3   229 _RS0	=	0x00d3
                           0000D4   230 _RS1	=	0x00d4
                           0000D5   231 _F0	=	0x00d5
                           0000D6   232 _AC	=	0x00d6
                           0000D7   233 _CY	=	0x00d7
                                    234 ;--------------------------------------------------------
                                    235 ; overlayable register banks
                                    236 ;--------------------------------------------------------
                                    237 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        238 	.ds 8
                                    239 ;--------------------------------------------------------
                                    240 ; internal ram data
                                    241 ;--------------------------------------------------------
                                    242 	.area DSEG    (DATA)
                           000030   243 _buffer	=	0x0030
                           000033   244 _head	=	0x0033
                           000034   245 _tail	=	0x0034
                           000035   246 _nextLetter	=	0x0035
                           000036   247 _nextDigit	=	0x0036
                           000037   248 _consumerCharacter	=	0x0037
                           000038   249 _mutex	=	0x0038
                           000039   250 _empty	=	0x0039
                           00003A   251 _full	=	0x003a
                           00003B   252 _letterTurn	=	0x003b
                           00003C   253 _digitTurn	=	0x003c
                                    254 ;--------------------------------------------------------
                                    255 ; overlayable items in internal ram
                                    256 ;--------------------------------------------------------
                                    257 ;--------------------------------------------------------
                                    258 ; Stack segment in internal ram
                                    259 ;--------------------------------------------------------
                                    260 	.area SSEG
      000008                        261 __start__stack:
      000008                        262 	.ds	1
                                    263 
                                    264 ;--------------------------------------------------------
                                    265 ; indirectly addressable internal ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area ISEG    (DATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute internal ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area IABS    (ABS,DATA)
                                    272 	.area IABS    (ABS,DATA)
                                    273 ;--------------------------------------------------------
                                    274 ; bit data
                                    275 ;--------------------------------------------------------
                                    276 	.area BSEG    (BIT)
                                    277 ;--------------------------------------------------------
                                    278 ; paged external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area PSEG    (PAG,XDATA)
                                    281 ;--------------------------------------------------------
                                    282 ; uninitialized external ram data
                                    283 ;--------------------------------------------------------
                                    284 	.area XSEG    (XDATA)
                                    285 ;--------------------------------------------------------
                                    286 ; absolute external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area XABS    (ABS,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; initialized external ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XISEG   (XDATA)
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT0 (CODE)
                                    295 	.area GSINIT1 (CODE)
                                    296 	.area GSINIT2 (CODE)
                                    297 	.area GSINIT3 (CODE)
                                    298 	.area GSINIT4 (CODE)
                                    299 	.area GSINIT5 (CODE)
                                    300 	.area GSINIT  (CODE)
                                    301 	.area GSFINAL (CODE)
                                    302 	.area CSEG    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; interrupt vector
                                    305 ;--------------------------------------------------------
                                    306 	.area HOME    (CODE)
      000000                        307 __interrupt_vect:
      000000 02 01 EF         [24]  308 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  309 	reti
      000004                        310 	.ds	7
      00000B 02 01 F6         [24]  311 	ljmp	_timer0_ISR
                                    312 ; restartable atomic support routines
      00000E                        313 	.ds	2
      000010                        314 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  315 	nop
      000011 00               [12]  316 	nop
      000012                        317 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  318 	movx	a, @r0
      000013 FB               [12]  319 	mov	r3, a
      000014 EA               [12]  320 	mov	a, r2
      000015 F2               [24]  321 	movx	@r0, a
      000016 80 2C            [24]  322 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  323 	nop
      000019 00               [12]  324 	nop
      00001A                        325 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  326 	movx	a, @dptr
      00001B FB               [12]  327 	mov	r3, a
      00001C EA               [12]  328 	mov	a, r2
      00001D F0               [24]  329 	movx	@dptr, a
      00001E 80 24            [24]  330 	sjmp	sdcc_atomic_exchange_exit
      000020                        331 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  332 	mov	a, @r0
      000021 B5 02 02         [24]  333 	cjne	a, ar2, .+#5
      000024 EB               [12]  334 	mov	a, r3
      000025 F6               [12]  335 	mov	@r0, a
      000026 22               [24]  336 	ret
      000027 00               [12]  337 	nop
      000028                        338 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  339 	movx	a, @r0
      000029 B5 02 02         [24]  340 	cjne	a, ar2, .+#5
      00002C EB               [12]  341 	mov	a, r3
      00002D F2               [24]  342 	movx	@r0, a
      00002E 22               [24]  343 	ret
      00002F 00               [12]  344 	nop
      000030                        345 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  346 	movx	a, @dptr
      000031 B5 02 02         [24]  347 	cjne	a, ar2, .+#5
      000034 EB               [12]  348 	mov	a, r3
      000035 F0               [24]  349 	movx	@dptr, a
      000036 22               [24]  350 	ret
      000037                        351 sdcc_atomic_exchange_rollback_end::
                                    352 
      000037                        353 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  354 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  355 	mov	r0, dpl
      00003C 20 F5 D3         [24]  356 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        357 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  358 	mov	a, r2
      000040 C6               [12]  359 	xch	a, @r0
      000041 F5 82            [12]  360 	mov	dpl, a
      000043 22               [24]  361 	ret
      000044                        362 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  363 	mov	dpl, r3
      000046 22               [24]  364 	ret
      000047                        365 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  366 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  367 	mov	r0, dpl
      00004C 20 F5 D9         [24]  368 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  369 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    370 ;--------------------------------------------------------
                                    371 ; global & static initialisations
                                    372 ;--------------------------------------------------------
                                    373 	.area HOME    (CODE)
                                    374 	.area GSINIT  (CODE)
                                    375 	.area GSFINAL (CODE)
                                    376 	.area GSINIT  (CODE)
                                    377 	.globl __sdcc_gsinit_startup
                                    378 	.globl __sdcc_program_startup
                                    379 	.globl __start__stack
                                    380 	.globl __mcs51_genXINIT
                                    381 	.globl __mcs51_genXRAMCLEAR
                                    382 	.globl __mcs51_genRAMCLEAR
                                    383 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  384 	ljmp	__sdcc_program_startup
                                    385 ;--------------------------------------------------------
                                    386 ; Home
                                    387 ;--------------------------------------------------------
                                    388 	.area HOME    (CODE)
                                    389 	.area HOME    (CODE)
      000051                        390 __sdcc_program_startup:
      000051 02 01 C2         [24]  391 	ljmp	_main
                                    392 ;	return from main will return to caller
                                    393 ;--------------------------------------------------------
                                    394 ; code
                                    395 ;--------------------------------------------------------
                                    396 	.area CSEG    (CODE)
                                    397 ;------------------------------------------------------------
                                    398 ;Allocation info for local variables in function 'Producer1'
                                    399 ;------------------------------------------------------------
                                    400 ;	test3threads.c:40: void Producer1(void)
                                    401 ;	-----------------------------------------
                                    402 ;	 function Producer1
                                    403 ;	-----------------------------------------
      000081                        404 _Producer1:
                           000007   405 	ar7 = 0x07
                           000006   406 	ar6 = 0x06
                           000005   407 	ar5 = 0x05
                           000004   408 	ar4 = 0x04
                           000003   409 	ar3 = 0x03
                           000002   410 	ar2 = 0x02
                           000001   411 	ar1 = 0x01
                           000000   412 	ar0 = 0x00
                                    413 ;	test3threads.c:42: nextLetter = 'A';
      000081 75 35 41         [24]  414 	mov	_nextLetter,#0x41
                                    415 ;	test3threads.c:49: SemaphoreWait(letterTurn);
      000084                        416 00101$:
      000084 E5 3B            [12]  417 	mov	a,_letterTurn
      000086 60 FC            [24]  418 	jz	00101$
                                    419 ;	assignBit
      000088 C2 AF            [12]  420 	clr	_EA
      00008A E5 3B            [12]  421 	mov	a,_letterTurn
      00008C 60 09            [24]  422 	jz	00105$
      00008E E5 3B            [12]  423 	mov	a,_letterTurn
      000090 14               [12]  424 	dec	a
      000091 F5 3B            [12]  425 	mov	_letterTurn,a
                                    426 ;	assignBit
      000093 D2 AF            [12]  427 	setb	_EA
      000095 80 04            [24]  428 	sjmp	00112$
      000097                        429 00105$:
                                    430 ;	assignBit
      000097 D2 AF            [12]  431 	setb	_EA
                                    432 ;	test3threads.c:54: SemaphoreWait(empty);
      000099 80 E9            [24]  433 	sjmp	00101$
      00009B                        434 00112$:
      00009B E5 39            [12]  435 	mov	a,_empty
      00009D 60 FC            [24]  436 	jz	00112$
                                    437 ;	assignBit
      00009F C2 AF            [12]  438 	clr	_EA
      0000A1 E5 39            [12]  439 	mov	a,_empty
      0000A3 60 09            [24]  440 	jz	00116$
      0000A5 E5 39            [12]  441 	mov	a,_empty
      0000A7 14               [12]  442 	dec	a
      0000A8 F5 39            [12]  443 	mov	_empty,a
                                    444 ;	assignBit
      0000AA D2 AF            [12]  445 	setb	_EA
      0000AC 80 04            [24]  446 	sjmp	00123$
      0000AE                        447 00116$:
                                    448 ;	assignBit
      0000AE D2 AF            [12]  449 	setb	_EA
                                    450 ;	test3threads.c:55: SemaphoreWait(mutex);
      0000B0 80 E9            [24]  451 	sjmp	00112$
      0000B2                        452 00123$:
      0000B2 E5 38            [12]  453 	mov	a,_mutex
      0000B4 60 FC            [24]  454 	jz	00123$
                                    455 ;	assignBit
      0000B6 C2 AF            [12]  456 	clr	_EA
      0000B8 E5 38            [12]  457 	mov	a,_mutex
      0000BA 60 09            [24]  458 	jz	00127$
      0000BC E5 38            [12]  459 	mov	a,_mutex
      0000BE 14               [12]  460 	dec	a
      0000BF F5 38            [12]  461 	mov	_mutex,a
                                    462 ;	assignBit
      0000C1 D2 AF            [12]  463 	setb	_EA
      0000C3 80 04            [24]  464 	sjmp	00132$
      0000C5                        465 00127$:
                                    466 ;	assignBit
      0000C5 D2 AF            [12]  467 	setb	_EA
      0000C7 80 E9            [24]  468 	sjmp	00123$
      0000C9                        469 00132$:
                                    470 ;	test3threads.c:60: buffer[tail] = nextLetter;
      0000C9 E5 34            [12]  471 	mov	a,_tail
      0000CB 24 30            [12]  472 	add	a, #_buffer
      0000CD F8               [12]  473 	mov	r0,a
      0000CE A6 35            [24]  474 	mov	@r0,_nextLetter
                                    475 ;	test3threads.c:62: tail++;
      0000D0 E5 34            [12]  476 	mov	a,_tail
      0000D2 04               [12]  477 	inc	a
      0000D3 F5 34            [12]  478 	mov	_tail,a
                                    479 ;	test3threads.c:63: if (tail == BUFFER_SIZE)
      0000D5 74 03            [12]  480 	mov	a,#0x03
      0000D7 B5 34 03         [24]  481 	cjne	a,_tail,00136$
                                    482 ;	test3threads.c:65: tail = 0;
      0000DA 75 34 00         [24]  483 	mov	_tail,#0x00
                                    484 ;	test3threads.c:68: SemaphoreSignal(mutex);
      0000DD                        485 00136$:
      0000DD 05 38            [12]  486 	INC _mutex 
                                    487 ;	test3threads.c:69: SemaphoreSignal(full);
      0000DF 05 3A            [12]  488 	INC _full 
                                    489 ;	test3threads.c:74: if (nextLetter == 'Z')
      0000E1 74 5A            [12]  490 	mov	a,#0x5a
      0000E3 B5 35 05         [24]  491 	cjne	a,_nextLetter,00143$
                                    492 ;	test3threads.c:76: nextLetter = 'A';
      0000E6 75 35 41         [24]  493 	mov	_nextLetter,#0x41
      0000E9 80 05            [24]  494 	sjmp	00145$
      0000EB                        495 00143$:
                                    496 ;	test3threads.c:80: nextLetter++;
      0000EB E5 35            [12]  497 	mov	a,_nextLetter
      0000ED 04               [12]  498 	inc	a
      0000EE F5 35            [12]  499 	mov	_nextLetter,a
                                    500 ;	test3threads.c:86: SemaphoreSignal(digitTurn);
      0000F0                        501 00145$:
      0000F0 05 3C            [12]  502 	INC _digitTurn 
                                    503 ;	test3threads.c:88: }
      0000F2 80 90            [24]  504 	sjmp	00101$
                                    505 ;------------------------------------------------------------
                                    506 ;Allocation info for local variables in function 'Producer2'
                                    507 ;------------------------------------------------------------
                                    508 ;	test3threads.c:94: void Producer2(void)
                                    509 ;	-----------------------------------------
                                    510 ;	 function Producer2
                                    511 ;	-----------------------------------------
      0000F4                        512 _Producer2:
                                    513 ;	test3threads.c:96: nextDigit = '0';
      0000F4 75 36 30         [24]  514 	mov	_nextDigit,#0x30
                                    515 ;	test3threads.c:103: SemaphoreWait(digitTurn);
      0000F7                        516 00101$:
      0000F7 E5 3C            [12]  517 	mov	a,_digitTurn
      0000F9 60 FC            [24]  518 	jz	00101$
                                    519 ;	assignBit
      0000FB C2 AF            [12]  520 	clr	_EA
      0000FD E5 3C            [12]  521 	mov	a,_digitTurn
      0000FF 60 09            [24]  522 	jz	00105$
      000101 E5 3C            [12]  523 	mov	a,_digitTurn
      000103 14               [12]  524 	dec	a
      000104 F5 3C            [12]  525 	mov	_digitTurn,a
                                    526 ;	assignBit
      000106 D2 AF            [12]  527 	setb	_EA
      000108 80 04            [24]  528 	sjmp	00112$
      00010A                        529 00105$:
                                    530 ;	assignBit
      00010A D2 AF            [12]  531 	setb	_EA
                                    532 ;	test3threads.c:108: SemaphoreWait(empty);
      00010C 80 E9            [24]  533 	sjmp	00101$
      00010E                        534 00112$:
      00010E E5 39            [12]  535 	mov	a,_empty
      000110 60 FC            [24]  536 	jz	00112$
                                    537 ;	assignBit
      000112 C2 AF            [12]  538 	clr	_EA
      000114 E5 39            [12]  539 	mov	a,_empty
      000116 60 09            [24]  540 	jz	00116$
      000118 E5 39            [12]  541 	mov	a,_empty
      00011A 14               [12]  542 	dec	a
      00011B F5 39            [12]  543 	mov	_empty,a
                                    544 ;	assignBit
      00011D D2 AF            [12]  545 	setb	_EA
      00011F 80 04            [24]  546 	sjmp	00123$
      000121                        547 00116$:
                                    548 ;	assignBit
      000121 D2 AF            [12]  549 	setb	_EA
                                    550 ;	test3threads.c:109: SemaphoreWait(mutex);
      000123 80 E9            [24]  551 	sjmp	00112$
      000125                        552 00123$:
      000125 E5 38            [12]  553 	mov	a,_mutex
      000127 60 FC            [24]  554 	jz	00123$
                                    555 ;	assignBit
      000129 C2 AF            [12]  556 	clr	_EA
      00012B E5 38            [12]  557 	mov	a,_mutex
      00012D 60 09            [24]  558 	jz	00127$
      00012F E5 38            [12]  559 	mov	a,_mutex
      000131 14               [12]  560 	dec	a
      000132 F5 38            [12]  561 	mov	_mutex,a
                                    562 ;	assignBit
      000134 D2 AF            [12]  563 	setb	_EA
      000136 80 04            [24]  564 	sjmp	00132$
      000138                        565 00127$:
                                    566 ;	assignBit
      000138 D2 AF            [12]  567 	setb	_EA
      00013A 80 E9            [24]  568 	sjmp	00123$
      00013C                        569 00132$:
                                    570 ;	test3threads.c:114: buffer[tail] = nextDigit;
      00013C E5 34            [12]  571 	mov	a,_tail
      00013E 24 30            [12]  572 	add	a, #_buffer
      000140 F8               [12]  573 	mov	r0,a
      000141 A6 36            [24]  574 	mov	@r0,_nextDigit
                                    575 ;	test3threads.c:116: tail++;
      000143 E5 34            [12]  576 	mov	a,_tail
      000145 04               [12]  577 	inc	a
      000146 F5 34            [12]  578 	mov	_tail,a
                                    579 ;	test3threads.c:117: if (tail == BUFFER_SIZE)
      000148 74 03            [12]  580 	mov	a,#0x03
      00014A B5 34 03         [24]  581 	cjne	a,_tail,00136$
                                    582 ;	test3threads.c:119: tail = 0;
      00014D 75 34 00         [24]  583 	mov	_tail,#0x00
                                    584 ;	test3threads.c:122: SemaphoreSignal(mutex);
      000150                        585 00136$:
      000150 05 38            [12]  586 	INC _mutex 
                                    587 ;	test3threads.c:123: SemaphoreSignal(full);
      000152 05 3A            [12]  588 	INC _full 
                                    589 ;	test3threads.c:128: if (nextDigit == '9')
      000154 74 39            [12]  590 	mov	a,#0x39
      000156 B5 36 05         [24]  591 	cjne	a,_nextDigit,00143$
                                    592 ;	test3threads.c:130: nextDigit = '0';
      000159 75 36 30         [24]  593 	mov	_nextDigit,#0x30
      00015C 80 05            [24]  594 	sjmp	00145$
      00015E                        595 00143$:
                                    596 ;	test3threads.c:134: nextDigit++;
      00015E E5 36            [12]  597 	mov	a,_nextDigit
      000160 04               [12]  598 	inc	a
      000161 F5 36            [12]  599 	mov	_nextDigit,a
                                    600 ;	test3threads.c:140: SemaphoreSignal(letterTurn);
      000163                        601 00145$:
      000163 05 3B            [12]  602 	INC _letterTurn 
                                    603 ;	test3threads.c:142: }
      000165 80 90            [24]  604 	sjmp	00101$
                                    605 ;------------------------------------------------------------
                                    606 ;Allocation info for local variables in function 'Consumer'
                                    607 ;------------------------------------------------------------
                                    608 ;	test3threads.c:149: void Consumer(void)
                                    609 ;	-----------------------------------------
                                    610 ;	 function Consumer
                                    611 ;	-----------------------------------------
      000167                        612 _Consumer:
                                    613 ;	test3threads.c:155: TMOD |= 0x20;
      000167 43 89 20         [24]  614 	orl	_TMOD,#0x20
                                    615 ;	test3threads.c:157: TH1 = (unsigned char)-6;
      00016A 75 8D FA         [24]  616 	mov	_TH1,#0xfa
                                    617 ;	test3threads.c:158: SCON = 0x50;
      00016D 75 98 50         [24]  618 	mov	_SCON,#0x50
                                    619 ;	test3threads.c:160: TI = 0;
                                    620 ;	assignBit
      000170 C2 99            [12]  621 	clr	_TI
                                    622 ;	test3threads.c:161: TR1 = 1;
                                    623 ;	assignBit
      000172 D2 8E            [12]  624 	setb	_TR1
                                    625 ;	test3threads.c:165: SemaphoreWait(full);
      000174                        626 00101$:
      000174 E5 3A            [12]  627 	mov	a,_full
      000176 60 FC            [24]  628 	jz	00101$
                                    629 ;	assignBit
      000178 C2 AF            [12]  630 	clr	_EA
      00017A E5 3A            [12]  631 	mov	a,_full
      00017C 60 09            [24]  632 	jz	00105$
      00017E E5 3A            [12]  633 	mov	a,_full
      000180 14               [12]  634 	dec	a
      000181 F5 3A            [12]  635 	mov	_full,a
                                    636 ;	assignBit
      000183 D2 AF            [12]  637 	setb	_EA
      000185 80 04            [24]  638 	sjmp	00112$
      000187                        639 00105$:
                                    640 ;	assignBit
      000187 D2 AF            [12]  641 	setb	_EA
                                    642 ;	test3threads.c:166: SemaphoreWait(mutex);
      000189 80 E9            [24]  643 	sjmp	00101$
      00018B                        644 00112$:
      00018B E5 38            [12]  645 	mov	a,_mutex
      00018D 60 FC            [24]  646 	jz	00112$
                                    647 ;	assignBit
      00018F C2 AF            [12]  648 	clr	_EA
      000191 E5 38            [12]  649 	mov	a,_mutex
      000193 60 09            [24]  650 	jz	00116$
      000195 E5 38            [12]  651 	mov	a,_mutex
      000197 14               [12]  652 	dec	a
      000198 F5 38            [12]  653 	mov	_mutex,a
                                    654 ;	assignBit
      00019A D2 AF            [12]  655 	setb	_EA
      00019C 80 04            [24]  656 	sjmp	00121$
      00019E                        657 00116$:
                                    658 ;	assignBit
      00019E D2 AF            [12]  659 	setb	_EA
      0001A0 80 E9            [24]  660 	sjmp	00112$
      0001A2                        661 00121$:
                                    662 ;	test3threads.c:171: consumerCharacter = buffer[head];
      0001A2 E5 33            [12]  663 	mov	a,_head
      0001A4 24 30            [12]  664 	add	a, #_buffer
      0001A6 F9               [12]  665 	mov	r1,a
      0001A7 87 37            [24]  666 	mov	_consumerCharacter,@r1
                                    667 ;	test3threads.c:173: head++;
      0001A9 E5 33            [12]  668 	mov	a,_head
      0001AB 04               [12]  669 	inc	a
      0001AC F5 33            [12]  670 	mov	_head,a
                                    671 ;	test3threads.c:174: if (head == BUFFER_SIZE)
      0001AE 74 03            [12]  672 	mov	a,#0x03
      0001B0 B5 33 03         [24]  673 	cjne	a,_head,00125$
                                    674 ;	test3threads.c:176: head = 0;
      0001B3 75 33 00         [24]  675 	mov	_head,#0x00
                                    676 ;	test3threads.c:179: SemaphoreSignal(mutex);
      0001B6                        677 00125$:
      0001B6 05 38            [12]  678 	INC _mutex 
                                    679 ;	test3threads.c:180: SemaphoreSignal(empty);
      0001B8 05 39            [12]  680 	INC _empty 
                                    681 ;	test3threads.c:185: SBUF = consumerCharacter;
      0001BA 85 37 99         [24]  682 	mov	_SBUF,_consumerCharacter
                                    683 ;	test3threads.c:187: while (!TI)
      0001BD                        684 00131$:
                                    685 ;	test3threads.c:191: TI = 0;
                                    686 ;	assignBit
      0001BD 10 99 B4         [24]  687 	jbc	_TI,00101$
                                    688 ;	test3threads.c:193: }
      0001C0 80 FB            [24]  689 	sjmp	00131$
                                    690 ;------------------------------------------------------------
                                    691 ;Allocation info for local variables in function 'main'
                                    692 ;------------------------------------------------------------
                                    693 ;	test3threads.c:203: void main(void)
                                    694 ;	-----------------------------------------
                                    695 ;	 function main
                                    696 ;	-----------------------------------------
      0001C2                        697 _main:
                                    698 ;	test3threads.c:205: head = 0;
      0001C2 75 33 00         [24]  699 	mov	_head,#0x00
                                    700 ;	test3threads.c:206: tail = 0;
      0001C5 75 34 00         [24]  701 	mov	_tail,#0x00
                                    702 ;	test3threads.c:208: nextLetter = 'A';
      0001C8 75 35 41         [24]  703 	mov	_nextLetter,#0x41
                                    704 ;	test3threads.c:209: nextDigit = '0';
      0001CB 75 36 30         [24]  705 	mov	_nextDigit,#0x30
                                    706 ;	test3threads.c:210: consumerCharacter = 0;
      0001CE 75 37 00         [24]  707 	mov	_consumerCharacter,#0x00
                                    708 ;	test3threads.c:215: SemaphoreCreate(mutex, 1);
      0001D1 75 38 01         [24]  709 	mov	_mutex,#0x01
                                    710 ;	test3threads.c:216: SemaphoreCreate(empty, BUFFER_SIZE);
      0001D4 75 39 03         [24]  711 	mov	_empty,#0x03
                                    712 ;	test3threads.c:217: SemaphoreCreate(full, 0);
      0001D7 75 3A 00         [24]  713 	mov	_full,#0x00
                                    714 ;	test3threads.c:225: SemaphoreCreate(letterTurn, 1);
      0001DA 75 3B 01         [24]  715 	mov	_letterTurn,#0x01
                                    716 ;	test3threads.c:226: SemaphoreCreate(digitTurn, 0);
      0001DD 75 3C 00         [24]  717 	mov	_digitTurn,#0x00
                                    718 ;	test3threads.c:228: ThreadCreate(Producer1);
      0001E0 90 00 81         [24]  719 	mov	dptr,#_Producer1
      0001E3 12 02 2A         [24]  720 	lcall	_ThreadCreate
                                    721 ;	test3threads.c:229: ThreadCreate(Producer2);
      0001E6 90 00 F4         [24]  722 	mov	dptr,#_Producer2
      0001E9 12 02 2A         [24]  723 	lcall	_ThreadCreate
                                    724 ;	test3threads.c:231: Consumer();
                                    725 ;	test3threads.c:232: }
      0001EC 02 01 67         [24]  726 	ljmp	_Consumer
                                    727 ;------------------------------------------------------------
                                    728 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    729 ;------------------------------------------------------------
                                    730 ;	test3threads.c:238: void _sdcc_gsinit_startup(void)
                                    731 ;	-----------------------------------------
                                    732 ;	 function _sdcc_gsinit_startup
                                    733 ;	-----------------------------------------
      0001EF                        734 __sdcc_gsinit_startup:
                                    735 ;	test3threads.c:242: __endasm;
      0001EF 02 01 FC         [24]  736 	LJMP	_Bootstrap
                                    737 ;	test3threads.c:243: }
      0001F2 22               [24]  738 	ret
                                    739 ;------------------------------------------------------------
                                    740 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    741 ;------------------------------------------------------------
                                    742 ;	test3threads.c:246: void _mcs51_genRAMCLEAR(void) {}
                                    743 ;	-----------------------------------------
                                    744 ;	 function _mcs51_genRAMCLEAR
                                    745 ;	-----------------------------------------
      0001F3                        746 __mcs51_genRAMCLEAR:
      0001F3 22               [24]  747 	ret
                                    748 ;------------------------------------------------------------
                                    749 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    750 ;------------------------------------------------------------
                                    751 ;	test3threads.c:247: void _mcs51_genXINIT(void) {}
                                    752 ;	-----------------------------------------
                                    753 ;	 function _mcs51_genXINIT
                                    754 ;	-----------------------------------------
      0001F4                        755 __mcs51_genXINIT:
      0001F4 22               [24]  756 	ret
                                    757 ;------------------------------------------------------------
                                    758 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    759 ;------------------------------------------------------------
                                    760 ;	test3threads.c:248: void _mcs51_genXRAMCLEAR(void) {}
                                    761 ;	-----------------------------------------
                                    762 ;	 function _mcs51_genXRAMCLEAR
                                    763 ;	-----------------------------------------
      0001F5                        764 __mcs51_genXRAMCLEAR:
      0001F5 22               [24]  765 	ret
                                    766 ;------------------------------------------------------------
                                    767 ;Allocation info for local variables in function 'timer0_ISR'
                                    768 ;------------------------------------------------------------
                                    769 ;	test3threads.c:254: void timer0_ISR(void) __interrupt(1)
                                    770 ;	-----------------------------------------
                                    771 ;	 function timer0_ISR
                                    772 ;	-----------------------------------------
      0001F6                        773 _timer0_ISR:
                                    774 ;	test3threads.c:258: __endasm;
      0001F6 02 03 67         [24]  775 	LJMP	_myTimer0Handler
                                    776 ;	test3threads.c:259: }
      0001F9 02 00 54         [24]  777 	ljmp	sdcc_atomic_maybe_rollback
                                    778 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    779 ;	eliminated unneeded push/pop not_psw
                                    780 ;	eliminated unneeded push/pop dpl
                                    781 ;	eliminated unneeded push/pop dph
                                    782 ;	eliminated unneeded push/pop b
                                    783 ;	eliminated unneeded push/pop acc
                                    784 	.area CSEG    (CODE)
                                    785 	.area CONST   (CODE)
                                    786 	.area XINIT   (CODE)
                                    787 	.area CABS    (ABS,CODE)
