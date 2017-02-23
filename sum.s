
	.globl _CS2011_STUDENTMAIN

_CS2011_STUDENTMAIN:
	push {lr}	
	mov r5,#1 @counter to count the amount of loops
	mov r6,#0
	mov r7,#0
	bl .Sum
	mov r0, r7 @store sum in display register
	pop {lr}
	mov pc, lr

.Sum:
	ldr r8, [r2, r6] @load current array value
	add r7, r8	 @add all array values into this register
	add r6, #4	 @increase array address by one
	add r5, #1	 @increment counter
	cmp r5, r0	 @check  if reached last value
	ble .Sum