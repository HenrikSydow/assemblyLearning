section .bss

section .data
	name DB "Hello world.", 0

section .text
global _start

_start:
	MOV bh, [name]
	MOV bl, [name + 1]
	MOV ch, [name + 2]
	MOV cl, [name + 3]
	MOV dh, [name + 4]
	MOV dl, [name + 5]

	MOV eax, 1
	INT 0x80


