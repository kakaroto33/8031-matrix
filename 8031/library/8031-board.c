//
// Created by haroldo on 26/10/2023.
//

#include "8031-board.h"

//== GLOBALS VARIABLES =========================================================

unsigned char led_status_map = 0x00;    // 8 Bytes: Keep LED states to update LED_DATA

//== LIBRARY FUNCTIONS =========================================================

/**
 *
 */
void setup_8031_board(void)
{
    IE  = 0;                            // Interrupt Enable: Disable all
    IP  = 0;                            // Interrupt Priority: Disable all
    PSW = 0;                            // Program Status World: Clear
    P0  = 0xFF;                         // Port 0: All alternate function Data/Address A0-A7
    P1  = 0x00;                         // Port 1: We use as mixed function I/O: LCD Control
    P2  = 0xFF;                         // Port 2: All alternate function Address A8-A15
    P3  = 0xFF;                         // Port 3: We use secondary functions like Interrupts

    led_status_map    = 0x00;           // Reset LED's state
    DATA_LATCH_MATRIX = 0x00;           // Clear Matrix Latch
    DATA_LATCH_LED    = 0x00;           // Clear Status LED's Latch
    DATA_LATCH_LCD    = 0x00;           // Clear LCD Latch

    //lcd_init();

}

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
        led_status_map |= led;          // To enable a bit, use just OR
    }
    DATA_LATCH_LED = led_status_map;
}
