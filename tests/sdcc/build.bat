
REM This ia manual build to test flags on SDCC compiler without CMake, use inside build dir
del *.*~
SET SOURCE="main"

del %SOURCE%.ihx
del %SOURCE%.lk
del %SOURCE%.lst
del %SOURCE%.map
del %SOURCE%.mem
del %SOURCE%.rel
del %SOURCE%.rst
del %SOURCE%.sym
del %SOURCE%.hex
sdcc.exe  -V --std c99 --model-small --fverbose-asm -mmcs51 -p8031 ../../main.c

packihx  %SOURCE%.ihx > %SOURCE%.hex