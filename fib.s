
	.globl _CS2011_STUDENTMAIN

_CS2011_STUDENTMAIN:
	push {lr}	
	cmp r0, #1 @check for base case
	ble .base
	mov r4, #0
	mov r5, #0
	mov r6, #0
	mov r7, #0
	mov r8, #0
	b .fib
	mov r0, r7 @store fibonacci value in display register
	pop {lr}
	mov pc, lr

.fib:
	sub r4, r8, #1 @get two values under the current value
	sub r5, r8, #2
	add r6, r5, r4 @add the two values together to get the current value
	add r7, r6     @add this onto running total for fib value
	sub r8, #1     @decrement to calculate next value in loop
	cmp r8, #1
	bne .fib

.base:
	cmp r0, #1   @check to see if 0 or 1
	moveq r0, #1 @if 1 then 1 and if 0 then 0
	movne r0, #0
	b .end

.end:
	pop {lr}
	mov pc, lr

