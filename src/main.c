/**
 * ETEP Led Matrix 8051 Project
 *
 * Main executable.
 */

#include "main.h"
//#include <stdio.h>

//== Memory Map and Ports ======================================================

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

//== LCD Ports =================================================================
#define LCD_DATA  P1                    // All port P1 is connected to data LCD (DB0-DB7)
#define LCD_RS    P3_3                  // LCD Register Select: Data(High)/Instruction(LOW)
#define LCD_RW    P3_4                  // LCD Read(HIGH)/Write(LOW)
#define LCD_E     P3_5                  // LCD Enable

//== Matrix Latches ============================================================
// Matrix latches is accessible in high address as RAM, need Write operations (WR#)
//define MATRIX_DA 0xA000                // (A15 NAND ¬WR#) NOR A13: When A15:HIGH, A13:HIGH, WR:LOW = MATRIX_DA:HIGH
//define MATRIX_DB 0xC000                // (A15 NAND ¬WR#) NOR A14: When A15:HIGH, A14:HIGH, WR:LOW = MATRIX_DB:HIGH
//__sfr16 __at (0xA000) MATRIX_DA;

__xdata __at (0xA000) unsigned char MATRIX_DA;
__xdata __at (0xC000) unsigned char MATRIX_DB;

//== Status Led's ==============================================================
// There 3 LED's on matrix latches, where user can change state
#define LED_STATUS 0x08                 // Data value to send to MATRIX_DA
#define LED_USER   0x80                 // Data value to send to MATRIX_DA
#define LED_MATRIX 0x09                 // Data value to send to MATRIX_DB, wee add 0x01 to make it unique, wil be removed
                                        // on function setMatrixStatus()
// Global Vars
unsigned char led_matrix_da = 0x00;     // 8 Bytes: Keep LED state on latch MATRIX_DA
unsigned char led_matrix_db = 0x00;     // 8 Bytes: Keep LED state on latch MATRIX_DB

//== Special functions =========================================================
// This a single Assemble Instruction NOP
// On 8051 Family this will take 12 clock cycles.
#define NOP() \
    __asm     \
        nop   \
    __endasm  \

//== Matrix Functions ==========================================================

/**
 *
 * @param led
 * @param state
 * @return void
 */
void setMatrixStatus(unsigned char led, bool state) {

    // To identify matrix latch, wee are added 0x01 on LED ID of latch B
    if (led & 0x01) {
        led = led & 0xfe;                                   // Set bit 0 to 0
        if (state) {
            led_matrix_db = led_matrix_db | led;            // To enable a bit, use just OR
        } else {
            led_matrix_db = led_matrix_db | ~led;           // To disable a bit, use AND with complement bits (inverted)
        }
    } else {
        if (state) {
            led_matrix_da = led_matrix_da | led;            // To enable a bit, use just OR
        } else {
            led_matrix_da = led_matrix_da | ~led;           // To disable a bit, use AND with complement bits (inverted)
        }
    }
}

/**
 * Update Matrix A and Led States
 * @param value
 */
void updateMatrixDataA(unsigned char value) {
    MATRIX_DA = value | led_matrix_da;
}

/**
 * Update Matrix B and Led States
 * @param value
 */
void updateMatrixDataB(unsigned char value) {
    MATRIX_DB = value | led_matrix_db;
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
void setup(void) {
    IE  = 0;                            // Interrupt Enable: Disable all
    IP  = 0;                            // Interrupt Priority: Disable all
    PSW = 0;                            // Program Status World: Clear
    P0  = 0xff;                         // Port 0: All alternate function Data/Address A0-A7
    P1  = 0x00;                         // Port 1: We use as LCD data bus
    P2  = 0xff;                         // Port 2: All alternate function Address A8-A15
    P3  = 0b11000011;                   // Port 3: We use as mixed function
    //   P3.0 - RxD     Alternate
    //   P3.1 - TxD     Alternate
    //   P3.2 - NC
    //   P3.3 - LCD_RS  Buss
    //   P3.4 - LCD_RW  Buss
    //   P3.5 - LCD_E   Buss
    //   P3.6 - WR#     Alternate
    //   P3.7 - RD#     Alternate
    led_matrix_da = 0x00;               // Reset LED state
    led_matrix_db = 0x00;               // Reset LED state
    // Set LED Status ON
    setMatrixStatus(LED_STATUS, true);
    // Update Matrix Latch A
    updateMatrixDataA(0x00);
    // Update Matrix Latch A
    updateMatrixDataB(0x00);
}

/**
 * Main function call
 * @return int
 */
int main(void) {
    setup();        // Setup IO and Registers
    NOP();
//    printf("Hello, World from C!");
    return 0;
}


