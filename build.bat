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
sdcc.exe main.c

packihx  %SOURCE%.ihx > %SOURCE%.hex