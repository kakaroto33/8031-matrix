//
// Created by haroldo on 13/09/2023.
//
/**
 * ETEP Led Matrix 8051 Project
 *
 * Main executable.
 */

#include <stdio.h>
#include <stdbool.h>


__sfr __at(0xb0) P3;

//#pragma message ("Compile C")

int __at(12) codeConst = 0x13;
int getInt();
long long fn() {
    return 3ll;
}

void interruptHandler() __interrupt(15) __naked {
__critical {
int i=2;
}
}
//void trapHandler() __trap {
//}
void fan(unsigned int x) {
    const int res = x == 123;
    if (x == 425) {}
}

// TODO: Make serial implementation
int main() {
    puts("Hello, World from C!");
    return 0;
}

int putchar(int c) {
    //fake function
    return 1;
}
