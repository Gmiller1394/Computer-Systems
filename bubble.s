
	.globl _CS2011_STUDENTMAIN

_CS2011_STUDENTMAIN:
	push {lr}	
	mov r4, r1
	mov r5, #1
	mov r6, #0
	bl .compare
	pop {lr}
	mov pc, lr

.compare:
	cmp r5, r4       @largest value is always moved to the back, shorten 
	beq .dec	 @the amount of times it loops by 1
	ldr r7, [r2, r6] @load first value
	add r6, #4	 @increment array address by 1
	ldr r8, [r2, r6] @load second value
	add r5, #1	 @increment array location by 1 
	cmp r7, r8     	 @cmp, if greater than, switch the values, if not, loop
	bgt .switch
	ble .compare

.dec:
	sub r4, #1 @shortens for loop in compare by and resets all the counters
	mov r5, #1
	mov r6, #0
	cmp r4, #0 @checks if gone through array enough times, if so, end
	beq .end
	b .compare

.switch:
	str r7, [r2, r6] @swaps values by storing first value in current locat.
	sub r6, #4	 @and storing second value in precious locat.
	str r8, [r2, r6]
	add r6, #4
	b .compare

.end:
	pop {lr}
	mov pc, lr