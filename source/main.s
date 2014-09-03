.section .init
.globl _start
_start:

/* 
* This command loads the physical address of the GPIO region into r0.
*/
ldr r0,=0x20200000

/*
* Our register use is as follows:
* r0=0x20200000	the address of the GPIO region.
* r1=0x00040000	a number with bits 18-20 set to 001 to put into the GPIO
*				function select to enable output to GPIO 16. 
* then
* r1=0x00010000	a number with bit 16 high, so we can communicate with GPIO 16.
*/
mov r1,#1
lsl r1,#18

/*
* Set the GPIO function select.
*/
str r1,[r0,#4]

/* 
* Set the 16th bit of r1.
*/
mov r1,#1
lsl r1,#16

/* 
* Set GPIO 16 to low, causing the LED to turn on.
*/
str r1,[r0,#40]

/*
* Loop over this forevermore
*/
loop$: 
b loop$
