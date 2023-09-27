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

//== LCD PORTS =================================================================
// Data will com from latch
#define LCD_RS    P1_0                  // LCD Register Select: Data(High)/Instruction(LOW)
#define LCD_RW    P1_1                  // LCD Read(HIGH)/Write(LOW)
#define LCD_E     P1_2                  // LCD Enable

//== INPUT: ROTATORY ENCODER ===================================================
#define ROT_CLOCK   P3_0                // ROTATORY: [INTERRUPT 0] Clock
#define ROT_SWITCH  P3_1                // ROTATORY: [INTERRUPT 1] Switch
#define ROT_DATA    P3_2                // ROTATORY: Data

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
//void lcd_cmd(unsigned char command)
//{
//    LCD_DATA = command;
//    LCD_RS   = 0;
//    LCD_RW   = 0;
//    LCD_E    = 1;
//    ms_delay(1);
//    LCD_E    = 0;
//}

/**
 * Function to send display data to LCD
 * @param disp_data
 */
//void lcd_data(unsigned char disp_data)
//{
//    LCD_DATA = disp_data;
//    LCD_RS   = 1;
//    LCD_RW   = 0;
//    LCD_E    = 1;
//    ms_delay(1);
//    LCD_E    = 0;
//}

/**
 * Function to prepare the LCD  and get it ready
 */
//void lcd_init(void)
//{
//    lcd_cmd(0x38);  // for using 2 lines and 5X7 matrix of LCD
//    ms_delay(10);
//    lcd_cmd(0x0F);  // turn display ON, cursor blinking
//    ms_delay(10);
//    lcd_cmd(0x01);  //clear screen
//    ms_delay(10);
//    lcd_cmd(0x81);  // bring cursor to position 1 of line 1
//    ms_delay(10);
//}

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
    unsigned i,j ;
    for(i=0;i<time;i++)
        for(j=0;j<1275;j++);            //TODO: Adjust to get 1ms

}

//== Tests =====================================================================
// TODO: Make serial implementation
//int putchar(int c) {
//  c = c; // Filling sausage
//  //fake function
//  return 1;
//}


//== Main Functions =============================================================


/**
 * Setup CPU IO and Registers
 * @return void
 */
void setup(void)
{
    IE  = 0;                            // Interrupt Enable: Disable all
    IP  = 0;                            // Interrupt Priority: Disable all
    PSW = 0;                            // Program Status World: Clear
    P0  = 0xFF;                         // Port 0: All alternate function Data/Address A0-A7
    P1  = 0x00;                         // Port 1: We use as LCD data bus
    P2  = 0xFF;                         // Port 2: All alternate function Address A8-A15
    P3  = 0xC3;                         // Port 3: We use as mixed function: 0b11000011 = 0xC3;
    //   P3.0 - RxD     Alternate
    //   P3.1 - TxD     Alternate
    //   P3.2 - NC
    //   P3.3 - LCD_RS  Buss
    //   P3.4 - LCD_RW  Buss
    //   P3.5 - LCD_E   Buss
    //   P3.6 - WR#     Alternate
    //   P3.7 - RD#     Alternate

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

}

/**
 * Main function call
 * @return int
 */
int main(void)
{
    setup();        // Setup IO and Registers
//    NOP();
//    NOP();
//    printf("Hello, World from C!");
    bool state = true;
    for(;;) {
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
        set_led_status(LED_MATRIX, true);
        ms_delay(100);
        set_led_status(LED_ENC_INPUT, true);
        ms_delay(100);
        set_led_status(LED_TERMINAL, true);
        ms_delay(100);
        set_led_status(LED_WAIT_PROG, true);
        ms_delay(100);
        set_led_status(LED_STATUS, true);
        ms_delay(100);
        set_led_status(LED_USER_PROG, true);
        ms_delay(100);
        set_led_status(LED_INTERRUPT, true);

        ms_delay(100);
        DATA_LATCH_LED = 0x00;
    }
    // return 0;
}


