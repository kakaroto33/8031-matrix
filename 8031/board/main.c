/**
 * ETEP Led Matrix 8051 Project
 *
 * Main executable.
 */

#include "main.h"
////#include <stdio.h>
//#include <stdio.h>
//#include <mcs51/8051.h>
//#include <stdbool.h>
//#include "common.h"
//#include "lcd-1602.h"
//#include "8031-board.h"
//
////#include "library/common.h"

/**
 * Main function call
 * @return int
 */
int main(void)
{
    setup_8031_board();
    set_led_status(LED_STATUS, true);
    delay_ms(100);
    while (true) {
        NOP();
    }
    //return 0;
}


