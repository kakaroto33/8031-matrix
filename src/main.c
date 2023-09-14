/**
 * ETEP Led Matrix 8051 Project
 *
 * Main executable.
 */

//#include "main.h"
//#include <stdio.h>
//#include <stdbool.h>
#include <mcs51/8051.h>

// Ports and Address definitions
#define LCD_RS P3_3
#define LCD_RW P3_4
#define LCD_E  P3_5

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
