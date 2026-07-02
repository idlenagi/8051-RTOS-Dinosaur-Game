;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module dino
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cactus
	.globl _dinosaur
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _game_control
	.globl _render_task
	.globl _keypad_control
	.globl _ThreadYield
	.globl _ThreadCreate
	.globl _LCD_write_char
	.globl _LCD_IRWrite
	.globl _LCD_Init
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
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
	.globl _wait_time
	.globl _screen_mode
	.globl _points
	.globl _level
	.globl _dino_row
	.globl _read_key
	.globl _pressed_key
	.globl _key_ready
	.globl _key_lock
	.globl _draw_step
	.globl _bottom_right
	.globl _bottom_left
	.globl _top_right
	.globl _top_left
	.globl _map_lock
	.globl _map_piece
	.globl _screen_is_ready
	.globl _move_way
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
_move_way	=	0x0028
_screen_is_ready	=	0x0029
_map_piece	=	0x002a
_map_lock	=	0x002b
_top_left	=	0x002c
_top_right	=	0x002d
_bottom_left	=	0x002e
_bottom_right	=	0x002f
_draw_step	=	0x003f
_key_lock	=	0x0030
_key_ready	=	0x0031
_pressed_key	=	0x0032
_read_key	=	0x0033
_dino_row	=	0x0034
_level	=	0x0035
_points	=	0x0036
_screen_mode	=	0x0037
_wait_time	=	0x0038
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
; restartable atomic support routines
	.ds	2
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'keypad_control'
;------------------------------------------------------------
;	dino.c:29: void keypad_control(void)
;	-----------------------------------------
;	 function keypad_control
;	-----------------------------------------
_keypad_control:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	dino.c:33: while(!AnyKeyPressed());
00101$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jz	00101$
;	dino.c:34: SemaphoreWait(key_lock);
00104$:
	mov	a,_key_lock
	jz	00104$
;	assignBit
	clr	_EA
	mov	a,_key_lock
	jz	00108$
	mov	a,_key_lock
	dec	a
	mov	_key_lock,a
;	assignBit
	setb	_EA
	sjmp	00113$
00108$:
;	assignBit
	setb	_EA
	sjmp	00104$
00113$:
;	dino.c:36: pressed_key = KeyToChar();
	lcall	_KeyToChar
	mov	_pressed_key,dpl
;	dino.c:37: SemaphoreSignal(key_lock);
	INC _key_lock 
;	dino.c:39: while(AnyKeyPressed());
00118$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jnz	00118$
;	dino.c:41: key_ready = 1;
	mov	_key_ready,#0x01
;	dino.c:42: ThreadYield();
	lcall	_ThreadYield
;	dino.c:44: }
	sjmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'render_task'
;------------------------------------------------------------
;	dino.c:46: void render_task(void)
;	-----------------------------------------
;	 function render_task
;	-----------------------------------------
_render_task:
;	dino.c:48: while(1)
00128$:
;	dino.c:50: if (screen_mode == 0)
	mov	a,_screen_mode
	jz	00234$
	ljmp	00125$
00234$:
;	dino.c:52: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:53: LCD_write_char('8');
	mov	dpl, #0x38
	lcall	_LCD_write_char
;	dino.c:54: LCD_write_char('0');
	mov	dpl, #0x30
	lcall	_LCD_write_char
;	dino.c:55: LCD_write_char('5');
	mov	dpl, #0x35
	lcall	_LCD_write_char
;	dino.c:56: LCD_write_char('1');
	mov	dpl, #0x31
	lcall	_LCD_write_char
;	dino.c:57: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:58: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:59: LCD_write_char('U');
	mov	dpl, #0x55
	lcall	_LCD_write_char
;	dino.c:60: LCD_write_char('N');
	mov	dpl, #0x4e
	lcall	_LCD_write_char
;	dino.c:61: LCD_write_char('N');
	mov	dpl, #0x4e
	lcall	_LCD_write_char
;	dino.c:62: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:63: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:64: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:65: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:66: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:67: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:69: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:70: LCD_write_char('0');
	mov	dpl, #0x30
	lcall	_LCD_write_char
;	dino.c:71: LCD_write_char('-');
	mov	dpl, #0x2d
	lcall	_LCD_write_char
;	dino.c:72: LCD_write_char('9');
	mov	dpl, #0x39
	lcall	_LCD_write_char
;	dino.c:73: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:74: LCD_write_char('T');
	mov	dpl, #0x54
	lcall	_LCD_write_char
;	dino.c:75: LCD_write_char('H');
	mov	dpl, #0x48
	lcall	_LCD_write_char
;	dino.c:76: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:77: LCD_write_char('N');
	mov	dpl, #0x4e
	lcall	_LCD_write_char
;	dino.c:78: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:79: LCD_write_char('#');
	mov	dpl, #0x23
	lcall	_LCD_write_char
;	dino.c:80: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:81: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:82: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:83: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:84: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
	ljmp	00126$
00125$:
;	dino.c:86: else if (screen_mode == 1)
	mov	a,#0x01
	cjne	a,_screen_mode,00235$
	sjmp	00236$
00235$:
	ljmp	00122$
00236$:
;	dino.c:88: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:89: SemaphoreWait(map_lock);
00101$:
	mov	a,_map_lock
	jz	00101$
;	assignBit
	clr	_EA
	mov	a,_map_lock
	jz	00105$
	mov	a,_map_lock
	dec	a
	mov	_map_lock,a
;	assignBit
	setb	_EA
	sjmp	00110$
00105$:
;	assignBit
	setb	_EA
	sjmp	00101$
00110$:
;	dino.c:90: map_piece = top_left;
	mov	_map_piece,_top_left
;	dino.c:91: for(draw_step = 0; draw_step < 8; ++draw_step)
	mov	_draw_step,#0x00
00131$:
	mov	a,#0x100 - 0x08
	add	a,_draw_step
	jc	00112$
;	dino.c:106: __endasm;
	PUSH	ACC
	MOV	A, _map_piece
	ANL	A, #0x80
	RLC	A
	ADDC	A, #0
	RL	A
	MOV	DPL, A
	LCALL	_LCD_write_char
	MOV	A, _map_piece
	RL	A
	MOV	_map_piece, A
	POP	ACC
;	dino.c:91: for(draw_step = 0; draw_step < 8; ++draw_step)
	inc	_draw_step
	sjmp	00131$
00112$:
;	dino.c:108: map_piece = top_right;
	mov	_map_piece,_top_right
00134$:
;	dino.c:109: for(; draw_step < 15; ++draw_step)
	mov	a,#0x100 - 0x0f
	add	a,_draw_step
	jc	00113$
;	dino.c:124: __endasm;
	PUSH	ACC
	MOV	A, _map_piece
	ANL	A, #0x80
	RLC	A
	ADDC	A, #0
	RL	A
	MOV	DPL, A
	LCALL	_LCD_write_char
	MOV	A, _map_piece
	RL	A
	MOV	_map_piece, A
	POP	ACC
;	dino.c:109: for(; draw_step < 15; ++draw_step)
	inc	_draw_step
	sjmp	00134$
00113$:
;	dino.c:126: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:127: map_piece = bottom_left;
	mov	_map_piece,_bottom_left
;	dino.c:128: for(draw_step = 0; draw_step < 8; ++draw_step)
	mov	_draw_step,#0x00
00137$:
	mov	a,#0x100 - 0x08
	add	a,_draw_step
	jc	00114$
;	dino.c:143: __endasm;
	PUSH	ACC
	MOV	A, _map_piece
	ANL	A, #0x80
	RLC	A
	ADDC	A, #0
	RL	A
	MOV	DPL, A
	LCALL	_LCD_write_char
	MOV	A, _map_piece
	RL	A
	MOV	_map_piece, A
	POP	ACC
;	dino.c:128: for(draw_step = 0; draw_step < 8; ++draw_step)
	inc	_draw_step
	sjmp	00137$
00114$:
;	dino.c:145: map_piece = bottom_right;
	mov	_map_piece,_bottom_right
00140$:
;	dino.c:146: for(; draw_step < 15; ++draw_step)
	mov	a,#0x100 - 0x0f
	add	a,_draw_step
	jc	00116$
;	dino.c:161: __endasm;
	PUSH	ACC
	MOV	A, _map_piece
	ANL	A, #0x80
	RLC	A
	ADDC	A, #0
	RL	A
	MOV	DPL, A
	LCALL	_LCD_write_char
	MOV	A, _map_piece
	RL	A
	MOV	_map_piece, A
	POP	ACC
;	dino.c:146: for(; draw_step < 15; ++draw_step)
	inc	_draw_step
;	dino.c:163: SemaphoreSignal(map_lock);
	sjmp	00140$
00116$:
	INC _map_lock 
;	dino.c:166: LCD_cursorGoTo(dino_row, 0);
	mov	a,_dino_row
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:167: LCD_write_char('\1');
	mov	dpl, #0x01
	lcall	_LCD_write_char
	ljmp	00126$
00122$:
;	dino.c:169: else if (screen_mode == 2)
	mov	a,#0x02
	cjne	a,_screen_mode,00243$
	sjmp	00244$
00243$:
	ljmp	00126$
00244$:
;	dino.c:171: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:172: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:173: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:174: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:175: LCD_write_char('G');
	mov	dpl, #0x47
	lcall	_LCD_write_char
;	dino.c:176: LCD_write_char('A');
	mov	dpl, #0x41
	lcall	_LCD_write_char
;	dino.c:177: LCD_write_char('M');
	mov	dpl, #0x4d
	lcall	_LCD_write_char
;	dino.c:178: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:179: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:180: LCD_write_char('O');
	mov	dpl, #0x4f
	lcall	_LCD_write_char
;	dino.c:181: LCD_write_char('V');
	mov	dpl, #0x56
	lcall	_LCD_write_char
;	dino.c:182: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:183: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:184: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:185: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:187: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:188: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:189: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:190: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:191: LCD_write_char('S');
	mov	dpl, #0x53
	lcall	_LCD_write_char
;	dino.c:192: LCD_write_char('C');
	mov	dpl, #0x43
	lcall	_LCD_write_char
;	dino.c:193: LCD_write_char('O');
	mov	dpl, #0x4f
	lcall	_LCD_write_char
;	dino.c:194: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:195: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:196: LCD_write_char(':');
	mov	dpl, #0x3a
	lcall	_LCD_write_char
;	dino.c:197: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:199: LCD_write_char('0' + (points / 10));
	mov	r7,_points
	mov	b,#0x0a
	mov	a,r7
	div	ab
	add	a,#0x30
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:200: LCD_write_char('0' + (points % 10));
	mov	r7,_points
	mov	b,#0x0a
	mov	a,r7
	div	ab
	mov	r7,b
	mov	a,#0x30
	add	a, r7
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:201: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:202: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:203: LCD_write_char('#');
	mov	dpl, #0x23
	lcall	_LCD_write_char
;	dino.c:204: LCD_write_char('=');
	mov	dpl, #0x3d
	lcall	_LCD_write_char
;	dino.c:205: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
00126$:
;	dino.c:208: ThreadYield();
	lcall	_ThreadYield
;	dino.c:210: }
	ljmp	00128$
;------------------------------------------------------------
;Allocation info for local variables in function 'game_control'
;------------------------------------------------------------
;	dino.c:212: void game_control(void) 
;	-----------------------------------------
;	 function game_control
;	-----------------------------------------
_game_control:
;	dino.c:214: while(1)
00200$:
;	dino.c:216: if (screen_mode == 0)
	mov	a,_screen_mode
	jnz	00197$
;	dino.c:218: level = (char)-1;
	mov	_level,#0xff
;	dino.c:219: while(1)
00122$:
;	dino.c:221: if (key_ready == 1)
	mov	a,#0x01
	cjne	a,_key_ready,00120$
;	dino.c:223: SemaphoreWait(key_lock);
00101$:
	mov	a,_key_lock
	jz	00101$
;	assignBit
	clr	_EA
	mov	a,_key_lock
	jz	00105$
	mov	a,_key_lock
	dec	a
	mov	_key_lock,a
;	assignBit
	setb	_EA
	sjmp	00110$
00105$:
;	assignBit
	setb	_EA
	sjmp	00101$
00110$:
;	dino.c:224: read_key = pressed_key;
	mov	_read_key,_pressed_key
;	dino.c:225: key_ready = 0;
	mov	_key_ready,#0x00
;	dino.c:226: SemaphoreSignal(key_lock);
	INC _key_lock 
;	dino.c:228: if ((read_key == '#') && (level >= 0) && (level <= 9)) {break;}
	mov	a,#0x23
	cjne	a,_read_key,00116$
	mov	a,_level
	add	a,#0xff - 0x09
	jnc	00123$
00116$:
;	dino.c:230: level = read_key - '0';
	mov	a,_read_key
	add	a,#0xd0
	mov	_level,a
00120$:
;	dino.c:233: ThreadYield();
	lcall	_ThreadYield
	sjmp	00122$
00123$:
;	dino.c:236: wait_time = (10 - level);
	mov	r7,_level
	mov	a,#0x0a
	clr	c
	subb	a,r7
	mov	_wait_time,a
;	dino.c:237: screen_mode = 1;
	mov	_screen_mode,#0x01
;	dino.c:238: continue;
	sjmp	00200$
00197$:
;	dino.c:240: else if (screen_mode == 1)
	mov	a,#0x01
	cjne	a,_screen_mode,00380$
	sjmp	00381$
00380$:
	ljmp	00194$
00381$:
;	dino.c:242: dino_row = 0;
	mov	_dino_row,#0x00
;	dino.c:243: points = 0;
	mov	_points,#0x00
;	dino.c:245: top_left = 0x12;
	mov	_top_left,#0x12
;	dino.c:246: top_right = 0x48;
	mov	_top_right,#0x48
;	dino.c:247: bottom_left = 0x24;
	mov	_bottom_left,#0x24
;	dino.c:248: bottom_right = 0x81;
	mov	_bottom_right,#0x81
;	dino.c:250: while(screen_mode == 1)
00167$:
	mov	a,#0x01
	cjne	a,_screen_mode,00200$
;	dino.c:252: if(key_ready == 1)
	mov	a,#0x01
	cjne	a,_key_ready,00144$
;	dino.c:254: SemaphoreWait(key_lock);
00124$:
	mov	a,_key_lock
	jz	00124$
;	assignBit
	clr	_EA
	mov	a,_key_lock
	jz	00128$
	mov	a,_key_lock
	dec	a
	mov	_key_lock,a
;	assignBit
	setb	_EA
	sjmp	00133$
00128$:
;	assignBit
	setb	_EA
	sjmp	00124$
00133$:
;	dino.c:255: read_key = pressed_key;
	mov	_read_key,_pressed_key
;	dino.c:256: key_ready = 0;
	mov	_key_ready,#0x00
;	dino.c:257: SemaphoreSignal(key_lock);
	INC _key_lock 
;	dino.c:259: if(read_key == '2')
	mov	a,#0x32
	cjne	a,_read_key,00141$
;	dino.c:261: dino_row = 0;
	mov	_dino_row,#0x00
	sjmp	00144$
00141$:
;	dino.c:263: else if(read_key == '8')
	mov	a,#0x38
	cjne	a,_read_key,00144$
;	dino.c:265: dino_row = 1;
	mov	_dino_row,#0x01
00144$:
;	dino.c:269: if (wait_time == 0)
	mov	a,_wait_time
	jnz	00160$
;	dino.c:271: wait_time = (10 - level);
	mov	r7,_level
	mov	a,#0x0a
	clr	c
	subb	a,r7
	mov	_wait_time,a
;	dino.c:272: SemaphoreWait(map_lock);
00145$:
	mov	a,_map_lock
	jz	00145$
;	assignBit
	clr	_EA
	mov	a,_map_lock
	jz	00149$
	mov	a,_map_lock
	dec	a
	mov	_map_lock,a
;	assignBit
	setb	_EA
	sjmp	00154$
00149$:
;	assignBit
	setb	_EA
	sjmp	00145$
00154$:
;	dino.c:304: __endasm;
	PUSH	ACC
	MOV	A, _top_right
	CLR	C
	RLC	A
	MOV	_top_right, A
	MOV	A, _top_left
	RLC	A
	MOV	_top_left, A
	MOV	A, _top_right
	ADDC	A, #0
	MOV	_top_right, A
	MOV	A, _bottom_right
	CLR	C
	RLC	A
	MOV	_bottom_right, A
	MOV	A, _bottom_left
	RLC	A
	MOV	_bottom_left, A
	MOV	A, _bottom_right
	ADDC	A, #0
	MOV	_bottom_right, A
	CLR	C
	MOV	A, _top_left
	ORL	A, _bottom_left
	RLC	A
	CLR	A
	ADDC	A, #0
	ADD	A, _points
	MOV	_points, A
	POP	ACC
;	dino.c:305: SemaphoreSignal(map_lock);
	INC _map_lock 
	sjmp	00161$
00160$:
;	dino.c:309: --wait_time;
	dec	_wait_time
00161$:
;	dino.c:312: if (((dino_row == 0) && (top_left & 0x80)) || ((dino_row == 1) && (bottom_left & 0x80)))
	mov	a,_dino_row
	jnz	00166$
	mov	a,_top_left
	mov	r7,a
	jb	acc.7,00162$
00166$:
	mov	a,#0x01
	cjne	a,_dino_row,00163$
	mov	a,_bottom_left
	mov	r7,a
	jnb	acc.7,00163$
00162$:
;	dino.c:314: --points;
	dec	_points
;	dino.c:315: screen_mode = 2;
	mov	_screen_mode,#0x02
;	dino.c:316: continue;
	ljmp	00167$
00163$:
;	dino.c:319: ThreadYield();
	lcall	_ThreadYield
	ljmp	00167$
00194$:
;	dino.c:322: else if (screen_mode == 2)
	mov	a,#0x02
	cjne	a,_screen_mode,00400$
	sjmp	00401$
00400$:
	ljmp	00200$
00401$:
;	dino.c:324: key_ready = 0;
	mov	_key_ready,#0x00
;	dino.c:325: while(screen_mode == 2)
00188$:
	mov	a,#0x02
	cjne	a,_screen_mode,00402$
	sjmp	00403$
00402$:
	ljmp	00200$
00403$:
;	dino.c:327: if(key_ready == 1)
	mov	a,#0x01
	cjne	a,_key_ready,00187$
;	dino.c:329: SemaphoreWait(key_lock);
00170$:
	mov	a,_key_lock
	jz	00170$
;	assignBit
	clr	_EA
	mov	a,_key_lock
	jz	00174$
	mov	a,_key_lock
	dec	a
	mov	_key_lock,a
;	assignBit
	setb	_EA
	sjmp	00179$
00174$:
;	assignBit
	setb	_EA
	sjmp	00170$
00179$:
;	dino.c:330: read_key = pressed_key;
	mov	_read_key,_pressed_key
;	dino.c:331: key_ready = 0;
	mov	_key_ready,#0x00
;	dino.c:332: SemaphoreSignal(key_lock);
	INC _key_lock 
;	dino.c:334: if(read_key == '#')
	mov	a,#0x23
	cjne	a,_read_key,00187$
;	dino.c:336: screen_mode = 0;
	mov	_screen_mode,#0x00
00187$:
;	dino.c:340: ThreadYield();
	lcall	_ThreadYield
;	dino.c:342: continue;
;	dino.c:345: }
	sjmp	00188$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	dino.c:347: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	dino.c:349: SemaphoreCreate(map_lock, 1);
	mov	_map_lock,#0x01
;	dino.c:350: SemaphoreCreate(key_lock, 1);
	mov	_key_lock,#0x01
;	dino.c:351: move_way = 1;
	mov	_move_way,#0x01
;	dino.c:352: Init_Keypad();
	lcall	_Init_Keypad
;	dino.c:353: LCD_Init();
	lcall	_LCD_Init
;	dino.c:354: LCD_set_symbol('\10', dinosaur);
	mov	dpl, #0x48
	lcall	_LCD_IRWrite
	mov	dptr,#_dinosaur
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_dinosaur + 0x0001)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_dinosaur + 0x0002)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_dinosaur + 0x0003)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_dinosaur + 0x0004)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_dinosaur + 0x0005)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_dinosaur + 0x0006)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_dinosaur + 0x0007)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:355: LCD_set_symbol('\20', cactus);
	mov	dpl, #0x50
	lcall	_LCD_IRWrite
	mov	dptr,#_cactus
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_cactus + 0x0001)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_cactus + 0x0002)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_cactus + 0x0003)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_cactus + 0x0004)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_cactus + 0x0005)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_cactus + 0x0006)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	mov	dptr,#(_cactus + 0x0007)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:356: ThreadCreate(keypad_control);
	mov	dptr,#_keypad_control
	lcall	_ThreadCreate
;	dino.c:357: ThreadCreate(render_task);
	mov	dptr,#_render_task
	lcall	_ThreadCreate
;	dino.c:358: game_control();
;	dino.c:359: }
	ljmp	_game_control
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	dino.c:361: void _sdcc_gsinit_startup(void) 
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	dino.c:365: __endasm;
	ljmp	_Bootstrap
;	dino.c:366: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	dino.c:368: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	dino.c:369: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	dino.c:370: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	dino.c:371: void timer0_ISR(void) __interrupt(1)
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	dino.c:375: __endasm;
	ljmp	_myTimer0Handler
;	dino.c:376: }
	ljmp	sdcc_atomic_maybe_rollback
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_dinosaur:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x0e	; 14
	.db #0x0a	; 10
	.area CSEG    (CODE)
	.area CONST   (CODE)
_cactus:
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
