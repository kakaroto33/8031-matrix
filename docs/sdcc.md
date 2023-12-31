Test project for Custom Compiler feature
===

This project is an example how to use [SDCC](http://sdcc.sourceforge.net/) for stm8
with [CMake](https://cmake.org/) and [CLion](https://www.jetbrains.com/clion/)
using [Custom Defined Compiler](https://blog.jetbrains.com/clion/2021/10/clion-2021-3-eap-custom-compiler/)

There is a custom compiler definition file for the compiler: [custom-compiler-sdcc-stm8.yaml](custom-compiler-sdcc-8051.yaml)

## Disclaimer

All the repository content is provided on an "AS IS" basis, without warranties or conditions of any kind.

Contributors must have permission to contribute config files, either by ensuring that config files are open source or 
suitably licensed.

Please note that JetBrains does not provide the described compilers or required licenses. The use of third-party
compilers in CLion is subject to the licensing policies of their vendors.
All trademarks, logos and brand names are the property of their respective owners. All company, product and service
names used in this repository are for identification purposes only. Use of these names,trademarks and brands does not
imply endorsement.



REf:

- https://www.instructables.com/8051-Programming-Using-Small-Device-C-Compiler-SDC/
- https://circuitdigest.com/microcontroller-projects/lcd-interfacing-with-8051-microcontroller-89s52
- https://www.pjrc.com/tech/8051/tools/linux_compile.html
- http://www.colecovision.eu/mcs51/51%20MCU%20SCM%20Serial.shtml
- https://cmake.org/cmake/help/latest/command/add_custom_command.html#command:add_custom_command
- https://www.analog.com/en/app-notes/using-the-free-sdcc-c-compiler-to-develop-firmware-for-the-ds89c430450-family-of-microcontrollers.html
- https://embarcados.com.br/compilando-c-para-8051-com-sdcc/
- https://wiki.laptop.org/go/SDCC
- https://github.com/AguHDz/SDCC-8051
  - https://github.com/AguHDz/SDCC-8051/blob/master/Libs/LCD.h
- file:///C:/Program%20Files/SDCC/doc/sdccman.html/node104.html



Asm31: Assembler for 8051
- https://www.pjrc.com/tech/8051/tools/as31-doc.html

uCsim: 8051 Simulator for Intel Hex Files:
- http://mazsola.iit.uni-miskolc.hu/~drdani/embedded/s51/

CMake:  
 - https://cmake.org/cmake/help/latest/index.html
 - https://github.com/eduardoaugustojulio/8051