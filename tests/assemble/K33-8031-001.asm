; 
; Author: Haroldo Mitsumi Murata <kakaroto33@gmail.com>
; Since:  2023-08-22

; This is a new Assembly for 8031 to old ETEP project fom 1996.
; With board remake, we changed logics address and simplify access and output.

; Most script is based on function of Paul's site
; https://www.pjrc.com/tech/8051/index.html

; Bla blaba

;##############################################################################
;## Constants and configurations ##############################################
;##############################################################################

.equ	base, 0x0000		; Base address of program
;.equ	vector, 0x2000		; location to LJMP interrupt vectors
.equ    main_address, 0x64		; Main loop

; These symbols configure paulmon2's internal memory usage.
; It is usually not a good idea to change these unless you
; know that you really have to.

.equ	psw_init, 0		;value for psw (which reg bank to use)
.equ	dnld_parm, 0x10		;block of 16 bytes for download
.equ	stack, 0x30		;location of the stack
.equ	baud_save, 0x78		;save baud for warm boot, 4 bytes


.equ    matrix_da_address, 0xc000   ; Matrix A  WR# + A15 + A14 + A13#
.equ    matrix_db_address, 0xa000   ; Matrix B  WR# + A15 + A14# + A13

; Boot sequence
	.org	base		; start on base address
	ljmp	poweron		; reset vector

;	.org	base+3      ; last command used 3 opcodes
;	ljmp	vector+3	; ext int0 vector

;##############################################################################
;## System Functions ##########################################################
;##############################################################################




main:
	.org	main_address
	mov	r7, #0b00001000                 ; LED_STATUS = D3
	acall	set_matrix_a
	acall	delay

	mov	r7, #0x80                       ; LED_USER = D8
	acall	set_matrix_a
	acall	delay

	mov r7, #0x00
    acall	set_matrix_a                ; Clear

	mov	r7, #0x08                       ; LED_MATRIX = D3
	acall	set_matrix_b
    acall	delay

    mov r7, #0x00
    acall	set_matrix_b
	acall	delay

	mov	r7, #0x08                       ; LED_STATUS = D3
    acall	set_matrix_a
    acall	delay
    mov	r7, #0x88                       ; LED_USER = D8
    acall	set_matrix_a
    acall	delay
    mov	r7, #0x08                       ; LED_MATRIX = D3
    acall	set_matrix_b
    acall	delay
    mov r7, #0x00
    acall	set_matrix_a
    acall	set_matrix_b
    acall	delay

	ljmp    main_address


intr_return:
	reti

poweron:
	clr	a
	;mov	p3, 0x00
	mov	ie, a		;all interrupts off
	mov	ip, a
	mov	psw, #psw_init
	;clear any interrupt status, just in case the user put
	;"ljmp 0" inside their interrupt service code.
	;acall	intr_return
	;acall	intr_return
	cpl	a
	mov	p0, a           ; 0xff  Port 0: All alternate function Data/Address A0-A7
	mov	p2, a           ; 0xff  Port 2: All alternate function Address A8-A15
	clr	a
	mov	p1, a           ; 0x00  Port 1: We use as LCD data bus
	mov a, #0xc3         ; 0b11000011
	mov	p3, a           ; 0xc3  Port 3: We use as mixed function

    ;//   P3.0 - RxD     Alternate
    ;//   P3.1 - TxD     Alternate
    ;//   P3.2 - NC
    ;//   P3.3 - LCD_RS  Buss
    ;//   P3.4 - LCD_RW  Buss
    ;//   P3.5 - LCD_E   Buss
    ;//   P3.6 - WR#     Alternate
    ;//   P3.7 - RD#     Alternate

    mov r7, #0x00
  	acall	set_matrix_a    ; Clear latch matrix a
  	acall	set_matrix_b    ; Clear latch matrix b


	ljmp    main_address

	;delay for a number of ms (specified by acc)
delay:
	mov	r0, #200
dly2:	mov	r1, #230		;#230
dly3:	nop
	nop
	nop			;6 NOPs + DJNZ is 4.34 us
	nop			;with the 22.1184 MHz crystal
	nop
	nop
	djnz	r1, dly3	;repeat 230 times for 1 ms
	djnz	r0, dly2	;repeat for specified # of ms
	ret


set_matrix_a:
	mov	  dptr, #matrix_da_address
	mov   a, r7
	movx  @dptr, a
	ret

set_matrix_b:
    mov	  dptr, #matrix_db_address
    mov   a, r7
	movx  @dptr, a
	ret

;END
