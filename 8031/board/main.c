/**
 * ETEP Led Matrix 8051 Project
 *
 * Main executable.
 */

//#include "main.h"
//#include <stdio.h>
#include <stdio.h>
#include <mcs51/8051.h>
#include <stdbool.h>
#include "common.h"

//#include "library/common.h"
#define TOOLCHAIN SDCC
// #define SDCC 1
#define UART_CLOCK_SOURCE __TIMER_1__

//######################################################################################################################
//# UART.h ###############################################################################################################
//######################################################################################################################


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

//######################################################################################################################
//# UART.c ###############################################################################################################
//######################################################################################################################

// Globals
#ifdef SERIAL_RX_INTERRUPT_ENABLE

// Uart New Line Flag (Set when new line received)
volatile unsigned char uartNewLineFlag = 0;
// UART Read Buffer to store Received Data
volatile unsigned char uartReadBuffer[UART_RX_BUFFER_SIZE];
// Uart Byte Count
volatile unsigned int  uartReadCount    = 0;
// Uart New Line Count
volatile unsigned char uartNewLineCount = 0;
// It holds every new line index
volatile unsigned char uartNewLineIndexes[NEW_LINE_INDEX_BUFFER_SIZE];
// It hold single byte (Last Received)
volatile unsigned char uartReadByte = CHAR_NULL;

#endif


/*** Function    : Serialbegin
**   Parameters  : unsigned long (OscillatorFrequency),unsigned long (Standard BaudRate)
**   Parameters  : unsigned long (OscillatorFrequency),unsigned long (Standard BaudRate)
**   Return      : None
**   Description : It will Set the baud rate for serial communication
**/
void Serialbegin(unsigned long OscillatorFrequency,unsigned long baudRate)
{
    volatile unsigned int autoReloadvalue;

#if UART_CLOCK_SOURCE == __TIMER_1__
    autoReloadvalue =  __baudRate_calc_timer_1(OscillatorFrequency,baudRate);
    TMOD  |= 0x20;
    SCON  |= 0x50;
    TL1    = autoReloadvalue >> 8;
    TH1    = autoReloadvalue;
    TR1    = 1;
#elif UART_CLOCK_SOURCE == __TIMER_2__
    autoReloadvalue=  __baudRate_calc_timer_2(OscillatorFrequency,baudRate);
    T2CON = 0x00;
    T2CON = 0x30;
    SCON  = 0x50;
    RCAP2H = autoReloadvalue >> 8;
    RCAP2L = autoReloadvalue;
    TH2 = autoReloadvalue >> 8;
    TL2 = autoReloadvalue;
    TR2    = 1;
#endif

}

/*** Function    : Serialavailable
**   Parameters  : None
**   Return      : __bit (If byte is available in receive buffer returns 1, else returns 0)
**   Description : It will give the whether Receiver is available or not
**/
unsigned char Serialavailable(void)
{
    return RI;
}


/*** Function    : Serialwrite
**   Parameters  : unsigned char (Single character that will send to UART)
**   Return      : None
**   Description : It will write single character to UART
**/
void Serialwrite(unsigned char Byte)
{
#ifdef SERIAL_RX_INTERRUPT_ENABLE
    EA = 0;
#endif
    SBUF = Byte;
    while(!TI);
    TI   = 0;
#ifdef SERIAL_RX_INTERRUPT_ENABLE
    EA = 1;
#endif
}



/*** Function    : Serialread
**   Parameters  : None
**   Return      : unsigned char
**   Description : It will read single byte from uart
**/
unsigned char Serialread(void)
{
    while(!RI);
    return SBUF;
}

/*** Function    : Serialprint
**   Parameters  : unsigned char *
**   Return      : None
**   Description : It will send the string to UART
**/
void Serialprint(unsigned char *sPtr)
{
    for(;*sPtr!='\0';Serialwrite(*(sPtr++)));
}


/*** Function    : Serialprint
**   Parameters  : unsigned char *
**   Return      : None
**   Description : It will send the string to UART
**/
void SerialIntWrite(signed int num)
{
    char *tempBuffer;
    sprintf(tempBuffer,"%d",num);
    Serialprint((unsigned char*)tempBuffer);
}


#ifdef SERIAL_RX_INTERRUPT_ENABLE

/*** Function    : setSerialinterrupt
**   Parameters  : None
**   Return      : None
**   Description : It sets the Serial Interrupt
**/
void setSerialinterrupt(void)
{
    ES = 1;
    EA = 1;
}

/*** Function    : Serialflush
**   Parameters  : None
**   Return      : None
**   Description : It clears the UART buffer,Index Buffer and Flags
**/
void Serialflush(void)
{
    unsigned char i;
    uartReadCount    = 0;           // Clear Uart Byte Count
    uartNewLineFlag  = 0;           // Clear New Line Flag
    uartNewLineCount = 0;           // Clear New Line Count
    uartReadByte     = CHAR_NULL;   // Clear Last Read Byte

// Flush New Line Index Buffer
    for(i=0;i<=NEW_LINE_INDEX_BUFFER_SIZE;i++)
        uartNewLineIndexes[i] = CHAR_NULL;

// Flush Uart Read Buffer
    for(i=0;i<=UART_RX_BUFFER_SIZE;i++)
        uartReadBuffer[i] = CHAR_NULL;
}

/*** Function    : SerialReadByteFlush
**   Parameters  : None
**   Return      : None
**   Description : It clears the UART Read Byte (uartReadByte)
**/
void SerialReadByteFlush(void)
{
    uartReadByte     = CHAR_NULL;   // Clear Last Read Byte
}

/*** Function    : uartISR
**   Parameters  : None
**   Return      : None
**   Description : It is ISR for UART Receive (It will trigger if any byte is received)
**/
//
//void uartISR(void) __interrupt (4)
//{
//    EA = 0;                                      // Disable Global Interrupt Flag
//    RI = 0;                                      // Clear RI flag
//    uartReadByte = SBUF;                         // Read Byte from SBUF
//    uartReadBuffer[uartReadCount++] = uartReadByte;
//    if(uartReadByte == LF)
//    {
//        uartNewLineIndexes[uartNewLineCount] = uartReadCount;
//        uartNewLineCount++;
//        uartNewLineFlag = 1;
//    }
//    EA = 1;                                     // Everything is done , Now Enable the Global Interrupt
//}

#endif

//######################################################################################################################
//######################################################################################################################

//== MEMORY MAP ================================================================

// EPROM: Will be used 16Kb or 8Kb EPROM (UV Erasable like CI 27128)
//        8031 don't have programmable internal memory, so, on boot will go directly on external program memory,
//        and to reinforce it EA# pin is in GND.
// Address Ports: A0-A13 (16k) or A0-A12(8K)
// Address Range: 0x0000-0x3FFF or 0x0000-0x1FFF
// OE# <= PSEN#
// CE# <= CS_EPROM#
// CS_EPROM# = (A15 OR A14)             // It's OR gate, A14:LOW and A15:LOW = CS_EPROM:LOW

// RAM: (CI 6264) 8Kb External RAM Memory
// Address Ports: A0-A12(8K)
// Address Range: 0x0000-0x1FFF
// CS1# <= GND
// CS2  <= CS_RAM
// OE#  <= RD#
// WE#  <= WR#
// CS_RAM = (A15 NOR A14)               // It's NOR gate, A14:LOW and A15:LOW = CS_RAM:HIGH

// EEPROM: (CI 28C64C) 8Kb EEPROM/Flash will be used to store external program come from serial and some persistent data.
//         For start development, wee can use external EEPROM writer and place on EPROM socket to test program.
//         There special signal port combination to access this memory as Program Memory and RAM Memory, so,
//         we will write as RAM and execute as Program.
// Address Ports: A0-A12(8K)
// Address Range: 0x4000-0x5FFF
// OE# <= RDPSEN#
// CE# <= CS_EEPROM#
// WE# <= WR#
// RDPSEN#    = (PSEN# AND RD#)         // Its AND gate, whenever PSEN:LOW or RD:LOW = RDPSEN:LOW
// CS_EEPROM# = (A14 NAND ¬A15)         // Its NAND gate, where A15 has NOT gate, A14:HIGH and A15:LOW = CS_EPROM:LOW

//== DATA LATCHES ============================================================
// Matrix latches is accessible in high address as RAM, need Write operations (WR#)
// These port controls is all on A15:HIGH or address above 0x8000
// WR_A15 = (A15 NAND ¬WR#)
__xdata __at (0xB000) unsigned char DATA_LATCH_MATRIX;      // WR_A15:LOW, A14:LOW , A13:HIGH, A12:HIGH = MATRIX_DATA:HIGH
__xdata __at (0xD000) unsigned char DATA_LATCH_LED;         // WR_A15:LOW, A14:HIGH, A13:LOW , A12:HIGH = LED_DATA:HIGH
__xdata __at (0xE000) unsigned char DATA_LATCH_LCD;         // WR_A15:LOW, A14:HIGH, A13:HIGH, A12:LOW  = LCD_DATA:HIGH

//== INTERRUPTS ================================================================

#define INTERRUPT_EXTERNAL_0    0x03    // 0
#define INTERRUPT_TIMER_0       0x0B    // 1
#define INTERRUPT_EXTERNAL_1    0x13    // 2
#define INTERRUPT_TIMER_1       0x1b    // 3
#define INTERRUPT_SERIAL        0x23    // 4

//== PORTS MAP =================================================================

//-- PORT P1 -------------------------------------------------------------------
// LCD Controls
#define LCD_RS    P1_0                  // LCD Register Select: Data(High)/Instruction(LOW)
#define LCD_RW    P1_1                  // LCD Read(HIGH)/Write(LOW)
#define LCD_E     P1_2                  // LCD Enable
// P1.3                                 Not used
// P1.4                                 Not used
// P1.5                                 Not used
// P1.6                                 Not used
// P1.7                                 Not used

//-- PORT P3 -------------------------------------------------------------------
// P3.0 => RxD                          Serial Data Read
// P3.1 => TxD                          Serial Data Transmit
// ROTATORY ENCODER
#define ROT_CLOCK   P3_2                // ROTATORY: [INTERRUPT 0] Clock
#define ROT_SWITCH  P3_3                // ROTATORY: [INTERRUPT 1] Switch
#define ROT_DATA    P3_4                // ROTATORY: Data
// P3.5 => TIMER1                       Not used
// P3.6 => WR#                          External RAM Write
// P3.7 => WR#                          External RAM Read

//== STATUS LED'S ==============================================================
// There 7 LED's on leds on LED_DATA latch

#define LED_MATRIX      0x01            // [0b00000001] YELLOW: Matrix routine is running
#define LED_ENC_INPUT   0x02            // [0b00000010] YELLOW: Encode input (clock or switch)
#define LED_TERMINAL    0x04            // [0b00000100] YELLOW: Serial terminal communication
#define LED_WAIT_PROG   0x08            // [0b00001000] YELLOW: Waiting/Write program from serial.
#define LED_STATUS      0x10            // [0b00010000] GREEN: Board boot status OK
#define LED_USER_PROG   0x20            // [0b00100000] GREEN: Started user program
#define LED_INTERRUPT   0x40            // [0b01000000] RED: On any interrupt started
//                      0x80            // RED: Last LED is connected to reset button.

//== SERIAL ====================================================================
#define OSC_FREQ            11100000
#define BAUD_RATE           9600

#define NEW_LINE_THRESHOLD  3

//== GLOBAL VARIABLES ==========================================================

unsigned char led_status_map = 0x00;    // 8 Bytes: Keep LED states to update LED_DATA

//== SPECIAL FUNCTIONS =========================================================
// This a single Assemble Instruction NOP
// On 8051 Family this will take 12 clock cycles.
#define NOP() \
    __asm     \
        nop   \
    __endasm  \

//== Matrix Functions ==========================================================

///**
// * Update Matrix A and Led States
// * @param value
// */
//void update_matrix_da(unsigned char value)
//{
//    MATRIX_DA = value | led_matrix_da;
//}
//
///**
// * Update Matrix B and Led States
// * @param value
// */
//void update_matrix_db(unsigned char value)
//{
//    MATRIX_DB = value | led_matrix_db;
//}

//== Others Functions ==========================================================

/**
 *
 * @param unsigned char led
 * @param bool state
 * @return void
 */
void set_led_status(unsigned char led, bool state)
{
    if (state == false) {
        led_status_map &= ~led;         // To disable a bit, use AND with complement bits (inverted)
    } else {
        led_status_map |= led;          //  To enable a bit, use just OR
    }
    DATA_LATCH_LED = led_status_map;
}


/**
 * Function for creating delay in milliseconds.
 * Current Clock 11.1 MHz
 * @param time
 */
void ms_delay(unsigned int time) {

    // Must calculate from CPU clock/cristal
    //CPU_CLOCK
    // Clock: 12MHz = 83.333ns
    // Cycles per loop for = 12 ~= 999,96ms ~= 1us
    unsigned i,j,one_ms ;
    one_ms = 0; //1275
    time   = 0;
    for(i=0;i<time;i++)
        for(j=0;j<one_ms;j++);            //TODO: Adjust to get 1ms
//    for(i=0;i<time;i++)
//        for(j=0;j<1275;j++);            //TODO: Adjust to get 1ms

}

//== LCD Functions =============================================================
//TODO: Move to external lib
// FROM: https://circuitdigest.com/microcontroller-projects/lcd-interfacing-with-8051-microcontroller-89s52
//
//#define display_port P2      //Data pins connected to port 2 on microcontroller
//sbit rs = P3^2;  //RS pin connected to pin 2 of port 3
//sbit rw = P3^3;  // RW pin connected to pin 3 of port 3
//sbit e =  P3^4;  //E pin connected to pin 4 of port 3



/**
 * Function to send command instruction to LCD
 * @param command
 */
void lcd_cmd(unsigned char command)
{
    DATA_LATCH_LCD = command;
    LCD_RS   = 0;
    LCD_RW   = 0;
    LCD_E    = 1;
    //ms_delay(1);
    LCD_E    = 0;
}

/**
 * Function to send display data to LCD
 * @param disp_data
 */
void lcd_data(unsigned char disp_data)
{
    DATA_LATCH_LCD = disp_data;
    LCD_RS   = 1;
    LCD_RW   = 0;
    LCD_E    = 1;
    //ms_delay(1);
    LCD_E    = 0;
}

/**
 * Function to prepare the LCD  and get it ready
 */
void lcd_init(void)
{
    lcd_cmd(0x38);  // for using 2 lines and 5X7 matrix of LCD
    //ms_delay(10);
    lcd_cmd(0x0F);  // turn display ON, cursor blinking
    //ms_delay(10);
    lcd_cmd(0x01);  // clear screen
    //ms_delay(10);
    //lcd_cmd(0x81);  // bring cursor to position 1 of line 1
    lcd_cmd(0x80);  // bring cursor to position 0 of line 1
    //ms_delay(10);
    NOP();  // This fix some randon behavior on compiler ??
}


//== Tests =====================================================================
// TODO: Make serial implementation
//int putchar(int c) {
//  c = c; // Filling sausage
//  //fake function
//  return 1;
//}


//== Interrupts ================================================================

//void serialHandler(void) __interrupt(SI0_VECTOR)  {
//    __critical {
//        int i=32;
//        set_led_status(LED_INTERRUPT, true);
//        // Handle terminal
//    }
//}

//== Main Functions ============================================================


/**
 * Setup CPU IO and Registers
 * @return void
 */
void setup(void)
{
    IE  = 0;                            // Interrupt Enable: Disable all
    EA  = 0;
    IP  = 0;                            // Interrupt Priority: Disable all
    PSW = 0;                            // Program Status World: Clear
    P0  = 0xFF;                         // Port 0: All alternate function Data/Address A0-A7
    P1  = 0x00;                         // Port 1: We use as mixed function I/O: LCD Control
    P2  = 0xFF;                         // Port 2: All alternate function Address A8-A15
    P3  = 0xFF;                         // Port 3: We use secondary functions like Interrupts

    //   P1.0 - RxD     Alternate
    //   P1.1 - TxD     Alternate
    //   P1.2 - NC
    //   P1.3 - LCD_RS  Buss
    //   P1.4 - LCD_RW  Buss
    //   P1.5 - LCD_E   Buss
    //   P1.6 - WR#     Alternate
    //   P1.7 - RD#     Alternate

//    led_matrix_da = 0x00;               // Reset LED state
//    led_matrix_db = 0x00;               // Reset LED state
//    // Set LED Status ON
//    set_matrix_status(LED_STATUS, true);
//    // Update Matrix Latch A
//    update_matrix_da(0x00);
//    // Update Matrix Latch A
//    update_matrix_db(0x00);
    DATA_LATCH_MATRIX = 0x00;
    DATA_LATCH_LED    = 0x00;
    DATA_LATCH_LCD    = 0x00;

    lcd_init();

//    volatile unsigned int autoReloadvalue = 200;
//    TMOD  |= 0x20;
//    SCON  |= 0x50;
//    TL1    = autoReloadvalue >> 8;
//    TH1    = autoReloadvalue;
//    TR1    = 1;

    //SetOsc(OSC_FREQ);             // Set Oscillator Freq
    //Serialbegin(OSC_FREQ, BAUD_RATE);       // Set Baud Rate
//    Serialflush();                // Clear the buffers
//    Serialprint("uart test\n\r"); // Print a string
//    setSerialinterrupt();         // Enable Serial Interrupt
}

/**
 * Main function call
 * @return int
 */
int main(void)
{
//    __asm
//        mov	a,#0x6c
//        mov	sp,a
//    __endasm;
    NOP();
    setup();        // Setup IO and Registers
    // Main status start
    set_led_status(LED_STATUS, true);

    //  //unsigned char a[15]="CIRCUIT DIGEST";    //string of 14 characters with a null terminator.
    unsigned char a[17]="ETEP MATRIX 8031";    //string of 14 characters with a null terminator.
    int l=0;
    while(a[l] != '\0') // searching the null terminator in the sentence
    {
        lcd_data(a[l]);
        l++;
        //ms_delay(50);
    }



//    NOP();
//    NOP();
//    printf("Hello, World from C!");
    bool state = true;
    for(;;) {
        NOP();
        // Set LED Status ON and OFF each loop
//        set_led_status(LED_STATUS, state);
//        ms_delay(100);
//        set_led_status(LED_BIT_USER , state);
//        ms_delay(100);
//        set_led_status(LED_MATRIX, state);
//        ms_delay(100);
//        state = ~state;
//        MATRIX_DA = 0x08;
//        ms_delay(100);
//        MATRIX_DA = 0x88;
//        ms_delay(100);
//        MATRIX_DB = 0x08;
//        ms_delay(100);
//        MATRIX_DA = 0x00;
//        MATRIX_DB = 0x00;
//        ms_delay(100);
//        set_matrix_status(LED_STATUS, state);
//        state = ~state;
//        set_led_status(LED_MATRIX, true);
//        ms_delay(100);
//        set_led_status(LED_ENC_INPUT, true);
//        ms_delay(100);
//        set_led_status(LED_TERMINAL, true);
//        ms_delay(100);
//        set_led_status(LED_WAIT_PROG, true);
//        ms_delay(100);
//        set_led_status(LED_STATUS, true);
//        ms_delay(100);
//        set_led_status(LED_USER_PROG, true);
//        ms_delay(100);
//        set_led_status(LED_INTERRUPT, true);
//
//        ms_delay(100);
//        DATA_LATCH_LED = 0x00;
//        led_status_map = 0x00;
        //ms_delay(100);
        //set_led_status(LED_INTERRUPT, false);

//        if (uartNewLineFlag > 1) {
//            set_led_status(LED_INTERRUPT, true);
//// //            Serialprint(uartReadBuffer);
//// //            Serialflush();
//        } else {
//            set_led_status(LED_INTERRUPT, false);
//        }
    }
    // return 0;
}


