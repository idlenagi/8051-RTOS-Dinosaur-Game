                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module dino
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cactus
                                     12 	.globl _dinosaur
                                     13 	.globl _timer0_ISR
                                     14 	.globl __mcs51_genXRAMCLEAR
                                     15 	.globl __mcs51_genXINIT
                                     16 	.globl __mcs51_genRAMCLEAR
                                     17 	.globl __sdcc_gsinit_startup
                                     18 	.globl _main
                                     19 	.globl _game_control
                                     20 	.globl _render_task
                                     21 	.globl _keypad_control
                                     22 	.globl _ThreadYield
                                     23 	.globl _ThreadCreate
                                     24 	.globl _LCD_write_char
                                     25 	.globl _LCD_IRWrite
                                     26 	.globl _LCD_Init
                                     27 	.globl _AnyKeyPressed
                                     28 	.globl _KeyToChar
                                     29 	.globl _Init_Keypad
                                     30 	.globl _CY
                                     31 	.globl _AC
                                     32 	.globl _F0
                                     33 	.globl _RS1
                                     34 	.globl _RS0
                                     35 	.globl _OV
                                     36 	.globl _F1
                                     37 	.globl _P
                                     38 	.globl _PS
                                     39 	.globl _PT1
                                     40 	.globl _PX1
                                     41 	.globl _PT0
                                     42 	.globl _PX0
                                     43 	.globl _RD
                                     44 	.globl _WR
                                     45 	.globl _T1
                                     46 	.globl _T0
                                     47 	.globl _INT1
                                     48 	.globl _INT0
                                     49 	.globl _TXD
                                     50 	.globl _RXD
                                     51 	.globl _P3_7
                                     52 	.globl _P3_6
                                     53 	.globl _P3_5
                                     54 	.globl _P3_4
                                     55 	.globl _P3_3
                                     56 	.globl _P3_2
                                     57 	.globl _P3_1
                                     58 	.globl _P3_0
                                     59 	.globl _EA
                                     60 	.globl _ES
                                     61 	.globl _ET1
                                     62 	.globl _EX1
                                     63 	.globl _ET0
                                     64 	.globl _EX0
                                     65 	.globl _P2_7
                                     66 	.globl _P2_6
                                     67 	.globl _P2_5
                                     68 	.globl _P2_4
                                     69 	.globl _P2_3
                                     70 	.globl _P2_2
                                     71 	.globl _P2_1
                                     72 	.globl _P2_0
                                     73 	.globl _SM0
                                     74 	.globl _SM1
                                     75 	.globl _SM2
                                     76 	.globl _REN
                                     77 	.globl _TB8
                                     78 	.globl _RB8
                                     79 	.globl _TI
                                     80 	.globl _RI
                                     81 	.globl _P1_7
                                     82 	.globl _P1_6
                                     83 	.globl _P1_5
                                     84 	.globl _P1_4
                                     85 	.globl _P1_3
                                     86 	.globl _P1_2
                                     87 	.globl _P1_1
                                     88 	.globl _P1_0
                                     89 	.globl _TF1
                                     90 	.globl _TR1
                                     91 	.globl _TF0
                                     92 	.globl _TR0
                                     93 	.globl _IE1
                                     94 	.globl _IT1
                                     95 	.globl _IE0
                                     96 	.globl _IT0
                                     97 	.globl _P0_7
                                     98 	.globl _P0_6
                                     99 	.globl _P0_5
                                    100 	.globl _P0_4
                                    101 	.globl _P0_3
                                    102 	.globl _P0_2
                                    103 	.globl _P0_1
                                    104 	.globl _P0_0
                                    105 	.globl _B
                                    106 	.globl _ACC
                                    107 	.globl _PSW
                                    108 	.globl _IP
                                    109 	.globl _P3
                                    110 	.globl _IE
                                    111 	.globl _P2
                                    112 	.globl _SBUF
                                    113 	.globl _SCON
                                    114 	.globl _P1
                                    115 	.globl _TH1
                                    116 	.globl _TH0
                                    117 	.globl _TL1
                                    118 	.globl _TL0
                                    119 	.globl _TMOD
                                    120 	.globl _TCON
                                    121 	.globl _PCON
                                    122 	.globl _DPH
                                    123 	.globl _DPL
                                    124 	.globl _SP
                                    125 	.globl _P0
                                    126 	.globl _wait_time
                                    127 	.globl _screen_mode
                                    128 	.globl _points
                                    129 	.globl _level
                                    130 	.globl _dino_row
                                    131 	.globl _read_key
                                    132 	.globl _pressed_key
                                    133 	.globl _key_ready
                                    134 	.globl _key_lock
                                    135 	.globl _draw_step
                                    136 	.globl _bottom_right
                                    137 	.globl _bottom_left
                                    138 	.globl _top_right
                                    139 	.globl _top_left
                                    140 	.globl _map_lock
                                    141 	.globl _map_piece
                                    142 	.globl _screen_is_ready
                                    143 	.globl _move_way
                                    144 ;--------------------------------------------------------
                                    145 ; special function registers
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0	=	0x0080
                           000081   150 _SP	=	0x0081
                           000082   151 _DPL	=	0x0082
                           000083   152 _DPH	=	0x0083
                           000087   153 _PCON	=	0x0087
                           000088   154 _TCON	=	0x0088
                           000089   155 _TMOD	=	0x0089
                           00008A   156 _TL0	=	0x008a
                           00008B   157 _TL1	=	0x008b
                           00008C   158 _TH0	=	0x008c
                           00008D   159 _TH1	=	0x008d
                           000090   160 _P1	=	0x0090
                           000098   161 _SCON	=	0x0098
                           000099   162 _SBUF	=	0x0099
                           0000A0   163 _P2	=	0x00a0
                           0000A8   164 _IE	=	0x00a8
                           0000B0   165 _P3	=	0x00b0
                           0000B8   166 _IP	=	0x00b8
                           0000D0   167 _PSW	=	0x00d0
                           0000E0   168 _ACC	=	0x00e0
                           0000F0   169 _B	=	0x00f0
                                    170 ;--------------------------------------------------------
                                    171 ; special function bits
                                    172 ;--------------------------------------------------------
                                    173 	.area RSEG    (ABS,DATA)
      000000                        174 	.org 0x0000
                           000080   175 _P0_0	=	0x0080
                           000081   176 _P0_1	=	0x0081
                           000082   177 _P0_2	=	0x0082
                           000083   178 _P0_3	=	0x0083
                           000084   179 _P0_4	=	0x0084
                           000085   180 _P0_5	=	0x0085
                           000086   181 _P0_6	=	0x0086
                           000087   182 _P0_7	=	0x0087
                           000088   183 _IT0	=	0x0088
                           000089   184 _IE0	=	0x0089
                           00008A   185 _IT1	=	0x008a
                           00008B   186 _IE1	=	0x008b
                           00008C   187 _TR0	=	0x008c
                           00008D   188 _TF0	=	0x008d
                           00008E   189 _TR1	=	0x008e
                           00008F   190 _TF1	=	0x008f
                           000090   191 _P1_0	=	0x0090
                           000091   192 _P1_1	=	0x0091
                           000092   193 _P1_2	=	0x0092
                           000093   194 _P1_3	=	0x0093
                           000094   195 _P1_4	=	0x0094
                           000095   196 _P1_5	=	0x0095
                           000096   197 _P1_6	=	0x0096
                           000097   198 _P1_7	=	0x0097
                           000098   199 _RI	=	0x0098
                           000099   200 _TI	=	0x0099
                           00009A   201 _RB8	=	0x009a
                           00009B   202 _TB8	=	0x009b
                           00009C   203 _REN	=	0x009c
                           00009D   204 _SM2	=	0x009d
                           00009E   205 _SM1	=	0x009e
                           00009F   206 _SM0	=	0x009f
                           0000A0   207 _P2_0	=	0x00a0
                           0000A1   208 _P2_1	=	0x00a1
                           0000A2   209 _P2_2	=	0x00a2
                           0000A3   210 _P2_3	=	0x00a3
                           0000A4   211 _P2_4	=	0x00a4
                           0000A5   212 _P2_5	=	0x00a5
                           0000A6   213 _P2_6	=	0x00a6
                           0000A7   214 _P2_7	=	0x00a7
                           0000A8   215 _EX0	=	0x00a8
                           0000A9   216 _ET0	=	0x00a9
                           0000AA   217 _EX1	=	0x00aa
                           0000AB   218 _ET1	=	0x00ab
                           0000AC   219 _ES	=	0x00ac
                           0000AF   220 _EA	=	0x00af
                           0000B0   221 _P3_0	=	0x00b0
                           0000B1   222 _P3_1	=	0x00b1
                           0000B2   223 _P3_2	=	0x00b2
                           0000B3   224 _P3_3	=	0x00b3
                           0000B4   225 _P3_4	=	0x00b4
                           0000B5   226 _P3_5	=	0x00b5
                           0000B6   227 _P3_6	=	0x00b6
                           0000B7   228 _P3_7	=	0x00b7
                           0000B0   229 _RXD	=	0x00b0
                           0000B1   230 _TXD	=	0x00b1
                           0000B2   231 _INT0	=	0x00b2
                           0000B3   232 _INT1	=	0x00b3
                           0000B4   233 _T0	=	0x00b4
                           0000B5   234 _T1	=	0x00b5
                           0000B6   235 _WR	=	0x00b6
                           0000B7   236 _RD	=	0x00b7
                           0000B8   237 _PX0	=	0x00b8
                           0000B9   238 _PT0	=	0x00b9
                           0000BA   239 _PX1	=	0x00ba
                           0000BB   240 _PT1	=	0x00bb
                           0000BC   241 _PS	=	0x00bc
                           0000D0   242 _P	=	0x00d0
                           0000D1   243 _F1	=	0x00d1
                           0000D2   244 _OV	=	0x00d2
                           0000D3   245 _RS0	=	0x00d3
                           0000D4   246 _RS1	=	0x00d4
                           0000D5   247 _F0	=	0x00d5
                           0000D6   248 _AC	=	0x00d6
                           0000D7   249 _CY	=	0x00d7
                                    250 ;--------------------------------------------------------
                                    251 ; overlayable register banks
                                    252 ;--------------------------------------------------------
                                    253 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        254 	.ds 8
                                    255 ;--------------------------------------------------------
                                    256 ; internal ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area DSEG    (DATA)
                           000028   259 _move_way	=	0x0028
                           000029   260 _screen_is_ready	=	0x0029
                           00002A   261 _map_piece	=	0x002a
                           00002B   262 _map_lock	=	0x002b
                           00002C   263 _top_left	=	0x002c
                           00002D   264 _top_right	=	0x002d
                           00002E   265 _bottom_left	=	0x002e
                           00002F   266 _bottom_right	=	0x002f
                           00003F   267 _draw_step	=	0x003f
                           000030   268 _key_lock	=	0x0030
                           000031   269 _key_ready	=	0x0031
                           000032   270 _pressed_key	=	0x0032
                           000033   271 _read_key	=	0x0033
                           000034   272 _dino_row	=	0x0034
                           000035   273 _level	=	0x0035
                           000036   274 _points	=	0x0036
                           000037   275 _screen_mode	=	0x0037
                           000038   276 _wait_time	=	0x0038
                                    277 ;--------------------------------------------------------
                                    278 ; overlayable items in internal ram
                                    279 ;--------------------------------------------------------
                                    280 ;--------------------------------------------------------
                                    281 ; Stack segment in internal ram
                                    282 ;--------------------------------------------------------
                                    283 	.area SSEG
      000008                        284 __start__stack:
      000008                        285 	.ds	1
                                    286 
                                    287 ;--------------------------------------------------------
                                    288 ; indirectly addressable internal ram data
                                    289 ;--------------------------------------------------------
                                    290 	.area ISEG    (DATA)
                                    291 ;--------------------------------------------------------
                                    292 ; absolute internal ram data
                                    293 ;--------------------------------------------------------
                                    294 	.area IABS    (ABS,DATA)
                                    295 	.area IABS    (ABS,DATA)
                                    296 ;--------------------------------------------------------
                                    297 ; bit data
                                    298 ;--------------------------------------------------------
                                    299 	.area BSEG    (BIT)
                                    300 ;--------------------------------------------------------
                                    301 ; paged external ram data
                                    302 ;--------------------------------------------------------
                                    303 	.area PSEG    (PAG,XDATA)
                                    304 ;--------------------------------------------------------
                                    305 ; uninitialized external ram data
                                    306 ;--------------------------------------------------------
                                    307 	.area XSEG    (XDATA)
                                    308 ;--------------------------------------------------------
                                    309 ; absolute external ram data
                                    310 ;--------------------------------------------------------
                                    311 	.area XABS    (ABS,XDATA)
                                    312 ;--------------------------------------------------------
                                    313 ; initialized external ram data
                                    314 ;--------------------------------------------------------
                                    315 	.area XISEG   (XDATA)
                                    316 	.area HOME    (CODE)
                                    317 	.area GSINIT0 (CODE)
                                    318 	.area GSINIT1 (CODE)
                                    319 	.area GSINIT2 (CODE)
                                    320 	.area GSINIT3 (CODE)
                                    321 	.area GSINIT4 (CODE)
                                    322 	.area GSINIT5 (CODE)
                                    323 	.area GSINIT  (CODE)
                                    324 	.area GSFINAL (CODE)
                                    325 	.area CSEG    (CODE)
                                    326 ;--------------------------------------------------------
                                    327 ; interrupt vector
                                    328 ;--------------------------------------------------------
                                    329 	.area HOME    (CODE)
      000000                        330 __interrupt_vect:
      000000 02 05 78         [24]  331 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  332 	reti
      000004                        333 	.ds	7
      00000B 02 05 7F         [24]  334 	ljmp	_timer0_ISR
                                    335 ; restartable atomic support routines
      00000E                        336 	.ds	2
      000010                        337 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  338 	nop
      000011 00               [12]  339 	nop
      000012                        340 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  341 	movx	a, @r0
      000013 FB               [12]  342 	mov	r3, a
      000014 EA               [12]  343 	mov	a, r2
      000015 F2               [24]  344 	movx	@r0, a
      000016 80 2C            [24]  345 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  346 	nop
      000019 00               [12]  347 	nop
      00001A                        348 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  349 	movx	a, @dptr
      00001B FB               [12]  350 	mov	r3, a
      00001C EA               [12]  351 	mov	a, r2
      00001D F0               [24]  352 	movx	@dptr, a
      00001E 80 24            [24]  353 	sjmp	sdcc_atomic_exchange_exit
      000020                        354 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  355 	mov	a, @r0
      000021 B5 02 02         [24]  356 	cjne	a, ar2, .+#5
      000024 EB               [12]  357 	mov	a, r3
      000025 F6               [12]  358 	mov	@r0, a
      000026 22               [24]  359 	ret
      000027 00               [12]  360 	nop
      000028                        361 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  362 	movx	a, @r0
      000029 B5 02 02         [24]  363 	cjne	a, ar2, .+#5
      00002C EB               [12]  364 	mov	a, r3
      00002D F2               [24]  365 	movx	@r0, a
      00002E 22               [24]  366 	ret
      00002F 00               [12]  367 	nop
      000030                        368 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  369 	movx	a, @dptr
      000031 B5 02 02         [24]  370 	cjne	a, ar2, .+#5
      000034 EB               [12]  371 	mov	a, r3
      000035 F0               [24]  372 	movx	@dptr, a
      000036 22               [24]  373 	ret
      000037                        374 sdcc_atomic_exchange_rollback_end::
                                    375 
      000037                        376 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  377 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  378 	mov	r0, dpl
      00003C 20 F5 D3         [24]  379 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        380 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  381 	mov	a, r2
      000040 C6               [12]  382 	xch	a, @r0
      000041 F5 82            [12]  383 	mov	dpl, a
      000043 22               [24]  384 	ret
      000044                        385 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  386 	mov	dpl, r3
      000046 22               [24]  387 	ret
      000047                        388 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  389 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  390 	mov	r0, dpl
      00004C 20 F5 D9         [24]  391 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  392 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    393 ;--------------------------------------------------------
                                    394 ; global & static initialisations
                                    395 ;--------------------------------------------------------
                                    396 	.area HOME    (CODE)
                                    397 	.area GSINIT  (CODE)
                                    398 	.area GSFINAL (CODE)
                                    399 	.area GSINIT  (CODE)
                                    400 	.globl __sdcc_gsinit_startup
                                    401 	.globl __sdcc_program_startup
                                    402 	.globl __start__stack
                                    403 	.globl __mcs51_genXINIT
                                    404 	.globl __mcs51_genXRAMCLEAR
                                    405 	.globl __mcs51_genRAMCLEAR
                                    406 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  407 	ljmp	__sdcc_program_startup
                                    408 ;--------------------------------------------------------
                                    409 ; Home
                                    410 ;--------------------------------------------------------
                                    411 	.area HOME    (CODE)
                                    412 	.area HOME    (CODE)
      000051                        413 __sdcc_program_startup:
      000051 02 04 AE         [24]  414 	ljmp	_main
                                    415 ;	return from main will return to caller
                                    416 ;--------------------------------------------------------
                                    417 ; code
                                    418 ;--------------------------------------------------------
                                    419 	.area CSEG    (CODE)
                                    420 ;------------------------------------------------------------
                                    421 ;Allocation info for local variables in function 'keypad_control'
                                    422 ;------------------------------------------------------------
                                    423 ;	dino.c:29: void keypad_control(void)
                                    424 ;	-----------------------------------------
                                    425 ;	 function keypad_control
                                    426 ;	-----------------------------------------
      000081                        427 _keypad_control:
                           000007   428 	ar7 = 0x07
                           000006   429 	ar6 = 0x06
                           000005   430 	ar5 = 0x05
                           000004   431 	ar4 = 0x04
                           000003   432 	ar3 = 0x03
                           000002   433 	ar2 = 0x02
                           000001   434 	ar1 = 0x01
                           000000   435 	ar0 = 0x00
                                    436 ;	dino.c:33: while(!AnyKeyPressed());
      000081                        437 00101$:
      000081 12 08 36         [24]  438 	lcall	_AnyKeyPressed
      000084 E5 82            [12]  439 	mov	a, dpl
      000086 60 F9            [24]  440 	jz	00101$
                                    441 ;	dino.c:34: SemaphoreWait(key_lock);
      000088                        442 00104$:
      000088 E5 30            [12]  443 	mov	a,_key_lock
      00008A 60 FC            [24]  444 	jz	00104$
                                    445 ;	assignBit
      00008C C2 AF            [12]  446 	clr	_EA
      00008E E5 30            [12]  447 	mov	a,_key_lock
      000090 60 09            [24]  448 	jz	00108$
      000092 E5 30            [12]  449 	mov	a,_key_lock
      000094 14               [12]  450 	dec	a
      000095 F5 30            [12]  451 	mov	_key_lock,a
                                    452 ;	assignBit
      000097 D2 AF            [12]  453 	setb	_EA
      000099 80 04            [24]  454 	sjmp	00113$
      00009B                        455 00108$:
                                    456 ;	assignBit
      00009B D2 AF            [12]  457 	setb	_EA
      00009D 80 E9            [24]  458 	sjmp	00104$
      00009F                        459 00113$:
                                    460 ;	dino.c:36: pressed_key = KeyToChar();
      00009F 12 08 42         [24]  461 	lcall	_KeyToChar
      0000A2 85 82 32         [24]  462 	mov	_pressed_key,dpl
                                    463 ;	dino.c:37: SemaphoreSignal(key_lock);
      0000A5 05 30            [12]  464 	INC _key_lock 
                                    465 ;	dino.c:39: while(AnyKeyPressed());
      0000A7                        466 00118$:
      0000A7 12 08 36         [24]  467 	lcall	_AnyKeyPressed
      0000AA E5 82            [12]  468 	mov	a, dpl
      0000AC 70 F9            [24]  469 	jnz	00118$
                                    470 ;	dino.c:41: key_ready = 1;
      0000AE 75 31 01         [24]  471 	mov	_key_ready,#0x01
                                    472 ;	dino.c:42: ThreadYield();
      0000B1 12 06 44         [24]  473 	lcall	_ThreadYield
                                    474 ;	dino.c:44: }
      0000B4 80 CB            [24]  475 	sjmp	00101$
                                    476 ;------------------------------------------------------------
                                    477 ;Allocation info for local variables in function 'render_task'
                                    478 ;------------------------------------------------------------
                                    479 ;	dino.c:46: void render_task(void)
                                    480 ;	-----------------------------------------
                                    481 ;	 function render_task
                                    482 ;	-----------------------------------------
      0000B6                        483 _render_task:
                                    484 ;	dino.c:48: while(1)
      0000B6                        485 00128$:
                                    486 ;	dino.c:50: if (screen_mode == 0)
      0000B6 E5 37            [12]  487 	mov	a,_screen_mode
      0000B8 60 03            [24]  488 	jz	00234$
      0000BA 02 01 80         [24]  489 	ljmp	00125$
      0000BD                        490 00234$:
                                    491 ;	dino.c:52: LCD_cursorGoTo(0, 0);
      0000BD 75 82 80         [24]  492 	mov	dpl, #0x80
      0000C0 12 07 81         [24]  493 	lcall	_LCD_IRWrite
                                    494 ;	dino.c:53: LCD_write_char('8');
      0000C3 75 82 38         [24]  495 	mov	dpl, #0x38
      0000C6 12 07 CD         [24]  496 	lcall	_LCD_write_char
                                    497 ;	dino.c:54: LCD_write_char('0');
      0000C9 75 82 30         [24]  498 	mov	dpl, #0x30
      0000CC 12 07 CD         [24]  499 	lcall	_LCD_write_char
                                    500 ;	dino.c:55: LCD_write_char('5');
      0000CF 75 82 35         [24]  501 	mov	dpl, #0x35
      0000D2 12 07 CD         [24]  502 	lcall	_LCD_write_char
                                    503 ;	dino.c:56: LCD_write_char('1');
      0000D5 75 82 31         [24]  504 	mov	dpl, #0x31
      0000D8 12 07 CD         [24]  505 	lcall	_LCD_write_char
                                    506 ;	dino.c:57: LCD_write_char(' ');
      0000DB 75 82 20         [24]  507 	mov	dpl, #0x20
      0000DE 12 07 CD         [24]  508 	lcall	_LCD_write_char
                                    509 ;	dino.c:58: LCD_write_char('R');
      0000E1 75 82 52         [24]  510 	mov	dpl, #0x52
      0000E4 12 07 CD         [24]  511 	lcall	_LCD_write_char
                                    512 ;	dino.c:59: LCD_write_char('U');
      0000E7 75 82 55         [24]  513 	mov	dpl, #0x55
      0000EA 12 07 CD         [24]  514 	lcall	_LCD_write_char
                                    515 ;	dino.c:60: LCD_write_char('N');
      0000ED 75 82 4E         [24]  516 	mov	dpl, #0x4e
      0000F0 12 07 CD         [24]  517 	lcall	_LCD_write_char
                                    518 ;	dino.c:61: LCD_write_char('N');
      0000F3 75 82 4E         [24]  519 	mov	dpl, #0x4e
      0000F6 12 07 CD         [24]  520 	lcall	_LCD_write_char
                                    521 ;	dino.c:62: LCD_write_char('E');
      0000F9 75 82 45         [24]  522 	mov	dpl, #0x45
      0000FC 12 07 CD         [24]  523 	lcall	_LCD_write_char
                                    524 ;	dino.c:63: LCD_write_char('R');
      0000FF 75 82 52         [24]  525 	mov	dpl, #0x52
      000102 12 07 CD         [24]  526 	lcall	_LCD_write_char
                                    527 ;	dino.c:64: LCD_write_char(' ');
      000105 75 82 20         [24]  528 	mov	dpl, #0x20
      000108 12 07 CD         [24]  529 	lcall	_LCD_write_char
                                    530 ;	dino.c:65: LCD_write_char(' ');
      00010B 75 82 20         [24]  531 	mov	dpl, #0x20
      00010E 12 07 CD         [24]  532 	lcall	_LCD_write_char
                                    533 ;	dino.c:66: LCD_write_char(' ');
      000111 75 82 20         [24]  534 	mov	dpl, #0x20
      000114 12 07 CD         [24]  535 	lcall	_LCD_write_char
                                    536 ;	dino.c:67: LCD_write_char(' ');
      000117 75 82 20         [24]  537 	mov	dpl, #0x20
      00011A 12 07 CD         [24]  538 	lcall	_LCD_write_char
                                    539 ;	dino.c:69: LCD_cursorGoTo(1, 0);
      00011D 75 82 C0         [24]  540 	mov	dpl, #0xc0
      000120 12 07 81         [24]  541 	lcall	_LCD_IRWrite
                                    542 ;	dino.c:70: LCD_write_char('0');
      000123 75 82 30         [24]  543 	mov	dpl, #0x30
      000126 12 07 CD         [24]  544 	lcall	_LCD_write_char
                                    545 ;	dino.c:71: LCD_write_char('-');
      000129 75 82 2D         [24]  546 	mov	dpl, #0x2d
      00012C 12 07 CD         [24]  547 	lcall	_LCD_write_char
                                    548 ;	dino.c:72: LCD_write_char('9');
      00012F 75 82 39         [24]  549 	mov	dpl, #0x39
      000132 12 07 CD         [24]  550 	lcall	_LCD_write_char
                                    551 ;	dino.c:73: LCD_write_char(' ');
      000135 75 82 20         [24]  552 	mov	dpl, #0x20
      000138 12 07 CD         [24]  553 	lcall	_LCD_write_char
                                    554 ;	dino.c:74: LCD_write_char('T');
      00013B 75 82 54         [24]  555 	mov	dpl, #0x54
      00013E 12 07 CD         [24]  556 	lcall	_LCD_write_char
                                    557 ;	dino.c:75: LCD_write_char('H');
      000141 75 82 48         [24]  558 	mov	dpl, #0x48
      000144 12 07 CD         [24]  559 	lcall	_LCD_write_char
                                    560 ;	dino.c:76: LCD_write_char('E');
      000147 75 82 45         [24]  561 	mov	dpl, #0x45
      00014A 12 07 CD         [24]  562 	lcall	_LCD_write_char
                                    563 ;	dino.c:77: LCD_write_char('N');
      00014D 75 82 4E         [24]  564 	mov	dpl, #0x4e
      000150 12 07 CD         [24]  565 	lcall	_LCD_write_char
                                    566 ;	dino.c:78: LCD_write_char(' ');
      000153 75 82 20         [24]  567 	mov	dpl, #0x20
      000156 12 07 CD         [24]  568 	lcall	_LCD_write_char
                                    569 ;	dino.c:79: LCD_write_char('#');
      000159 75 82 23         [24]  570 	mov	dpl, #0x23
      00015C 12 07 CD         [24]  571 	lcall	_LCD_write_char
                                    572 ;	dino.c:80: LCD_write_char(' ');
      00015F 75 82 20         [24]  573 	mov	dpl, #0x20
      000162 12 07 CD         [24]  574 	lcall	_LCD_write_char
                                    575 ;	dino.c:81: LCD_write_char(' ');
      000165 75 82 20         [24]  576 	mov	dpl, #0x20
      000168 12 07 CD         [24]  577 	lcall	_LCD_write_char
                                    578 ;	dino.c:82: LCD_write_char(' ');
      00016B 75 82 20         [24]  579 	mov	dpl, #0x20
      00016E 12 07 CD         [24]  580 	lcall	_LCD_write_char
                                    581 ;	dino.c:83: LCD_write_char(' ');
      000171 75 82 20         [24]  582 	mov	dpl, #0x20
      000174 12 07 CD         [24]  583 	lcall	_LCD_write_char
                                    584 ;	dino.c:84: LCD_write_char(' ');
      000177 75 82 20         [24]  585 	mov	dpl, #0x20
      00017A 12 07 CD         [24]  586 	lcall	_LCD_write_char
      00017D 02 03 3C         [24]  587 	ljmp	00126$
      000180                        588 00125$:
                                    589 ;	dino.c:86: else if (screen_mode == 1)
      000180 74 01            [12]  590 	mov	a,#0x01
      000182 B5 37 02         [24]  591 	cjne	a,_screen_mode,00235$
      000185 80 03            [24]  592 	sjmp	00236$
      000187                        593 00235$:
      000187 02 02 59         [24]  594 	ljmp	00122$
      00018A                        595 00236$:
                                    596 ;	dino.c:88: LCD_cursorGoTo(0, 0);
      00018A 75 82 80         [24]  597 	mov	dpl, #0x80
      00018D 12 07 81         [24]  598 	lcall	_LCD_IRWrite
                                    599 ;	dino.c:89: SemaphoreWait(map_lock);
      000190                        600 00101$:
      000190 E5 2B            [12]  601 	mov	a,_map_lock
      000192 60 FC            [24]  602 	jz	00101$
                                    603 ;	assignBit
      000194 C2 AF            [12]  604 	clr	_EA
      000196 E5 2B            [12]  605 	mov	a,_map_lock
      000198 60 09            [24]  606 	jz	00105$
      00019A E5 2B            [12]  607 	mov	a,_map_lock
      00019C 14               [12]  608 	dec	a
      00019D F5 2B            [12]  609 	mov	_map_lock,a
                                    610 ;	assignBit
      00019F D2 AF            [12]  611 	setb	_EA
      0001A1 80 04            [24]  612 	sjmp	00110$
      0001A3                        613 00105$:
                                    614 ;	assignBit
      0001A3 D2 AF            [12]  615 	setb	_EA
      0001A5 80 E9            [24]  616 	sjmp	00101$
      0001A7                        617 00110$:
                                    618 ;	dino.c:90: map_piece = top_left;
      0001A7 85 2C 2A         [24]  619 	mov	_map_piece,_top_left
                                    620 ;	dino.c:91: for(draw_step = 0; draw_step < 8; ++draw_step)
      0001AA 75 3F 00         [24]  621 	mov	_draw_step,#0x00
      0001AD                        622 00131$:
      0001AD 74 F8            [12]  623 	mov	a,#0x100 - 0x08
      0001AF 25 3F            [12]  624 	add	a,_draw_step
      0001B1 40 1A            [24]  625 	jc	00112$
                                    626 ;	dino.c:106: __endasm;
      0001B3 C0 E0            [24]  627 	PUSH	ACC
      0001B5 E5 2A            [12]  628 	MOV	A, _map_piece
      0001B7 54 80            [12]  629 	ANL	A, #0x80
      0001B9 33               [12]  630 	RLC	A
      0001BA 34 00            [12]  631 	ADDC	A, #0
      0001BC 23               [12]  632 	RL	A
      0001BD F5 82            [12]  633 	MOV	DPL, A
      0001BF 12 07 CD         [24]  634 	LCALL	_LCD_write_char
      0001C2 E5 2A            [12]  635 	MOV	A, _map_piece
      0001C4 23               [12]  636 	RL	A
      0001C5 F5 2A            [12]  637 	MOV	_map_piece, A
      0001C7 D0 E0            [24]  638 	POP	ACC
                                    639 ;	dino.c:91: for(draw_step = 0; draw_step < 8; ++draw_step)
      0001C9 05 3F            [12]  640 	inc	_draw_step
      0001CB 80 E0            [24]  641 	sjmp	00131$
      0001CD                        642 00112$:
                                    643 ;	dino.c:108: map_piece = top_right;
      0001CD 85 2D 2A         [24]  644 	mov	_map_piece,_top_right
      0001D0                        645 00134$:
                                    646 ;	dino.c:109: for(; draw_step < 15; ++draw_step)
      0001D0 74 F1            [12]  647 	mov	a,#0x100 - 0x0f
      0001D2 25 3F            [12]  648 	add	a,_draw_step
      0001D4 40 1A            [24]  649 	jc	00113$
                                    650 ;	dino.c:124: __endasm;
      0001D6 C0 E0            [24]  651 	PUSH	ACC
      0001D8 E5 2A            [12]  652 	MOV	A, _map_piece
      0001DA 54 80            [12]  653 	ANL	A, #0x80
      0001DC 33               [12]  654 	RLC	A
      0001DD 34 00            [12]  655 	ADDC	A, #0
      0001DF 23               [12]  656 	RL	A
      0001E0 F5 82            [12]  657 	MOV	DPL, A
      0001E2 12 07 CD         [24]  658 	LCALL	_LCD_write_char
      0001E5 E5 2A            [12]  659 	MOV	A, _map_piece
      0001E7 23               [12]  660 	RL	A
      0001E8 F5 2A            [12]  661 	MOV	_map_piece, A
      0001EA D0 E0            [24]  662 	POP	ACC
                                    663 ;	dino.c:109: for(; draw_step < 15; ++draw_step)
      0001EC 05 3F            [12]  664 	inc	_draw_step
      0001EE 80 E0            [24]  665 	sjmp	00134$
      0001F0                        666 00113$:
                                    667 ;	dino.c:126: LCD_cursorGoTo(1, 0);
      0001F0 75 82 C0         [24]  668 	mov	dpl, #0xc0
      0001F3 12 07 81         [24]  669 	lcall	_LCD_IRWrite
                                    670 ;	dino.c:127: map_piece = bottom_left;
      0001F6 85 2E 2A         [24]  671 	mov	_map_piece,_bottom_left
                                    672 ;	dino.c:128: for(draw_step = 0; draw_step < 8; ++draw_step)
      0001F9 75 3F 00         [24]  673 	mov	_draw_step,#0x00
      0001FC                        674 00137$:
      0001FC 74 F8            [12]  675 	mov	a,#0x100 - 0x08
      0001FE 25 3F            [12]  676 	add	a,_draw_step
      000200 40 1A            [24]  677 	jc	00114$
                                    678 ;	dino.c:143: __endasm;
      000202 C0 E0            [24]  679 	PUSH	ACC
      000204 E5 2A            [12]  680 	MOV	A, _map_piece
      000206 54 80            [12]  681 	ANL	A, #0x80
      000208 33               [12]  682 	RLC	A
      000209 34 00            [12]  683 	ADDC	A, #0
      00020B 23               [12]  684 	RL	A
      00020C F5 82            [12]  685 	MOV	DPL, A
      00020E 12 07 CD         [24]  686 	LCALL	_LCD_write_char
      000211 E5 2A            [12]  687 	MOV	A, _map_piece
      000213 23               [12]  688 	RL	A
      000214 F5 2A            [12]  689 	MOV	_map_piece, A
      000216 D0 E0            [24]  690 	POP	ACC
                                    691 ;	dino.c:128: for(draw_step = 0; draw_step < 8; ++draw_step)
      000218 05 3F            [12]  692 	inc	_draw_step
      00021A 80 E0            [24]  693 	sjmp	00137$
      00021C                        694 00114$:
                                    695 ;	dino.c:145: map_piece = bottom_right;
      00021C 85 2F 2A         [24]  696 	mov	_map_piece,_bottom_right
      00021F                        697 00140$:
                                    698 ;	dino.c:146: for(; draw_step < 15; ++draw_step)
      00021F 74 F1            [12]  699 	mov	a,#0x100 - 0x0f
      000221 25 3F            [12]  700 	add	a,_draw_step
      000223 40 1A            [24]  701 	jc	00116$
                                    702 ;	dino.c:161: __endasm;
      000225 C0 E0            [24]  703 	PUSH	ACC
      000227 E5 2A            [12]  704 	MOV	A, _map_piece
      000229 54 80            [12]  705 	ANL	A, #0x80
      00022B 33               [12]  706 	RLC	A
      00022C 34 00            [12]  707 	ADDC	A, #0
      00022E 23               [12]  708 	RL	A
      00022F F5 82            [12]  709 	MOV	DPL, A
      000231 12 07 CD         [24]  710 	LCALL	_LCD_write_char
      000234 E5 2A            [12]  711 	MOV	A, _map_piece
      000236 23               [12]  712 	RL	A
      000237 F5 2A            [12]  713 	MOV	_map_piece, A
      000239 D0 E0            [24]  714 	POP	ACC
                                    715 ;	dino.c:146: for(; draw_step < 15; ++draw_step)
      00023B 05 3F            [12]  716 	inc	_draw_step
                                    717 ;	dino.c:163: SemaphoreSignal(map_lock);
      00023D 80 E0            [24]  718 	sjmp	00140$
      00023F                        719 00116$:
      00023F 05 2B            [12]  720 	INC _map_lock 
                                    721 ;	dino.c:166: LCD_cursorGoTo(dino_row, 0);
      000241 E5 34            [12]  722 	mov	a,_dino_row
      000243 03               [12]  723 	rr	a
      000244 03               [12]  724 	rr	a
      000245 54 C0            [12]  725 	anl	a,#0xc0
      000247 FF               [12]  726 	mov	r7,a
      000248 74 80            [12]  727 	mov	a,#0x80
      00024A 4F               [12]  728 	orl	a,r7
      00024B F5 82            [12]  729 	mov	dpl,a
      00024D 12 07 81         [24]  730 	lcall	_LCD_IRWrite
                                    731 ;	dino.c:167: LCD_write_char('\1');
      000250 75 82 01         [24]  732 	mov	dpl, #0x01
      000253 12 07 CD         [24]  733 	lcall	_LCD_write_char
      000256 02 03 3C         [24]  734 	ljmp	00126$
      000259                        735 00122$:
                                    736 ;	dino.c:169: else if (screen_mode == 2)
      000259 74 02            [12]  737 	mov	a,#0x02
      00025B B5 37 02         [24]  738 	cjne	a,_screen_mode,00243$
      00025E 80 03            [24]  739 	sjmp	00244$
      000260                        740 00243$:
      000260 02 03 3C         [24]  741 	ljmp	00126$
      000263                        742 00244$:
                                    743 ;	dino.c:171: LCD_cursorGoTo(0, 0);
      000263 75 82 80         [24]  744 	mov	dpl, #0x80
      000266 12 07 81         [24]  745 	lcall	_LCD_IRWrite
                                    746 ;	dino.c:172: LCD_write_char(' ');
      000269 75 82 20         [24]  747 	mov	dpl, #0x20
      00026C 12 07 CD         [24]  748 	lcall	_LCD_write_char
                                    749 ;	dino.c:173: LCD_write_char(' ');
      00026F 75 82 20         [24]  750 	mov	dpl, #0x20
      000272 12 07 CD         [24]  751 	lcall	_LCD_write_char
                                    752 ;	dino.c:174: LCD_write_char(' ');
      000275 75 82 20         [24]  753 	mov	dpl, #0x20
      000278 12 07 CD         [24]  754 	lcall	_LCD_write_char
                                    755 ;	dino.c:175: LCD_write_char('G');
      00027B 75 82 47         [24]  756 	mov	dpl, #0x47
      00027E 12 07 CD         [24]  757 	lcall	_LCD_write_char
                                    758 ;	dino.c:176: LCD_write_char('A');
      000281 75 82 41         [24]  759 	mov	dpl, #0x41
      000284 12 07 CD         [24]  760 	lcall	_LCD_write_char
                                    761 ;	dino.c:177: LCD_write_char('M');
      000287 75 82 4D         [24]  762 	mov	dpl, #0x4d
      00028A 12 07 CD         [24]  763 	lcall	_LCD_write_char
                                    764 ;	dino.c:178: LCD_write_char('E');
      00028D 75 82 45         [24]  765 	mov	dpl, #0x45
      000290 12 07 CD         [24]  766 	lcall	_LCD_write_char
                                    767 ;	dino.c:179: LCD_write_char(' ');
      000293 75 82 20         [24]  768 	mov	dpl, #0x20
      000296 12 07 CD         [24]  769 	lcall	_LCD_write_char
                                    770 ;	dino.c:180: LCD_write_char('O');
      000299 75 82 4F         [24]  771 	mov	dpl, #0x4f
      00029C 12 07 CD         [24]  772 	lcall	_LCD_write_char
                                    773 ;	dino.c:181: LCD_write_char('V');
      00029F 75 82 56         [24]  774 	mov	dpl, #0x56
      0002A2 12 07 CD         [24]  775 	lcall	_LCD_write_char
                                    776 ;	dino.c:182: LCD_write_char('E');
      0002A5 75 82 45         [24]  777 	mov	dpl, #0x45
      0002A8 12 07 CD         [24]  778 	lcall	_LCD_write_char
                                    779 ;	dino.c:183: LCD_write_char('R');
      0002AB 75 82 52         [24]  780 	mov	dpl, #0x52
      0002AE 12 07 CD         [24]  781 	lcall	_LCD_write_char
                                    782 ;	dino.c:184: LCD_write_char(' ');
      0002B1 75 82 20         [24]  783 	mov	dpl, #0x20
      0002B4 12 07 CD         [24]  784 	lcall	_LCD_write_char
                                    785 ;	dino.c:185: LCD_write_char(' ');
      0002B7 75 82 20         [24]  786 	mov	dpl, #0x20
      0002BA 12 07 CD         [24]  787 	lcall	_LCD_write_char
                                    788 ;	dino.c:187: LCD_cursorGoTo(1, 0);
      0002BD 75 82 C0         [24]  789 	mov	dpl, #0xc0
      0002C0 12 07 81         [24]  790 	lcall	_LCD_IRWrite
                                    791 ;	dino.c:188: LCD_write_char(' ');
      0002C3 75 82 20         [24]  792 	mov	dpl, #0x20
      0002C6 12 07 CD         [24]  793 	lcall	_LCD_write_char
                                    794 ;	dino.c:189: LCD_write_char(' ');
      0002C9 75 82 20         [24]  795 	mov	dpl, #0x20
      0002CC 12 07 CD         [24]  796 	lcall	_LCD_write_char
                                    797 ;	dino.c:190: LCD_write_char(' ');
      0002CF 75 82 20         [24]  798 	mov	dpl, #0x20
      0002D2 12 07 CD         [24]  799 	lcall	_LCD_write_char
                                    800 ;	dino.c:191: LCD_write_char('S');
      0002D5 75 82 53         [24]  801 	mov	dpl, #0x53
      0002D8 12 07 CD         [24]  802 	lcall	_LCD_write_char
                                    803 ;	dino.c:192: LCD_write_char('C');
      0002DB 75 82 43         [24]  804 	mov	dpl, #0x43
      0002DE 12 07 CD         [24]  805 	lcall	_LCD_write_char
                                    806 ;	dino.c:193: LCD_write_char('O');
      0002E1 75 82 4F         [24]  807 	mov	dpl, #0x4f
      0002E4 12 07 CD         [24]  808 	lcall	_LCD_write_char
                                    809 ;	dino.c:194: LCD_write_char('R');
      0002E7 75 82 52         [24]  810 	mov	dpl, #0x52
      0002EA 12 07 CD         [24]  811 	lcall	_LCD_write_char
                                    812 ;	dino.c:195: LCD_write_char('E');
      0002ED 75 82 45         [24]  813 	mov	dpl, #0x45
      0002F0 12 07 CD         [24]  814 	lcall	_LCD_write_char
                                    815 ;	dino.c:196: LCD_write_char(':');
      0002F3 75 82 3A         [24]  816 	mov	dpl, #0x3a
      0002F6 12 07 CD         [24]  817 	lcall	_LCD_write_char
                                    818 ;	dino.c:197: LCD_write_char(' ');
      0002F9 75 82 20         [24]  819 	mov	dpl, #0x20
      0002FC 12 07 CD         [24]  820 	lcall	_LCD_write_char
                                    821 ;	dino.c:199: LCD_write_char('0' + (points / 10));
      0002FF AF 36            [24]  822 	mov	r7,_points
      000301 75 F0 0A         [24]  823 	mov	b,#0x0a
      000304 EF               [12]  824 	mov	a,r7
      000305 84               [48]  825 	div	ab
      000306 24 30            [12]  826 	add	a,#0x30
      000308 F5 82            [12]  827 	mov	dpl,a
      00030A 12 07 CD         [24]  828 	lcall	_LCD_write_char
                                    829 ;	dino.c:200: LCD_write_char('0' + (points % 10));
      00030D AF 36            [24]  830 	mov	r7,_points
      00030F 75 F0 0A         [24]  831 	mov	b,#0x0a
      000312 EF               [12]  832 	mov	a,r7
      000313 84               [48]  833 	div	ab
      000314 AF F0            [24]  834 	mov	r7,b
      000316 74 30            [12]  835 	mov	a,#0x30
      000318 2F               [12]  836 	add	a, r7
      000319 F5 82            [12]  837 	mov	dpl,a
      00031B 12 07 CD         [24]  838 	lcall	_LCD_write_char
                                    839 ;	dino.c:201: LCD_write_char(' ');
      00031E 75 82 20         [24]  840 	mov	dpl, #0x20
      000321 12 07 CD         [24]  841 	lcall	_LCD_write_char
                                    842 ;	dino.c:202: LCD_write_char(' ');
      000324 75 82 20         [24]  843 	mov	dpl, #0x20
      000327 12 07 CD         [24]  844 	lcall	_LCD_write_char
                                    845 ;	dino.c:203: LCD_write_char('#');
      00032A 75 82 23         [24]  846 	mov	dpl, #0x23
      00032D 12 07 CD         [24]  847 	lcall	_LCD_write_char
                                    848 ;	dino.c:204: LCD_write_char('=');
      000330 75 82 3D         [24]  849 	mov	dpl, #0x3d
      000333 12 07 CD         [24]  850 	lcall	_LCD_write_char
                                    851 ;	dino.c:205: LCD_write_char('R');
      000336 75 82 52         [24]  852 	mov	dpl, #0x52
      000339 12 07 CD         [24]  853 	lcall	_LCD_write_char
      00033C                        854 00126$:
                                    855 ;	dino.c:208: ThreadYield();
      00033C 12 06 44         [24]  856 	lcall	_ThreadYield
                                    857 ;	dino.c:210: }
      00033F 02 00 B6         [24]  858 	ljmp	00128$
                                    859 ;------------------------------------------------------------
                                    860 ;Allocation info for local variables in function 'game_control'
                                    861 ;------------------------------------------------------------
                                    862 ;	dino.c:212: void game_control(void) 
                                    863 ;	-----------------------------------------
                                    864 ;	 function game_control
                                    865 ;	-----------------------------------------
      000342                        866 _game_control:
                                    867 ;	dino.c:214: while(1)
      000342                        868 00200$:
                                    869 ;	dino.c:216: if (screen_mode == 0)
      000342 E5 37            [12]  870 	mov	a,_screen_mode
      000344 70 4A            [24]  871 	jnz	00197$
                                    872 ;	dino.c:218: level = (char)-1;
      000346 75 35 FF         [24]  873 	mov	_level,#0xff
                                    874 ;	dino.c:219: while(1)
      000349                        875 00122$:
                                    876 ;	dino.c:221: if (key_ready == 1)
      000349 74 01            [12]  877 	mov	a,#0x01
      00034B B5 31 30         [24]  878 	cjne	a,_key_ready,00120$
                                    879 ;	dino.c:223: SemaphoreWait(key_lock);
      00034E                        880 00101$:
      00034E E5 30            [12]  881 	mov	a,_key_lock
      000350 60 FC            [24]  882 	jz	00101$
                                    883 ;	assignBit
      000352 C2 AF            [12]  884 	clr	_EA
      000354 E5 30            [12]  885 	mov	a,_key_lock
      000356 60 09            [24]  886 	jz	00105$
      000358 E5 30            [12]  887 	mov	a,_key_lock
      00035A 14               [12]  888 	dec	a
      00035B F5 30            [12]  889 	mov	_key_lock,a
                                    890 ;	assignBit
      00035D D2 AF            [12]  891 	setb	_EA
      00035F 80 04            [24]  892 	sjmp	00110$
      000361                        893 00105$:
                                    894 ;	assignBit
      000361 D2 AF            [12]  895 	setb	_EA
      000363 80 E9            [24]  896 	sjmp	00101$
      000365                        897 00110$:
                                    898 ;	dino.c:224: read_key = pressed_key;
      000365 85 32 33         [24]  899 	mov	_read_key,_pressed_key
                                    900 ;	dino.c:225: key_ready = 0;
      000368 75 31 00         [24]  901 	mov	_key_ready,#0x00
                                    902 ;	dino.c:226: SemaphoreSignal(key_lock);
      00036B 05 30            [12]  903 	INC _key_lock 
                                    904 ;	dino.c:228: if ((read_key == '#') && (level >= 0) && (level <= 9)) {break;}
      00036D 74 23            [12]  905 	mov	a,#0x23
      00036F B5 33 06         [24]  906 	cjne	a,_read_key,00116$
      000372 E5 35            [12]  907 	mov	a,_level
      000374 24 F6            [12]  908 	add	a,#0xff - 0x09
      000376 50 0B            [24]  909 	jnc	00123$
      000378                        910 00116$:
                                    911 ;	dino.c:230: level = read_key - '0';
      000378 E5 33            [12]  912 	mov	a,_read_key
      00037A 24 D0            [12]  913 	add	a,#0xd0
      00037C F5 35            [12]  914 	mov	_level,a
      00037E                        915 00120$:
                                    916 ;	dino.c:233: ThreadYield();
      00037E 12 06 44         [24]  917 	lcall	_ThreadYield
      000381 80 C6            [24]  918 	sjmp	00122$
      000383                        919 00123$:
                                    920 ;	dino.c:236: wait_time = (10 - level);
      000383 AF 35            [24]  921 	mov	r7,_level
      000385 74 0A            [12]  922 	mov	a,#0x0a
      000387 C3               [12]  923 	clr	c
      000388 9F               [12]  924 	subb	a,r7
      000389 F5 38            [12]  925 	mov	_wait_time,a
                                    926 ;	dino.c:237: screen_mode = 1;
      00038B 75 37 01         [24]  927 	mov	_screen_mode,#0x01
                                    928 ;	dino.c:238: continue;
      00038E 80 B2            [24]  929 	sjmp	00200$
      000390                        930 00197$:
                                    931 ;	dino.c:240: else if (screen_mode == 1)
      000390 74 01            [12]  932 	mov	a,#0x01
      000392 B5 37 02         [24]  933 	cjne	a,_screen_mode,00380$
      000395 80 03            [24]  934 	sjmp	00381$
      000397                        935 00380$:
      000397 02 04 66         [24]  936 	ljmp	00194$
      00039A                        937 00381$:
                                    938 ;	dino.c:242: dino_row = 0;
      00039A 75 34 00         [24]  939 	mov	_dino_row,#0x00
                                    940 ;	dino.c:243: points = 0;
      00039D 75 36 00         [24]  941 	mov	_points,#0x00
                                    942 ;	dino.c:245: top_left = 0x12;
      0003A0 75 2C 12         [24]  943 	mov	_top_left,#0x12
                                    944 ;	dino.c:246: top_right = 0x48;
      0003A3 75 2D 48         [24]  945 	mov	_top_right,#0x48
                                    946 ;	dino.c:247: bottom_left = 0x24;
      0003A6 75 2E 24         [24]  947 	mov	_bottom_left,#0x24
                                    948 ;	dino.c:248: bottom_right = 0x81;
      0003A9 75 2F 81         [24]  949 	mov	_bottom_right,#0x81
                                    950 ;	dino.c:250: while(screen_mode == 1)
      0003AC                        951 00167$:
      0003AC 74 01            [12]  952 	mov	a,#0x01
      0003AE B5 37 91         [24]  953 	cjne	a,_screen_mode,00200$
                                    954 ;	dino.c:252: if(key_ready == 1)
      0003B1 74 01            [12]  955 	mov	a,#0x01
      0003B3 B5 31 31         [24]  956 	cjne	a,_key_ready,00144$
                                    957 ;	dino.c:254: SemaphoreWait(key_lock);
      0003B6                        958 00124$:
      0003B6 E5 30            [12]  959 	mov	a,_key_lock
      0003B8 60 FC            [24]  960 	jz	00124$
                                    961 ;	assignBit
      0003BA C2 AF            [12]  962 	clr	_EA
      0003BC E5 30            [12]  963 	mov	a,_key_lock
      0003BE 60 09            [24]  964 	jz	00128$
      0003C0 E5 30            [12]  965 	mov	a,_key_lock
      0003C2 14               [12]  966 	dec	a
      0003C3 F5 30            [12]  967 	mov	_key_lock,a
                                    968 ;	assignBit
      0003C5 D2 AF            [12]  969 	setb	_EA
      0003C7 80 04            [24]  970 	sjmp	00133$
      0003C9                        971 00128$:
                                    972 ;	assignBit
      0003C9 D2 AF            [12]  973 	setb	_EA
      0003CB 80 E9            [24]  974 	sjmp	00124$
      0003CD                        975 00133$:
                                    976 ;	dino.c:255: read_key = pressed_key;
      0003CD 85 32 33         [24]  977 	mov	_read_key,_pressed_key
                                    978 ;	dino.c:256: key_ready = 0;
      0003D0 75 31 00         [24]  979 	mov	_key_ready,#0x00
                                    980 ;	dino.c:257: SemaphoreSignal(key_lock);
      0003D3 05 30            [12]  981 	INC _key_lock 
                                    982 ;	dino.c:259: if(read_key == '2')
      0003D5 74 32            [12]  983 	mov	a,#0x32
      0003D7 B5 33 05         [24]  984 	cjne	a,_read_key,00141$
                                    985 ;	dino.c:261: dino_row = 0;
      0003DA 75 34 00         [24]  986 	mov	_dino_row,#0x00
      0003DD 80 08            [24]  987 	sjmp	00144$
      0003DF                        988 00141$:
                                    989 ;	dino.c:263: else if(read_key == '8')
      0003DF 74 38            [12]  990 	mov	a,#0x38
      0003E1 B5 33 03         [24]  991 	cjne	a,_read_key,00144$
                                    992 ;	dino.c:265: dino_row = 1;
      0003E4 75 34 01         [24]  993 	mov	_dino_row,#0x01
      0003E7                        994 00144$:
                                    995 ;	dino.c:269: if (wait_time == 0)
      0003E7 E5 38            [12]  996 	mov	a,_wait_time
      0003E9 70 56            [24]  997 	jnz	00160$
                                    998 ;	dino.c:271: wait_time = (10 - level);
      0003EB AF 35            [24]  999 	mov	r7,_level
      0003ED 74 0A            [12] 1000 	mov	a,#0x0a
      0003EF C3               [12] 1001 	clr	c
      0003F0 9F               [12] 1002 	subb	a,r7
      0003F1 F5 38            [12] 1003 	mov	_wait_time,a
                                   1004 ;	dino.c:272: SemaphoreWait(map_lock);
      0003F3                       1005 00145$:
      0003F3 E5 2B            [12] 1006 	mov	a,_map_lock
      0003F5 60 FC            [24] 1007 	jz	00145$
                                   1008 ;	assignBit
      0003F7 C2 AF            [12] 1009 	clr	_EA
      0003F9 E5 2B            [12] 1010 	mov	a,_map_lock
      0003FB 60 09            [24] 1011 	jz	00149$
      0003FD E5 2B            [12] 1012 	mov	a,_map_lock
      0003FF 14               [12] 1013 	dec	a
      000400 F5 2B            [12] 1014 	mov	_map_lock,a
                                   1015 ;	assignBit
      000402 D2 AF            [12] 1016 	setb	_EA
      000404 80 04            [24] 1017 	sjmp	00154$
      000406                       1018 00149$:
                                   1019 ;	assignBit
      000406 D2 AF            [12] 1020 	setb	_EA
      000408 80 E9            [24] 1021 	sjmp	00145$
      00040A                       1022 00154$:
                                   1023 ;	dino.c:304: __endasm;
      00040A C0 E0            [24] 1024 	PUSH	ACC
      00040C E5 2D            [12] 1025 	MOV	A, _top_right
      00040E C3               [12] 1026 	CLR	C
      00040F 33               [12] 1027 	RLC	A
      000410 F5 2D            [12] 1028 	MOV	_top_right, A
      000412 E5 2C            [12] 1029 	MOV	A, _top_left
      000414 33               [12] 1030 	RLC	A
      000415 F5 2C            [12] 1031 	MOV	_top_left, A
      000417 E5 2D            [12] 1032 	MOV	A, _top_right
      000419 34 00            [12] 1033 	ADDC	A, #0
      00041B F5 2D            [12] 1034 	MOV	_top_right, A
      00041D E5 2F            [12] 1035 	MOV	A, _bottom_right
      00041F C3               [12] 1036 	CLR	C
      000420 33               [12] 1037 	RLC	A
      000421 F5 2F            [12] 1038 	MOV	_bottom_right, A
      000423 E5 2E            [12] 1039 	MOV	A, _bottom_left
      000425 33               [12] 1040 	RLC	A
      000426 F5 2E            [12] 1041 	MOV	_bottom_left, A
      000428 E5 2F            [12] 1042 	MOV	A, _bottom_right
      00042A 34 00            [12] 1043 	ADDC	A, #0
      00042C F5 2F            [12] 1044 	MOV	_bottom_right, A
      00042E C3               [12] 1045 	CLR	C
      00042F E5 2C            [12] 1046 	MOV	A, _top_left
      000431 45 2E            [12] 1047 	ORL	A, _bottom_left
      000433 33               [12] 1048 	RLC	A
      000434 E4               [12] 1049 	CLR	A
      000435 34 00            [12] 1050 	ADDC	A, #0
      000437 25 36            [12] 1051 	ADD	A, _points
      000439 F5 36            [12] 1052 	MOV	_points, A
      00043B D0 E0            [24] 1053 	POP	ACC
                                   1054 ;	dino.c:305: SemaphoreSignal(map_lock);
      00043D 05 2B            [12] 1055 	INC _map_lock 
      00043F 80 02            [24] 1056 	sjmp	00161$
      000441                       1057 00160$:
                                   1058 ;	dino.c:309: --wait_time;
      000441 15 38            [12] 1059 	dec	_wait_time
      000443                       1060 00161$:
                                   1061 ;	dino.c:312: if (((dino_row == 0) && (top_left & 0x80)) || ((dino_row == 1) && (bottom_left & 0x80)))
      000443 E5 34            [12] 1062 	mov	a,_dino_row
      000445 70 06            [24] 1063 	jnz	00166$
      000447 E5 2C            [12] 1064 	mov	a,_top_left
      000449 FF               [12] 1065 	mov	r7,a
      00044A 20 E7 0B         [24] 1066 	jb	acc.7,00162$
      00044D                       1067 00166$:
      00044D 74 01            [12] 1068 	mov	a,#0x01
      00044F B5 34 0E         [24] 1069 	cjne	a,_dino_row,00163$
      000452 E5 2E            [12] 1070 	mov	a,_bottom_left
      000454 FF               [12] 1071 	mov	r7,a
      000455 30 E7 08         [24] 1072 	jnb	acc.7,00163$
      000458                       1073 00162$:
                                   1074 ;	dino.c:314: --points;
      000458 15 36            [12] 1075 	dec	_points
                                   1076 ;	dino.c:315: screen_mode = 2;
      00045A 75 37 02         [24] 1077 	mov	_screen_mode,#0x02
                                   1078 ;	dino.c:316: continue;
      00045D 02 03 AC         [24] 1079 	ljmp	00167$
      000460                       1080 00163$:
                                   1081 ;	dino.c:319: ThreadYield();
      000460 12 06 44         [24] 1082 	lcall	_ThreadYield
      000463 02 03 AC         [24] 1083 	ljmp	00167$
      000466                       1084 00194$:
                                   1085 ;	dino.c:322: else if (screen_mode == 2)
      000466 74 02            [12] 1086 	mov	a,#0x02
      000468 B5 37 02         [24] 1087 	cjne	a,_screen_mode,00400$
      00046B 80 03            [24] 1088 	sjmp	00401$
      00046D                       1089 00400$:
      00046D 02 03 42         [24] 1090 	ljmp	00200$
      000470                       1091 00401$:
                                   1092 ;	dino.c:324: key_ready = 0;
      000470 75 31 00         [24] 1093 	mov	_key_ready,#0x00
                                   1094 ;	dino.c:325: while(screen_mode == 2)
      000473                       1095 00188$:
      000473 74 02            [12] 1096 	mov	a,#0x02
      000475 B5 37 02         [24] 1097 	cjne	a,_screen_mode,00402$
      000478 80 03            [24] 1098 	sjmp	00403$
      00047A                       1099 00402$:
      00047A 02 03 42         [24] 1100 	ljmp	00200$
      00047D                       1101 00403$:
                                   1102 ;	dino.c:327: if(key_ready == 1)
      00047D 74 01            [12] 1103 	mov	a,#0x01
      00047F B5 31 27         [24] 1104 	cjne	a,_key_ready,00187$
                                   1105 ;	dino.c:329: SemaphoreWait(key_lock);
      000482                       1106 00170$:
      000482 E5 30            [12] 1107 	mov	a,_key_lock
      000484 60 FC            [24] 1108 	jz	00170$
                                   1109 ;	assignBit
      000486 C2 AF            [12] 1110 	clr	_EA
      000488 E5 30            [12] 1111 	mov	a,_key_lock
      00048A 60 09            [24] 1112 	jz	00174$
      00048C E5 30            [12] 1113 	mov	a,_key_lock
      00048E 14               [12] 1114 	dec	a
      00048F F5 30            [12] 1115 	mov	_key_lock,a
                                   1116 ;	assignBit
      000491 D2 AF            [12] 1117 	setb	_EA
      000493 80 04            [24] 1118 	sjmp	00179$
      000495                       1119 00174$:
                                   1120 ;	assignBit
      000495 D2 AF            [12] 1121 	setb	_EA
      000497 80 E9            [24] 1122 	sjmp	00170$
      000499                       1123 00179$:
                                   1124 ;	dino.c:330: read_key = pressed_key;
      000499 85 32 33         [24] 1125 	mov	_read_key,_pressed_key
                                   1126 ;	dino.c:331: key_ready = 0;
      00049C 75 31 00         [24] 1127 	mov	_key_ready,#0x00
                                   1128 ;	dino.c:332: SemaphoreSignal(key_lock);
      00049F 05 30            [12] 1129 	INC _key_lock 
                                   1130 ;	dino.c:334: if(read_key == '#')
      0004A1 74 23            [12] 1131 	mov	a,#0x23
      0004A3 B5 33 03         [24] 1132 	cjne	a,_read_key,00187$
                                   1133 ;	dino.c:336: screen_mode = 0;
      0004A6 75 37 00         [24] 1134 	mov	_screen_mode,#0x00
      0004A9                       1135 00187$:
                                   1136 ;	dino.c:340: ThreadYield();
      0004A9 12 06 44         [24] 1137 	lcall	_ThreadYield
                                   1138 ;	dino.c:342: continue;
                                   1139 ;	dino.c:345: }
      0004AC 80 C5            [24] 1140 	sjmp	00188$
                                   1141 ;------------------------------------------------------------
                                   1142 ;Allocation info for local variables in function 'main'
                                   1143 ;------------------------------------------------------------
                                   1144 ;	dino.c:347: void main(void)
                                   1145 ;	-----------------------------------------
                                   1146 ;	 function main
                                   1147 ;	-----------------------------------------
      0004AE                       1148 _main:
                                   1149 ;	dino.c:349: SemaphoreCreate(map_lock, 1);
      0004AE 75 2B 01         [24] 1150 	mov	_map_lock,#0x01
                                   1151 ;	dino.c:350: SemaphoreCreate(key_lock, 1);
      0004B1 75 30 01         [24] 1152 	mov	_key_lock,#0x01
                                   1153 ;	dino.c:351: move_way = 1;
      0004B4 75 28 01         [24] 1154 	mov	_move_way,#0x01
                                   1155 ;	dino.c:352: Init_Keypad();
      0004B7 12 08 30         [24] 1156 	lcall	_Init_Keypad
                                   1157 ;	dino.c:353: LCD_Init();
      0004BA 12 07 6E         [24] 1158 	lcall	_LCD_Init
                                   1159 ;	dino.c:354: LCD_set_symbol('\10', dinosaur);
      0004BD 75 82 48         [24] 1160 	mov	dpl, #0x48
      0004C0 12 07 81         [24] 1161 	lcall	_LCD_IRWrite
      0004C3 90 08 DA         [24] 1162 	mov	dptr,#_dinosaur
      0004C6 E4               [12] 1163 	clr	a
      0004C7 93               [24] 1164 	movc	a,@a+dptr
      0004C8 F5 82            [12] 1165 	mov	dpl,a
      0004CA 12 07 CD         [24] 1166 	lcall	_LCD_write_char
      0004CD 90 08 DB         [24] 1167 	mov	dptr,#(_dinosaur + 0x0001)
      0004D0 E4               [12] 1168 	clr	a
      0004D1 93               [24] 1169 	movc	a,@a+dptr
      0004D2 F5 82            [12] 1170 	mov	dpl,a
      0004D4 12 07 CD         [24] 1171 	lcall	_LCD_write_char
      0004D7 90 08 DC         [24] 1172 	mov	dptr,#(_dinosaur + 0x0002)
      0004DA E4               [12] 1173 	clr	a
      0004DB 93               [24] 1174 	movc	a,@a+dptr
      0004DC F5 82            [12] 1175 	mov	dpl,a
      0004DE 12 07 CD         [24] 1176 	lcall	_LCD_write_char
      0004E1 90 08 DD         [24] 1177 	mov	dptr,#(_dinosaur + 0x0003)
      0004E4 E4               [12] 1178 	clr	a
      0004E5 93               [24] 1179 	movc	a,@a+dptr
      0004E6 F5 82            [12] 1180 	mov	dpl,a
      0004E8 12 07 CD         [24] 1181 	lcall	_LCD_write_char
      0004EB 90 08 DE         [24] 1182 	mov	dptr,#(_dinosaur + 0x0004)
      0004EE E4               [12] 1183 	clr	a
      0004EF 93               [24] 1184 	movc	a,@a+dptr
      0004F0 F5 82            [12] 1185 	mov	dpl,a
      0004F2 12 07 CD         [24] 1186 	lcall	_LCD_write_char
      0004F5 90 08 DF         [24] 1187 	mov	dptr,#(_dinosaur + 0x0005)
      0004F8 E4               [12] 1188 	clr	a
      0004F9 93               [24] 1189 	movc	a,@a+dptr
      0004FA F5 82            [12] 1190 	mov	dpl,a
      0004FC 12 07 CD         [24] 1191 	lcall	_LCD_write_char
      0004FF 90 08 E0         [24] 1192 	mov	dptr,#(_dinosaur + 0x0006)
      000502 E4               [12] 1193 	clr	a
      000503 93               [24] 1194 	movc	a,@a+dptr
      000504 F5 82            [12] 1195 	mov	dpl,a
      000506 12 07 CD         [24] 1196 	lcall	_LCD_write_char
      000509 90 08 E1         [24] 1197 	mov	dptr,#(_dinosaur + 0x0007)
      00050C E4               [12] 1198 	clr	a
      00050D 93               [24] 1199 	movc	a,@a+dptr
      00050E F5 82            [12] 1200 	mov	dpl,a
      000510 12 07 CD         [24] 1201 	lcall	_LCD_write_char
                                   1202 ;	dino.c:355: LCD_set_symbol('\20', cactus);
      000513 75 82 50         [24] 1203 	mov	dpl, #0x50
      000516 12 07 81         [24] 1204 	lcall	_LCD_IRWrite
      000519 90 08 E2         [24] 1205 	mov	dptr,#_cactus
      00051C E4               [12] 1206 	clr	a
      00051D 93               [24] 1207 	movc	a,@a+dptr
      00051E F5 82            [12] 1208 	mov	dpl,a
      000520 12 07 CD         [24] 1209 	lcall	_LCD_write_char
      000523 90 08 E3         [24] 1210 	mov	dptr,#(_cactus + 0x0001)
      000526 E4               [12] 1211 	clr	a
      000527 93               [24] 1212 	movc	a,@a+dptr
      000528 F5 82            [12] 1213 	mov	dpl,a
      00052A 12 07 CD         [24] 1214 	lcall	_LCD_write_char
      00052D 90 08 E4         [24] 1215 	mov	dptr,#(_cactus + 0x0002)
      000530 E4               [12] 1216 	clr	a
      000531 93               [24] 1217 	movc	a,@a+dptr
      000532 F5 82            [12] 1218 	mov	dpl,a
      000534 12 07 CD         [24] 1219 	lcall	_LCD_write_char
      000537 90 08 E5         [24] 1220 	mov	dptr,#(_cactus + 0x0003)
      00053A E4               [12] 1221 	clr	a
      00053B 93               [24] 1222 	movc	a,@a+dptr
      00053C F5 82            [12] 1223 	mov	dpl,a
      00053E 12 07 CD         [24] 1224 	lcall	_LCD_write_char
      000541 90 08 E6         [24] 1225 	mov	dptr,#(_cactus + 0x0004)
      000544 E4               [12] 1226 	clr	a
      000545 93               [24] 1227 	movc	a,@a+dptr
      000546 F5 82            [12] 1228 	mov	dpl,a
      000548 12 07 CD         [24] 1229 	lcall	_LCD_write_char
      00054B 90 08 E7         [24] 1230 	mov	dptr,#(_cactus + 0x0005)
      00054E E4               [12] 1231 	clr	a
      00054F 93               [24] 1232 	movc	a,@a+dptr
      000550 F5 82            [12] 1233 	mov	dpl,a
      000552 12 07 CD         [24] 1234 	lcall	_LCD_write_char
      000555 90 08 E8         [24] 1235 	mov	dptr,#(_cactus + 0x0006)
      000558 E4               [12] 1236 	clr	a
      000559 93               [24] 1237 	movc	a,@a+dptr
      00055A F5 82            [12] 1238 	mov	dpl,a
      00055C 12 07 CD         [24] 1239 	lcall	_LCD_write_char
      00055F 90 08 E9         [24] 1240 	mov	dptr,#(_cactus + 0x0007)
      000562 E4               [12] 1241 	clr	a
      000563 93               [24] 1242 	movc	a,@a+dptr
      000564 F5 82            [12] 1243 	mov	dpl,a
      000566 12 07 CD         [24] 1244 	lcall	_LCD_write_char
                                   1245 ;	dino.c:356: ThreadCreate(keypad_control);
      000569 90 00 81         [24] 1246 	mov	dptr,#_keypad_control
      00056C 12 05 B6         [24] 1247 	lcall	_ThreadCreate
                                   1248 ;	dino.c:357: ThreadCreate(render_task);
      00056F 90 00 B6         [24] 1249 	mov	dptr,#_render_task
      000572 12 05 B6         [24] 1250 	lcall	_ThreadCreate
                                   1251 ;	dino.c:358: game_control();
                                   1252 ;	dino.c:359: }
      000575 02 03 42         [24] 1253 	ljmp	_game_control
                                   1254 ;------------------------------------------------------------
                                   1255 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                   1256 ;------------------------------------------------------------
                                   1257 ;	dino.c:361: void _sdcc_gsinit_startup(void) 
                                   1258 ;	-----------------------------------------
                                   1259 ;	 function _sdcc_gsinit_startup
                                   1260 ;	-----------------------------------------
      000578                       1261 __sdcc_gsinit_startup:
                                   1262 ;	dino.c:365: __endasm;
      000578 02 05 85         [24] 1263 	ljmp	_Bootstrap
                                   1264 ;	dino.c:366: }
      00057B 22               [24] 1265 	ret
                                   1266 ;------------------------------------------------------------
                                   1267 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                   1268 ;------------------------------------------------------------
                                   1269 ;	dino.c:368: void _mcs51_genRAMCLEAR(void) {}
                                   1270 ;	-----------------------------------------
                                   1271 ;	 function _mcs51_genRAMCLEAR
                                   1272 ;	-----------------------------------------
      00057C                       1273 __mcs51_genRAMCLEAR:
      00057C 22               [24] 1274 	ret
                                   1275 ;------------------------------------------------------------
                                   1276 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                   1277 ;------------------------------------------------------------
                                   1278 ;	dino.c:369: void _mcs51_genXINIT(void) {}
                                   1279 ;	-----------------------------------------
                                   1280 ;	 function _mcs51_genXINIT
                                   1281 ;	-----------------------------------------
      00057D                       1282 __mcs51_genXINIT:
      00057D 22               [24] 1283 	ret
                                   1284 ;------------------------------------------------------------
                                   1285 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                   1286 ;------------------------------------------------------------
                                   1287 ;	dino.c:370: void _mcs51_genXRAMCLEAR(void) {}
                                   1288 ;	-----------------------------------------
                                   1289 ;	 function _mcs51_genXRAMCLEAR
                                   1290 ;	-----------------------------------------
      00057E                       1291 __mcs51_genXRAMCLEAR:
      00057E 22               [24] 1292 	ret
                                   1293 ;------------------------------------------------------------
                                   1294 ;Allocation info for local variables in function 'timer0_ISR'
                                   1295 ;------------------------------------------------------------
                                   1296 ;	dino.c:371: void timer0_ISR(void) __interrupt(1)
                                   1297 ;	-----------------------------------------
                                   1298 ;	 function timer0_ISR
                                   1299 ;	-----------------------------------------
      00057F                       1300 _timer0_ISR:
                                   1301 ;	dino.c:375: __endasm;
      00057F 02 07 10         [24] 1302 	ljmp	_myTimer0Handler
                                   1303 ;	dino.c:376: }
      000582 02 00 54         [24] 1304 	ljmp	sdcc_atomic_maybe_rollback
                                   1305 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                   1306 ;	eliminated unneeded push/pop not_psw
                                   1307 ;	eliminated unneeded push/pop dpl
                                   1308 ;	eliminated unneeded push/pop dph
                                   1309 ;	eliminated unneeded push/pop b
                                   1310 ;	eliminated unneeded push/pop acc
                                   1311 	.area CSEG    (CODE)
                                   1312 	.area CONST   (CODE)
                                   1313 	.area CONST   (CODE)
      0008DA                       1314 _dinosaur:
      0008DA 07                    1315 	.db #0x07	; 7
      0008DB 05                    1316 	.db #0x05	; 5
      0008DC 06                    1317 	.db #0x06	; 6
      0008DD 07                    1318 	.db #0x07	; 7
      0008DE 14                    1319 	.db #0x14	; 20
      0008DF 17                    1320 	.db #0x17	; 23
      0008E0 0E                    1321 	.db #0x0e	; 14
      0008E1 0A                    1322 	.db #0x0a	; 10
                                   1323 	.area CSEG    (CODE)
                                   1324 	.area CONST   (CODE)
      0008E2                       1325 _cactus:
      0008E2 04                    1326 	.db #0x04	; 4
      0008E3 05                    1327 	.db #0x05	; 5
      0008E4 15                    1328 	.db #0x15	; 21
      0008E5 15                    1329 	.db #0x15	; 21
      0008E6 16                    1330 	.db #0x16	; 22
      0008E7 0C                    1331 	.db #0x0c	; 12
      0008E8 04                    1332 	.db #0x04	; 4
      0008E9 04                    1333 	.db #0x04	; 4
                                   1334 	.area CSEG    (CODE)
                                   1335 	.area XINIT   (CODE)
                                   1336 	.area CABS    (ABS,CODE)
