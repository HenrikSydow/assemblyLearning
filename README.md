# assemblyLearning
This repository contains some beginner assembly scripts. (x86 / intel)
Written for use with nasm on Ubuntu.
Useful commands can be found in this readme file.

## run using nasm
```bash
nasm -f elf -o <file_name>.o <file_name>.s
ld -m elf_i386 -o <file_name> <file_name>.o
./<file_name>
echo $?
```

## debug using GDB
### start debugging
```bash
gdb <file_name>
break <label_name for example _start>
layout asm
run
```
### useful commands
- step over: ```stepi```
- get register data: ```info registers <register_name for example eax or eflags```
- get data at offset: ```x/x 0x<address>```
- get number of bytes starting at offset: ```x/<number> 0x<address>```

## x86 assembly syntax (intel)
### Example script:
Moves the value 2 to register a.  
Gets the value from pointer "myNum", which is 3, and moves it to register b.  
Adds the value from register b to the value of register a.  
Interrupts the application.  
Register a's value is returned by default, which is now the sum of 2 and 3 (5 is returned).  
```asm
section .bss

section .data
        myNum DB 3

section .text
global _start

_start:
        MOV eax, 2
        MOV ebx, [myNum]
        ADD eax, ebx
        INT 0x80
```
