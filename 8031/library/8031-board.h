//
// Created by k33 on 10/22/2023.
//
// Define configurations and macros of 8031 board
//

#ifndef ETEP_SDCC_8031_BOARD_H
#define ETEP_SDCC_8031_BOARD_H

//------------------------------------------------------------------------------

//#include <stdio.h>
#include <mcs51/8051.h>
#include <stdbool.h>
#include "common.h"

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

//== DATA LATCHES ==============================================================

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
//#define ROT_CLOCK   P3_2                // ROTATORY: [INTERRUPT 0] Clock
//#define ROT_SWITCH  P3_3                // ROTATORY: [INTERRUPT 1] Switch
//#define ROT_DATA    P3_4                // ROTATORY: Data
// P3.5 => TIMER1                       Not used
// P3.6 => WR#                          External RAM Write
// P3.7 => WR#                          External RAM Read

//== STATUS LED'S ==============================================================

// There 7 LEDs on LED_DATA latch

#define LED_MATRIX      0x01            // [0b00000001] YELLOW: Matrix routine is running
#define LED_ENC_INPUT   0x02            // [0b00000010] YELLOW: Encode input (clock or switch)
#define LED_TERMINAL    0x04            // [0b00000100] YELLOW: Serial terminal communication
#define LED_WAIT_PROG   0x08            // [0b00001000] YELLOW: Waiting/Write program from serial.
#define LED_STATUS      0x10            // [0b00010000] GREEN: Board boot status OK
#define LED_USER_PROG   0x20            // [0b00100000] GREEN: Started user program
#define LED_INTERRUPT   0x40            // [0b01000000] RED: On any interrupt started
//                      0x80            // RED: Last LED is connected to reset button.


//== BOARD FUNCTIONS ===========================================================

/**
 * Setup 8031 board SFR and Variables.
 */
void setup_8031_board(void);

/**
 *
 * @param unsigned char led
 * @param bool state
 * @return void
 */
void set_led_status(unsigned char led, bool state);


//== MATRIX FUNCTIONS ==========================================================



//----------------------------------------------------------------------------------------------------------------------

#endif //ETEP_SDCC_8031_BOARD_H
