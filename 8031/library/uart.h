//
// Created by haroldo on 24/10/2023.
//

#ifndef INC_8031_MATRIX_UART_H
#define INC_8031_MATRIX_UART_H



#ifndef __uart_h__
#define __uart_h__

// UART Clock Source
#define __TIMER_1__                  0
#define __TIMER_2__                  1

#ifndef UART_CLOCK_SOURCE
#define UART_CLOCK_SOURCE            __TIMER_2__
#endif

#ifndef SDCC
#define SDCC 0
#endif
#ifndef KEIL
#define KEIL 1
#endif

#ifndef TOOLCHAIN
#define TOOLCHAIN SDCC
#endif

#include <stdio.h>            // Standard input/output file used in Serialintwrite (sprintf)

// Serial Interrupt Enable
#define SERIAL_RX_INTERRUPT_ENABLE

// UART Buffer Size
#define UART_RX_BUFFER_SIZE          20

// New Line Index Buffer Size
#define NEW_LINE_INDEX_BUFFER_SIZE   10

// BaudRate Calculation
#define  __baudRate_calc_timer_1(__freq,__baud) (256 - ((__freq/384) / __baud))
#define  __baudRate_calc_timer_2(__freq,__baud) (65536 - (__freq/(__baud*32)))

// ASCII Code Definitions
#define NUL 0x00                          // Null Character
#define SOH 0x01                          // Start Of Heading
#define STX 0x02                          // Start Of Text
#define ETX 0x03                          // End Of Text
#define EOT 0x04                          // End of Transmission
#define ENQ 0x05                          // Enquiry
#define ACK 0x06                          // Acknowledgement
#define BEL 0x07                          // Bell
#define BS  0x08                          // Back Space
#define TAB 0x09                          // Horizontal TAB
#define LF  0x0A                          // Line Feed (Newline)
#define VT  0x0B                          // Vertical TAB
#define NP  0x0C                          // New Page
#define CR  0x0D                          // Carriage Return
#define SO  0x0E                          // Shift OUT
#define SI  0x0F                          // Shift IN
#define DLE 0x10                          // Data Link Escape
#define DC1 0x11                          // Device Control 1
#define DC2 0x12                          // Device Control 2
#define DC3 0x13                          // Device Control 3
#define DC4 0x14                          // Device Control 4
#define NAK 0x15                          // Negative Acknowledgement
#define SYN 0x16                          // Synchronous Idle
#define ETB 0x17                          // End of Trans. Block
#define CAN 0x18                          // Cancel
#define EM  0x19                          // End of Medium
#define SUB 0x1A                          // Substitute
#define ESC 0x1B                          // Escape
#define FS  0x1C                          // File Seperator
#define GS  0x1D                          // Group Seperator
#define RS  0x1E                          // Record Seperator
#define US  0x1F                          // Unit Seperator

#define CHAR_NULL '\0'

/***************** Prototypes ****************************/
extern void           Serialbegin(unsigned long,unsigned long);
extern unsigned char Serialavailable(void);
extern void           Serialwrite(unsigned char);
extern void           Serialprint(unsigned char *);
extern unsigned char  Serialread(void);
extern void           SerialIntWrite(signed int);
extern void           SetOsc(unsigned long);


#ifdef SERIAL_RX_INTERRUPT_ENABLE

/*extern void          uartISR(void) __interrupt (4);*/
extern void          setSerialinterrupt(void);
extern void          Serialflush(void);
extern volatile unsigned char          uartNewLineFlag;
extern volatile unsigned char          uartReadByte;
extern volatile unsigned char          uartReadBuffer[UART_RX_BUFFER_SIZE];
extern volatile unsigned int           uartReadCount;
extern volatile unsigned char          uartNewLineCount;
extern volatile unsigned char          uartNewLineIndexes[NEW_LINE_INDEX_BUFFER_SIZE];
#endif

#endif


#endif //INC_8031_MATRIX_UART_H
