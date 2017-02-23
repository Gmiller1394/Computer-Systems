
	.globl _CS2011_STUDENTMAIN

_CS2011_STUDENTMAIN:
	push {lr}	
	mov r5,#0
	mov r6,#0
	mov r7,#0
	bl .Check
	pop {lr}
	mov pc, lr

.Check:
	cmp r5, r1	 @if value isn't into array, branch to not equal func.
	beq .not_equal
	ldr r8, [r2, r6] @load current array value
	add r6, #4	 @increment array address by one
	add r5, #1	 @increment counter
	cmp r8, r0	 @check if array value is equal to first arg.
	bne .Check
	moveq r0, r5  	 @set display register equal to array location	
	pop {lr}
	mov pc, lr

.not_equal:
	mvn r0, #0 	@set display register to -1 since value was not found
	pop {lr}
	mov pc, lr
	