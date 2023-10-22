;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-medium
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setup
	.globl _lcd_init
	.globl _lcd_data
	.globl _lcd_cmd
	.globl _ms_delay
	.globl _set_led_status
	.globl _SerialReadByteFlush
	.globl _sprintf
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
	.globl _DATA_LATCH_LCD
	.globl _DATA_LATCH_LED
	.globl _DATA_LATCH_MATRIX
	.globl _set_led_status_PARM_2
	.globl _led_status_map
	.globl _Serialbegin_PARM_2
	.globl _uartReadByte
	.globl _uartNewLineIndexes
	.globl _uartNewLineCount
	.globl _uartReadCount
	.globl _uartReadBuffer
	.globl _uartNewLineFlag
	.globl _Serialbegin
	.globl _Serialavailable
	.globl _Serialwrite
	.globl _Serialread
	.globl _Serialprint
	.globl _SerialIntWrite
	.globl _setSerialinterrupt
	.globl _Serialflush
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
_uartNewLineFlag::
	.ds 1
_uartReadBuffer::
	.ds 20
_uartReadCount::
	.ds 2
_uartNewLineCount::
	.ds 1
_uartNewLineIndexes::
	.ds 10
_uartReadByte::
	.ds 1
_Serialbegin_PARM_2:
	.ds 4
_Serialbegin_autoReloadvalue_65536_25:
	.ds 2
_SerialIntWrite_tempBuffer_65536_36:
	.ds 3
_led_status_map::
	.ds 1
_set_led_status_PARM_2:
	.ds 1
_main_a_65537_63:
	.ds 17
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_DATA_LATCH_MATRIX	=	0xb000
_DATA_LATCH_LED	=	0xd000
_DATA_LATCH_LCD	=	0xe000
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
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:130: volatile unsigned char uartNewLineFlag = 0;
;	genAssign
	mov	r0,#_uartNewLineFlag
;	Peephole 181	changed mov to clr
	clr	a
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:134: volatile unsigned int  uartReadCount    = 0;
;	genAssign
	mov	r0,#_uartReadCount
;	genFromRTrack acc==0x00
	movx	@r0,a
;	genFromRTrack acc==0x00
	inc	r0
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:136: volatile unsigned char uartNewLineCount = 0;
;	genAssign
	mov	r0,#_uartNewLineCount
;	genFromRTrack acc==0x00
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:140: volatile unsigned char uartReadByte = CHAR_NULL;
;	genAssign
	mov	r0,#_uartReadByte
;	genFromRTrack acc==0x00
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:405: unsigned char led_status_map = 0x00;    // 8 Bytes: Keep LED states to update LED_DATA
;	genAssign
	mov	r0,#_led_status_map
;	genFromRTrack acc==0x00
	movx	@r0,a
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
;Allocation info for local variables in function 'Serialbegin'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:151: void Serialbegin(unsigned long OscillatorFrequency,unsigned long baudRate)
;	-----------------------------------------
;	 function Serialbegin
;	-----------------------------------------
_Serialbegin:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	genReceive
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:156: autoReloadvalue =  __baudRate_calc_timer_1(OscillatorFrequency,baudRate);
;	genIpush
	mov	a,#0x80
	push	acc
;	genFromRTrack 0x01==rl(0x80)
	rl	a
	push	acc
;	Peephole 181	changed mov to clr
	clr	a
	push	acc
	push	acc
;	genCall
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	__divulong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	genIpush
	mov	r0,#_Serialbegin_PARM_2
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
;	genCall
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	__divulong
	mov	r4,dpl
	mov	r5,dph
;	Peephole 302	mov r6,b removed
;	Peephole 302	mov r7,a removed
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	genCast
;	genMinus
	mov	r0,#_Serialbegin_autoReloadvalue_65536_25
;	Peephole 181	changed mov to clr
	clr	a
	clr	c
	subb	a,r4
	movx	@r0,a
	mov	a,#0x01
	subb	a,r5
	inc	r0
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:157: TMOD  |= 0x20;
;	genOr
	orl	_TMOD,#0x20
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:158: SCON  |= 0x50;
;	genOr
	orl	_SCON,#0x50
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:159: TL1    = autoReloadvalue >> 8;
;	genGetByte
;	Peephole 263.c	optimized loading const
	mov	r0,#(_Serialbegin_autoReloadvalue_65536_25 + 1)
	movx	a,@r0
	mov	_TL1,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:160: TH1    = autoReloadvalue;
;	genCast
	mov	r0,#_Serialbegin_autoReloadvalue_65536_25
	movx	a,@r0
	mov	_TH1,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:161: TR1    = 1;
;	genAssign
;	assignBit
	setb	_TR1
;	Peephole 500	removed redundant label 00101$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:174: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Serialavailable'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:181: unsigned char Serialavailable(void)
;	-----------------------------------------
;	 function Serialavailable
;	-----------------------------------------
_Serialavailable:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:183: return RI;
;	genCast
	mov	c,_RI
	clr	a
	rlc	a
	mov	dpl,a
;	genRet
;	Peephole 500	removed redundant label 00101$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:184: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Serialwrite'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:192: void Serialwrite(unsigned char Byte)
;	-----------------------------------------
;	 function Serialwrite
;	-----------------------------------------
_Serialwrite:
;	genReceive
	mov	r7,dpl
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:195: EA = 0;
;	genAssign
;	assignBit
	clr	_EA
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:197: SBUF = Byte;
;	genAssign
	mov	_SBUF,r7
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:198: while(!TI);
00101$:
;	genIfx
;	genIfxJump
;	Peephole 108.d	removed ljmp by inverse jump logic
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:199: TI   = 0;
;	genAssign
;	assignBit
;	Peephole 250.a	using atomic test and clear
	jbc	_TI,00114$
	sjmp	00101$
00114$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:201: EA = 1;
;	genAssign
;	assignBit
	setb	_EA
;	Peephole 500	removed redundant label 00104$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:203: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Serialread'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:212: unsigned char Serialread(void)
;	-----------------------------------------
;	 function Serialread
;	-----------------------------------------
_Serialread:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:214: while(!RI);
00101$:
;	genIfx
;	genIfxJump
;	Peephole 108.d	removed ljmp by inverse jump logic
	jnb	_RI,00101$
;	Peephole 500	removed redundant label 00114$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:215: return SBUF;
;	genRet
	mov	dpl,_SBUF
;	Peephole 500	removed redundant label 00104$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:216: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Serialprint'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:223: void Serialprint(unsigned char *sPtr)
;	-----------------------------------------
;	 function Serialprint
;	-----------------------------------------
_Serialprint:
;	genReceive
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
00103$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:225: for(;*sPtr!='\0';Serialwrite(*(sPtr++)));
;	genPointerGet
;	genGenPointerGet
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
;	genIfx
	mov	r4,a
;	Peephole 105.a	removed redundant mov
;	genIfxJump
;	Peephole 108.c	removed ljmp by inverse jump logic
	jz	00105$
;	Peephole 500	removed redundant label 00116$
;	genAssign
	mov	dpl,r4
;	genPlus
;	genPlusIncr
	inc	r5
	cjne	r5,#0x00,00117$
	inc	r6
00117$:
;	genCall
	push	ar7
	push	ar6
	push	ar5
	lcall	_Serialwrite
	pop	ar5
	pop	ar6
	pop	ar7
;	Peephole 112.b	changed ljmp to sjmp
	sjmp	00103$
00105$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:226: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SerialIntWrite'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:234: void SerialIntWrite(signed int num)
;	-----------------------------------------
;	 function SerialIntWrite
;	-----------------------------------------
_SerialIntWrite:
;	genReceive
	mov	r6,dpl
	mov	r7,dph
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:237: sprintf(tempBuffer,"%d",num);
;	genIpush
	push	ar6
	push	ar7
;	genIpush
	mov	a,#___str_0
	push	acc
	mov	a,#(___str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
;	genIpush
	mov	r0,#_SerialIntWrite_tempBuffer_65536_36
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
;	genCall
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:238: Serialprint((unsigned char*)tempBuffer);
;	genCall
	mov	r0,#_SerialIntWrite_tempBuffer_65536_36
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:239: }
;	Peephole 400.b	replaced lcall/ret with ljmp
	ljmp	_Serialprint
;
;------------------------------------------------------------
;Allocation info for local variables in function 'setSerialinterrupt'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:249: void setSerialinterrupt(void)
;	-----------------------------------------
;	 function setSerialinterrupt
;	-----------------------------------------
_setSerialinterrupt:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:251: ES = 1;
;	genAssign
;	assignBit
	setb	_ES
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:252: EA = 1;
;	genAssign
;	assignBit
	setb	_EA
;	Peephole 500	removed redundant label 00101$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:253: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Serialflush'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:260: void Serialflush(void)
;	-----------------------------------------
;	 function Serialflush
;	-----------------------------------------
_Serialflush:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:263: uartReadCount    = 0;           // Clear Uart Byte Count
;	genAssign
	mov	r0,#_uartReadCount
;	Peephole 181	changed mov to clr
	clr	a
	movx	@r0,a
;	genFromRTrack acc==0x00
	inc	r0
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:264: uartNewLineFlag  = 0;           // Clear New Line Flag
;	genAssign
	mov	r0,#_uartNewLineFlag
;	genFromRTrack acc==0x00
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:265: uartNewLineCount = 0;           // Clear New Line Count
;	genAssign
	mov	r0,#_uartNewLineCount
;	genFromRTrack acc==0x00
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:266: uartReadByte     = CHAR_NULL;   // Clear Last Read Byte
;	genAssign
	mov	r0,#_uartReadByte
;	genFromRTrack acc==0x00
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:269: for(i=0;i<=NEW_LINE_INDEX_BUFFER_SIZE;i++)
;	genAssign
;	genFromRTrack replaced	mov	r7,#0x00
;	Peephole 236.i	used r7 instead of ar7
	mov	r7,a
00103$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:270: uartNewLineIndexes[i] = CHAR_NULL;
;	genPlus
	mov	a,r7
	add	a,#_uartNewLineIndexes
;	genPointerSet
;	genPagedPointerSet
;	Peephole 239	used a instead of acc
	mov	r0,a
;	Peephole 181	changed mov to clr
	clr	a
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:269: for(i=0;i<=NEW_LINE_INDEX_BUFFER_SIZE;i++)
;	genPlus
;	genPlusIncr
	inc	r7
;	genCmpGt
;	genCmp
;	genIfxJump
;	Peephole 108.a	removed ljmp by inverse jump logic
;	Peephole 132.b	optimized genCmpGt by inverse logic (acc differs)
	mov	a,r7
	add	a,#0xff - 0x0a
	jnc	00103$
;	Peephole 500	removed redundant label 00123$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:273: for(i=0;i<=UART_RX_BUFFER_SIZE;i++)
;	genAssign
	mov	r7,#0x00
00105$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:274: uartReadBuffer[i] = CHAR_NULL;
;	genPlus
	mov	a,r7
	add	a,#_uartReadBuffer
;	genPointerSet
;	genPagedPointerSet
;	Peephole 239	used a instead of acc
	mov	r0,a
;	Peephole 181	changed mov to clr
	clr	a
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:273: for(i=0;i<=UART_RX_BUFFER_SIZE;i++)
;	genPlus
;	genPlusIncr
	inc	r7
;	genCmpGt
;	genCmp
;	genIfxJump
;	Peephole 108.a	removed ljmp by inverse jump logic
;	Peephole 132.b	optimized genCmpGt by inverse logic (acc differs)
	mov	a,r7
	add	a,#0xff - 0x14
	jnc	00105$
;	Peephole 500	removed redundant label 00124$
;	Peephole 500	removed redundant label 00107$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:275: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SerialReadByteFlush'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:282: void SerialReadByteFlush(void)
;	-----------------------------------------
;	 function SerialReadByteFlush
;	-----------------------------------------
_SerialReadByteFlush:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:284: uartReadByte     = CHAR_NULL;   // Clear Last Read Byte
;	genAssign
	mov	r0,#_uartReadByte
;	Peephole 181	changed mov to clr
	clr	a
	movx	@r0,a
;	Peephole 500	removed redundant label 00101$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:285: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_led_status'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:443: void set_led_status(unsigned char led, bool state)
;	-----------------------------------------
;	 function set_led_status
;	-----------------------------------------
_set_led_status:
;	genReceive
	mov	r7,dpl
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:445: if (state == false) {
;	genIfx
	mov	r0,#_set_led_status_PARM_2
	movx	a,@r0
;	genIfxJump
;	Peephole 108.b	removed ljmp by inverse jump logic
	jnz	00102$
;	Peephole 500	removed redundant label 00110$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:446: led_status_map &= ~led;         // To disable a bit, use AND with complement bits (inverted)
;	genCpl
	mov	a,r7
	cpl	a
	mov	r6,a
;	genAnd
	mov	r0,#_led_status_map
	movx	a,@r0
	anl	a,r6
	movx	@r0,a
;	Peephole 112.b	changed ljmp to sjmp
	sjmp	00103$
00102$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:448: led_status_map |= led;          //  To enable a bit, use just OR
;	genOr
	mov	r0,#_led_status_map
	movx	a,@r0
	orl	a,r7
	movx	@r0,a
00103$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:450: DATA_LATCH_LED = led_status_map;
;	genAssign
	mov	r0,#_led_status_map
	mov	dptr,#_DATA_LATCH_LED
	movx	a,@r0
	movx	@dptr,a
;	Peephole 500	removed redundant label 00104$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:451: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ms_delay'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:459: void ms_delay(unsigned int time) {
;	-----------------------------------------
;	 function ms_delay
;	-----------------------------------------
_ms_delay:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:468: for(i=0;i<time;i++)
;	genAssign
	mov	r6,#0x00
	mov	r7,#0x00
00107$:
;	genCmpLt
;	genCmp
	clr	c
;	genIfxJump
;	Peephole 108.a	removed ljmp by inverse jump logic
	jnc	00109$
;	Peephole 500	removed redundant label 00129$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:469: for(j=0;j<one_ms;j++);            //TODO: Adjust to get 1ms
;	genAssign
	mov	r4,#0x00
	mov	r5,#0x00
00104$:
;	genCmpLt
;	genCmp
	clr	c
;	genIfxJump
;	Peephole 108.a	removed ljmp by inverse jump logic
	jnc	00108$
;	Peephole 500	removed redundant label 00130$
;	genPlus
;	genPlusIncr
	inc	r4
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 243	avoided branch to sjmp
	cjne	r4,#0x00,00104$
	inc	r5
;	Peephole 500	removed redundant label 00131$
	sjmp	00104$
00108$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:468: for(i=0;i<time;i++)
;	genPlus
;	genPlusIncr
	inc	r6
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 243	avoided branch to sjmp
	cjne	r6,#0x00,00107$
	inc	r7
;	Peephole 500	removed redundant label 00132$
	sjmp	00107$
00109$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:473: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_cmd'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:490: void lcd_cmd(unsigned char command)
;	-----------------------------------------
;	 function lcd_cmd
;	-----------------------------------------
_lcd_cmd:
;	genReceive
	mov	r7,dpl
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:492: DATA_LATCH_LCD = command;
;	genAssign
	mov	dptr,#_DATA_LATCH_LCD
	mov	a,r7
	movx	@dptr,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:493: LCD_RS   = 0;
;	genAssign
;	assignBit
	clr	_P1_0
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:494: LCD_RW   = 0;
;	genAssign
;	assignBit
	clr	_P1_1
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:495: LCD_E    = 1;
;	genAssign
;	assignBit
	setb	_P1_2
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:497: LCD_E    = 0;
;	genAssign
;	assignBit
	clr	_P1_2
;	Peephole 500	removed redundant label 00101$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:498: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_data'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:504: void lcd_data(unsigned char disp_data)
;	-----------------------------------------
;	 function lcd_data
;	-----------------------------------------
_lcd_data:
;	genReceive
	mov	r7,dpl
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:506: DATA_LATCH_LCD = disp_data;
;	genAssign
	mov	dptr,#_DATA_LATCH_LCD
	mov	a,r7
	movx	@dptr,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:507: LCD_RS   = 1;
;	genAssign
;	assignBit
	setb	_P1_0
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:508: LCD_RW   = 0;
;	genAssign
;	assignBit
	clr	_P1_1
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:509: LCD_E    = 1;
;	genAssign
;	assignBit
	setb	_P1_2
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:511: LCD_E    = 0;
;	genAssign
;	assignBit
	clr	_P1_2
;	Peephole 500	removed redundant label 00101$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:512: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_init'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:517: void lcd_init(void)
;	-----------------------------------------
;	 function lcd_init
;	-----------------------------------------
_lcd_init:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:519: lcd_cmd(0x38);  // for using 2 lines and 5X7 matrix of LCD
;	genCall
	mov	dpl,#0x38
	lcall	_lcd_cmd
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:521: lcd_cmd(0x0F);  // turn display ON, cursor blinking
;	genCall
	mov	dpl,#0x0f
	lcall	_lcd_cmd
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:523: lcd_cmd(0x01);  // clear screen
;	genCall
	mov	dpl,#0x01
	lcall	_lcd_cmd
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:526: lcd_cmd(0x80);  // bring cursor to position 0 of line 1
;	genCall
	mov	dpl,#0x80
	lcall	_lcd_cmd
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:528: NOP();  // This fix some randon behavior on compiler ??
;	genInline
	nop 
;	Peephole 500	removed redundant label 00101$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:529: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setup'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:558: void setup(void)
;	-----------------------------------------
;	 function setup
;	-----------------------------------------
_setup:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:560: IE  = 0;                            // Interrupt Enable: Disable all
;	genAssign
	mov	_IE,#0x00
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:561: EA  = 0;
;	genAssign
;	assignBit
	clr	_EA
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:562: IP  = 0;                            // Interrupt Priority: Disable all
;	genAssign
	mov	_IP,#0x00
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:563: PSW = 0;                            // Program Status World: Clear
;	genAssign
	mov	_PSW,#0x00
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:564: P0  = 0xFF;                         // Port 0: All alternate function Data/Address A0-A7
;	genAssign
	mov	_P0,#0xff
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:565: P1  = 0x00;                         // Port 1: We use as mixed function I/O: LCD Control
;	genAssign
	mov	_P1,#0x00
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:566: P2  = 0xFF;                         // Port 2: All alternate function Address A8-A15
;	genAssign
	mov	_P2,#0xff
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:567: P3  = 0xFF;                         // Port 3: We use secondary functions like Interrupts
;	genAssign
	mov	_P3,#0xff
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:586: DATA_LATCH_MATRIX = 0x00;
;	genAssign
	mov	dptr,#_DATA_LATCH_MATRIX
;	Peephole 181	changed mov to clr
	clr	a
	movx	@dptr,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:587: DATA_LATCH_LED    = 0x00;
;	genAssign
	mov	dptr,#_DATA_LATCH_LED
;	genFromRTrack acc==0x00
	movx	@dptr,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:588: DATA_LATCH_LCD    = 0x00;
;	genAssign
	mov	dptr,#_DATA_LATCH_LCD
;	genFromRTrack acc==0x00
	movx	@dptr,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:590: lcd_init();
;	genCall
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:604: }
;	Peephole 400.b	replaced lcall/ret with ljmp
	ljmp	_lcd_init
;
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:610: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:616: NOP();
;	genInline
	nop 
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:617: setup();        // Setup IO and Registers
;	genCall
	lcall	_setup
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:619: set_led_status(LED_STATUS, true);
;	genAssign
	mov	r0,#_set_led_status_PARM_2
	mov	a,#0x01
	movx	@r0,a
;	genCall
	mov	dpl,#0x10
	lcall	_set_led_status
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:622: unsigned char a[17]="ETEP MATRIX 8031";    //string of 14 characters with a null terminator.
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#_main_a_65537_63
	mov	a,#0x45
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0001)
;	genFromRTrack 0x54==swap(0x45)
	swap	a
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0002)
;	genFromRTrack 0x45==swap(0x54)
	swap	a
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0003)
	mov	a,#0x50
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0004)
	mov	a,#0x20
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0005)
	mov	a,#0x4d
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0006)
	mov	a,#0x41
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0007)
	mov	a,#0x54
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0008)
	mov	a,#0x52
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0009)
	mov	a,#0x49
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x000a)
	mov	a,#0x58
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x000b)
	mov	a,#0x20
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x000c)
	mov	a,#0x38
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x000d)
	mov	a,#0x30
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x000e)
	mov	a,#0x33
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x000f)
	mov	a,#0x31
	movx	@r0,a
;	genPointerSet
;	genPagedPointerSet
	mov	r0,#(_main_a_65537_63 + 0x0010)
;	Peephole 181	changed mov to clr
	clr	a
	movx	@r0,a
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:624: while(a[l] != '\0') // searching the null terminator in the sentence
;	genAssign
;	genFromRTrack replaced	mov	r6,#0x00
;	Peephole 236.i	used r6 instead of ar6
	mov	r6,a
;	genFromRTrack replaced	mov	r7,#0x00
;	Peephole 236.i	used r7 instead of ar7
	mov	r7,a
00101$:
;	genPlus
	mov	a,r6
	add	a,#_main_a_65537_63
	mov	r1,a
;	genPointerGet
;	genPagedPointerGet
	movx	a,@r1
;	genIfx
	mov	r5,a
;	Peephole 105.a	removed redundant mov
;	genIfxJump
;	Peephole 108.c	removed ljmp by inverse jump logic
	jz	00105$
;	Peephole 500	removed redundant label 00122$
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:626: lcd_data(a[l]);
;	genCall
	mov	dpl,r5
	push	ar7
	push	ar6
	lcall	_lcd_data
	pop	ar6
	pop	ar7
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:627: l++;
;	genPlus
;	genPlusIncr
	inc	r6
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:636: bool state = true;
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 243	avoided branch to sjmp
	cjne	r6,#0x00,00101$
	inc	r7
;	Peephole 500	removed redundant label 00123$
	sjmp	00101$
00105$:
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:638: NOP();
;	genInline
	nop 
;	Peephole 112.b	changed ljmp to sjmp
;	C:\K33\OneDrive\Projects\Working\8031 Contoller - 20230816\Sources\8031-matrix\main.c:687: }
	sjmp	00105$
;	Peephole 259.a	removed redundant label 00107$ and ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "%d"
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
