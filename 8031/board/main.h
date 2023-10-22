//
// Created by haroldo on 13/09/2023.
//

#include <mcs51/8051.h>
#include <stdbool.h>

#ifndef ETEP_SDCC_MAIN_H_H
#define ETEP_SDCC_MAIN_H_H

void lcd_cmd(unsigned char command);
void lcd_data(unsigned char disp_data);
void lcd_init(void);
void ms_delay(unsigned int time);

void set_matrix_status(unsigned char led, bool state);
void update_matrix_da(unsigned char value);
void update_matrix_db(unsigned char value);

void setup(void);
int main(void);

#endif //ETEP_SDCC_MAIN_H_H


