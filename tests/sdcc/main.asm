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
	.globl _main
	.globl _setup
	.globl _ms_delay
	.globl _set_matrix_status
	.globl _update_matrix_db
	.globl _update_matrix_da
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
_led_matrix_da::
	.ds 1
_led_matrix_db::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_set_matrix_status_PARM_2:
	.ds 1
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
_MATRIX_DA	=	0xa000
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
;	../../main.c:74: unsigned char led_matrix_da = 0x00;     // 8 Bytes: Keep LED state on latch MATRIX_DA
;	genAssign
	mov	_led_matrix_da,#0x00
;	../../main.c:75: unsigned char led_matrix_db = 0x00;     // 8 Bytes: Keep LED state on latch MATRIX_DB
;	genAssign
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
;Allocation info for local variables in function 'update_matrix_da'
;------------------------------------------------------------
;value                     Allocated to registers r7 
;------------------------------------------------------------
;	../../main.c:92: void update_matrix_da(unsigned char value)
;	-----------------------------------------
;	 function update_matrix_da
;	-----------------------------------------
_update_matrix_da:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	genReceive
	mov	r7,dpl
;	../../main.c:94: MATRIX_DA = value | led_matrix_da;
;	genOr
	mov	dptr,#_MATRIX_DA
	mov	a,_led_matrix_da
	orl	a,r7
	movx	@dptr,a
;	Peephole 500	removed redundant label 00101$
;	../../main.c:95: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_matrix_db'
;------------------------------------------------------------
;value                     Allocated to registers r7 
;------------------------------------------------------------
;	../../main.c:101: void update_matrix_db(unsigned char value)
;	-----------------------------------------
;	 function update_matrix_db
;	-----------------------------------------
_update_matrix_db:
;	genReceive
	mov	r7,dpl
;	../../main.c:103: MATRIX_DB = value | led_matrix_db;
;	genOr
	mov	dptr,#_MATRIX_DB
	mov	a,_led_matrix_db
	orl	a,r7
	movx	@dptr,a
;	Peephole 500	removed redundant label 00101$
;	../../main.c:104: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_matrix_status'
;------------------------------------------------------------
;state                     Allocated with name '_set_matrix_status_PARM_2'
;led                       Allocated to registers r7 
;led_byte                  Allocated to registers r6 
;------------------------------------------------------------
;	../../main.c:112: void set_matrix_status(unsigned char led, bool state)
;	-----------------------------------------
;	 function set_matrix_status
;	-----------------------------------------
_set_matrix_status:
;	genReceive
	mov	r7,dpl
;	../../main.c:114: unsigned char led_byte = 0;
;	genAssign
	mov	r6,#0x00
;	../../main.c:116: if      (led == LED_STATUS) led_byte = LED_BIT_STATUS;
;	genCmpEq
;	gencjneshort
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 198.b	optimized misc jump sequence
	cjne	r7,#0x01,00107$
;	Peephole 200.b	removed redundant sjmp
;	Peephole 500	removed redundant label 00144$
;	Peephole 500	removed redundant label 00145$
;	genAssign
	mov	r6,#0x08
;	Peephole 112.b	changed ljmp to sjmp
	sjmp	00108$
00107$:
;	../../main.c:117: else if (led == LED_USER)   led_byte = LED_BIT_USER;
;	genCmpEq
;	gencjneshort
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 198.b	optimized misc jump sequence
	cjne	r7,#0x02,00104$
;	Peephole 200.b	removed redundant sjmp
;	Peephole 500	removed redundant label 00146$
;	Peephole 500	removed redundant label 00147$
;	genAssign
	mov	r6,#0x80
;	Peephole 112.b	changed ljmp to sjmp
	sjmp	00108$
00104$:
;	../../main.c:118: else if (led == LED_MATRIX) led_byte = LED_BIT_MATRIX;
;	genCmpEq
;	gencjneshort
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 198.b	optimized misc jump sequence
	cjne	r7,#0x10,00108$
;	Peephole 200.b	removed redundant sjmp
;	Peephole 500	removed redundant label 00148$
;	Peephole 500	removed redundant label 00149$
;	genAssign
	mov	r6,#0x08
00108$:
;	../../main.c:120: if (state == false) {
;	genIfx
	mov	a,_set_matrix_status_PARM_2
;	genIfxJump
;	Peephole 108.b	removed ljmp by inverse jump logic
	jnz	00116$
;	Peephole 500	removed redundant label 00150$
;	../../main.c:121: if (led == LED_BIT_MATRIX) {                        // LED_BIT_MATRIX is on led_matrix_db
;	genCmpEq
;	gencjneshort
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 198.b	optimized misc jump sequence
	cjne	r7,#0x08,00110$
;	Peephole 200.b	removed redundant sjmp
;	Peephole 500	removed redundant label 00151$
;	Peephole 500	removed redundant label 00152$
;	../../main.c:122: led_matrix_db = led_matrix_db & ~led_byte;      // To disable a bit, use AND with complement bits (inverted)
;	genCpl
	mov	a,r6
	cpl	a
;	genAnd
;	Peephole 302	mov r5,a removed
;	Peephole 105.a	removed redundant mov
	anl	_led_matrix_db,a
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 251.b	replaced sjmp 00118$ to ret with ret
	ret
00110$:
;	../../main.c:124: led_matrix_da = led_matrix_da & ~led_byte;      // To disable a bit, use AND with complement bits (inverted)
;	genCpl
	mov	a,r6
	cpl	a
;	genAnd
;	Peephole 302	mov r5,a removed
;	Peephole 105.a	removed redundant mov
	anl	_led_matrix_da,a
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 251.b	replaced sjmp 00118$ to ret with ret
	ret
00116$:
;	../../main.c:127: if (led == LED_BIT_MATRIX) {                        // LED_BIT_MATRIX is on led_matrix_db
;	genCmpEq
;	gencjneshort
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 198.b	optimized misc jump sequence
	cjne	r7,#0x08,00113$
;	Peephole 200.b	removed redundant sjmp
;	Peephole 500	removed redundant label 00153$
;	Peephole 500	removed redundant label 00154$
;	../../main.c:128: led_matrix_db = led_matrix_db | led_byte;       //  To enable a bit, use just OR
;	genOr
	mov	a,r6
	orl	_led_matrix_db,a
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 251.b	replaced sjmp 00118$ to ret with ret
	ret
00113$:
;	../../main.c:130: led_matrix_da = led_matrix_da | led_byte;       // To enable a bit, use just OR
;	genOr
	mov	a,r6
	orl	_led_matrix_da,a
;	Peephole 500	removed redundant label 00118$
;	../../main.c:133: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ms_delay'
;------------------------------------------------------------
;time                      Allocated to registers r6 r7 
;i                         Allocated to registers r4 r5 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	../../main.c:195: void ms_delay(unsigned int time) {
;	-----------------------------------------
;	 function ms_delay
;	-----------------------------------------
_ms_delay:
;	genReceive
	mov	r6,dpl
	mov	r7,dph
;	../../main.c:201: for(i=0;i<time;i++)
;	genAssign
	mov	r4,#0x00
	mov	r5,#0x00
00107$:
;	genCmpLt
;	genCmp
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
;	genIfxJump
;	Peephole 108.a	removed ljmp by inverse jump logic
	jnc	00109$
;	Peephole 500	removed redundant label 00129$
;	../../main.c:202: for(j=0;j<1275;j++);            //TODO: Adjust to get 1ms
;	genAssign
	mov	r2,#0xfb
	mov	r3,#0x04
00105$:
;	genMinus
;	genMinusDec
	dec	r2
	cjne	r2,#0xff,00130$
	dec	r3
00130$:
;	genIfx
	mov	a,r2
	orl	a,r3
;	genIfxJump
;	Peephole 108.b	removed ljmp by inverse jump logic
	jnz	00105$
;	Peephole 500	removed redundant label 00131$
;	../../main.c:201: for(i=0;i<time;i++)
;	genPlus
;	genPlusIncr
	inc	r4
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 243	avoided branch to sjmp
	cjne	r4,#0x00,00107$
	inc	r5
;	Peephole 500	removed redundant label 00132$
	sjmp	00107$
00109$:
;	../../main.c:204: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setup'
;------------------------------------------------------------
;	../../main.c:222: void setup(void)
;	-----------------------------------------
;	 function setup
;	-----------------------------------------
_setup:
;	../../main.c:224: IE  = 0;                            // Interrupt Enable: Disable all
;	genAssign
	mov	_IE,#0x00
;	../../main.c:225: IP  = 0;                            // Interrupt Priority: Disable all
;	genAssign
	mov	_IP,#0x00
;	../../main.c:226: PSW = 0;                            // Program Status World: Clear
;	genAssign
	mov	_PSW,#0x00
;	../../main.c:227: P0  = 0xFF;                         // Port 0: All alternate function Data/Address A0-A7
;	genAssign
	mov	_P0,#0xff
;	../../main.c:228: P1  = 0x00;                         // Port 1: We use as LCD data bus
;	genAssign
	mov	_P1,#0x00
;	../../main.c:229: P2  = 0xFF;                         // Port 2: All alternate function Address A8-A15
;	genAssign
	mov	_P2,#0xff
;	../../main.c:230: P3  = 0xC3;                         // Port 3: We use as mixed function: 0b11000011 = 0xC3;
;	genAssign
	mov	_P3,#0xc3
;	../../main.c:248: MATRIX_DA = 0x00;
;	genAssign
	mov	dptr,#_MATRIX_DA
;	Peephole 181	changed mov to clr
	clr	a
	movx	@dptr,a
;	../../main.c:249: MATRIX_DB = 0x00;
;	genAssign
	mov	dptr,#_MATRIX_DB
;	genFromRTrack acc==0x00
	movx	@dptr,a
;	Peephole 500	removed redundant label 00101$
;	../../main.c:251: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;state                     Allocated to registers 
;------------------------------------------------------------
;	../../main.c:257: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	../../main.c:259: setup();        // Setup IO and Registers
;	genCall
	lcall	_setup
;	../../main.c:263: bool state = false;
00102$:
;	../../main.c:266: MATRIX_DA = 0x08;
;	genAssign
	mov	dptr,#_MATRIX_DA
	mov	a,#0x08
	movx	@dptr,a
;	../../main.c:267: ms_delay(10);
;	genCall
;	Peephole 182.b	used 16 bit load of dptr
	mov	dptr,#0x000a
	lcall	_ms_delay
;	../../main.c:268: MATRIX_DA = 0x88;
;	genAssign
	mov	dptr,#_MATRIX_DA
	mov	a,#0x88
	movx	@dptr,a
;	../../main.c:269: ms_delay(10);
;	genCall
;	Peephole 182.b	used 16 bit load of dptr
	mov	dptr,#0x000a
	lcall	_ms_delay
;	../../main.c:270: MATRIX_DA = 0x00;
;	genAssign
	mov	dptr,#_MATRIX_DA
;	Peephole 181	changed mov to clr
	clr	a
	movx	@dptr,a
;	../../main.c:271: ms_delay(10);
;	genCall
;	Peephole 182.b	used 16 bit load of dptr
	mov	dptr,#0x000a
	lcall	_ms_delay
;	Peephole 112.b	changed ljmp to sjmp
;	../../main.c:276: }
	sjmp	00102$
;	Peephole 259.a	removed redundant label 00104$ and ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
