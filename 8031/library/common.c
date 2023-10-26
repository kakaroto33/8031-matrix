//
// Created by haroldo on 23/10/2023.
//

#include <common.h>

/**
 * Function for creating delay in milliseconds.
 * Current Clock 11.1 MHz
 * @param time
 */
void delay_ms(unsigned int time_ms){

    // Must calculate from CPU clock/cristal
    // CPU_CLOCK
    // Clock: 12MHz = 83.333ns
    // Cycles per loop for = 12 ~= 999,96ms ~= 1us
    unsigned i,j,one_ms ;
    one_ms = 0; //1275
    time_ms = 0;
    for(i=0;i<time_ms;i++)
        for(j=0;j<one_ms;j++);            //TODO: Adjust to get 1ms
//    for(i=0;i<time;i++)
//        for(j=0;j<1275;j++);            //TODO: Adjust to get 1ms

}