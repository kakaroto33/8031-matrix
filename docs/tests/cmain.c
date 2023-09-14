#include <stdio.h>
#include <string.h>
#include <mcs51/8051.h>

#define display_port P2      //Data pins connected to port 2 on microcontroller



char str1[10];

void ss(void) {
    strcpy(str1, 'testing');
}

int main() {
    puts("Hello, World from C!");
    return 0;
}