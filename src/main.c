/**
 * ETEP Led Matrix 8051 Project
 *
 * Main executable.
 */

//#include "main.h"
//#include <stdio.h>
//#include <stdbool.h>
#include <mcs51/8051.h>

// Memory Map and Ports ====================================

// EPROM: Will be used 16Kb or 8Kb EPROM (UV Erasable like CI 27128)
//        8031 don't have programmable internal memory, so, on boot will go directly on external program memory,
//        and to reinforce it EA# pin is in GND.
// Address Ports: A0-A13 (16k) or A0-A12(8K)
// Address Range: 0x0000-0x3FFF or 0x0000-0x1FFF
// OE# <= PSEN#
// CE# <= CS_EPROM#
// CS_EPROM# = (A15 OR A14)             // It's OR gate, A14 and A15 must be LOW to CS_EPROM go to LOW

// RAM: (CI 6264) 8Kb External RAM Memory
// Address Ports: A0-A12(8K)
// Address Range: 0x0000-0x1FFF
// CS1# <= GND
// CS2  <= CS_RAM
// OE#  <= RD#
// WE#  <= WR#
// CS_RAM = (A15 NOR A14)               // It's NOR gate, A14 and A15 must be LOW to CS_RAM go to HIGH

// EEPROM: (CI 28C64C) 8Kb EEPROM/Flash will be used to store external program come from serial and some persistent data.
//         For start development, wee can use external EEPROM writer and place on EPROM socket to test program.
//         There special signal port combination to access this memory as Program Memory and RAM Memory, so,
//         we will write as RAM and execute as Program.
// Address Ports: A0-A12(8K)
// Address Range: 0x4000-0x5FFF
// OE# <= RDPSEN#
// CE# <= CS_EEPROM#
// WE# <= WR#
// RDPSEN#    = (PSEN# AND RD#)         // Its AND gate, whenever PSEN or RD is LOW, RDPSEN will go LOW
// CS_EEPROM# = (A14 NAND ¬A15)         // Its NAND gate where A15 has NOT before NAND, A14 must be HIGH and A15 and LOW
//                                      // to CS_EPROM go to LOW

// LCD Ports ===============================================
// All port P1 is connected to data LCD (DB0-DB7)
#define LCD_RS P3_3
#define LCD_RW P3_4
#define LCD_E  P3_5

//

#define LCD_PORT 0x8020
__sfr16 __at (0x8C8A) TMR0;

// Special functions
#define NOP() \
    __asm     \
        nop   \
    __endasm  \


/**
 * Setup CPU IO and Registers
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

// TODO: Make serial implementation
//int putchar(int c) {
//  c = c; // Filling sausage
//  //fake function
//  return 1;
//}
