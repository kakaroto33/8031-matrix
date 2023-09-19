;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_matrix_status_PARM_2
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
	.globl _MATRIX_DB
	.globl _MATRIX_DA
	.globl _led_matrix_db
	.globl _led_matrix_da
	.globl _set_matrix_status
	.globl _update_matrix_da
	.globl _update_matrix_db
	.globl _lcd_cmd
	.globl _lcd_data
	.globl _lcd_init
	.globl _ms_delay
	.globl _setup
	.globl _main
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
G$P0$0_0$0 == 0x0080
_P0	=	0x0080
G$SP$0_0$0 == 0x0081
_SP	=	0x0081
G$DPL$0_0$0 == 0x0082
_DPL	=	0x0082
G$DPH$0_0$0 == 0x0083
_DPH	=	0x0083
G$PCON$0_0$0 == 0x0087
_PCON	=	0x0087
G$TCON$0_0$0 == 0x0088
_TCON	=	0x0088
G$TMOD$0_0$0 == 0x0089
_TMOD	=	0x0089
G$TL0$0_0$0 == 0x008a
_TL0	=	0x008a
G$TL1$0_0$0 == 0x008b
_TL1	=	0x008b
G$TH0$0_0$0 == 0x008c
_TH0	=	0x008c
G$TH1$0_0$0 == 0x008d
_TH1	=	0x008d
G$P1$0_0$0 == 0x0090
_P1	=	0x0090
G$SCON$0_0$0 == 0x0098
_SCON	=	0x0098
G$SBUF$0_0$0 == 0x0099
_SBUF	=	0x0099
G$P2$0_0$0 == 0x00a0
_P2	=	0x00a0
G$IE$0_0$0 == 0x00a8
_IE	=	0x00a8
G$P3$0_0$0 == 0x00b0
_P3	=	0x00b0
G$IP$0_0$0 == 0x00b8
_IP	=	0x00b8
G$PSW$0_0$0 == 0x00d0
_PSW	=	0x00d0
G$ACC$0_0$0 == 0x00e0
_ACC	=	0x00e0
G$B$0_0$0 == 0x00f0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
G$P0_0$0_0$0 == 0x0080
_P0_0	=	0x0080
G$P0_1$0_0$0 == 0x0081
_P0_1	=	0x0081
G$P0_2$0_0$0 == 0x0082
_P0_2	=	0x0082
G$P0_3$0_0$0 == 0x0083
_P0_3	=	0x0083
G$P0_4$0_0$0 == 0x0084
_P0_4	=	0x0084
G$P0_5$0_0$0 == 0x0085
_P0_5	=	0x0085
G$P0_6$0_0$0 == 0x0086
_P0_6	=	0x0086
G$P0_7$0_0$0 == 0x0087
_P0_7	=	0x0087
G$IT0$0_0$0 == 0x0088
_IT0	=	0x0088
G$IE0$0_0$0 == 0x0089
_IE0	=	0x0089
G$IT1$0_0$0 == 0x008a
_IT1	=	0x008a
G$IE1$0_0$0 == 0x008b
_IE1	=	0x008b
G$TR0$0_0$0 == 0x008c
_TR0	=	0x008c
G$TF0$0_0$0 == 0x008d
_TF0	=	0x008d
G$TR1$0_0$0 == 0x008e
_TR1	=	0x008e
G$TF1$0_0$0 == 0x008f
_TF1	=	0x008f
G$P1_0$0_0$0 == 0x0090
_P1_0	=	0x0090
G$P1_1$0_0$0 == 0x0091
_P1_1	=	0x0091
G$P1_2$0_0$0 == 0x0092
_P1_2	=	0x0092
G$P1_3$0_0$0 == 0x0093
_P1_3	=	0x0093
G$P1_4$0_0$0 == 0x0094
_P1_4	=	0x0094
G$P1_5$0_0$0 == 0x0095
_P1_5	=	0x0095
G$P1_6$0_0$0 == 0x0096
_P1_6	=	0x0096
G$P1_7$0_0$0 == 0x0097
_P1_7	=	0x0097
G$RI$0_0$0 == 0x0098
_RI	=	0x0098
G$TI$0_0$0 == 0x0099
_TI	=	0x0099
G$RB8$0_0$0 == 0x009a
_RB8	=	0x009a
G$TB8$0_0$0 == 0x009b
_TB8	=	0x009b
G$REN$0_0$0 == 0x009c
_REN	=	0x009c
G$SM2$0_0$0 == 0x009d
_SM2	=	0x009d
G$SM1$0_0$0 == 0x009e
_SM1	=	0x009e
G$SM0$0_0$0 == 0x009f
_SM0	=	0x009f
G$P2_0$0_0$0 == 0x00a0
_P2_0	=	0x00a0
G$P2_1$0_0$0 == 0x00a1
_P2_1	=	0x00a1
G$P2_2$0_0$0 == 0x00a2
_P2_2	=	0x00a2
G$P2_3$0_0$0 == 0x00a3
_P2_3	=	0x00a3
G$P2_4$0_0$0 == 0x00a4
_P2_4	=	0x00a4
G$P2_5$0_0$0 == 0x00a5
_P2_5	=	0x00a5
G$P2_6$0_0$0 == 0x00a6
_P2_6	=	0x00a6
G$P2_7$0_0$0 == 0x00a7
_P2_7	=	0x00a7
G$EX0$0_0$0 == 0x00a8
_EX0	=	0x00a8
G$ET0$0_0$0 == 0x00a9
_ET0	=	0x00a9
G$EX1$0_0$0 == 0x00aa
_EX1	=	0x00aa
G$ET1$0_0$0 == 0x00ab
_ET1	=	0x00ab
G$ES$0_0$0 == 0x00ac
_ES	=	0x00ac
G$EA$0_0$0 == 0x00af
_EA	=	0x00af
G$P3_0$0_0$0 == 0x00b0
_P3_0	=	0x00b0
G$P3_1$0_0$0 == 0x00b1
_P3_1	=	0x00b1
G$P3_2$0_0$0 == 0x00b2
_P3_2	=	0x00b2
G$P3_3$0_0$0 == 0x00b3
_P3_3	=	0x00b3
G$P3_4$0_0$0 == 0x00b4
_P3_4	=	0x00b4
G$P3_5$0_0$0 == 0x00b5
_P3_5	=	0x00b5
G$P3_6$0_0$0 == 0x00b6
_P3_6	=	0x00b6
G$P3_7$0_0$0 == 0x00b7
_P3_7	=	0x00b7
G$RXD$0_0$0 == 0x00b0
_RXD	=	0x00b0
G$TXD$0_0$0 == 0x00b1
_TXD	=	0x00b1
G$INT0$0_0$0 == 0x00b2
_INT0	=	0x00b2
G$INT1$0_0$0 == 0x00b3
_INT1	=	0x00b3
G$T0$0_0$0 == 0x00b4
_T0	=	0x00b4
G$T1$0_0$0 == 0x00b5
_T1	=	0x00b5
G$WR$0_0$0 == 0x00b6
_WR	=	0x00b6
G$RD$0_0$0 == 0x00b7
_RD	=	0x00b7
G$PX0$0_0$0 == 0x00b8
_PX0	=	0x00b8
G$PT0$0_0$0 == 0x00b9
_PT0	=	0x00b9
G$PX1$0_0$0 == 0x00ba
_PX1	=	0x00ba
G$PT1$0_0$0 == 0x00bb
_PT1	=	0x00bb
G$PS$0_0$0 == 0x00bc
_PS	=	0x00bc
G$P$0_0$0 == 0x00d0
_P	=	0x00d0
G$F1$0_0$0 == 0x00d1
_F1	=	0x00d1
G$OV$0_0$0 == 0x00d2
_OV	=	0x00d2
G$RS0$0_0$0 == 0x00d3
_RS0	=	0x00d3
G$RS1$0_0$0 == 0x00d4
_RS1	=	0x00d4
G$F0$0_0$0 == 0x00d5
_F0	=	0x00d5
G$AC$0_0$0 == 0x00d6
_AC	=	0x00d6
G$CY$0_0$0 == 0x00d7
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
G$led_matrix_da$0_0$0==.
_led_matrix_da::
	.ds 1
G$led_matrix_db$0_0$0==.
_led_matrix_db::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
Lmain.set_matrix_status$state$1_0$10==.
_set_matrix_status_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
G$MATRIX_DA$0_0$0 == 0xa000
_MATRIX_DA	=	0xa000
G$MATRIX_DB$0_0$0 == 0xc000
_MATRIX_DB	=	0xc000
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
	C$main.c$64$1_1$35 ==.
;	.\main.c:64: unsigned char led_matrix_da = 0x00;     // 8 Bytes: Keep LED state on latch MATRIX_DA
	mov	_led_matrix_da,#0x00
	C$main.c$65$1_1$35 ==.
;	.\main.c:65: unsigned char led_matrix_db = 0x00;     // 8 Bytes: Keep LED state on latch MATRIX_DB
	mov	_led_matrix_db,#0x00
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
;Allocation info for local variables in function 'set_matrix_status'
;------------------------------------------------------------
;state                     Allocated with name '_set_matrix_status_PARM_2'
;led                       Allocated to registers r6 
;------------------------------------------------------------
	G$set_matrix_status$0$0 ==.
	C$main.c$83$0_0$11 ==.
;	.\main.c:83: void set_matrix_status(unsigned char led, bool state)
;	-----------------------------------------
;	 function set_matrix_status
;	-----------------------------------------
_set_matrix_status:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	C$main.c$86$1_0$11 ==.
;	.\main.c:86: if (led & 0x01) {
	mov	a,dpl
	mov	r7,a
	jnb	acc.0,00108$
	C$main.c$87$2_0$12 ==.
;	.\main.c:87: led = led & 0xfe;                                   // Set bit 0 to 0
	mov	a,#0xfe
	anl	a,r7
	mov	r6,a
	C$main.c$88$2_0$12 ==.
;	.\main.c:88: if (state) {
	mov	a,_set_matrix_status_PARM_2
	jz	00102$
	C$main.c$89$3_0$13 ==.
;	.\main.c:89: led_matrix_db = led_matrix_db | led;            // To enable a bit, use just OR
	mov	a,r6
	orl	_led_matrix_db,a
	sjmp	00110$
00102$:
	C$main.c$91$3_0$14 ==.
;	.\main.c:91: led_matrix_db = led_matrix_db | ~led;           // To disable a bit, use AND with complement bits (inverted)
	mov	a,r6
	cpl	a
	mov	r6,a
	orl	_led_matrix_db,a
	sjmp	00110$
00108$:
	C$main.c$94$2_0$15 ==.
;	.\main.c:94: if (state) {
	mov	a,_set_matrix_status_PARM_2
	jz	00105$
	C$main.c$95$3_0$16 ==.
;	.\main.c:95: led_matrix_da = led_matrix_da | led;            // To enable a bit, use just OR
	mov	a,r7
	orl	_led_matrix_da,a
	sjmp	00110$
00105$:
	C$main.c$97$3_0$17 ==.
;	.\main.c:97: led_matrix_da = led_matrix_da | ~led;           // To disable a bit, use AND with complement bits (inverted)
	mov	a,r7
	cpl	a
	mov	r7,a
	orl	_led_matrix_da,a
00110$:
	C$main.c$100$1_0$11 ==.
;	.\main.c:100: }
	C$main.c$100$1_0$11 ==.
	XG$set_matrix_status$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_matrix_da'
;------------------------------------------------------------
;value                     Allocated to registers r7 
;------------------------------------------------------------
	G$update_matrix_da$0$0 ==.
	C$main.c$106$1_0$19 ==.
;	.\main.c:106: void update_matrix_da(unsigned char value)
;	-----------------------------------------
;	 function update_matrix_da
;	-----------------------------------------
_update_matrix_da:
	mov	r7,dpl
	C$main.c$108$1_0$19 ==.
;	.\main.c:108: MATRIX_DA = value | led_matrix_da;
	mov	dptr,#_MATRIX_DA
	mov	a,_led_matrix_da
	orl	a,r7
	movx	@dptr,a
	C$main.c$109$1_0$19 ==.
;	.\main.c:109: }
	C$main.c$109$1_0$19 ==.
	XG$update_matrix_da$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_matrix_db'
;------------------------------------------------------------
;value                     Allocated to registers r7 
;------------------------------------------------------------
	G$update_matrix_db$0$0 ==.
	C$main.c$115$1_0$21 ==.
;	.\main.c:115: void update_matrix_db(unsigned char value)
;	-----------------------------------------
;	 function update_matrix_db
;	-----------------------------------------
_update_matrix_db:
	mov	r7,dpl
	C$main.c$117$1_0$21 ==.
;	.\main.c:117: MATRIX_DB = value | led_matrix_db;
	mov	dptr,#_MATRIX_DB
	mov	a,_led_matrix_db
	orl	a,r7
	movx	@dptr,a
	C$main.c$118$1_0$21 ==.
;	.\main.c:118: }
	C$main.c$118$1_0$21 ==.
	XG$update_matrix_db$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_cmd'
;------------------------------------------------------------
;command                   Allocated to registers 
;------------------------------------------------------------
	G$lcd_cmd$0$0 ==.
	C$main.c$135$1_0$23 ==.
;	.\main.c:135: void lcd_cmd(unsigned char command)
;	-----------------------------------------
;	 function lcd_cmd
;	-----------------------------------------
_lcd_cmd:
	mov	_P1,dpl
	C$main.c$138$1_0$23 ==.
;	.\main.c:138: LCD_RS   = 0;
;	assignBit
	clr	_P3_3
	C$main.c$139$1_0$23 ==.
;	.\main.c:139: LCD_RW   = 0;
;	assignBit
	clr	_P3_4
	C$main.c$140$1_0$23 ==.
;	.\main.c:140: LCD_E    = 1;
;	assignBit
	setb	_P3_5
	C$main.c$141$1_0$23 ==.
;	.\main.c:141: ms_delay(1);
	mov	dptr,#0x0001
	lcall	_ms_delay
	C$main.c$142$1_0$23 ==.
;	.\main.c:142: LCD_E    = 0;
;	assignBit
	clr	_P3_5
	C$main.c$143$1_0$23 ==.
;	.\main.c:143: }
	C$main.c$143$1_0$23 ==.
	XG$lcd_cmd$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_data'
;------------------------------------------------------------
;disp_data                 Allocated to registers 
;------------------------------------------------------------
	G$lcd_data$0$0 ==.
	C$main.c$149$1_0$25 ==.
;	.\main.c:149: void lcd_data(unsigned char disp_data)
;	-----------------------------------------
;	 function lcd_data
;	-----------------------------------------
_lcd_data:
	mov	_P1,dpl
	C$main.c$152$1_0$25 ==.
;	.\main.c:152: LCD_RS   = 1;
;	assignBit
	setb	_P3_3
	C$main.c$153$1_0$25 ==.
;	.\main.c:153: LCD_RW   = 0;
;	assignBit
	clr	_P3_4
	C$main.c$154$1_0$25 ==.
;	.\main.c:154: LCD_E    = 1;
;	assignBit
	setb	_P3_5
	C$main.c$155$1_0$25 ==.
;	.\main.c:155: ms_delay(1);
	mov	dptr,#0x0001
	lcall	_ms_delay
	C$main.c$156$1_0$25 ==.
;	.\main.c:156: LCD_E    = 0;
;	assignBit
	clr	_P3_5
	C$main.c$157$1_0$25 ==.
;	.\main.c:157: }
	C$main.c$157$1_0$25 ==.
	XG$lcd_data$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_init'
;------------------------------------------------------------
	G$lcd_init$0$0 ==.
	C$main.c$162$1_0$27 ==.
;	.\main.c:162: void lcd_init(void)
;	-----------------------------------------
;	 function lcd_init
;	-----------------------------------------
_lcd_init:
	C$main.c$164$1_0$27 ==.
;	.\main.c:164: lcd_cmd(0x38);  // for using 2 lines and 5X7 matrix of LCD
	mov	dpl,#0x38
	lcall	_lcd_cmd
	C$main.c$165$1_0$27 ==.
;	.\main.c:165: ms_delay(10);
	mov	dptr,#0x000a
	lcall	_ms_delay
	C$main.c$166$1_0$27 ==.
;	.\main.c:166: lcd_cmd(0x0F);  // turn display ON, cursor blinking
	mov	dpl,#0x0f
	lcall	_lcd_cmd
	C$main.c$167$1_0$27 ==.
;	.\main.c:167: ms_delay(10);
	mov	dptr,#0x000a
	lcall	_ms_delay
	C$main.c$168$1_0$27 ==.
;	.\main.c:168: lcd_cmd(0x01);  //clear screen
	mov	dpl,#0x01
	lcall	_lcd_cmd
	C$main.c$169$1_0$27 ==.
;	.\main.c:169: ms_delay(10);
	mov	dptr,#0x000a
	lcall	_ms_delay
	C$main.c$170$1_0$27 ==.
;	.\main.c:170: lcd_cmd(0x81);  // bring cursor to position 1 of line 1
	mov	dpl,#0x81
	lcall	_lcd_cmd
	C$main.c$171$1_0$27 ==.
;	.\main.c:171: ms_delay(10);
	mov	dptr,#0x000a
	lcall	_ms_delay
	C$main.c$172$1_0$27 ==.
;	.\main.c:172: }
	C$main.c$172$1_0$27 ==.
	XG$lcd_init$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ms_delay'
;------------------------------------------------------------
;time                      Allocated to registers r6 r7 
;i                         Allocated to registers r4 r5 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
	G$ms_delay$0$0 ==.
	C$main.c$178$1_0$30 ==.
;	.\main.c:178: void ms_delay(unsigned int time) {
;	-----------------------------------------
;	 function ms_delay
;	-----------------------------------------
_ms_delay:
	mov	r6,dpl
	mov	r7,dph
	C$main.c$184$2_0$30 ==.
;	.\main.c:184: for(i=0;i<time;i++)
	mov	r4,#0x00
	mov	r5,#0x00
00107$:
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jnc	00109$
	C$main.c$185$2_0$30 ==.
;	.\main.c:185: for(j=0;j<1275;j++);            //TODO: Adjust to get 1ms
	mov	r2,#0xfb
	mov	r3,#0x04
00105$:
	dec	r2
	cjne	r2,#0xff,00130$
	dec	r3
00130$:
	mov	a,r2
	orl	a,r3
	jnz	00105$
	C$main.c$184$2_0$30 ==.
;	.\main.c:184: for(i=0;i<time;i++)
	inc	r4
	cjne	r4,#0x00,00107$
	inc	r5
	sjmp	00107$
00109$:
	C$main.c$187$2_0$30 ==.
;	.\main.c:187: }
	C$main.c$187$2_0$30 ==.
	XG$ms_delay$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setup'
;------------------------------------------------------------
	G$setup$0$0 ==.
	C$main.c$205$2_0$33 ==.
;	.\main.c:205: void setup(void)
;	-----------------------------------------
;	 function setup
;	-----------------------------------------
_setup:
	C$main.c$207$1_0$33 ==.
;	.\main.c:207: IE  = 0;                            // Interrupt Enable: Disable all
	mov	_IE,#0x00
	C$main.c$208$1_0$33 ==.
;	.\main.c:208: IP  = 0;                            // Interrupt Priority: Disable all
	mov	_IP,#0x00
	C$main.c$209$1_0$33 ==.
;	.\main.c:209: PSW = 0;                            // Program Status World: Clear
	mov	_PSW,#0x00
	C$main.c$210$1_0$33 ==.
;	.\main.c:210: P0  = 0xff;                         // Port 0: All alternate function Data/Address A0-A7
	mov	_P0,#0xff
	C$main.c$211$1_0$33 ==.
;	.\main.c:211: P1  = 0x00;                         // Port 1: We use as LCD data bus
	mov	_P1,#0x00
	C$main.c$212$1_0$33 ==.
;	.\main.c:212: P2  = 0xff;                         // Port 2: All alternate function Address A8-A15
	mov	_P2,#0xff
	C$main.c$213$1_0$33 ==.
;	.\main.c:213: P3  = 0b11000011;                   // Port 3: We use as mixed function
	mov	_P3,#0xc3
	C$main.c$222$1_0$33 ==.
;	.\main.c:222: led_matrix_da = 0x00;               // Reset LED state
	mov	_led_matrix_da,#0x00
	C$main.c$223$1_0$33 ==.
;	.\main.c:223: led_matrix_db = 0x00;               // Reset LED state
	mov	_led_matrix_db,#0x00
	C$main.c$225$1_0$33 ==.
;	.\main.c:225: set_matrix_status(LED_STATUS, true);
	mov	_set_matrix_status_PARM_2,#0x01
	mov	dpl,#0x08
	lcall	_set_matrix_status
	C$main.c$227$1_0$33 ==.
;	.\main.c:227: update_matrix_da(0x00);
	mov	dpl,#0x00
	lcall	_update_matrix_da
	C$main.c$229$1_0$33 ==.
;	.\main.c:229: update_matrix_db(0x00);
	mov	dpl,#0x00
	lcall	_update_matrix_db
	C$main.c$230$1_0$33 ==.
;	.\main.c:230: }
	C$main.c$230$1_0$33 ==.
	XG$setup$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;state                     Allocated to registers 
;------------------------------------------------------------
	G$main$0$0 ==.
	C$main.c$236$1_0$35 ==.
;	.\main.c:236: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	C$main.c$238$1_0$35 ==.
;	.\main.c:238: setup();        // Setup IO and Registers
	lcall	_setup
	C$main.c$239$1_0$35 ==.
;	.\main.c:239: NOP();
	nop 
	C$main.c$240$1_0$35 ==.
;	.\main.c:240: NOP();
	nop 
	C$main.c$244$1_1$36 ==.
;	.\main.c:244: ms_delay(1000);
	mov	dptr,#0x03e8
	lcall	_ms_delay
	C$main.c$246$1_1$36 ==.
;	.\main.c:246: set_matrix_status(LED_STATUS, state);
	mov	_set_matrix_status_PARM_2,#0x00
	mov	dpl,#0x08
	lcall	_set_matrix_status
	C$main.c$249$1_1$36 ==.
;	.\main.c:249: return 0;
	mov	dptr,#0x0000
	C$main.c$250$1_1$35 ==.
;	.\main.c:250: }
	C$main.c$250$1_1$35 ==.
	XG$main$0$0 ==.
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
