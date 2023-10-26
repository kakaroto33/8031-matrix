//
// Created by haroldo on 24/10/2023.
//

#ifndef INC_8031_MATRIX_LCD_1602_H
#define INC_8031_MATRIX_LCD_1602_H

__xdata __at (0xB000) unsigned char DATA_LATCH_MATRIX;      // WR_A15:LOW, A14:LOW , A13:HIGH, A12:HIGH = MATRIX_DATA:HIGH
__xdata __at (0xD000) unsigned char DATA_LATCH_LED;         // WR_A15:LOW, A14:HIGH, A13:LOW , A12:HIGH = LED_DATA:HIGH
__xdata __at (0xE000) unsigned char DATA_LATCH_LCD;         // WR_A15:LOW, A14:HIGH, A13:HIGH, A12:LOW  = LCD_DATA:HIGH


#define LCD_RS    P1_0                  // LCD Register Select: Data(High)/Instruction(LOW)
#define LCD_RW    P1_1                  // LCD Read(HIGH)/Write(LOW)
#define LCD_E     P1_2                  // LCD Enable

void lcd_cmd(unsigned char command);
void lcd_data(unsigned char disp_data);
void lcd_init(void);

#endif //INC_8031_MATRIX_LCD_1602_H
