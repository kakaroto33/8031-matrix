//
// Created by k33 on 10/22/2023.
// Common functions
//

#ifndef ETEP_SDCC_COMMON_H
#define ETEP_SDCC_COMMON_H

// This a single Assemble Instruction NOP
// On 8051 Family this will take 12 clock cycles.
#define NOP() \
    __asm     \
        nop   \
    __endasm  \

/**
 * Function for creating delay in milliseconds.
 * Current Clock 11.1 MHz
 * @param time
 */
void delay_ms(unsigned int time_ms);

#endif //ETEP_SDCC_COMMON_H
