del *.*~
SET SOURCE="K33-8031-002"
del %SOURCE%.bin
del %SOURCE%.hex
del %SOURCE%.adf
del %SOURCE%.lst
as31.exe %SOURCE%.asm
as31.exe -Fbin %SOURCE%.asm