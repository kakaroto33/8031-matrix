//
// Created by haroldo on 13/09/2023.
//

#include <mcs51/8051.h>
#include <stdbool.h>

#ifndef ETEP_SDCC_MAIN_H_H
#define ETEP_SDCC_MAIN_H_H

void setup(void);
void setMatrixStatus(unsigned char led, bool state);
void updateMatrixDataA(unsigned char value);
void updateMatrixDataB(unsigned char value);

#endif //ETEP_SDCC_MAIN_H_H


