cat clib.s lab1asm.s lab1.s > lab1final.s
nasm lab1final.s -o lab1.bin -l lab1.lst
emu86
