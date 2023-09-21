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


.equ    status_address, 0x8000

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
	mov	a, #85
	acall	set_status
	mov	a, #100
	acall	delay
	mov	a, #170
	acall	set_status
	mov	a, #100
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
	mov	p0, a
	mov	p1, a
	mov	p2, a
	mov	p3, a
	ljmp    main_address

	;delay for a number of ms (specified by acc)
delay:
	mov	r0, a
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


set_status:
	mov	dptr, #status_address
	movx	@dptr, a
	ret


;END
