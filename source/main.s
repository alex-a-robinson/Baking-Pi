.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

pinNum .req r0
pinFunc .req r1
mov pinNum,#16
mov pinFunc,#1
bl SetGpioFunction
.unreq pinNum
.unreq pinFunc

loop$:
	mov r0,#16
	mov r1,#0
	bl SetGpio

	ldr r0,=100000
	bl Wait
	
	mov r0,#16
	mov r1,#1
	bl SetGpio
	
	ldr r0,=100000
	bl Wait

b loop$

