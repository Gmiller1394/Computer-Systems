
	.globl _CS2011_STUDENTMAIN

_CS2011_STUDENTMAIN:
	push {lr}
	cmp r1, #1
	beq .base
	mov r4, #0
	mov r3, #4
	mul r4 , r3, r1 @offset for end of array
	mov r5, r1 @position in array
	mov r6, #1 @tree height counter
	bal .check

.check:
	ldr r8, [r2, r4]
	cmp r8, #0	@check if non zero, if is decrement position and offset
	subeq r4, #4
	subeq r5, #1
	beq .check
	bne .parent	@if not equal go to parent

.parent:
	sub r5, #1	@do (i-1)/2, add to tree height, loop if not parent
	LSR r5, #1
	cmp r5, #0
	beq .end
	add r6, #1
	b .parent

.base:
	mov r0, #0   @tree height is zero if array size is 1
	pop {lr}
	mov pc, lr
	
.end:
	mov r0, r6   @store tree height counter in display register
	pop {lr}
	mov pc, lr
	
	