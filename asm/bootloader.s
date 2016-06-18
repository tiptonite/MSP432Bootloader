	.syntax unified
	.arch armv7e-m
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.fpu fpv4-sp-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
	.file	"bootloader.c"
	.section	.bootloader,"ax",%progbits
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L50
	ldr	r3, [r3]
	sub	sp, sp, #100
	ldr	r3, [r3]
	blx	r3
	.syntax unified
@ 83 "bootloader.c" 1
			cpsid i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L50+4
	ldr	r1, .L50+8
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	r3, .L50+12
	ldr	r4, .L50+60
	ldr	r6, .L50+16
	orr	r0, r0, #1
	strb	r0, [r2]
	ldrb	r0, [r1]	@ zero_extendqisi2
	orr	r0, r0, #18
	strb	r0, [r1]
	ldrb	r5, [r3]	@ zero_extendqisi2
.LPIC16:
	add	r4, pc
	movs	r0, #0
	orr	r5, r5, #18
	strb	r5, [r3]
	strh	r0, [r4]	@ movhi
	ldrb	r4, [r6]	@ zero_extendqisi2
	lsls	r4, r4, #30
	bmi	.L2
	ldrb	r3, [r6]	@ zero_extendqisi2
	tst	r3, #18
	bne	.L3
	.syntax unified
@ 187 "bootloader.c" 1
	
@ See if we're in RAM already
   mov     r1, PC
   ldr     r2, =SRAM_CODE_START
   cmp     r1, r2
   bhi     ExecutingInRAM

@ Not in RAM --> Start copying
   ldr     r1, =BOOTLOADER_START_ADDRESS
   ldr     r3, =BOOTLOADER_END_ADDRESS
CopyLoop:
   @ r1 = Flash pointer, r2 = SRAM pointer
   @ r3 = Address of end of bootloader, r4 = middle man for r1 and r2
   ldr     r4, [r1], #4
   str     r4, [r2], #4
   cmp     r1, r3
   bne     CopyLoop
@ Jump to RAM
   ldr     r1, =SRAM_CODE_START
   orr     r1, r1, #1
   bx      r1

@ Label so we can skip copying if we're in RAM already
ExecutingInRAM:

@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L50+20
	ldr	r3, [r3]
	mov	r1, #-1
	ldr	r3, [r3, #16]
	movs	r0, #1
	blx	r3
.L4:
	ldr	r4, .L50+20
	ldr	r6, .L50+24
	ldr	r3, [r4]
	ldr	r5, .L50+28
	ldr	r3, [r3, #16]
	mov	r1, #-1
	movs	r0, #2
	blx	r3
	ldr	r3, [r4]
	movs	r0, #1
	ldr	r3, [r3, #32]
	blx	r3
	ldr	r3, .L50+32
	ldr	r0, [r4]
	ldr	r1, .L50+36
	ldr	r2, .L50+40
	movw	r7, #26970
	str	r7, [r3]
	mov	r7, #196608
	str	r7, [r6]
	movs	r6, #128
	movs	r7, #0
	str	r7, [r3]
	strh	r6, [r5]	@ movhi
	ldrb	r3, [r1]	@ zero_extendqisi2
	orr	r3, r3, #12
	strb	r3, [r1]
	ldrh	r3, [r2]
	ldr	r1, [r0, #44]
	uxth	r3, r3
	orr	r3, r3, #33
	movs	r6, #78
	strh	r3, [r2]	@ movhi
	movs	r0, #12
	strh	r6, [r5, #6]	@ movhi
	blx	r1
	ldr	r3, [r4]
	movs	r0, #2
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L50+44
	ldr	r1, .L50+48
	movs	r2, #62
	strh	r2, [r3]	@ movhi
.L5:
	ldrh	r3, [r1]
	lsls	r2, r3, #30
	bpl	.L5
	ldr	r3, .L50+64
	ldr	r10, .L50+68
	ldr	r4, .L50+48
	ldr	r9, .L50+72
	ldr	r6, .L50+12
	ldr	r8, .L50+76
.LPIC17:
	add	r3, pc
	str	r3, [sp, #8]
	add	r3, sp, #17
.LPIC18:
	add	r10, pc
	movs	r2, #0
	add	r5, sp, #16
	str	r3, [sp, #4]
	add	r7, sp, #21
.L6:
	ldrh	r3, [r4]
	lsls	r3, r3, #31
	bpl	.L6
	add	r3, sp, #96
	add	r3, r3, r2
	ldrh	r1, [r9]
	strb	r1, [r3, #-80]
	ldrh	r1, [r9]
	uxth	r1, r1
	adds	r3, r2, #1
	cmp	r1, #10
	uxtb	r3, r3
	beq	.L44
	cmp	r3, #77
	bhi	.L45
.L26:
	movs	r1, #0
	mov	r2, r3
	strh	r1, [r4]	@ movhi
	b	.L6
.L3:
	ldr	r3, .L50+20
	ldr	r3, [r3]
	mvn	r1, #1
	ldr	r3, [r3, #16]
	movs	r0, #1
	blx	r3
	b	.L4
.L2:
	strb	r0, [r1]
	strb	r0, [r2]
	strb	r0, [r3]
	.syntax unified
@ 355 "bootloader.c" 1
	
@ Reset stack and jump to startup code address
   ldr     SP, =STACK_BEGIN
   ldr     PC, =STARTUP_CODE_JUMP_ADDRESS

@ 0 "" 2
	.thumb
	.syntax unified
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L44:
	subs	r2, r2, #1
	uxtb	r1, r2
	cmp	r1, #1
	it	hi
	movhi	r0, #2
	bls	.L13
.L12:
	adds	r3, r5, r0
	lsr	ip, r0, #1
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	sub	r3, r2, #48
	uxtb	r3, r3
	cmp	r3, #9
	sub	lr, r2, #65
	bls	.L10
	cmp	lr, #5
	sub	r3, r2, #55
	ite	ls
	uxtbls	r3, r3
	movhi	r3, r2
.L10:
	ldrb	lr, [r5, r0]	@ zero_extendqisi2
	sub	r2, lr, #48
	uxtb	r2, r2
	lsls	r3, r3, #4
	cmp	r2, #9
	sub	fp, lr, #65
	sxtb	r3, r3
	bls	.L11
	cmp	fp, #5
	sub	r2, lr, #55
	ite	ls
	uxtbls	r2, r2
	movhi	r2, lr
.L11:
	adds	r0, r0, #2
	orrs	r3, r3, r2
	cmp	r0, r1
	strb	r3, [r5, ip]
	bls	.L12
.L13:
	ldrb	r3, [sp, #17]	@ zero_extendqisi2
	add	lr, r3, #4
	add	lr, lr, r5
	adds	r1, r3, #5
	mov	r0, r5
	movs	r2, #0
.L9:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	lr, r0
	add	r2, r2, ip
	bne	.L9
	add	r0, sp, #96
	add	r1, r1, r0
	negs	r2, r2
	ldrb	r1, [r1, #-80]	@ zero_extendqisi2
	uxtb	r2, r2
	cmp	r1, r2
	beq	.L46
	ldr	r3, .L50+44
	ldr	r1, .L50+52
	ldr	r2, .L50+56
	movs	r0, #67
	strh	r0, [r3]	@ movhi
	ldrb	r3, [r1]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r1]
.L25:
	ldrb	r3, [r2]	@ zero_extendqisi2
	eor	r3, r3, #1
	strb	r3, [r2]
	b	.L25
.L45:
	ldr	r3, .L50+44
	ldr	r1, .L50+52
	ldr	r2, .L50+56
	movs	r0, #66
	strh	r0, [r3]	@ movhi
	ldrb	r3, [r1]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r1]
.L27:
	ldrb	r3, [r2]	@ zero_extendqisi2
	eor	r3, r3, #1
	strb	r3, [r2]
	b	.L27
.L46:
	ldrb	r0, [sp, #20]	@ zero_extendqisi2
	cbz	r0, .L47
	cmp	r0, #4
	beq	.L48
	cmp	r0, #1
	beq	.L49
.L24:
	ldrb	r3, [r6]	@ zero_extendqisi2
	eor	r3, r3, #1
	strb	r3, [r6]
	movs	r3, #0
	b	.L26
.L51:
	.align	2
.L50:
	.word	33556580
	.word	1073761284
	.word	1073761286
	.word	1073761282
	.word	1073761280
	.word	33556508
	.word	1073808388
	.word	1073745920
	.word	1073808384
	.word	1073761290
	.word	1073745928
	.word	1073745934
	.word	1073745948
	.word	1073761285
	.word	1073761283
	.word	.LANCHOR0-(.LPIC16+4)
	.word	.LANCHOR0-(.LPIC17+4)
	.word	.LANCHOR0-(.LPIC18+4)
	.word	1073745932
	.word	1073811696
.L47:
	ldr	r1, [sp, #8]
	ldrb	r2, [sp, #18]	@ zero_extendqisi2
	ldrh	r0, [r1]
	ldrb	r1, [sp, #19]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orr	r2, r2, r0, lsl #16
	cmp	r3, #3
	orr	r1, r1, r2
	bls	.L32
	subs	r2, r3, #4
	ubfx	r2, r2, #2, #6
	add	lr, r1, r2, lsl #2
	ldr	ip, [sp, #4]
	add	lr, lr, #4
	mov	r0, r1
	mov	fp, r3
.L17:
	ldr	r3, [ip, #4]!
	str	r3, [r0], #4
	cmp	lr, r0
	bne	.L17
	adds	r2, r2, #1
	lsls	r2, r2, #2
	add	r1, r1, r2
	and	r3, fp, #3
	add	r2, r2, r7
.L16:
	cbz	r3, .L21
	subs	r3, r3, #1
	uxtb	r3, r3
	adds	r3, r3, #1
	add	r3, r3, r2
	subs	r1, r1, #1
.L20:
	ldrb	r0, [r2], #1	@ zero_extendqisi2
	strb	r0, [r1, #1]!
	cmp	r3, r2
	bne	.L20
.L21:
	ldr	r2, [r8]
	movw	r3, #518
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L24
	ldr	r3, .L52
	ldr	r1, .L52+4
	ldr	r2, .L52+8
	movs	r0, #70
	strh	r0, [r3]	@ movhi
	ldrb	r3, [r1]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r1]
.L22:
	ldrb	r3, [r2]	@ zero_extendqisi2
	eor	r3, r3, #1
	strb	r3, [r2]
	b	.L22
.L49:
	ldr	r3, [r8]
	ands	fp, r3, #134
	bne	.L24
	ldr	r3, .L52+12
	ldr	r2, [r3]
	str	r3, [sp, #12]
	ldr	r2, [r2, #20]
	mov	r1, #-1
	blx	r2
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	mov	r1, #-1
	ldr	r3, [r3, #20]
	movs	r0, #2
	blx	r3
	ldr	r2, .L52+16
	ldr	r3, .L52+20
	strb	fp, [r2]
	strb	fp, [r3]
	strb	fp, [r6]
	.syntax unified
@ 355 "bootloader.c" 1
	
@ Reset stack and jump to startup code address
   ldr     SP, =STACK_BEGIN
   ldr     PC, =STARTUP_CODE_JUMP_ADDRESS

@ 0 "" 2
	.thumb
	.syntax unified
	b	.L24
.L48:
	ldrb	r2, [sp, #21]	@ zero_extendqisi2
	ldrb	r3, [sp, #22]	@ zero_extendqisi2
	orr	r3, r3, r2, lsl #8
	strh	r3, [r10]	@ movhi
	b	.L24
.L32:
	mov	r2, r7
	b	.L16
.L53:
	.align	2
.L52:
	.word	1073745934
	.word	1073761285
	.word	1073761283
	.word	33556508
	.word	1073761286
	.word	1073761284
	.size	main, .-main
	.bss
	.align	1
	.set	.LANCHOR0,. + 0
	.type	scu16BaseAddress, %object
	.size	scu16BaseAddress, 2
scu16BaseAddress:
	.space	2
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.3.1 20160307 (release) [ARM/embedded-5-branch revision 234589]"
