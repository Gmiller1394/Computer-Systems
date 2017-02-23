
	.globl _CS2011_STUDENTMAIN

_CS2011_STUDENTMAIN:
	push {lr}	
	cmp r0, #1 @checks for base case of 0 and 1
	ble .base
	mov r4, #0
	mov r5, r0
	b .fact
	mov r0, r6 @stores the final value in the display register
	pop {lr}
	mov pc, lr

.base:
	mov r0, #1 @0! and 1! both equal 1 so set display register to 1
	pop {lr}
	mov pc, lr

.fact:
	sub r4, r5, #1 @get number one under top  number
	mul r6, r5, r4 @multiply and store
	sub r5, #1     @ decrement counter
	cmp r5, #1     @ check if gone through all numbers
	bne .fact
	