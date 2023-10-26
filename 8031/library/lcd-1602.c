//
// Created by haroldo on 24/10/2023.
//
#include <mcs51/8051.h>
#include "lcd-1602.h"

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
    //NOP();  // This fix some randon behavior on compiler ??
}

