
.build/binary/nvic.elf:     file format elf32-littlearm


Disassembly of section .text:

080000e0 <_stack_init>:
 80000e0:	f5a3 3a80 	sub.w	sl, r3, #65536	; 0x10000
 80000e4:	4770      	bx	lr
 80000e6:	bf00      	nop

080000e8 <_mainCRTStartup>:
 80000e8:	4b17      	ldr	r3, [pc, #92]	; (8000148 <_mainCRTStartup+0x60>)
 80000ea:	2b00      	cmp	r3, #0
 80000ec:	bf08      	it	eq
 80000ee:	4b13      	ldreq	r3, [pc, #76]	; (800013c <_mainCRTStartup+0x54>)
 80000f0:	469d      	mov	sp, r3
 80000f2:	f7ff fff5 	bl	80000e0 <_stack_init>
 80000f6:	2100      	movs	r1, #0
 80000f8:	468b      	mov	fp, r1
 80000fa:	460f      	mov	r7, r1
 80000fc:	4813      	ldr	r0, [pc, #76]	; (800014c <_mainCRTStartup+0x64>)
 80000fe:	4a14      	ldr	r2, [pc, #80]	; (8000150 <_mainCRTStartup+0x68>)
 8000100:	1a12      	subs	r2, r2, r0
 8000102:	f000 ff6c 	bl	8000fde <memset>
 8000106:	4b0e      	ldr	r3, [pc, #56]	; (8000140 <_mainCRTStartup+0x58>)
 8000108:	2b00      	cmp	r3, #0
 800010a:	d000      	beq.n	800010e <_mainCRTStartup+0x26>
 800010c:	4798      	blx	r3
 800010e:	4b0d      	ldr	r3, [pc, #52]	; (8000144 <_mainCRTStartup+0x5c>)
 8000110:	2b00      	cmp	r3, #0
 8000112:	d000      	beq.n	8000116 <_mainCRTStartup+0x2e>
 8000114:	4798      	blx	r3
 8000116:	2000      	movs	r0, #0
 8000118:	2100      	movs	r1, #0
 800011a:	0004      	movs	r4, r0
 800011c:	000d      	movs	r5, r1
 800011e:	480d      	ldr	r0, [pc, #52]	; (8000154 <_mainCRTStartup+0x6c>)
 8000120:	2800      	cmp	r0, #0
 8000122:	d002      	beq.n	800012a <_mainCRTStartup+0x42>
 8000124:	480c      	ldr	r0, [pc, #48]	; (8000158 <_mainCRTStartup+0x70>)
 8000126:	f3af 8000 	nop.w
 800012a:	f000 fffd 	bl	8001128 <__libc_init_array>
 800012e:	0020      	movs	r0, r4
 8000130:	0029      	movs	r1, r5
 8000132:	f000 f84b 	bl	80001cc <main>
 8000136:	f000 fd61 	bl	8000bfc <exit>
 800013a:	bf00      	nop
 800013c:	00080000 	.word	0x00080000
	...
 800014c:	20000078 	.word	0x20000078
 8000150:	200001f0 	.word	0x200001f0
	...

0800015c <capslock>:
 800015c:	b580      	push	{r7, lr}
 800015e:	b084      	sub	sp, #16
 8000160:	af00      	add	r7, sp, #0
 8000162:	6078      	str	r0, [r7, #4]
 8000164:	f107 030f 	add.w	r3, r7, #15
 8000168:	461a      	mov	r2, r3
 800016a:	2101      	movs	r1, #1
 800016c:	6878      	ldr	r0, [r7, #4]
 800016e:	f000 fc50 	bl	8000a12 <usart_receive>
 8000172:	7bfb      	ldrb	r3, [r7, #15]
 8000174:	4618      	mov	r0, r3
 8000176:	f000 f80d 	bl	8000194 <capsbit>
 800017a:	4603      	mov	r3, r0
 800017c:	73fb      	strb	r3, [r7, #15]
 800017e:	f107 030f 	add.w	r3, r7, #15
 8000182:	461a      	mov	r2, r3
 8000184:	2101      	movs	r1, #1
 8000186:	6878      	ldr	r0, [r7, #4]
 8000188:	f000 fc0c 	bl	80009a4 <usart_transmit>
 800018c:	bf00      	nop
 800018e:	3710      	adds	r7, #16
 8000190:	46bd      	mov	sp, r7
 8000192:	bd80      	pop	{r7, pc}

08000194 <capsbit>:
 8000194:	b480      	push	{r7}
 8000196:	b083      	sub	sp, #12
 8000198:	af00      	add	r7, sp, #0
 800019a:	4603      	mov	r3, r0
 800019c:	71fb      	strb	r3, [r7, #7]
 800019e:	79fb      	ldrb	r3, [r7, #7]
 80001a0:	3301      	adds	r3, #1
 80001a2:	4a09      	ldr	r2, [pc, #36]	; (80001c8 <capsbit+0x34>)
 80001a4:	4413      	add	r3, r2
 80001a6:	781b      	ldrb	r3, [r3, #0]
 80001a8:	f003 0303 	and.w	r3, r3, #3
 80001ac:	2b00      	cmp	r3, #0
 80001ae:	d004      	beq.n	80001ba <capsbit+0x26>
 80001b0:	79fb      	ldrb	r3, [r7, #7]
 80001b2:	f083 0320 	eor.w	r3, r3, #32
 80001b6:	b2db      	uxtb	r3, r3
 80001b8:	e000      	b.n	80001bc <capsbit+0x28>
 80001ba:	79fb      	ldrb	r3, [r7, #7]
 80001bc:	4618      	mov	r0, r3
 80001be:	370c      	adds	r7, #12
 80001c0:	46bd      	mov	sp, r7
 80001c2:	bc80      	pop	{r7}
 80001c4:	4770      	bx	lr
 80001c6:	bf00      	nop
 80001c8:	08001d44 	.word	0x08001d44

080001cc <main>:
 80001cc:	b580      	push	{r7, lr}
 80001ce:	af00      	add	r7, sp, #0
 80001d0:	f000 f80c 	bl	80001ec <fusecore>
 80001d4:	210d      	movs	r1, #13
 80001d6:	4804      	ldr	r0, [pc, #16]	; (80001e8 <main+0x1c>)
 80001d8:	f000 f91c 	bl	8000414 <gpio_toggle_pin>
 80001dc:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80001e0:	f000 fb66 	bl	80008b0 <delay_ms>
 80001e4:	bf00      	nop
 80001e6:	e7f5      	b.n	80001d4 <main+0x8>
 80001e8:	40020800 	.word	0x40020800

080001ec <fusecore>:
 80001ec:	b580      	push	{r7, lr}
 80001ee:	af00      	add	r7, sp, #0
 80001f0:	f000 f84e 	bl	8000290 <gpio_init>
 80001f4:	f000 f868 	bl	80002c8 <usart1_init>
 80001f8:	f000 f812 	bl	8000220 <usart2_init>
 80001fc:	f000 f858 	bl	80002b0 <nvic_init>
 8000200:	4b05      	ldr	r3, [pc, #20]	; (8000218 <fusecore+0x2c>)
 8000202:	681b      	ldr	r3, [r3, #0]
 8000204:	4a05      	ldr	r2, [pc, #20]	; (800021c <fusecore+0x30>)
 8000206:	fba2 2303 	umull	r2, r3, r2, r3
 800020a:	099b      	lsrs	r3, r3, #6
 800020c:	4618      	mov	r0, r3
 800020e:	f000 fb1d 	bl	800084c <systick_init>
 8000212:	bf00      	nop
 8000214:	bd80      	pop	{r7, pc}
 8000216:	bf00      	nop
 8000218:	20000004 	.word	0x20000004
 800021c:	10624dd3 	.word	0x10624dd3

08000220 <usart2_init>:
 8000220:	b580      	push	{r7, lr}
 8000222:	af00      	add	r7, sp, #0
 8000224:	2101      	movs	r1, #1
 8000226:	2000      	movs	r0, #0
 8000228:	f000 fa3e 	bl	80006a8 <rcc_periph_clock_enable>
 800022c:	2202      	movs	r2, #2
 800022e:	2102      	movs	r1, #2
 8000230:	4815      	ldr	r0, [pc, #84]	; (8000288 <usart2_init+0x68>)
 8000232:	f000 f87f 	bl	8000334 <gpio_mode_setup>
 8000236:	2202      	movs	r2, #2
 8000238:	2103      	movs	r1, #3
 800023a:	4813      	ldr	r0, [pc, #76]	; (8000288 <usart2_init+0x68>)
 800023c:	f000 f87a 	bl	8000334 <gpio_mode_setup>
 8000240:	2207      	movs	r2, #7
 8000242:	2102      	movs	r1, #2
 8000244:	4810      	ldr	r0, [pc, #64]	; (8000288 <usart2_init+0x68>)
 8000246:	f000 f898 	bl	800037a <gpio_af_setup>
 800024a:	2207      	movs	r2, #7
 800024c:	2103      	movs	r1, #3
 800024e:	480e      	ldr	r0, [pc, #56]	; (8000288 <usart2_init+0x68>)
 8000250:	f000 f893 	bl	800037a <gpio_af_setup>
 8000254:	f44f 3100 	mov.w	r1, #131072	; 0x20000
 8000258:	2001      	movs	r0, #1
 800025a:	f000 fa25 	bl	80006a8 <rcc_periph_clock_enable>
 800025e:	f44f 5116 	mov.w	r1, #9600	; 0x2580
 8000262:	480a      	ldr	r0, [pc, #40]	; (800028c <usart2_init+0x6c>)
 8000264:	f000 fb80 	bl	8000968 <usart_set_baudrate>
 8000268:	210c      	movs	r1, #12
 800026a:	4808      	ldr	r0, [pc, #32]	; (800028c <usart2_init+0x6c>)
 800026c:	f000 fb69 	bl	8000942 <usart_set_mode>
 8000270:	4806      	ldr	r0, [pc, #24]	; (800028c <usart2_init+0x6c>)
 8000272:	f000 fc01 	bl	8000a78 <usart_irq_enable>
 8000276:	4805      	ldr	r0, [pc, #20]	; (800028c <usart2_init+0x6c>)
 8000278:	f000 fb52 	bl	8000920 <usart_enable>
 800027c:	4803      	ldr	r0, [pc, #12]	; (800028c <usart2_init+0x6c>)
 800027e:	f000 fc0c 	bl	8000a9a <usart_init_send>
 8000282:	bf00      	nop
 8000284:	bd80      	pop	{r7, pc}
 8000286:	bf00      	nop
 8000288:	40020000 	.word	0x40020000
 800028c:	40004400 	.word	0x40004400

08000290 <gpio_init>:
 8000290:	b580      	push	{r7, lr}
 8000292:	af00      	add	r7, sp, #0
 8000294:	2104      	movs	r1, #4
 8000296:	2000      	movs	r0, #0
 8000298:	f000 fa06 	bl	80006a8 <rcc_periph_clock_enable>
 800029c:	2201      	movs	r2, #1
 800029e:	210d      	movs	r1, #13
 80002a0:	4802      	ldr	r0, [pc, #8]	; (80002ac <gpio_init+0x1c>)
 80002a2:	f000 f847 	bl	8000334 <gpio_mode_setup>
 80002a6:	bf00      	nop
 80002a8:	bd80      	pop	{r7, pc}
 80002aa:	bf00      	nop
 80002ac:	40020800 	.word	0x40020800

080002b0 <nvic_init>:
 80002b0:	b580      	push	{r7, lr}
 80002b2:	af00      	add	r7, sp, #0
 80002b4:	f000 f9f2 	bl	800069c <nvic_global_enable>
 80002b8:	2026      	movs	r0, #38	; 0x26
 80002ba:	f000 f9cb 	bl	8000654 <nvic_irq_setup>
 80002be:	2025      	movs	r0, #37	; 0x25
 80002c0:	f000 f9c8 	bl	8000654 <nvic_irq_setup>
 80002c4:	bf00      	nop
 80002c6:	bd80      	pop	{r7, pc}

080002c8 <usart1_init>:
 80002c8:	b580      	push	{r7, lr}
 80002ca:	af00      	add	r7, sp, #0
 80002cc:	2101      	movs	r1, #1
 80002ce:	2000      	movs	r0, #0
 80002d0:	f000 f9ea 	bl	80006a8 <rcc_periph_clock_enable>
 80002d4:	2202      	movs	r2, #2
 80002d6:	2109      	movs	r1, #9
 80002d8:	4814      	ldr	r0, [pc, #80]	; (800032c <usart1_init+0x64>)
 80002da:	f000 f82b 	bl	8000334 <gpio_mode_setup>
 80002de:	2202      	movs	r2, #2
 80002e0:	210a      	movs	r1, #10
 80002e2:	4812      	ldr	r0, [pc, #72]	; (800032c <usart1_init+0x64>)
 80002e4:	f000 f826 	bl	8000334 <gpio_mode_setup>
 80002e8:	2207      	movs	r2, #7
 80002ea:	2109      	movs	r1, #9
 80002ec:	480f      	ldr	r0, [pc, #60]	; (800032c <usart1_init+0x64>)
 80002ee:	f000 f844 	bl	800037a <gpio_af_setup>
 80002f2:	2207      	movs	r2, #7
 80002f4:	210a      	movs	r1, #10
 80002f6:	480d      	ldr	r0, [pc, #52]	; (800032c <usart1_init+0x64>)
 80002f8:	f000 f83f 	bl	800037a <gpio_af_setup>
 80002fc:	2110      	movs	r1, #16
 80002fe:	2002      	movs	r0, #2
 8000300:	f000 f9d2 	bl	80006a8 <rcc_periph_clock_enable>
 8000304:	f44f 5116 	mov.w	r1, #9600	; 0x2580
 8000308:	4809      	ldr	r0, [pc, #36]	; (8000330 <usart1_init+0x68>)
 800030a:	f000 fb2d 	bl	8000968 <usart_set_baudrate>
 800030e:	210c      	movs	r1, #12
 8000310:	4807      	ldr	r0, [pc, #28]	; (8000330 <usart1_init+0x68>)
 8000312:	f000 fb16 	bl	8000942 <usart_set_mode>
 8000316:	4806      	ldr	r0, [pc, #24]	; (8000330 <usart1_init+0x68>)
 8000318:	f000 fbae 	bl	8000a78 <usart_irq_enable>
 800031c:	4804      	ldr	r0, [pc, #16]	; (8000330 <usart1_init+0x68>)
 800031e:	f000 faff 	bl	8000920 <usart_enable>
 8000322:	4803      	ldr	r0, [pc, #12]	; (8000330 <usart1_init+0x68>)
 8000324:	f000 fbb9 	bl	8000a9a <usart_init_send>
 8000328:	bf00      	nop
 800032a:	bd80      	pop	{r7, pc}
 800032c:	40020000 	.word	0x40020000
 8000330:	40011000 	.word	0x40011000

08000334 <gpio_mode_setup>:
 8000334:	b480      	push	{r7}
 8000336:	b087      	sub	sp, #28
 8000338:	af00      	add	r7, sp, #0
 800033a:	60f8      	str	r0, [r7, #12]
 800033c:	60b9      	str	r1, [r7, #8]
 800033e:	607a      	str	r2, [r7, #4]
 8000340:	68fb      	ldr	r3, [r7, #12]
 8000342:	681b      	ldr	r3, [r3, #0]
 8000344:	617b      	str	r3, [r7, #20]
 8000346:	68bb      	ldr	r3, [r7, #8]
 8000348:	005b      	lsls	r3, r3, #1
 800034a:	2203      	movs	r2, #3
 800034c:	fa02 f303 	lsl.w	r3, r2, r3
 8000350:	43db      	mvns	r3, r3
 8000352:	461a      	mov	r2, r3
 8000354:	697b      	ldr	r3, [r7, #20]
 8000356:	4013      	ands	r3, r2
 8000358:	617b      	str	r3, [r7, #20]
 800035a:	68bb      	ldr	r3, [r7, #8]
 800035c:	005b      	lsls	r3, r3, #1
 800035e:	687a      	ldr	r2, [r7, #4]
 8000360:	fa02 f303 	lsl.w	r3, r2, r3
 8000364:	697a      	ldr	r2, [r7, #20]
 8000366:	4313      	orrs	r3, r2
 8000368:	617b      	str	r3, [r7, #20]
 800036a:	68fb      	ldr	r3, [r7, #12]
 800036c:	697a      	ldr	r2, [r7, #20]
 800036e:	601a      	str	r2, [r3, #0]
 8000370:	bf00      	nop
 8000372:	371c      	adds	r7, #28
 8000374:	46bd      	mov	sp, r7
 8000376:	bc80      	pop	{r7}
 8000378:	4770      	bx	lr

0800037a <gpio_af_setup>:
 800037a:	b480      	push	{r7}
 800037c:	b089      	sub	sp, #36	; 0x24
 800037e:	af00      	add	r7, sp, #0
 8000380:	60f8      	str	r0, [r7, #12]
 8000382:	60b9      	str	r1, [r7, #8]
 8000384:	607a      	str	r2, [r7, #4]
 8000386:	2308      	movs	r3, #8
 8000388:	77fb      	strb	r3, [r7, #31]
 800038a:	2304      	movs	r3, #4
 800038c:	77bb      	strb	r3, [r7, #30]
 800038e:	7ffb      	ldrb	r3, [r7, #31]
 8000390:	68ba      	ldr	r2, [r7, #8]
 8000392:	429a      	cmp	r2, r3
 8000394:	d907      	bls.n	80003a6 <gpio_af_setup+0x2c>
 8000396:	7ffa      	ldrb	r2, [r7, #31]
 8000398:	68bb      	ldr	r3, [r7, #8]
 800039a:	fbb3 f1f2 	udiv	r1, r3, r2
 800039e:	fb01 f202 	mul.w	r2, r1, r2
 80003a2:	1a9b      	subs	r3, r3, r2
 80003a4:	e000      	b.n	80003a8 <gpio_af_setup+0x2e>
 80003a6:	68bb      	ldr	r3, [r7, #8]
 80003a8:	61bb      	str	r3, [r7, #24]
 80003aa:	7ffb      	ldrb	r3, [r7, #31]
 80003ac:	68ba      	ldr	r2, [r7, #8]
 80003ae:	429a      	cmp	r2, r3
 80003b0:	d203      	bcs.n	80003ba <gpio_af_setup+0x40>
 80003b2:	68fb      	ldr	r3, [r7, #12]
 80003b4:	3320      	adds	r3, #32
 80003b6:	681b      	ldr	r3, [r3, #0]
 80003b8:	e002      	b.n	80003c0 <gpio_af_setup+0x46>
 80003ba:	68fb      	ldr	r3, [r7, #12]
 80003bc:	3324      	adds	r3, #36	; 0x24
 80003be:	681b      	ldr	r3, [r3, #0]
 80003c0:	617b      	str	r3, [r7, #20]
 80003c2:	7fbb      	ldrb	r3, [r7, #30]
 80003c4:	69ba      	ldr	r2, [r7, #24]
 80003c6:	fb02 f303 	mul.w	r3, r2, r3
 80003ca:	220f      	movs	r2, #15
 80003cc:	fa02 f303 	lsl.w	r3, r2, r3
 80003d0:	43db      	mvns	r3, r3
 80003d2:	697a      	ldr	r2, [r7, #20]
 80003d4:	4013      	ands	r3, r2
 80003d6:	617b      	str	r3, [r7, #20]
 80003d8:	7fbb      	ldrb	r3, [r7, #30]
 80003da:	69ba      	ldr	r2, [r7, #24]
 80003dc:	fb02 f303 	mul.w	r3, r2, r3
 80003e0:	687a      	ldr	r2, [r7, #4]
 80003e2:	fa02 f303 	lsl.w	r3, r2, r3
 80003e6:	697a      	ldr	r2, [r7, #20]
 80003e8:	4313      	orrs	r3, r2
 80003ea:	617b      	str	r3, [r7, #20]
 80003ec:	7ffb      	ldrb	r3, [r7, #31]
 80003ee:	68ba      	ldr	r2, [r7, #8]
 80003f0:	429a      	cmp	r2, r3
 80003f2:	d205      	bcs.n	8000400 <gpio_af_setup+0x86>
 80003f4:	68fb      	ldr	r3, [r7, #12]
 80003f6:	3320      	adds	r3, #32
 80003f8:	461a      	mov	r2, r3
 80003fa:	697b      	ldr	r3, [r7, #20]
 80003fc:	6013      	str	r3, [r2, #0]
 80003fe:	e004      	b.n	800040a <gpio_af_setup+0x90>
 8000400:	68fb      	ldr	r3, [r7, #12]
 8000402:	3324      	adds	r3, #36	; 0x24
 8000404:	461a      	mov	r2, r3
 8000406:	697b      	ldr	r3, [r7, #20]
 8000408:	6013      	str	r3, [r2, #0]
 800040a:	bf00      	nop
 800040c:	3724      	adds	r7, #36	; 0x24
 800040e:	46bd      	mov	sp, r7
 8000410:	bc80      	pop	{r7}
 8000412:	4770      	bx	lr

08000414 <gpio_toggle_pin>:
 8000414:	b480      	push	{r7}
 8000416:	b083      	sub	sp, #12
 8000418:	af00      	add	r7, sp, #0
 800041a:	6078      	str	r0, [r7, #4]
 800041c:	6039      	str	r1, [r7, #0]
 800041e:	687b      	ldr	r3, [r7, #4]
 8000420:	3314      	adds	r3, #20
 8000422:	681b      	ldr	r3, [r3, #0]
 8000424:	2101      	movs	r1, #1
 8000426:	683a      	ldr	r2, [r7, #0]
 8000428:	fa01 f202 	lsl.w	r2, r1, r2
 800042c:	4611      	mov	r1, r2
 800042e:	687a      	ldr	r2, [r7, #4]
 8000430:	3214      	adds	r2, #20
 8000432:	404b      	eors	r3, r1
 8000434:	6013      	str	r3, [r2, #0]
 8000436:	bf00      	nop
 8000438:	370c      	adds	r7, #12
 800043a:	46bd      	mov	sp, r7
 800043c:	bc80      	pop	{r7}
 800043e:	4770      	bx	lr

08000440 <hardfault_handler>:
 8000440:	b580      	push	{r7, lr}
 8000442:	b094      	sub	sp, #80	; 0x50
 8000444:	af02      	add	r7, sp, #8
 8000446:	4a11      	ldr	r2, [pc, #68]	; (800048c <hardfault_handler+0x4c>)
 8000448:	4911      	ldr	r1, [pc, #68]	; (8000490 <hardfault_handler+0x50>)
 800044a:	4812      	ldr	r0, [pc, #72]	; (8000494 <hardfault_handler+0x54>)
 800044c:	f000 f86a 	bl	8000524 <tags_log>
 8000450:	2300      	movs	r3, #0
 8000452:	647b      	str	r3, [r7, #68]	; 0x44
 8000454:	e015      	b.n	8000482 <hardfault_handler+0x42>
 8000456:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8000458:	009a      	lsls	r2, r3, #2
 800045a:	490f      	ldr	r1, [pc, #60]	; (8000498 <hardfault_handler+0x58>)
 800045c:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800045e:	f851 3023 	ldr.w	r3, [r1, r3, lsl #2]
 8000462:	1d38      	adds	r0, r7, #4
 8000464:	9300      	str	r3, [sp, #0]
 8000466:	4613      	mov	r3, r2
 8000468:	4a0c      	ldr	r2, [pc, #48]	; (800049c <hardfault_handler+0x5c>)
 800046a:	2140      	movs	r1, #64	; 0x40
 800046c:	f000 fd3e 	bl	8000eec <sniprintf>
 8000470:	1d3b      	adds	r3, r7, #4
 8000472:	461a      	mov	r2, r3
 8000474:	4906      	ldr	r1, [pc, #24]	; (8000490 <hardfault_handler+0x50>)
 8000476:	4807      	ldr	r0, [pc, #28]	; (8000494 <hardfault_handler+0x54>)
 8000478:	f000 f854 	bl	8000524 <tags_log>
 800047c:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800047e:	3301      	adds	r3, #1
 8000480:	647b      	str	r3, [r7, #68]	; 0x44
 8000482:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8000484:	2b35      	cmp	r3, #53	; 0x35
 8000486:	d9e6      	bls.n	8000456 <hardfault_handler+0x16>
 8000488:	bf00      	nop
 800048a:	e7fd      	b.n	8000488 <hardfault_handler+0x48>
 800048c:	08001c8c 	.word	0x08001c8c
 8000490:	08001ca0 	.word	0x08001ca0
 8000494:	40011000 	.word	0x40011000
 8000498:	08000000 	.word	0x08000000
 800049c:	08001cac 	.word	0x08001cac

080004a0 <systick_handler>:
 80004a0:	b580      	push	{r7, lr}
 80004a2:	b088      	sub	sp, #32
 80004a4:	af00      	add	r7, sp, #0
 80004a6:	4b0b      	ldr	r3, [pc, #44]	; (80004d4 <systick_handler+0x34>)
 80004a8:	681b      	ldr	r3, [r3, #0]
 80004aa:	3301      	adds	r3, #1
 80004ac:	4a09      	ldr	r2, [pc, #36]	; (80004d4 <systick_handler+0x34>)
 80004ae:	6013      	str	r3, [r2, #0]
 80004b0:	4b08      	ldr	r3, [pc, #32]	; (80004d4 <systick_handler+0x34>)
 80004b2:	681b      	ldr	r3, [r3, #0]
 80004b4:	4638      	mov	r0, r7
 80004b6:	4a08      	ldr	r2, [pc, #32]	; (80004d8 <systick_handler+0x38>)
 80004b8:	2120      	movs	r1, #32
 80004ba:	f000 fd17 	bl	8000eec <sniprintf>
 80004be:	463b      	mov	r3, r7
 80004c0:	461a      	mov	r2, r3
 80004c2:	4906      	ldr	r1, [pc, #24]	; (80004dc <systick_handler+0x3c>)
 80004c4:	4806      	ldr	r0, [pc, #24]	; (80004e0 <systick_handler+0x40>)
 80004c6:	f000 f82d 	bl	8000524 <tags_log>
 80004ca:	bf00      	nop
 80004cc:	3720      	adds	r7, #32
 80004ce:	46bd      	mov	sp, r7
 80004d0:	bd80      	pop	{r7, pc}
 80004d2:	bf00      	nop
 80004d4:	20000078 	.word	0x20000078
 80004d8:	08001ccc 	.word	0x08001ccc
 80004dc:	08001ca0 	.word	0x08001ca0
 80004e0:	40011000 	.word	0x40011000

080004e4 <usart1_IRQhandler>:
 80004e4:	b580      	push	{r7, lr}
 80004e6:	af00      	add	r7, sp, #0
 80004e8:	4b05      	ldr	r3, [pc, #20]	; (8000500 <usart1_IRQhandler+0x1c>)
 80004ea:	681b      	ldr	r3, [r3, #0]
 80004ec:	f003 0320 	and.w	r3, r3, #32
 80004f0:	2b00      	cmp	r3, #0
 80004f2:	d002      	beq.n	80004fa <usart1_IRQhandler+0x16>
 80004f4:	4802      	ldr	r0, [pc, #8]	; (8000500 <usart1_IRQhandler+0x1c>)
 80004f6:	f7ff fe31 	bl	800015c <capslock>
 80004fa:	bf00      	nop
 80004fc:	bd80      	pop	{r7, pc}
 80004fe:	bf00      	nop
 8000500:	40011000 	.word	0x40011000

08000504 <usart2_IRQhandler>:
 8000504:	b580      	push	{r7, lr}
 8000506:	af00      	add	r7, sp, #0
 8000508:	4b05      	ldr	r3, [pc, #20]	; (8000520 <usart2_IRQhandler+0x1c>)
 800050a:	681b      	ldr	r3, [r3, #0]
 800050c:	f003 0320 	and.w	r3, r3, #32
 8000510:	2b00      	cmp	r3, #0
 8000512:	d002      	beq.n	800051a <usart2_IRQhandler+0x16>
 8000514:	4802      	ldr	r0, [pc, #8]	; (8000520 <usart2_IRQhandler+0x1c>)
 8000516:	f7ff fe21 	bl	800015c <capslock>
 800051a:	bf00      	nop
 800051c:	bd80      	pop	{r7, pc}
 800051e:	bf00      	nop
 8000520:	40004400 	.word	0x40004400

08000524 <tags_log>:
 8000524:	b580      	push	{r7, lr}
 8000526:	b084      	sub	sp, #16
 8000528:	af00      	add	r7, sp, #0
 800052a:	60f8      	str	r0, [r7, #12]
 800052c:	60b9      	str	r1, [r7, #8]
 800052e:	607a      	str	r2, [r7, #4]
 8000530:	68fb      	ldr	r3, [r7, #12]
 8000532:	4a08      	ldr	r2, [pc, #32]	; (8000554 <tags_log+0x30>)
 8000534:	4293      	cmp	r3, r2
 8000536:	d003      	beq.n	8000540 <tags_log+0x1c>
 8000538:	68fb      	ldr	r3, [r7, #12]
 800053a:	4a07      	ldr	r2, [pc, #28]	; (8000558 <tags_log+0x34>)
 800053c:	4293      	cmp	r3, r2
 800053e:	d104      	bne.n	800054a <tags_log+0x26>
 8000540:	687a      	ldr	r2, [r7, #4]
 8000542:	68b9      	ldr	r1, [r7, #8]
 8000544:	68f8      	ldr	r0, [r7, #12]
 8000546:	f000 f809 	bl	800055c <tag_send>
 800054a:	bf00      	nop
 800054c:	3710      	adds	r7, #16
 800054e:	46bd      	mov	sp, r7
 8000550:	bd80      	pop	{r7, pc}
 8000552:	bf00      	nop
 8000554:	40011000 	.word	0x40011000
 8000558:	40004400 	.word	0x40004400

0800055c <tag_send>:
 800055c:	b580      	push	{r7, lr}
 800055e:	b084      	sub	sp, #16
 8000560:	af00      	add	r7, sp, #0
 8000562:	60f8      	str	r0, [r7, #12]
 8000564:	60b9      	str	r1, [r7, #8]
 8000566:	607a      	str	r2, [r7, #4]
 8000568:	68b8      	ldr	r0, [r7, #8]
 800056a:	f000 faa3 	bl	8000ab4 <strlen>
 800056e:	4603      	mov	r3, r0
 8000570:	68ba      	ldr	r2, [r7, #8]
 8000572:	4619      	mov	r1, r3
 8000574:	68f8      	ldr	r0, [r7, #12]
 8000576:	f000 fa15 	bl	80009a4 <usart_transmit>
 800057a:	4b18      	ldr	r3, [pc, #96]	; (80005dc <tag_send+0x80>)
 800057c:	681b      	ldr	r3, [r3, #0]
 800057e:	4618      	mov	r0, r3
 8000580:	f000 fa98 	bl	8000ab4 <strlen>
 8000584:	4601      	mov	r1, r0
 8000586:	4b15      	ldr	r3, [pc, #84]	; (80005dc <tag_send+0x80>)
 8000588:	681b      	ldr	r3, [r3, #0]
 800058a:	461a      	mov	r2, r3
 800058c:	68f8      	ldr	r0, [r7, #12]
 800058e:	f000 fa09 	bl	80009a4 <usart_transmit>
 8000592:	4b13      	ldr	r3, [pc, #76]	; (80005e0 <tag_send+0x84>)
 8000594:	781b      	ldrb	r3, [r3, #0]
 8000596:	2b00      	cmp	r3, #0
 8000598:	d00e      	beq.n	80005b8 <tag_send+0x5c>
 800059a:	68f8      	ldr	r0, [r7, #12]
 800059c:	f000 f824 	bl	80005e8 <channel_send>
 80005a0:	4b0e      	ldr	r3, [pc, #56]	; (80005dc <tag_send+0x80>)
 80005a2:	681b      	ldr	r3, [r3, #0]
 80005a4:	4618      	mov	r0, r3
 80005a6:	f000 fa85 	bl	8000ab4 <strlen>
 80005aa:	4601      	mov	r1, r0
 80005ac:	4b0b      	ldr	r3, [pc, #44]	; (80005dc <tag_send+0x80>)
 80005ae:	681b      	ldr	r3, [r3, #0]
 80005b0:	461a      	mov	r2, r3
 80005b2:	68f8      	ldr	r0, [r7, #12]
 80005b4:	f000 f9f6 	bl	80009a4 <usart_transmit>
 80005b8:	6878      	ldr	r0, [r7, #4]
 80005ba:	f000 fa7b 	bl	8000ab4 <strlen>
 80005be:	4603      	mov	r3, r0
 80005c0:	687a      	ldr	r2, [r7, #4]
 80005c2:	4619      	mov	r1, r3
 80005c4:	68f8      	ldr	r0, [r7, #12]
 80005c6:	f000 f9ed 	bl	80009a4 <usart_transmit>
 80005ca:	4a06      	ldr	r2, [pc, #24]	; (80005e4 <tag_send+0x88>)
 80005cc:	2101      	movs	r1, #1
 80005ce:	68f8      	ldr	r0, [r7, #12]
 80005d0:	f000 f9e8 	bl	80009a4 <usart_transmit>
 80005d4:	bf00      	nop
 80005d6:	3710      	adds	r7, #16
 80005d8:	46bd      	mov	sp, r7
 80005da:	bd80      	pop	{r7, pc}
 80005dc:	20000000 	.word	0x20000000
 80005e0:	2000007c 	.word	0x2000007c
 80005e4:	08001cd8 	.word	0x08001cd8

080005e8 <channel_send>:
 80005e8:	b580      	push	{r7, lr}
 80005ea:	b084      	sub	sp, #16
 80005ec:	af00      	add	r7, sp, #0
 80005ee:	6078      	str	r0, [r7, #4]
 80005f0:	6878      	ldr	r0, [r7, #4]
 80005f2:	f000 f80e 	bl	8000612 <get_channel_name>
 80005f6:	60f8      	str	r0, [r7, #12]
 80005f8:	68f8      	ldr	r0, [r7, #12]
 80005fa:	f000 fa5b 	bl	8000ab4 <strlen>
 80005fe:	4603      	mov	r3, r0
 8000600:	68fa      	ldr	r2, [r7, #12]
 8000602:	4619      	mov	r1, r3
 8000604:	6878      	ldr	r0, [r7, #4]
 8000606:	f000 f9cd 	bl	80009a4 <usart_transmit>
 800060a:	bf00      	nop
 800060c:	3710      	adds	r7, #16
 800060e:	46bd      	mov	sp, r7
 8000610:	bd80      	pop	{r7, pc}

08000612 <get_channel_name>:
 8000612:	b480      	push	{r7}
 8000614:	b083      	sub	sp, #12
 8000616:	af00      	add	r7, sp, #0
 8000618:	6078      	str	r0, [r7, #4]
 800061a:	687b      	ldr	r3, [r7, #4]
 800061c:	4a08      	ldr	r2, [pc, #32]	; (8000640 <get_channel_name+0x2e>)
 800061e:	4293      	cmp	r3, r2
 8000620:	d005      	beq.n	800062e <get_channel_name+0x1c>
 8000622:	687b      	ldr	r3, [r7, #4]
 8000624:	4a07      	ldr	r2, [pc, #28]	; (8000644 <get_channel_name+0x32>)
 8000626:	4293      	cmp	r3, r2
 8000628:	d103      	bne.n	8000632 <get_channel_name+0x20>
 800062a:	4b07      	ldr	r3, [pc, #28]	; (8000648 <get_channel_name+0x36>)
 800062c:	e002      	b.n	8000634 <get_channel_name+0x22>
 800062e:	4b07      	ldr	r3, [pc, #28]	; (800064c <get_channel_name+0x3a>)
 8000630:	e000      	b.n	8000634 <get_channel_name+0x22>
 8000632:	4b07      	ldr	r3, [pc, #28]	; (8000650 <get_channel_name+0x3e>)
 8000634:	4618      	mov	r0, r3
 8000636:	370c      	adds	r7, #12
 8000638:	46bd      	mov	sp, r7
 800063a:	bc80      	pop	{r7}
 800063c:	4770      	bx	lr
 800063e:	bf00      	nop
 8000640:	40004400 	.word	0x40004400
 8000644:	40011000 	.word	0x40011000
 8000648:	08001cdc 	.word	0x08001cdc
 800064c:	08001ce4 	.word	0x08001ce4
 8000650:	08001cec 	.word	0x08001cec

08000654 <nvic_irq_setup>:
 8000654:	b480      	push	{r7}
 8000656:	b085      	sub	sp, #20
 8000658:	af00      	add	r7, sp, #0
 800065a:	6078      	str	r0, [r7, #4]
 800065c:	687b      	ldr	r3, [r7, #4]
 800065e:	095b      	lsrs	r3, r3, #5
 8000660:	60fb      	str	r3, [r7, #12]
 8000662:	687b      	ldr	r3, [r7, #4]
 8000664:	f003 031f 	and.w	r3, r3, #31
 8000668:	60bb      	str	r3, [r7, #8]
 800066a:	68fb      	ldr	r3, [r7, #12]
 800066c:	f103 2338 	add.w	r3, r3, #939538432	; 0x38003800
 8000670:	3340      	adds	r3, #64	; 0x40
 8000672:	009b      	lsls	r3, r3, #2
 8000674:	681a      	ldr	r2, [r3, #0]
 8000676:	2101      	movs	r1, #1
 8000678:	68bb      	ldr	r3, [r7, #8]
 800067a:	fa01 f303 	lsl.w	r3, r1, r3
 800067e:	4618      	mov	r0, r3
 8000680:	68fb      	ldr	r3, [r7, #12]
 8000682:	f103 2338 	add.w	r3, r3, #939538432	; 0x38003800
 8000686:	3340      	adds	r3, #64	; 0x40
 8000688:	009b      	lsls	r3, r3, #2
 800068a:	4619      	mov	r1, r3
 800068c:	ea42 0300 	orr.w	r3, r2, r0
 8000690:	600b      	str	r3, [r1, #0]
 8000692:	bf00      	nop
 8000694:	3714      	adds	r7, #20
 8000696:	46bd      	mov	sp, r7
 8000698:	bc80      	pop	{r7}
 800069a:	4770      	bx	lr

0800069c <nvic_global_enable>:
 800069c:	b580      	push	{r7, lr}
 800069e:	af00      	add	r7, sp, #0
 80006a0:	f000 f872 	bl	8000788 <_enable_irq>
 80006a4:	bf00      	nop
 80006a6:	bd80      	pop	{r7, pc}

080006a8 <rcc_periph_clock_enable>:
 80006a8:	b480      	push	{r7}
 80006aa:	b083      	sub	sp, #12
 80006ac:	af00      	add	r7, sp, #0
 80006ae:	6078      	str	r0, [r7, #4]
 80006b0:	6039      	str	r1, [r7, #0]
 80006b2:	687b      	ldr	r3, [r7, #4]
 80006b4:	2b00      	cmp	r3, #0
 80006b6:	d106      	bne.n	80006c6 <rcc_periph_clock_enable+0x1e>
 80006b8:	4b0f      	ldr	r3, [pc, #60]	; (80006f8 <rcc_periph_clock_enable+0x50>)
 80006ba:	681a      	ldr	r2, [r3, #0]
 80006bc:	490e      	ldr	r1, [pc, #56]	; (80006f8 <rcc_periph_clock_enable+0x50>)
 80006be:	683b      	ldr	r3, [r7, #0]
 80006c0:	4313      	orrs	r3, r2
 80006c2:	600b      	str	r3, [r1, #0]
 80006c4:	e012      	b.n	80006ec <rcc_periph_clock_enable+0x44>
 80006c6:	687b      	ldr	r3, [r7, #4]
 80006c8:	2b01      	cmp	r3, #1
 80006ca:	d106      	bne.n	80006da <rcc_periph_clock_enable+0x32>
 80006cc:	4b0b      	ldr	r3, [pc, #44]	; (80006fc <rcc_periph_clock_enable+0x54>)
 80006ce:	681a      	ldr	r2, [r3, #0]
 80006d0:	490a      	ldr	r1, [pc, #40]	; (80006fc <rcc_periph_clock_enable+0x54>)
 80006d2:	683b      	ldr	r3, [r7, #0]
 80006d4:	4313      	orrs	r3, r2
 80006d6:	600b      	str	r3, [r1, #0]
 80006d8:	e008      	b.n	80006ec <rcc_periph_clock_enable+0x44>
 80006da:	687b      	ldr	r3, [r7, #4]
 80006dc:	2b02      	cmp	r3, #2
 80006de:	d105      	bne.n	80006ec <rcc_periph_clock_enable+0x44>
 80006e0:	4b07      	ldr	r3, [pc, #28]	; (8000700 <rcc_periph_clock_enable+0x58>)
 80006e2:	681a      	ldr	r2, [r3, #0]
 80006e4:	4906      	ldr	r1, [pc, #24]	; (8000700 <rcc_periph_clock_enable+0x58>)
 80006e6:	683b      	ldr	r3, [r7, #0]
 80006e8:	4313      	orrs	r3, r2
 80006ea:	600b      	str	r3, [r1, #0]
 80006ec:	bf00      	nop
 80006ee:	370c      	adds	r7, #12
 80006f0:	46bd      	mov	sp, r7
 80006f2:	bc80      	pop	{r7}
 80006f4:	4770      	bx	lr
 80006f6:	bf00      	nop
 80006f8:	40023830 	.word	0x40023830
 80006fc:	40023840 	.word	0x40023840
 8000700:	40023844 	.word	0x40023844

08000704 <reset_handler>:
 8000704:	b580      	push	{r7, lr}
 8000706:	b088      	sub	sp, #32
 8000708:	af00      	add	r7, sp, #0
 800070a:	4a1a      	ldr	r2, [pc, #104]	; (8000774 <reset_handler+0x70>)
 800070c:	4b1a      	ldr	r3, [pc, #104]	; (8000778 <reset_handler+0x74>)
 800070e:	1ad3      	subs	r3, r2, r3
 8000710:	617b      	str	r3, [r7, #20]
 8000712:	4b1a      	ldr	r3, [pc, #104]	; (800077c <reset_handler+0x78>)
 8000714:	613b      	str	r3, [r7, #16]
 8000716:	4b18      	ldr	r3, [pc, #96]	; (8000778 <reset_handler+0x74>)
 8000718:	60fb      	str	r3, [r7, #12]
 800071a:	2300      	movs	r3, #0
 800071c:	61fb      	str	r3, [r7, #28]
 800071e:	e00a      	b.n	8000736 <reset_handler+0x32>
 8000720:	693a      	ldr	r2, [r7, #16]
 8000722:	69fb      	ldr	r3, [r7, #28]
 8000724:	441a      	add	r2, r3
 8000726:	68f9      	ldr	r1, [r7, #12]
 8000728:	69fb      	ldr	r3, [r7, #28]
 800072a:	440b      	add	r3, r1
 800072c:	7812      	ldrb	r2, [r2, #0]
 800072e:	701a      	strb	r2, [r3, #0]
 8000730:	69fb      	ldr	r3, [r7, #28]
 8000732:	3301      	adds	r3, #1
 8000734:	61fb      	str	r3, [r7, #28]
 8000736:	69fa      	ldr	r2, [r7, #28]
 8000738:	697b      	ldr	r3, [r7, #20]
 800073a:	429a      	cmp	r2, r3
 800073c:	d3f0      	bcc.n	8000720 <reset_handler+0x1c>
 800073e:	4a10      	ldr	r2, [pc, #64]	; (8000780 <reset_handler+0x7c>)
 8000740:	4b10      	ldr	r3, [pc, #64]	; (8000784 <reset_handler+0x80>)
 8000742:	1ad3      	subs	r3, r2, r3
 8000744:	60bb      	str	r3, [r7, #8]
 8000746:	4b0f      	ldr	r3, [pc, #60]	; (8000784 <reset_handler+0x80>)
 8000748:	607b      	str	r3, [r7, #4]
 800074a:	2300      	movs	r3, #0
 800074c:	61bb      	str	r3, [r7, #24]
 800074e:	e007      	b.n	8000760 <reset_handler+0x5c>
 8000750:	687a      	ldr	r2, [r7, #4]
 8000752:	69bb      	ldr	r3, [r7, #24]
 8000754:	4413      	add	r3, r2
 8000756:	2200      	movs	r2, #0
 8000758:	701a      	strb	r2, [r3, #0]
 800075a:	69bb      	ldr	r3, [r7, #24]
 800075c:	3301      	adds	r3, #1
 800075e:	61bb      	str	r3, [r7, #24]
 8000760:	69ba      	ldr	r2, [r7, #24]
 8000762:	68bb      	ldr	r3, [r7, #8]
 8000764:	429a      	cmp	r2, r3
 8000766:	d3f3      	bcc.n	8000750 <reset_handler+0x4c>
 8000768:	f7ff fd30 	bl	80001cc <main>
 800076c:	bf00      	nop
 800076e:	3720      	adds	r7, #32
 8000770:	46bd      	mov	sp, r7
 8000772:	bd80      	pop	{r7, pc}
 8000774:	20000078 	.word	0x20000078
 8000778:	20000000 	.word	0x20000000
 800077c:	08001f2c 	.word	0x08001f2c
 8000780:	200001f0 	.word	0x200001f0
 8000784:	20000078 	.word	0x20000078

08000788 <_enable_irq>:
 8000788:	b580      	push	{r7, lr}
 800078a:	af00      	add	r7, sp, #0
 800078c:	f000 f802 	bl	8000794 <__enable_irq>
 8000790:	bf00      	nop
 8000792:	bd80      	pop	{r7, pc}

08000794 <__enable_irq>:
 8000794:	b480      	push	{r7}
 8000796:	af00      	add	r7, sp, #0
 8000798:	b662      	cpsie	i
 800079a:	bf00      	nop
 800079c:	46bd      	mov	sp, r7
 800079e:	bc80      	pop	{r7}
 80007a0:	4770      	bx	lr
	...

080007a4 <_close>:
 80007a4:	b480      	push	{r7}
 80007a6:	b083      	sub	sp, #12
 80007a8:	af00      	add	r7, sp, #0
 80007aa:	6078      	str	r0, [r7, #4]
 80007ac:	f04f 33ff 	mov.w	r3, #4294967295
 80007b0:	4618      	mov	r0, r3
 80007b2:	370c      	adds	r7, #12
 80007b4:	46bd      	mov	sp, r7
 80007b6:	bc80      	pop	{r7}
 80007b8:	4770      	bx	lr

080007ba <_lseek>:
 80007ba:	b480      	push	{r7}
 80007bc:	b085      	sub	sp, #20
 80007be:	af00      	add	r7, sp, #0
 80007c0:	60f8      	str	r0, [r7, #12]
 80007c2:	60b9      	str	r1, [r7, #8]
 80007c4:	607a      	str	r2, [r7, #4]
 80007c6:	2300      	movs	r3, #0
 80007c8:	4618      	mov	r0, r3
 80007ca:	3714      	adds	r7, #20
 80007cc:	46bd      	mov	sp, r7
 80007ce:	bc80      	pop	{r7}
 80007d0:	4770      	bx	lr

080007d2 <_exit>:
 80007d2:	b480      	push	{r7}
 80007d4:	b083      	sub	sp, #12
 80007d6:	af00      	add	r7, sp, #0
 80007d8:	6078      	str	r0, [r7, #4]
 80007da:	bf00      	nop
 80007dc:	e7fd      	b.n	80007da <_exit+0x8>

080007de <_read>:
 80007de:	b480      	push	{r7}
 80007e0:	b085      	sub	sp, #20
 80007e2:	af00      	add	r7, sp, #0
 80007e4:	60f8      	str	r0, [r7, #12]
 80007e6:	60b9      	str	r1, [r7, #8]
 80007e8:	607a      	str	r2, [r7, #4]
 80007ea:	687b      	ldr	r3, [r7, #4]
 80007ec:	4618      	mov	r0, r3
 80007ee:	3714      	adds	r7, #20
 80007f0:	46bd      	mov	sp, r7
 80007f2:	bc80      	pop	{r7}
 80007f4:	4770      	bx	lr

080007f6 <_write>:
 80007f6:	b480      	push	{r7}
 80007f8:	b085      	sub	sp, #20
 80007fa:	af00      	add	r7, sp, #0
 80007fc:	60f8      	str	r0, [r7, #12]
 80007fe:	60b9      	str	r1, [r7, #8]
 8000800:	607a      	str	r2, [r7, #4]
 8000802:	687b      	ldr	r3, [r7, #4]
 8000804:	4618      	mov	r0, r3
 8000806:	3714      	adds	r7, #20
 8000808:	46bd      	mov	sp, r7
 800080a:	bc80      	pop	{r7}
 800080c:	4770      	bx	lr

0800080e <_sbrk>:
 800080e:	b480      	push	{r7}
 8000810:	b085      	sub	sp, #20
 8000812:	af00      	add	r7, sp, #0
 8000814:	6078      	str	r0, [r7, #4]
 8000816:	4b0b      	ldr	r3, [pc, #44]	; (8000844 <_sbrk+0x36>)
 8000818:	681b      	ldr	r3, [r3, #0]
 800081a:	2b00      	cmp	r3, #0
 800081c:	d102      	bne.n	8000824 <_sbrk+0x16>
 800081e:	4b09      	ldr	r3, [pc, #36]	; (8000844 <_sbrk+0x36>)
 8000820:	4a09      	ldr	r2, [pc, #36]	; (8000848 <_sbrk+0x3a>)
 8000822:	601a      	str	r2, [r3, #0]
 8000824:	4b07      	ldr	r3, [pc, #28]	; (8000844 <_sbrk+0x36>)
 8000826:	681b      	ldr	r3, [r3, #0]
 8000828:	60fb      	str	r3, [r7, #12]
 800082a:	4b06      	ldr	r3, [pc, #24]	; (8000844 <_sbrk+0x36>)
 800082c:	681a      	ldr	r2, [r3, #0]
 800082e:	687b      	ldr	r3, [r7, #4]
 8000830:	4413      	add	r3, r2
 8000832:	4a04      	ldr	r2, [pc, #16]	; (8000844 <_sbrk+0x36>)
 8000834:	6013      	str	r3, [r2, #0]
 8000836:	68fb      	ldr	r3, [r7, #12]
 8000838:	4618      	mov	r0, r3
 800083a:	3714      	adds	r7, #20
 800083c:	46bd      	mov	sp, r7
 800083e:	bc80      	pop	{r7}
 8000840:	4770      	bx	lr
 8000842:	bf00      	nop
 8000844:	20000080 	.word	0x20000080
 8000848:	00000000 	.word	0x00000000

0800084c <systick_init>:
 800084c:	b580      	push	{r7, lr}
 800084e:	b082      	sub	sp, #8
 8000850:	af00      	add	r7, sp, #0
 8000852:	6078      	str	r0, [r7, #4]
 8000854:	6878      	ldr	r0, [r7, #4]
 8000856:	f000 f804 	bl	8000862 <SysTick_Config>
 800085a:	bf00      	nop
 800085c:	3708      	adds	r7, #8
 800085e:	46bd      	mov	sp, r7
 8000860:	bd80      	pop	{r7, pc}

08000862 <SysTick_Config>:
 8000862:	b480      	push	{r7}
 8000864:	b083      	sub	sp, #12
 8000866:	af00      	add	r7, sp, #0
 8000868:	6078      	str	r0, [r7, #4]
 800086a:	687b      	ldr	r3, [r7, #4]
 800086c:	3b01      	subs	r3, #1
 800086e:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
 8000872:	d210      	bcs.n	8000896 <SysTick_Config+0x34>
 8000874:	4a0a      	ldr	r2, [pc, #40]	; (80008a0 <SysTick_Config+0x3e>)
 8000876:	687b      	ldr	r3, [r7, #4]
 8000878:	3b01      	subs	r3, #1
 800087a:	6013      	str	r3, [r2, #0]
 800087c:	4b09      	ldr	r3, [pc, #36]	; (80008a4 <SysTick_Config+0x42>)
 800087e:	2200      	movs	r2, #0
 8000880:	601a      	str	r2, [r3, #0]
 8000882:	4b09      	ldr	r3, [pc, #36]	; (80008a8 <SysTick_Config+0x46>)
 8000884:	2207      	movs	r2, #7
 8000886:	601a      	str	r2, [r3, #0]
 8000888:	4b08      	ldr	r3, [pc, #32]	; (80008ac <SysTick_Config+0x4a>)
 800088a:	681b      	ldr	r3, [r3, #0]
 800088c:	4a07      	ldr	r2, [pc, #28]	; (80008ac <SysTick_Config+0x4a>)
 800088e:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
 8000892:	6013      	str	r3, [r2, #0]
 8000894:	e000      	b.n	8000898 <SysTick_Config+0x36>
 8000896:	bf00      	nop
 8000898:	370c      	adds	r7, #12
 800089a:	46bd      	mov	sp, r7
 800089c:	bc80      	pop	{r7}
 800089e:	4770      	bx	lr
 80008a0:	e000e014 	.word	0xe000e014
 80008a4:	e000e018 	.word	0xe000e018
 80008a8:	e000e010 	.word	0xe000e010
 80008ac:	40023844 	.word	0x40023844

080008b0 <delay_ms>:
 80008b0:	b580      	push	{r7, lr}
 80008b2:	b094      	sub	sp, #80	; 0x50
 80008b4:	af00      	add	r7, sp, #0
 80008b6:	6078      	str	r0, [r7, #4]
 80008b8:	4b14      	ldr	r3, [pc, #80]	; (800090c <delay_ms+0x5c>)
 80008ba:	681b      	ldr	r3, [r3, #0]
 80008bc:	64fb      	str	r3, [r7, #76]	; 0x4c
 80008be:	6cfa      	ldr	r2, [r7, #76]	; 0x4c
 80008c0:	687b      	ldr	r3, [r7, #4]
 80008c2:	4413      	add	r3, r2
 80008c4:	64bb      	str	r3, [r7, #72]	; 0x48
 80008c6:	f107 0008 	add.w	r0, r7, #8
 80008ca:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 80008cc:	4a10      	ldr	r2, [pc, #64]	; (8000910 <delay_ms+0x60>)
 80008ce:	2140      	movs	r1, #64	; 0x40
 80008d0:	f000 fb0c 	bl	8000eec <sniprintf>
 80008d4:	4b0f      	ldr	r3, [pc, #60]	; (8000914 <delay_ms+0x64>)
 80008d6:	681b      	ldr	r3, [r3, #0]
 80008d8:	f107 0208 	add.w	r2, r7, #8
 80008dc:	4619      	mov	r1, r3
 80008de:	480e      	ldr	r0, [pc, #56]	; (8000918 <delay_ms+0x68>)
 80008e0:	f7ff fe20 	bl	8000524 <tags_log>
 80008e4:	f107 0008 	add.w	r0, r7, #8
 80008e8:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 80008ea:	4a0c      	ldr	r2, [pc, #48]	; (800091c <delay_ms+0x6c>)
 80008ec:	2140      	movs	r1, #64	; 0x40
 80008ee:	f000 fafd 	bl	8000eec <sniprintf>
 80008f2:	4b08      	ldr	r3, [pc, #32]	; (8000914 <delay_ms+0x64>)
 80008f4:	681b      	ldr	r3, [r3, #0]
 80008f6:	f107 0208 	add.w	r2, r7, #8
 80008fa:	4619      	mov	r1, r3
 80008fc:	4806      	ldr	r0, [pc, #24]	; (8000918 <delay_ms+0x68>)
 80008fe:	f7ff fe11 	bl	8000524 <tags_log>
 8000902:	bf00      	nop
 8000904:	3750      	adds	r7, #80	; 0x50
 8000906:	46bd      	mov	sp, r7
 8000908:	bd80      	pop	{r7, pc}
 800090a:	bf00      	nop
 800090c:	20000078 	.word	0x20000078
 8000910:	08001d08 	.word	0x08001d08
 8000914:	20000008 	.word	0x20000008
 8000918:	40011000 	.word	0x40011000
 800091c:	08001d14 	.word	0x08001d14

08000920 <usart_enable>:
 8000920:	b480      	push	{r7}
 8000922:	b083      	sub	sp, #12
 8000924:	af00      	add	r7, sp, #0
 8000926:	6078      	str	r0, [r7, #4]
 8000928:	687b      	ldr	r3, [r7, #4]
 800092a:	330c      	adds	r3, #12
 800092c:	681b      	ldr	r3, [r3, #0]
 800092e:	687a      	ldr	r2, [r7, #4]
 8000930:	320c      	adds	r2, #12
 8000932:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000936:	6013      	str	r3, [r2, #0]
 8000938:	bf00      	nop
 800093a:	370c      	adds	r7, #12
 800093c:	46bd      	mov	sp, r7
 800093e:	bc80      	pop	{r7}
 8000940:	4770      	bx	lr

08000942 <usart_set_mode>:
 8000942:	b480      	push	{r7}
 8000944:	b083      	sub	sp, #12
 8000946:	af00      	add	r7, sp, #0
 8000948:	6078      	str	r0, [r7, #4]
 800094a:	6039      	str	r1, [r7, #0]
 800094c:	687b      	ldr	r3, [r7, #4]
 800094e:	330c      	adds	r3, #12
 8000950:	681a      	ldr	r2, [r3, #0]
 8000952:	687b      	ldr	r3, [r7, #4]
 8000954:	330c      	adds	r3, #12
 8000956:	4619      	mov	r1, r3
 8000958:	683b      	ldr	r3, [r7, #0]
 800095a:	4313      	orrs	r3, r2
 800095c:	600b      	str	r3, [r1, #0]
 800095e:	bf00      	nop
 8000960:	370c      	adds	r7, #12
 8000962:	46bd      	mov	sp, r7
 8000964:	bc80      	pop	{r7}
 8000966:	4770      	bx	lr

08000968 <usart_set_baudrate>:
 8000968:	b480      	push	{r7}
 800096a:	b085      	sub	sp, #20
 800096c:	af00      	add	r7, sp, #0
 800096e:	6078      	str	r0, [r7, #4]
 8000970:	6039      	str	r1, [r7, #0]
 8000972:	687b      	ldr	r3, [r7, #4]
 8000974:	3308      	adds	r3, #8
 8000976:	681b      	ldr	r3, [r3, #0]
 8000978:	60fb      	str	r3, [r7, #12]
 800097a:	4b09      	ldr	r3, [pc, #36]	; (80009a0 <usart_set_baudrate+0x38>)
 800097c:	681a      	ldr	r2, [r3, #0]
 800097e:	683b      	ldr	r3, [r7, #0]
 8000980:	011b      	lsls	r3, r3, #4
 8000982:	fbb2 f3f3 	udiv	r3, r2, r3
 8000986:	011b      	lsls	r3, r3, #4
 8000988:	60fb      	str	r3, [r7, #12]
 800098a:	687b      	ldr	r3, [r7, #4]
 800098c:	3308      	adds	r3, #8
 800098e:	461a      	mov	r2, r3
 8000990:	68fb      	ldr	r3, [r7, #12]
 8000992:	6013      	str	r3, [r2, #0]
 8000994:	bf00      	nop
 8000996:	3714      	adds	r7, #20
 8000998:	46bd      	mov	sp, r7
 800099a:	bc80      	pop	{r7}
 800099c:	4770      	bx	lr
 800099e:	bf00      	nop
 80009a0:	20000004 	.word	0x20000004

080009a4 <usart_transmit>:
 80009a4:	b580      	push	{r7, lr}
 80009a6:	b086      	sub	sp, #24
 80009a8:	af00      	add	r7, sp, #0
 80009aa:	60f8      	str	r0, [r7, #12]
 80009ac:	60b9      	str	r1, [r7, #8]
 80009ae:	607a      	str	r2, [r7, #4]
 80009b0:	687b      	ldr	r3, [r7, #4]
 80009b2:	613b      	str	r3, [r7, #16]
 80009b4:	2300      	movs	r3, #0
 80009b6:	617b      	str	r3, [r7, #20]
 80009b8:	e00a      	b.n	80009d0 <usart_transmit+0x2c>
 80009ba:	693b      	ldr	r3, [r7, #16]
 80009bc:	1c5a      	adds	r2, r3, #1
 80009be:	613a      	str	r2, [r7, #16]
 80009c0:	781b      	ldrb	r3, [r3, #0]
 80009c2:	4619      	mov	r1, r3
 80009c4:	68f8      	ldr	r0, [r7, #12]
 80009c6:	f000 f80c 	bl	80009e2 <usart_send_byte>
 80009ca:	697b      	ldr	r3, [r7, #20]
 80009cc:	3301      	adds	r3, #1
 80009ce:	617b      	str	r3, [r7, #20]
 80009d0:	697a      	ldr	r2, [r7, #20]
 80009d2:	68bb      	ldr	r3, [r7, #8]
 80009d4:	429a      	cmp	r2, r3
 80009d6:	d3f0      	bcc.n	80009ba <usart_transmit+0x16>
 80009d8:	bf00      	nop
 80009da:	bf00      	nop
 80009dc:	3718      	adds	r7, #24
 80009de:	46bd      	mov	sp, r7
 80009e0:	bd80      	pop	{r7, pc}

080009e2 <usart_send_byte>:
 80009e2:	b480      	push	{r7}
 80009e4:	b083      	sub	sp, #12
 80009e6:	af00      	add	r7, sp, #0
 80009e8:	6078      	str	r0, [r7, #4]
 80009ea:	460b      	mov	r3, r1
 80009ec:	70fb      	strb	r3, [r7, #3]
 80009ee:	687b      	ldr	r3, [r7, #4]
 80009f0:	3304      	adds	r3, #4
 80009f2:	461a      	mov	r2, r3
 80009f4:	78fb      	ldrb	r3, [r7, #3]
 80009f6:	6013      	str	r3, [r2, #0]
 80009f8:	bf00      	nop
 80009fa:	687b      	ldr	r3, [r7, #4]
 80009fc:	681b      	ldr	r3, [r3, #0]
 80009fe:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8000a02:	2b00      	cmp	r3, #0
 8000a04:	d0f9      	beq.n	80009fa <usart_send_byte+0x18>
 8000a06:	bf00      	nop
 8000a08:	bf00      	nop
 8000a0a:	370c      	adds	r7, #12
 8000a0c:	46bd      	mov	sp, r7
 8000a0e:	bc80      	pop	{r7}
 8000a10:	4770      	bx	lr

08000a12 <usart_receive>:
 8000a12:	b590      	push	{r4, r7, lr}
 8000a14:	b087      	sub	sp, #28
 8000a16:	af00      	add	r7, sp, #0
 8000a18:	60f8      	str	r0, [r7, #12]
 8000a1a:	60b9      	str	r1, [r7, #8]
 8000a1c:	607a      	str	r2, [r7, #4]
 8000a1e:	687b      	ldr	r3, [r7, #4]
 8000a20:	613b      	str	r3, [r7, #16]
 8000a22:	2300      	movs	r3, #0
 8000a24:	617b      	str	r3, [r7, #20]
 8000a26:	e00a      	b.n	8000a3e <usart_receive+0x2c>
 8000a28:	693c      	ldr	r4, [r7, #16]
 8000a2a:	1c63      	adds	r3, r4, #1
 8000a2c:	613b      	str	r3, [r7, #16]
 8000a2e:	68f8      	ldr	r0, [r7, #12]
 8000a30:	f000 f80e 	bl	8000a50 <usart_get_byte>
 8000a34:	4603      	mov	r3, r0
 8000a36:	7023      	strb	r3, [r4, #0]
 8000a38:	697b      	ldr	r3, [r7, #20]
 8000a3a:	3301      	adds	r3, #1
 8000a3c:	617b      	str	r3, [r7, #20]
 8000a3e:	697a      	ldr	r2, [r7, #20]
 8000a40:	68bb      	ldr	r3, [r7, #8]
 8000a42:	429a      	cmp	r2, r3
 8000a44:	d3f0      	bcc.n	8000a28 <usart_receive+0x16>
 8000a46:	bf00      	nop
 8000a48:	bf00      	nop
 8000a4a:	371c      	adds	r7, #28
 8000a4c:	46bd      	mov	sp, r7
 8000a4e:	bd90      	pop	{r4, r7, pc}

08000a50 <usart_get_byte>:
 8000a50:	b480      	push	{r7}
 8000a52:	b083      	sub	sp, #12
 8000a54:	af00      	add	r7, sp, #0
 8000a56:	6078      	str	r0, [r7, #4]
 8000a58:	bf00      	nop
 8000a5a:	687b      	ldr	r3, [r7, #4]
 8000a5c:	681b      	ldr	r3, [r3, #0]
 8000a5e:	f003 0320 	and.w	r3, r3, #32
 8000a62:	2b00      	cmp	r3, #0
 8000a64:	d0f9      	beq.n	8000a5a <usart_get_byte+0xa>
 8000a66:	687b      	ldr	r3, [r7, #4]
 8000a68:	3304      	adds	r3, #4
 8000a6a:	681b      	ldr	r3, [r3, #0]
 8000a6c:	b2db      	uxtb	r3, r3
 8000a6e:	4618      	mov	r0, r3
 8000a70:	370c      	adds	r7, #12
 8000a72:	46bd      	mov	sp, r7
 8000a74:	bc80      	pop	{r7}
 8000a76:	4770      	bx	lr

08000a78 <usart_irq_enable>:
 8000a78:	b480      	push	{r7}
 8000a7a:	b083      	sub	sp, #12
 8000a7c:	af00      	add	r7, sp, #0
 8000a7e:	6078      	str	r0, [r7, #4]
 8000a80:	687b      	ldr	r3, [r7, #4]
 8000a82:	330c      	adds	r3, #12
 8000a84:	681b      	ldr	r3, [r3, #0]
 8000a86:	687a      	ldr	r2, [r7, #4]
 8000a88:	320c      	adds	r2, #12
 8000a8a:	f043 0320 	orr.w	r3, r3, #32
 8000a8e:	6013      	str	r3, [r2, #0]
 8000a90:	bf00      	nop
 8000a92:	370c      	adds	r7, #12
 8000a94:	46bd      	mov	sp, r7
 8000a96:	bc80      	pop	{r7}
 8000a98:	4770      	bx	lr

08000a9a <usart_init_send>:
 8000a9a:	b580      	push	{r7, lr}
 8000a9c:	b082      	sub	sp, #8
 8000a9e:	af00      	add	r7, sp, #0
 8000aa0:	6078      	str	r0, [r7, #4]
 8000aa2:	2100      	movs	r1, #0
 8000aa4:	6878      	ldr	r0, [r7, #4]
 8000aa6:	f7ff ff9c 	bl	80009e2 <usart_send_byte>
 8000aaa:	bf00      	nop
 8000aac:	3708      	adds	r7, #8
 8000aae:	46bd      	mov	sp, r7
 8000ab0:	bd80      	pop	{r7, pc}
 8000ab2:	bf00      	nop

08000ab4 <strlen>:
 8000ab4:	4603      	mov	r3, r0
 8000ab6:	f813 2b01 	ldrb.w	r2, [r3], #1
 8000aba:	2a00      	cmp	r2, #0
 8000abc:	d1fb      	bne.n	8000ab6 <strlen+0x2>
 8000abe:	1a18      	subs	r0, r3, r0
 8000ac0:	3801      	subs	r0, #1
 8000ac2:	4770      	bx	lr
	...

08000ad0 <memchr>:
 8000ad0:	f001 01ff 	and.w	r1, r1, #255	; 0xff
 8000ad4:	2a10      	cmp	r2, #16
 8000ad6:	db2b      	blt.n	8000b30 <memchr+0x60>
 8000ad8:	f010 0f07 	tst.w	r0, #7
 8000adc:	d008      	beq.n	8000af0 <memchr+0x20>
 8000ade:	f810 3b01 	ldrb.w	r3, [r0], #1
 8000ae2:	3a01      	subs	r2, #1
 8000ae4:	428b      	cmp	r3, r1
 8000ae6:	d02d      	beq.n	8000b44 <memchr+0x74>
 8000ae8:	f010 0f07 	tst.w	r0, #7
 8000aec:	b342      	cbz	r2, 8000b40 <memchr+0x70>
 8000aee:	d1f6      	bne.n	8000ade <memchr+0xe>
 8000af0:	b4f0      	push	{r4, r5, r6, r7}
 8000af2:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
 8000af6:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
 8000afa:	f022 0407 	bic.w	r4, r2, #7
 8000afe:	f07f 0700 	mvns.w	r7, #0
 8000b02:	2300      	movs	r3, #0
 8000b04:	e8f0 5602 	ldrd	r5, r6, [r0], #8
 8000b08:	3c08      	subs	r4, #8
 8000b0a:	ea85 0501 	eor.w	r5, r5, r1
 8000b0e:	ea86 0601 	eor.w	r6, r6, r1
 8000b12:	fa85 f547 	uadd8	r5, r5, r7
 8000b16:	faa3 f587 	sel	r5, r3, r7
 8000b1a:	fa86 f647 	uadd8	r6, r6, r7
 8000b1e:	faa5 f687 	sel	r6, r5, r7
 8000b22:	b98e      	cbnz	r6, 8000b48 <memchr+0x78>
 8000b24:	d1ee      	bne.n	8000b04 <memchr+0x34>
 8000b26:	bcf0      	pop	{r4, r5, r6, r7}
 8000b28:	f001 01ff 	and.w	r1, r1, #255	; 0xff
 8000b2c:	f002 0207 	and.w	r2, r2, #7
 8000b30:	b132      	cbz	r2, 8000b40 <memchr+0x70>
 8000b32:	f810 3b01 	ldrb.w	r3, [r0], #1
 8000b36:	3a01      	subs	r2, #1
 8000b38:	ea83 0301 	eor.w	r3, r3, r1
 8000b3c:	b113      	cbz	r3, 8000b44 <memchr+0x74>
 8000b3e:	d1f8      	bne.n	8000b32 <memchr+0x62>
 8000b40:	2000      	movs	r0, #0
 8000b42:	4770      	bx	lr
 8000b44:	3801      	subs	r0, #1
 8000b46:	4770      	bx	lr
 8000b48:	2d00      	cmp	r5, #0
 8000b4a:	bf06      	itte	eq
 8000b4c:	4635      	moveq	r5, r6
 8000b4e:	3803      	subeq	r0, #3
 8000b50:	3807      	subne	r0, #7
 8000b52:	f015 0f01 	tst.w	r5, #1
 8000b56:	d107      	bne.n	8000b68 <memchr+0x98>
 8000b58:	3001      	adds	r0, #1
 8000b5a:	f415 7f80 	tst.w	r5, #256	; 0x100
 8000b5e:	bf02      	ittt	eq
 8000b60:	3001      	addeq	r0, #1
 8000b62:	f415 3fc0 	tsteq.w	r5, #98304	; 0x18000
 8000b66:	3001      	addeq	r0, #1
 8000b68:	3801      	subs	r0, #1
 8000b6a:	bcf0      	pop	{r4, r5, r6, r7}
 8000b6c:	4770      	bx	lr
 8000b6e:	bf00      	nop

08000b70 <deregister_tm_clones>:
 8000b70:	4803      	ldr	r0, [pc, #12]	; (8000b80 <deregister_tm_clones+0x10>)
 8000b72:	4b04      	ldr	r3, [pc, #16]	; (8000b84 <deregister_tm_clones+0x14>)
 8000b74:	4283      	cmp	r3, r0
 8000b76:	d002      	beq.n	8000b7e <deregister_tm_clones+0xe>
 8000b78:	4b03      	ldr	r3, [pc, #12]	; (8000b88 <deregister_tm_clones+0x18>)
 8000b7a:	b103      	cbz	r3, 8000b7e <deregister_tm_clones+0xe>
 8000b7c:	4718      	bx	r3
 8000b7e:	4770      	bx	lr
 8000b80:	20000078 	.word	0x20000078
 8000b84:	20000078 	.word	0x20000078
 8000b88:	00000000 	.word	0x00000000

08000b8c <register_tm_clones>:
 8000b8c:	4805      	ldr	r0, [pc, #20]	; (8000ba4 <register_tm_clones+0x18>)
 8000b8e:	4b06      	ldr	r3, [pc, #24]	; (8000ba8 <register_tm_clones+0x1c>)
 8000b90:	1a1b      	subs	r3, r3, r0
 8000b92:	0fd9      	lsrs	r1, r3, #31
 8000b94:	eb01 01a3 	add.w	r1, r1, r3, asr #2
 8000b98:	1049      	asrs	r1, r1, #1
 8000b9a:	d002      	beq.n	8000ba2 <register_tm_clones+0x16>
 8000b9c:	4b03      	ldr	r3, [pc, #12]	; (8000bac <register_tm_clones+0x20>)
 8000b9e:	b103      	cbz	r3, 8000ba2 <register_tm_clones+0x16>
 8000ba0:	4718      	bx	r3
 8000ba2:	4770      	bx	lr
 8000ba4:	20000078 	.word	0x20000078
 8000ba8:	20000078 	.word	0x20000078
 8000bac:	00000000 	.word	0x00000000

08000bb0 <__do_global_dtors_aux>:
 8000bb0:	b510      	push	{r4, lr}
 8000bb2:	4c06      	ldr	r4, [pc, #24]	; (8000bcc <__do_global_dtors_aux+0x1c>)
 8000bb4:	7823      	ldrb	r3, [r4, #0]
 8000bb6:	b943      	cbnz	r3, 8000bca <__do_global_dtors_aux+0x1a>
 8000bb8:	f7ff ffda 	bl	8000b70 <deregister_tm_clones>
 8000bbc:	4b04      	ldr	r3, [pc, #16]	; (8000bd0 <__do_global_dtors_aux+0x20>)
 8000bbe:	b113      	cbz	r3, 8000bc6 <__do_global_dtors_aux+0x16>
 8000bc0:	4804      	ldr	r0, [pc, #16]	; (8000bd4 <__do_global_dtors_aux+0x24>)
 8000bc2:	f3af 8000 	nop.w
 8000bc6:	2301      	movs	r3, #1
 8000bc8:	7023      	strb	r3, [r4, #0]
 8000bca:	bd10      	pop	{r4, pc}
 8000bcc:	20000084 	.word	0x20000084
 8000bd0:	00000000 	.word	0x00000000
 8000bd4:	08001eb4 	.word	0x08001eb4

08000bd8 <frame_dummy>:
 8000bd8:	b508      	push	{r3, lr}
 8000bda:	4b05      	ldr	r3, [pc, #20]	; (8000bf0 <frame_dummy+0x18>)
 8000bdc:	b11b      	cbz	r3, 8000be6 <frame_dummy+0xe>
 8000bde:	4905      	ldr	r1, [pc, #20]	; (8000bf4 <frame_dummy+0x1c>)
 8000be0:	4805      	ldr	r0, [pc, #20]	; (8000bf8 <frame_dummy+0x20>)
 8000be2:	f3af 8000 	nop.w
 8000be6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000bea:	f7ff bfcf 	b.w	8000b8c <register_tm_clones>
 8000bee:	bf00      	nop
 8000bf0:	00000000 	.word	0x00000000
 8000bf4:	20000088 	.word	0x20000088
 8000bf8:	08001eb4 	.word	0x08001eb4

08000bfc <exit>:
 8000bfc:	b508      	push	{r3, lr}
 8000bfe:	4b06      	ldr	r3, [pc, #24]	; (8000c18 <exit+0x1c>)
 8000c00:	4604      	mov	r4, r0
 8000c02:	b113      	cbz	r3, 8000c0a <exit+0xe>
 8000c04:	2100      	movs	r1, #0
 8000c06:	f3af 8000 	nop.w
 8000c0a:	4b04      	ldr	r3, [pc, #16]	; (8000c1c <exit+0x20>)
 8000c0c:	681b      	ldr	r3, [r3, #0]
 8000c0e:	b103      	cbz	r3, 8000c12 <exit+0x16>
 8000c10:	4798      	blx	r3
 8000c12:	4620      	mov	r0, r4
 8000c14:	f7ff fddd 	bl	80007d2 <_exit>
 8000c18:	00000000 	.word	0x00000000
 8000c1c:	200001d8 	.word	0x200001d8

08000c20 <std>:
 8000c20:	2300      	movs	r3, #0
 8000c22:	b510      	push	{r4, lr}
 8000c24:	4604      	mov	r4, r0
 8000c26:	e9c0 3300 	strd	r3, r3, [r0]
 8000c2a:	e9c0 3304 	strd	r3, r3, [r0, #16]
 8000c2e:	6083      	str	r3, [r0, #8]
 8000c30:	8181      	strh	r1, [r0, #12]
 8000c32:	6643      	str	r3, [r0, #100]	; 0x64
 8000c34:	81c2      	strh	r2, [r0, #14]
 8000c36:	6183      	str	r3, [r0, #24]
 8000c38:	4619      	mov	r1, r3
 8000c3a:	2208      	movs	r2, #8
 8000c3c:	305c      	adds	r0, #92	; 0x5c
 8000c3e:	f000 f9ce 	bl	8000fde <memset>
 8000c42:	4b05      	ldr	r3, [pc, #20]	; (8000c58 <std+0x38>)
 8000c44:	6263      	str	r3, [r4, #36]	; 0x24
 8000c46:	4b05      	ldr	r3, [pc, #20]	; (8000c5c <std+0x3c>)
 8000c48:	62a3      	str	r3, [r4, #40]	; 0x28
 8000c4a:	4b05      	ldr	r3, [pc, #20]	; (8000c60 <std+0x40>)
 8000c4c:	62e3      	str	r3, [r4, #44]	; 0x2c
 8000c4e:	4b05      	ldr	r3, [pc, #20]	; (8000c64 <std+0x44>)
 8000c50:	6224      	str	r4, [r4, #32]
 8000c52:	6323      	str	r3, [r4, #48]	; 0x30
 8000c54:	bd10      	pop	{r4, pc}
 8000c56:	bf00      	nop
 8000c58:	08000f55 	.word	0x08000f55
 8000c5c:	08000f7b 	.word	0x08000f7b
 8000c60:	08000fb3 	.word	0x08000fb3
 8000c64:	08000fd7 	.word	0x08000fd7

08000c68 <stdio_exit_handler>:
 8000c68:	4a02      	ldr	r2, [pc, #8]	; (8000c74 <stdio_exit_handler+0xc>)
 8000c6a:	4903      	ldr	r1, [pc, #12]	; (8000c78 <stdio_exit_handler+0x10>)
 8000c6c:	4803      	ldr	r0, [pc, #12]	; (8000c7c <stdio_exit_handler+0x14>)
 8000c6e:	f000 b8ef 	b.w	8000e50 <_fwalk_sglue>
 8000c72:	bf00      	nop
 8000c74:	20000014 	.word	0x20000014
 8000c78:	08001b39 	.word	0x08001b39
 8000c7c:	20000024 	.word	0x20000024

08000c80 <cleanup_stdio>:
 8000c80:	6841      	ldr	r1, [r0, #4]
 8000c82:	4b0c      	ldr	r3, [pc, #48]	; (8000cb4 <cleanup_stdio+0x34>)
 8000c84:	4299      	cmp	r1, r3
 8000c86:	b510      	push	{r4, lr}
 8000c88:	4604      	mov	r4, r0
 8000c8a:	d001      	beq.n	8000c90 <cleanup_stdio+0x10>
 8000c8c:	f000 ff54 	bl	8001b38 <_fflush_r>
 8000c90:	68a1      	ldr	r1, [r4, #8]
 8000c92:	4b09      	ldr	r3, [pc, #36]	; (8000cb8 <cleanup_stdio+0x38>)
 8000c94:	4299      	cmp	r1, r3
 8000c96:	d002      	beq.n	8000c9e <cleanup_stdio+0x1e>
 8000c98:	4620      	mov	r0, r4
 8000c9a:	f000 ff4d 	bl	8001b38 <_fflush_r>
 8000c9e:	68e1      	ldr	r1, [r4, #12]
 8000ca0:	4b06      	ldr	r3, [pc, #24]	; (8000cbc <cleanup_stdio+0x3c>)
 8000ca2:	4299      	cmp	r1, r3
 8000ca4:	d004      	beq.n	8000cb0 <cleanup_stdio+0x30>
 8000ca6:	4620      	mov	r0, r4
 8000ca8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000cac:	f000 bf44 	b.w	8001b38 <_fflush_r>
 8000cb0:	bd10      	pop	{r4, pc}
 8000cb2:	bf00      	nop
 8000cb4:	200000a0 	.word	0x200000a0
 8000cb8:	20000108 	.word	0x20000108
 8000cbc:	20000170 	.word	0x20000170

08000cc0 <__fp_lock>:
 8000cc0:	b508      	push	{r3, lr}
 8000cc2:	6e4b      	ldr	r3, [r1, #100]	; 0x64
 8000cc4:	07da      	lsls	r2, r3, #31
 8000cc6:	d405      	bmi.n	8000cd4 <__fp_lock+0x14>
 8000cc8:	898b      	ldrh	r3, [r1, #12]
 8000cca:	059b      	lsls	r3, r3, #22
 8000ccc:	d402      	bmi.n	8000cd4 <__fp_lock+0x14>
 8000cce:	6d88      	ldr	r0, [r1, #88]	; 0x58
 8000cd0:	f000 fa53 	bl	800117a <__retarget_lock_acquire_recursive>
 8000cd4:	2000      	movs	r0, #0
 8000cd6:	bd08      	pop	{r3, pc}

08000cd8 <__fp_unlock>:
 8000cd8:	b508      	push	{r3, lr}
 8000cda:	6e4b      	ldr	r3, [r1, #100]	; 0x64
 8000cdc:	07da      	lsls	r2, r3, #31
 8000cde:	d405      	bmi.n	8000cec <__fp_unlock+0x14>
 8000ce0:	898b      	ldrh	r3, [r1, #12]
 8000ce2:	059b      	lsls	r3, r3, #22
 8000ce4:	d402      	bmi.n	8000cec <__fp_unlock+0x14>
 8000ce6:	6d88      	ldr	r0, [r1, #88]	; 0x58
 8000ce8:	f000 fa4d 	bl	8001186 <__retarget_lock_release_recursive>
 8000cec:	2000      	movs	r0, #0
 8000cee:	bd08      	pop	{r3, pc}

08000cf0 <global_stdio_init.part.0>:
 8000cf0:	b510      	push	{r4, lr}
 8000cf2:	4b0b      	ldr	r3, [pc, #44]	; (8000d20 <global_stdio_init.part.0+0x30>)
 8000cf4:	4c0b      	ldr	r4, [pc, #44]	; (8000d24 <global_stdio_init.part.0+0x34>)
 8000cf6:	4a0c      	ldr	r2, [pc, #48]	; (8000d28 <global_stdio_init.part.0+0x38>)
 8000cf8:	601a      	str	r2, [r3, #0]
 8000cfa:	4620      	mov	r0, r4
 8000cfc:	2200      	movs	r2, #0
 8000cfe:	2104      	movs	r1, #4
 8000d00:	f7ff ff8e 	bl	8000c20 <std>
 8000d04:	f104 0068 	add.w	r0, r4, #104	; 0x68
 8000d08:	2201      	movs	r2, #1
 8000d0a:	2109      	movs	r1, #9
 8000d0c:	f7ff ff88 	bl	8000c20 <std>
 8000d10:	f104 00d0 	add.w	r0, r4, #208	; 0xd0
 8000d14:	2202      	movs	r2, #2
 8000d16:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000d1a:	2112      	movs	r1, #18
 8000d1c:	f7ff bf80 	b.w	8000c20 <std>
 8000d20:	200001d8 	.word	0x200001d8
 8000d24:	200000a0 	.word	0x200000a0
 8000d28:	08000c69 	.word	0x08000c69

08000d2c <__sfp_lock_acquire>:
 8000d2c:	4801      	ldr	r0, [pc, #4]	; (8000d34 <__sfp_lock_acquire+0x8>)
 8000d2e:	f000 ba24 	b.w	800117a <__retarget_lock_acquire_recursive>
 8000d32:	bf00      	nop
 8000d34:	200001e7 	.word	0x200001e7

08000d38 <__sfp_lock_release>:
 8000d38:	4801      	ldr	r0, [pc, #4]	; (8000d40 <__sfp_lock_release+0x8>)
 8000d3a:	f000 ba24 	b.w	8001186 <__retarget_lock_release_recursive>
 8000d3e:	bf00      	nop
 8000d40:	200001e7 	.word	0x200001e7

08000d44 <__sfp>:
 8000d44:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000d46:	4607      	mov	r7, r0
 8000d48:	f7ff fff0 	bl	8000d2c <__sfp_lock_acquire>
 8000d4c:	4b23      	ldr	r3, [pc, #140]	; (8000ddc <__sfp+0x98>)
 8000d4e:	681b      	ldr	r3, [r3, #0]
 8000d50:	b90b      	cbnz	r3, 8000d56 <__sfp+0x12>
 8000d52:	f7ff ffcd 	bl	8000cf0 <global_stdio_init.part.0>
 8000d56:	4e22      	ldr	r6, [pc, #136]	; (8000de0 <__sfp+0x9c>)
 8000d58:	e9d6 3401 	ldrd	r3, r4, [r6, #4]
 8000d5c:	3b01      	subs	r3, #1
 8000d5e:	d50f      	bpl.n	8000d80 <__sfp+0x3c>
 8000d60:	6835      	ldr	r5, [r6, #0]
 8000d62:	2d00      	cmp	r5, #0
 8000d64:	d137      	bne.n	8000dd6 <__sfp+0x92>
 8000d66:	f44f 71d6 	mov.w	r1, #428	; 0x1ac
 8000d6a:	4638      	mov	r0, r7
 8000d6c:	f000 fa78 	bl	8001260 <_malloc_r>
 8000d70:	4604      	mov	r4, r0
 8000d72:	bb28      	cbnz	r0, 8000dc0 <__sfp+0x7c>
 8000d74:	6030      	str	r0, [r6, #0]
 8000d76:	f7ff ffdf 	bl	8000d38 <__sfp_lock_release>
 8000d7a:	230c      	movs	r3, #12
 8000d7c:	603b      	str	r3, [r7, #0]
 8000d7e:	e01b      	b.n	8000db8 <__sfp+0x74>
 8000d80:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
 8000d84:	b9d5      	cbnz	r5, 8000dbc <__sfp+0x78>
 8000d86:	4b17      	ldr	r3, [pc, #92]	; (8000de4 <__sfp+0xa0>)
 8000d88:	60e3      	str	r3, [r4, #12]
 8000d8a:	f104 0058 	add.w	r0, r4, #88	; 0x58
 8000d8e:	6665      	str	r5, [r4, #100]	; 0x64
 8000d90:	f000 f9ef 	bl	8001172 <__retarget_lock_init_recursive>
 8000d94:	f7ff ffd0 	bl	8000d38 <__sfp_lock_release>
 8000d98:	e9c4 5501 	strd	r5, r5, [r4, #4]
 8000d9c:	e9c4 5504 	strd	r5, r5, [r4, #16]
 8000da0:	6025      	str	r5, [r4, #0]
 8000da2:	61a5      	str	r5, [r4, #24]
 8000da4:	2208      	movs	r2, #8
 8000da6:	4629      	mov	r1, r5
 8000da8:	f104 005c 	add.w	r0, r4, #92	; 0x5c
 8000dac:	f000 f917 	bl	8000fde <memset>
 8000db0:	e9c4 550d 	strd	r5, r5, [r4, #52]	; 0x34
 8000db4:	e9c4 5512 	strd	r5, r5, [r4, #72]	; 0x48
 8000db8:	4620      	mov	r0, r4
 8000dba:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000dbc:	3468      	adds	r4, #104	; 0x68
 8000dbe:	e7cd      	b.n	8000d5c <__sfp+0x18>
 8000dc0:	2304      	movs	r3, #4
 8000dc2:	6005      	str	r5, [r0, #0]
 8000dc4:	6043      	str	r3, [r0, #4]
 8000dc6:	300c      	adds	r0, #12
 8000dc8:	60a0      	str	r0, [r4, #8]
 8000dca:	f44f 72d0 	mov.w	r2, #416	; 0x1a0
 8000dce:	4629      	mov	r1, r5
 8000dd0:	f000 f905 	bl	8000fde <memset>
 8000dd4:	6034      	str	r4, [r6, #0]
 8000dd6:	6836      	ldr	r6, [r6, #0]
 8000dd8:	e7be      	b.n	8000d58 <__sfp+0x14>
 8000dda:	bf00      	nop
 8000ddc:	200001d8 	.word	0x200001d8
 8000de0:	20000014 	.word	0x20000014
 8000de4:	ffff0001 	.word	0xffff0001

08000de8 <__sinit>:
 8000de8:	b510      	push	{r4, lr}
 8000dea:	4604      	mov	r4, r0
 8000dec:	f7ff ff9e 	bl	8000d2c <__sfp_lock_acquire>
 8000df0:	6a23      	ldr	r3, [r4, #32]
 8000df2:	b11b      	cbz	r3, 8000dfc <__sinit+0x14>
 8000df4:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000df8:	f7ff bf9e 	b.w	8000d38 <__sfp_lock_release>
 8000dfc:	4b04      	ldr	r3, [pc, #16]	; (8000e10 <__sinit+0x28>)
 8000dfe:	6223      	str	r3, [r4, #32]
 8000e00:	4b04      	ldr	r3, [pc, #16]	; (8000e14 <__sinit+0x2c>)
 8000e02:	681b      	ldr	r3, [r3, #0]
 8000e04:	2b00      	cmp	r3, #0
 8000e06:	d1f5      	bne.n	8000df4 <__sinit+0xc>
 8000e08:	f7ff ff72 	bl	8000cf0 <global_stdio_init.part.0>
 8000e0c:	e7f2      	b.n	8000df4 <__sinit+0xc>
 8000e0e:	bf00      	nop
 8000e10:	08000c81 	.word	0x08000c81
 8000e14:	200001d8 	.word	0x200001d8

08000e18 <__fp_lock_all>:
 8000e18:	b508      	push	{r3, lr}
 8000e1a:	f7ff ff87 	bl	8000d2c <__sfp_lock_acquire>
 8000e1e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000e22:	4a02      	ldr	r2, [pc, #8]	; (8000e2c <__fp_lock_all+0x14>)
 8000e24:	4902      	ldr	r1, [pc, #8]	; (8000e30 <__fp_lock_all+0x18>)
 8000e26:	2000      	movs	r0, #0
 8000e28:	f000 b812 	b.w	8000e50 <_fwalk_sglue>
 8000e2c:	20000014 	.word	0x20000014
 8000e30:	08000cc1 	.word	0x08000cc1

08000e34 <__fp_unlock_all>:
 8000e34:	b508      	push	{r3, lr}
 8000e36:	4a04      	ldr	r2, [pc, #16]	; (8000e48 <__fp_unlock_all+0x14>)
 8000e38:	4904      	ldr	r1, [pc, #16]	; (8000e4c <__fp_unlock_all+0x18>)
 8000e3a:	2000      	movs	r0, #0
 8000e3c:	f000 f808 	bl	8000e50 <_fwalk_sglue>
 8000e40:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000e44:	f7ff bf78 	b.w	8000d38 <__sfp_lock_release>
 8000e48:	20000014 	.word	0x20000014
 8000e4c:	08000cd9 	.word	0x08000cd9

08000e50 <_fwalk_sglue>:
 8000e50:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000e54:	4607      	mov	r7, r0
 8000e56:	4688      	mov	r8, r1
 8000e58:	4614      	mov	r4, r2
 8000e5a:	2600      	movs	r6, #0
 8000e5c:	e9d4 9501 	ldrd	r9, r5, [r4, #4]
 8000e60:	f1b9 0901 	subs.w	r9, r9, #1
 8000e64:	d505      	bpl.n	8000e72 <_fwalk_sglue+0x22>
 8000e66:	6824      	ldr	r4, [r4, #0]
 8000e68:	2c00      	cmp	r4, #0
 8000e6a:	d1f7      	bne.n	8000e5c <_fwalk_sglue+0xc>
 8000e6c:	4630      	mov	r0, r6
 8000e6e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000e72:	89ab      	ldrh	r3, [r5, #12]
 8000e74:	2b01      	cmp	r3, #1
 8000e76:	d907      	bls.n	8000e88 <_fwalk_sglue+0x38>
 8000e78:	f9b5 300e 	ldrsh.w	r3, [r5, #14]
 8000e7c:	3301      	adds	r3, #1
 8000e7e:	d003      	beq.n	8000e88 <_fwalk_sglue+0x38>
 8000e80:	4629      	mov	r1, r5
 8000e82:	4638      	mov	r0, r7
 8000e84:	47c0      	blx	r8
 8000e86:	4306      	orrs	r6, r0
 8000e88:	3568      	adds	r5, #104	; 0x68
 8000e8a:	e7e9      	b.n	8000e60 <_fwalk_sglue+0x10>

08000e8c <_sniprintf_r>:
 8000e8c:	b408      	push	{r3}
 8000e8e:	b530      	push	{r4, r5, lr}
 8000e90:	1e14      	subs	r4, r2, #0
 8000e92:	b09c      	sub	sp, #112	; 0x70
 8000e94:	4605      	mov	r5, r0
 8000e96:	da08      	bge.n	8000eaa <_sniprintf_r+0x1e>
 8000e98:	238b      	movs	r3, #139	; 0x8b
 8000e9a:	6003      	str	r3, [r0, #0]
 8000e9c:	f04f 30ff 	mov.w	r0, #4294967295
 8000ea0:	b01c      	add	sp, #112	; 0x70
 8000ea2:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000ea6:	b001      	add	sp, #4
 8000ea8:	4770      	bx	lr
 8000eaa:	f44f 7302 	mov.w	r3, #520	; 0x208
 8000eae:	f8ad 3014 	strh.w	r3, [sp, #20]
 8000eb2:	bf14      	ite	ne
 8000eb4:	f104 33ff 	addne.w	r3, r4, #4294967295
 8000eb8:	4623      	moveq	r3, r4
 8000eba:	9304      	str	r3, [sp, #16]
 8000ebc:	9307      	str	r3, [sp, #28]
 8000ebe:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000ec2:	9102      	str	r1, [sp, #8]
 8000ec4:	9106      	str	r1, [sp, #24]
 8000ec6:	f8ad 3016 	strh.w	r3, [sp, #22]
 8000eca:	9a1f      	ldr	r2, [sp, #124]	; 0x7c
 8000ecc:	ab20      	add	r3, sp, #128	; 0x80
 8000ece:	a902      	add	r1, sp, #8
 8000ed0:	9301      	str	r3, [sp, #4]
 8000ed2:	f000 fb19 	bl	8001508 <_svfiprintf_r>
 8000ed6:	1c43      	adds	r3, r0, #1
 8000ed8:	bfbc      	itt	lt
 8000eda:	238b      	movlt	r3, #139	; 0x8b
 8000edc:	602b      	strlt	r3, [r5, #0]
 8000ede:	2c00      	cmp	r4, #0
 8000ee0:	d0de      	beq.n	8000ea0 <_sniprintf_r+0x14>
 8000ee2:	9b02      	ldr	r3, [sp, #8]
 8000ee4:	2200      	movs	r2, #0
 8000ee6:	701a      	strb	r2, [r3, #0]
 8000ee8:	e7da      	b.n	8000ea0 <_sniprintf_r+0x14>
	...

08000eec <sniprintf>:
 8000eec:	b40c      	push	{r2, r3}
 8000eee:	b530      	push	{r4, r5, lr}
 8000ef0:	4b17      	ldr	r3, [pc, #92]	; (8000f50 <sniprintf+0x64>)
 8000ef2:	1e0c      	subs	r4, r1, #0
 8000ef4:	681d      	ldr	r5, [r3, #0]
 8000ef6:	b09d      	sub	sp, #116	; 0x74
 8000ef8:	da08      	bge.n	8000f0c <sniprintf+0x20>
 8000efa:	238b      	movs	r3, #139	; 0x8b
 8000efc:	602b      	str	r3, [r5, #0]
 8000efe:	f04f 30ff 	mov.w	r0, #4294967295
 8000f02:	b01d      	add	sp, #116	; 0x74
 8000f04:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000f08:	b002      	add	sp, #8
 8000f0a:	4770      	bx	lr
 8000f0c:	f44f 7302 	mov.w	r3, #520	; 0x208
 8000f10:	f8ad 3014 	strh.w	r3, [sp, #20]
 8000f14:	bf14      	ite	ne
 8000f16:	f104 33ff 	addne.w	r3, r4, #4294967295
 8000f1a:	4623      	moveq	r3, r4
 8000f1c:	9304      	str	r3, [sp, #16]
 8000f1e:	9307      	str	r3, [sp, #28]
 8000f20:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000f24:	9002      	str	r0, [sp, #8]
 8000f26:	9006      	str	r0, [sp, #24]
 8000f28:	f8ad 3016 	strh.w	r3, [sp, #22]
 8000f2c:	9a20      	ldr	r2, [sp, #128]	; 0x80
 8000f2e:	ab21      	add	r3, sp, #132	; 0x84
 8000f30:	a902      	add	r1, sp, #8
 8000f32:	4628      	mov	r0, r5
 8000f34:	9301      	str	r3, [sp, #4]
 8000f36:	f000 fae7 	bl	8001508 <_svfiprintf_r>
 8000f3a:	1c43      	adds	r3, r0, #1
 8000f3c:	bfbc      	itt	lt
 8000f3e:	238b      	movlt	r3, #139	; 0x8b
 8000f40:	602b      	strlt	r3, [r5, #0]
 8000f42:	2c00      	cmp	r4, #0
 8000f44:	d0dd      	beq.n	8000f02 <sniprintf+0x16>
 8000f46:	9b02      	ldr	r3, [sp, #8]
 8000f48:	2200      	movs	r2, #0
 8000f4a:	701a      	strb	r2, [r3, #0]
 8000f4c:	e7d9      	b.n	8000f02 <sniprintf+0x16>
 8000f4e:	bf00      	nop
 8000f50:	20000020 	.word	0x20000020

08000f54 <__sread>:
 8000f54:	b510      	push	{r4, lr}
 8000f56:	460c      	mov	r4, r1
 8000f58:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8000f5c:	f000 f8c0 	bl	80010e0 <_read_r>
 8000f60:	2800      	cmp	r0, #0
 8000f62:	bfab      	itete	ge
 8000f64:	6d63      	ldrge	r3, [r4, #84]	; 0x54
 8000f66:	89a3      	ldrhlt	r3, [r4, #12]
 8000f68:	181b      	addge	r3, r3, r0
 8000f6a:	f423 5380 	biclt.w	r3, r3, #4096	; 0x1000
 8000f6e:	bfac      	ite	ge
 8000f70:	6563      	strge	r3, [r4, #84]	; 0x54
 8000f72:	81a3      	strhlt	r3, [r4, #12]
 8000f74:	bd10      	pop	{r4, pc}

08000f76 <__seofread>:
 8000f76:	2000      	movs	r0, #0
 8000f78:	4770      	bx	lr

08000f7a <__swrite>:
 8000f7a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000f7e:	461f      	mov	r7, r3
 8000f80:	898b      	ldrh	r3, [r1, #12]
 8000f82:	05db      	lsls	r3, r3, #23
 8000f84:	4605      	mov	r5, r0
 8000f86:	460c      	mov	r4, r1
 8000f88:	4616      	mov	r6, r2
 8000f8a:	d505      	bpl.n	8000f98 <__swrite+0x1e>
 8000f8c:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8000f90:	2302      	movs	r3, #2
 8000f92:	2200      	movs	r2, #0
 8000f94:	f000 f892 	bl	80010bc <_lseek_r>
 8000f98:	89a3      	ldrh	r3, [r4, #12]
 8000f9a:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
 8000f9e:	f423 5380 	bic.w	r3, r3, #4096	; 0x1000
 8000fa2:	81a3      	strh	r3, [r4, #12]
 8000fa4:	4632      	mov	r2, r6
 8000fa6:	463b      	mov	r3, r7
 8000fa8:	4628      	mov	r0, r5
 8000faa:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 8000fae:	f000 b8a9 	b.w	8001104 <_write_r>

08000fb2 <__sseek>:
 8000fb2:	b510      	push	{r4, lr}
 8000fb4:	460c      	mov	r4, r1
 8000fb6:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8000fba:	f000 f87f 	bl	80010bc <_lseek_r>
 8000fbe:	1c43      	adds	r3, r0, #1
 8000fc0:	89a3      	ldrh	r3, [r4, #12]
 8000fc2:	bf15      	itete	ne
 8000fc4:	6560      	strne	r0, [r4, #84]	; 0x54
 8000fc6:	f423 5380 	biceq.w	r3, r3, #4096	; 0x1000
 8000fca:	f443 5380 	orrne.w	r3, r3, #4096	; 0x1000
 8000fce:	81a3      	strheq	r3, [r4, #12]
 8000fd0:	bf18      	it	ne
 8000fd2:	81a3      	strhne	r3, [r4, #12]
 8000fd4:	bd10      	pop	{r4, pc}

08000fd6 <__sclose>:
 8000fd6:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8000fda:	f000 b809 	b.w	8000ff0 <_close_r>

08000fde <memset>:
 8000fde:	4402      	add	r2, r0
 8000fe0:	4603      	mov	r3, r0
 8000fe2:	4293      	cmp	r3, r2
 8000fe4:	d100      	bne.n	8000fe8 <memset+0xa>
 8000fe6:	4770      	bx	lr
 8000fe8:	f803 1b01 	strb.w	r1, [r3], #1
 8000fec:	e7f9      	b.n	8000fe2 <memset+0x4>
	...

08000ff0 <_close_r>:
 8000ff0:	b538      	push	{r3, r4, r5, lr}
 8000ff2:	4d06      	ldr	r5, [pc, #24]	; (800100c <_close_r+0x1c>)
 8000ff4:	2300      	movs	r3, #0
 8000ff6:	4604      	mov	r4, r0
 8000ff8:	4608      	mov	r0, r1
 8000ffa:	602b      	str	r3, [r5, #0]
 8000ffc:	f7ff fbd2 	bl	80007a4 <_close>
 8001000:	1c43      	adds	r3, r0, #1
 8001002:	d102      	bne.n	800100a <_close_r+0x1a>
 8001004:	682b      	ldr	r3, [r5, #0]
 8001006:	b103      	cbz	r3, 800100a <_close_r+0x1a>
 8001008:	6023      	str	r3, [r4, #0]
 800100a:	bd38      	pop	{r3, r4, r5, pc}
 800100c:	200001dc 	.word	0x200001dc

08001010 <_reclaim_reent>:
 8001010:	4b29      	ldr	r3, [pc, #164]	; (80010b8 <_reclaim_reent+0xa8>)
 8001012:	681b      	ldr	r3, [r3, #0]
 8001014:	4283      	cmp	r3, r0
 8001016:	b570      	push	{r4, r5, r6, lr}
 8001018:	4604      	mov	r4, r0
 800101a:	d04b      	beq.n	80010b4 <_reclaim_reent+0xa4>
 800101c:	69c3      	ldr	r3, [r0, #28]
 800101e:	b1ab      	cbz	r3, 800104c <_reclaim_reent+0x3c>
 8001020:	68db      	ldr	r3, [r3, #12]
 8001022:	b16b      	cbz	r3, 8001040 <_reclaim_reent+0x30>
 8001024:	2500      	movs	r5, #0
 8001026:	69e3      	ldr	r3, [r4, #28]
 8001028:	68db      	ldr	r3, [r3, #12]
 800102a:	5959      	ldr	r1, [r3, r5]
 800102c:	2900      	cmp	r1, #0
 800102e:	d13b      	bne.n	80010a8 <_reclaim_reent+0x98>
 8001030:	3504      	adds	r5, #4
 8001032:	2d80      	cmp	r5, #128	; 0x80
 8001034:	d1f7      	bne.n	8001026 <_reclaim_reent+0x16>
 8001036:	69e3      	ldr	r3, [r4, #28]
 8001038:	4620      	mov	r0, r4
 800103a:	68d9      	ldr	r1, [r3, #12]
 800103c:	f000 f8a4 	bl	8001188 <_free_r>
 8001040:	69e3      	ldr	r3, [r4, #28]
 8001042:	6819      	ldr	r1, [r3, #0]
 8001044:	b111      	cbz	r1, 800104c <_reclaim_reent+0x3c>
 8001046:	4620      	mov	r0, r4
 8001048:	f000 f89e 	bl	8001188 <_free_r>
 800104c:	6961      	ldr	r1, [r4, #20]
 800104e:	b111      	cbz	r1, 8001056 <_reclaim_reent+0x46>
 8001050:	4620      	mov	r0, r4
 8001052:	f000 f899 	bl	8001188 <_free_r>
 8001056:	69e1      	ldr	r1, [r4, #28]
 8001058:	b111      	cbz	r1, 8001060 <_reclaim_reent+0x50>
 800105a:	4620      	mov	r0, r4
 800105c:	f000 f894 	bl	8001188 <_free_r>
 8001060:	6b21      	ldr	r1, [r4, #48]	; 0x30
 8001062:	b111      	cbz	r1, 800106a <_reclaim_reent+0x5a>
 8001064:	4620      	mov	r0, r4
 8001066:	f000 f88f 	bl	8001188 <_free_r>
 800106a:	6b61      	ldr	r1, [r4, #52]	; 0x34
 800106c:	b111      	cbz	r1, 8001074 <_reclaim_reent+0x64>
 800106e:	4620      	mov	r0, r4
 8001070:	f000 f88a 	bl	8001188 <_free_r>
 8001074:	6ba1      	ldr	r1, [r4, #56]	; 0x38
 8001076:	b111      	cbz	r1, 800107e <_reclaim_reent+0x6e>
 8001078:	4620      	mov	r0, r4
 800107a:	f000 f885 	bl	8001188 <_free_r>
 800107e:	6ca1      	ldr	r1, [r4, #72]	; 0x48
 8001080:	b111      	cbz	r1, 8001088 <_reclaim_reent+0x78>
 8001082:	4620      	mov	r0, r4
 8001084:	f000 f880 	bl	8001188 <_free_r>
 8001088:	6c61      	ldr	r1, [r4, #68]	; 0x44
 800108a:	b111      	cbz	r1, 8001092 <_reclaim_reent+0x82>
 800108c:	4620      	mov	r0, r4
 800108e:	f000 f87b 	bl	8001188 <_free_r>
 8001092:	6ae1      	ldr	r1, [r4, #44]	; 0x2c
 8001094:	b111      	cbz	r1, 800109c <_reclaim_reent+0x8c>
 8001096:	4620      	mov	r0, r4
 8001098:	f000 f876 	bl	8001188 <_free_r>
 800109c:	6a23      	ldr	r3, [r4, #32]
 800109e:	b14b      	cbz	r3, 80010b4 <_reclaim_reent+0xa4>
 80010a0:	4620      	mov	r0, r4
 80010a2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80010a6:	4718      	bx	r3
 80010a8:	680e      	ldr	r6, [r1, #0]
 80010aa:	4620      	mov	r0, r4
 80010ac:	f000 f86c 	bl	8001188 <_free_r>
 80010b0:	4631      	mov	r1, r6
 80010b2:	e7bb      	b.n	800102c <_reclaim_reent+0x1c>
 80010b4:	bd70      	pop	{r4, r5, r6, pc}
 80010b6:	bf00      	nop
 80010b8:	20000020 	.word	0x20000020

080010bc <_lseek_r>:
 80010bc:	b538      	push	{r3, r4, r5, lr}
 80010be:	4d07      	ldr	r5, [pc, #28]	; (80010dc <_lseek_r+0x20>)
 80010c0:	4604      	mov	r4, r0
 80010c2:	4608      	mov	r0, r1
 80010c4:	4611      	mov	r1, r2
 80010c6:	2200      	movs	r2, #0
 80010c8:	602a      	str	r2, [r5, #0]
 80010ca:	461a      	mov	r2, r3
 80010cc:	f7ff fb75 	bl	80007ba <_lseek>
 80010d0:	1c43      	adds	r3, r0, #1
 80010d2:	d102      	bne.n	80010da <_lseek_r+0x1e>
 80010d4:	682b      	ldr	r3, [r5, #0]
 80010d6:	b103      	cbz	r3, 80010da <_lseek_r+0x1e>
 80010d8:	6023      	str	r3, [r4, #0]
 80010da:	bd38      	pop	{r3, r4, r5, pc}
 80010dc:	200001dc 	.word	0x200001dc

080010e0 <_read_r>:
 80010e0:	b538      	push	{r3, r4, r5, lr}
 80010e2:	4d07      	ldr	r5, [pc, #28]	; (8001100 <_read_r+0x20>)
 80010e4:	4604      	mov	r4, r0
 80010e6:	4608      	mov	r0, r1
 80010e8:	4611      	mov	r1, r2
 80010ea:	2200      	movs	r2, #0
 80010ec:	602a      	str	r2, [r5, #0]
 80010ee:	461a      	mov	r2, r3
 80010f0:	f7ff fb75 	bl	80007de <_read>
 80010f4:	1c43      	adds	r3, r0, #1
 80010f6:	d102      	bne.n	80010fe <_read_r+0x1e>
 80010f8:	682b      	ldr	r3, [r5, #0]
 80010fa:	b103      	cbz	r3, 80010fe <_read_r+0x1e>
 80010fc:	6023      	str	r3, [r4, #0]
 80010fe:	bd38      	pop	{r3, r4, r5, pc}
 8001100:	200001dc 	.word	0x200001dc

08001104 <_write_r>:
 8001104:	b538      	push	{r3, r4, r5, lr}
 8001106:	4d07      	ldr	r5, [pc, #28]	; (8001124 <_write_r+0x20>)
 8001108:	4604      	mov	r4, r0
 800110a:	4608      	mov	r0, r1
 800110c:	4611      	mov	r1, r2
 800110e:	2200      	movs	r2, #0
 8001110:	602a      	str	r2, [r5, #0]
 8001112:	461a      	mov	r2, r3
 8001114:	f7ff fb6f 	bl	80007f6 <_write>
 8001118:	1c43      	adds	r3, r0, #1
 800111a:	d102      	bne.n	8001122 <_write_r+0x1e>
 800111c:	682b      	ldr	r3, [r5, #0]
 800111e:	b103      	cbz	r3, 8001122 <_write_r+0x1e>
 8001120:	6023      	str	r3, [r4, #0]
 8001122:	bd38      	pop	{r3, r4, r5, pc}
 8001124:	200001dc 	.word	0x200001dc

08001128 <__libc_init_array>:
 8001128:	b570      	push	{r4, r5, r6, lr}
 800112a:	4d0d      	ldr	r5, [pc, #52]	; (8001160 <__libc_init_array+0x38>)
 800112c:	4c0d      	ldr	r4, [pc, #52]	; (8001164 <__libc_init_array+0x3c>)
 800112e:	1b64      	subs	r4, r4, r5
 8001130:	10a4      	asrs	r4, r4, #2
 8001132:	2600      	movs	r6, #0
 8001134:	42a6      	cmp	r6, r4
 8001136:	d109      	bne.n	800114c <__libc_init_array+0x24>
 8001138:	4d0b      	ldr	r5, [pc, #44]	; (8001168 <__libc_init_array+0x40>)
 800113a:	4c0c      	ldr	r4, [pc, #48]	; (800116c <__libc_init_array+0x44>)
 800113c:	f000 feae 	bl	8001e9c <_init>
 8001140:	1b64      	subs	r4, r4, r5
 8001142:	10a4      	asrs	r4, r4, #2
 8001144:	2600      	movs	r6, #0
 8001146:	42a6      	cmp	r6, r4
 8001148:	d105      	bne.n	8001156 <__libc_init_array+0x2e>
 800114a:	bd70      	pop	{r4, r5, r6, pc}
 800114c:	f855 3b04 	ldr.w	r3, [r5], #4
 8001150:	4798      	blx	r3
 8001152:	3601      	adds	r6, #1
 8001154:	e7ee      	b.n	8001134 <__libc_init_array+0xc>
 8001156:	f855 3b04 	ldr.w	r3, [r5], #4
 800115a:	4798      	blx	r3
 800115c:	3601      	adds	r6, #1
 800115e:	e7f2      	b.n	8001146 <__libc_init_array+0x1e>
	...

08001170 <__retarget_lock_init>:
 8001170:	4770      	bx	lr

08001172 <__retarget_lock_init_recursive>:
 8001172:	4770      	bx	lr

08001174 <__retarget_lock_close>:
 8001174:	4770      	bx	lr

08001176 <__retarget_lock_close_recursive>:
 8001176:	4770      	bx	lr

08001178 <__retarget_lock_acquire>:
 8001178:	4770      	bx	lr

0800117a <__retarget_lock_acquire_recursive>:
 800117a:	4770      	bx	lr

0800117c <__retarget_lock_try_acquire>:
 800117c:	2001      	movs	r0, #1
 800117e:	4770      	bx	lr

08001180 <__retarget_lock_try_acquire_recursive>:
 8001180:	2001      	movs	r0, #1
 8001182:	4770      	bx	lr

08001184 <__retarget_lock_release>:
 8001184:	4770      	bx	lr

08001186 <__retarget_lock_release_recursive>:
 8001186:	4770      	bx	lr

08001188 <_free_r>:
 8001188:	b538      	push	{r3, r4, r5, lr}
 800118a:	4605      	mov	r5, r0
 800118c:	2900      	cmp	r1, #0
 800118e:	d041      	beq.n	8001214 <_free_r+0x8c>
 8001190:	f851 3c04 	ldr.w	r3, [r1, #-4]
 8001194:	1f0c      	subs	r4, r1, #4
 8001196:	2b00      	cmp	r3, #0
 8001198:	bfb8      	it	lt
 800119a:	18e4      	addlt	r4, r4, r3
 800119c:	f000 f8d0 	bl	8001340 <__malloc_lock>
 80011a0:	4a1d      	ldr	r2, [pc, #116]	; (8001218 <_free_r+0x90>)
 80011a2:	6813      	ldr	r3, [r2, #0]
 80011a4:	b933      	cbnz	r3, 80011b4 <_free_r+0x2c>
 80011a6:	6063      	str	r3, [r4, #4]
 80011a8:	6014      	str	r4, [r2, #0]
 80011aa:	4628      	mov	r0, r5
 80011ac:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80011b0:	f000 b8cc 	b.w	800134c <__malloc_unlock>
 80011b4:	42a3      	cmp	r3, r4
 80011b6:	d908      	bls.n	80011ca <_free_r+0x42>
 80011b8:	6820      	ldr	r0, [r4, #0]
 80011ba:	1821      	adds	r1, r4, r0
 80011bc:	428b      	cmp	r3, r1
 80011be:	bf01      	itttt	eq
 80011c0:	6819      	ldreq	r1, [r3, #0]
 80011c2:	685b      	ldreq	r3, [r3, #4]
 80011c4:	1809      	addeq	r1, r1, r0
 80011c6:	6021      	streq	r1, [r4, #0]
 80011c8:	e7ed      	b.n	80011a6 <_free_r+0x1e>
 80011ca:	461a      	mov	r2, r3
 80011cc:	685b      	ldr	r3, [r3, #4]
 80011ce:	b10b      	cbz	r3, 80011d4 <_free_r+0x4c>
 80011d0:	42a3      	cmp	r3, r4
 80011d2:	d9fa      	bls.n	80011ca <_free_r+0x42>
 80011d4:	6811      	ldr	r1, [r2, #0]
 80011d6:	1850      	adds	r0, r2, r1
 80011d8:	42a0      	cmp	r0, r4
 80011da:	d10b      	bne.n	80011f4 <_free_r+0x6c>
 80011dc:	6820      	ldr	r0, [r4, #0]
 80011de:	4401      	add	r1, r0
 80011e0:	1850      	adds	r0, r2, r1
 80011e2:	4283      	cmp	r3, r0
 80011e4:	6011      	str	r1, [r2, #0]
 80011e6:	d1e0      	bne.n	80011aa <_free_r+0x22>
 80011e8:	6818      	ldr	r0, [r3, #0]
 80011ea:	685b      	ldr	r3, [r3, #4]
 80011ec:	6053      	str	r3, [r2, #4]
 80011ee:	4408      	add	r0, r1
 80011f0:	6010      	str	r0, [r2, #0]
 80011f2:	e7da      	b.n	80011aa <_free_r+0x22>
 80011f4:	d902      	bls.n	80011fc <_free_r+0x74>
 80011f6:	230c      	movs	r3, #12
 80011f8:	602b      	str	r3, [r5, #0]
 80011fa:	e7d6      	b.n	80011aa <_free_r+0x22>
 80011fc:	6820      	ldr	r0, [r4, #0]
 80011fe:	1821      	adds	r1, r4, r0
 8001200:	428b      	cmp	r3, r1
 8001202:	bf04      	itt	eq
 8001204:	6819      	ldreq	r1, [r3, #0]
 8001206:	685b      	ldreq	r3, [r3, #4]
 8001208:	6063      	str	r3, [r4, #4]
 800120a:	bf04      	itt	eq
 800120c:	1809      	addeq	r1, r1, r0
 800120e:	6021      	streq	r1, [r4, #0]
 8001210:	6054      	str	r4, [r2, #4]
 8001212:	e7ca      	b.n	80011aa <_free_r+0x22>
 8001214:	bd38      	pop	{r3, r4, r5, pc}
 8001216:	bf00      	nop
 8001218:	200001ec 	.word	0x200001ec

0800121c <sbrk_aligned>:
 800121c:	b570      	push	{r4, r5, r6, lr}
 800121e:	4e0f      	ldr	r6, [pc, #60]	; (800125c <sbrk_aligned+0x40>)
 8001220:	460c      	mov	r4, r1
 8001222:	6831      	ldr	r1, [r6, #0]
 8001224:	4605      	mov	r5, r0
 8001226:	b911      	cbnz	r1, 800122e <sbrk_aligned+0x12>
 8001228:	f000 fcdc 	bl	8001be4 <_sbrk_r>
 800122c:	6030      	str	r0, [r6, #0]
 800122e:	4621      	mov	r1, r4
 8001230:	4628      	mov	r0, r5
 8001232:	f000 fcd7 	bl	8001be4 <_sbrk_r>
 8001236:	1c43      	adds	r3, r0, #1
 8001238:	d103      	bne.n	8001242 <sbrk_aligned+0x26>
 800123a:	f04f 34ff 	mov.w	r4, #4294967295
 800123e:	4620      	mov	r0, r4
 8001240:	bd70      	pop	{r4, r5, r6, pc}
 8001242:	1cc4      	adds	r4, r0, #3
 8001244:	f024 0403 	bic.w	r4, r4, #3
 8001248:	42a0      	cmp	r0, r4
 800124a:	d0f8      	beq.n	800123e <sbrk_aligned+0x22>
 800124c:	1a21      	subs	r1, r4, r0
 800124e:	4628      	mov	r0, r5
 8001250:	f000 fcc8 	bl	8001be4 <_sbrk_r>
 8001254:	3001      	adds	r0, #1
 8001256:	d1f2      	bne.n	800123e <sbrk_aligned+0x22>
 8001258:	e7ef      	b.n	800123a <sbrk_aligned+0x1e>
 800125a:	bf00      	nop
 800125c:	200001e8 	.word	0x200001e8

08001260 <_malloc_r>:
 8001260:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001262:	1ccd      	adds	r5, r1, #3
 8001264:	f025 0503 	bic.w	r5, r5, #3
 8001268:	3508      	adds	r5, #8
 800126a:	2d0c      	cmp	r5, #12
 800126c:	bf38      	it	cc
 800126e:	250c      	movcc	r5, #12
 8001270:	2d00      	cmp	r5, #0
 8001272:	4606      	mov	r6, r0
 8001274:	db01      	blt.n	800127a <_malloc_r+0x1a>
 8001276:	42a9      	cmp	r1, r5
 8001278:	d903      	bls.n	8001282 <_malloc_r+0x22>
 800127a:	230c      	movs	r3, #12
 800127c:	6033      	str	r3, [r6, #0]
 800127e:	2000      	movs	r0, #0
 8001280:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001282:	4f2e      	ldr	r7, [pc, #184]	; (800133c <_malloc_r+0xdc>)
 8001284:	f000 f85c 	bl	8001340 <__malloc_lock>
 8001288:	683b      	ldr	r3, [r7, #0]
 800128a:	461c      	mov	r4, r3
 800128c:	bb34      	cbnz	r4, 80012dc <_malloc_r+0x7c>
 800128e:	4629      	mov	r1, r5
 8001290:	4630      	mov	r0, r6
 8001292:	f7ff ffc3 	bl	800121c <sbrk_aligned>
 8001296:	1c43      	adds	r3, r0, #1
 8001298:	4604      	mov	r4, r0
 800129a:	d14d      	bne.n	8001338 <_malloc_r+0xd8>
 800129c:	683c      	ldr	r4, [r7, #0]
 800129e:	4621      	mov	r1, r4
 80012a0:	2900      	cmp	r1, #0
 80012a2:	d140      	bne.n	8001326 <_malloc_r+0xc6>
 80012a4:	2c00      	cmp	r4, #0
 80012a6:	d041      	beq.n	800132c <_malloc_r+0xcc>
 80012a8:	6823      	ldr	r3, [r4, #0]
 80012aa:	4630      	mov	r0, r6
 80012ac:	18e7      	adds	r7, r4, r3
 80012ae:	f000 fc99 	bl	8001be4 <_sbrk_r>
 80012b2:	4287      	cmp	r7, r0
 80012b4:	d13a      	bne.n	800132c <_malloc_r+0xcc>
 80012b6:	6823      	ldr	r3, [r4, #0]
 80012b8:	3503      	adds	r5, #3
 80012ba:	1aed      	subs	r5, r5, r3
 80012bc:	f025 0503 	bic.w	r5, r5, #3
 80012c0:	3508      	adds	r5, #8
 80012c2:	2d0c      	cmp	r5, #12
 80012c4:	bf38      	it	cc
 80012c6:	250c      	movcc	r5, #12
 80012c8:	4629      	mov	r1, r5
 80012ca:	4630      	mov	r0, r6
 80012cc:	f7ff ffa6 	bl	800121c <sbrk_aligned>
 80012d0:	3001      	adds	r0, #1
 80012d2:	d02b      	beq.n	800132c <_malloc_r+0xcc>
 80012d4:	6823      	ldr	r3, [r4, #0]
 80012d6:	442b      	add	r3, r5
 80012d8:	6023      	str	r3, [r4, #0]
 80012da:	e00e      	b.n	80012fa <_malloc_r+0x9a>
 80012dc:	6822      	ldr	r2, [r4, #0]
 80012de:	1b52      	subs	r2, r2, r5
 80012e0:	d41e      	bmi.n	8001320 <_malloc_r+0xc0>
 80012e2:	2a0b      	cmp	r2, #11
 80012e4:	d916      	bls.n	8001314 <_malloc_r+0xb4>
 80012e6:	1961      	adds	r1, r4, r5
 80012e8:	42a3      	cmp	r3, r4
 80012ea:	6025      	str	r5, [r4, #0]
 80012ec:	bf18      	it	ne
 80012ee:	6059      	strne	r1, [r3, #4]
 80012f0:	6863      	ldr	r3, [r4, #4]
 80012f2:	bf08      	it	eq
 80012f4:	6039      	streq	r1, [r7, #0]
 80012f6:	5162      	str	r2, [r4, r5]
 80012f8:	604b      	str	r3, [r1, #4]
 80012fa:	4630      	mov	r0, r6
 80012fc:	f000 f826 	bl	800134c <__malloc_unlock>
 8001300:	f104 000b 	add.w	r0, r4, #11
 8001304:	1d23      	adds	r3, r4, #4
 8001306:	f020 0007 	bic.w	r0, r0, #7
 800130a:	1ac2      	subs	r2, r0, r3
 800130c:	bf1c      	itt	ne
 800130e:	1a1b      	subne	r3, r3, r0
 8001310:	50a3      	strne	r3, [r4, r2]
 8001312:	e7b5      	b.n	8001280 <_malloc_r+0x20>
 8001314:	6862      	ldr	r2, [r4, #4]
 8001316:	42a3      	cmp	r3, r4
 8001318:	bf0c      	ite	eq
 800131a:	603a      	streq	r2, [r7, #0]
 800131c:	605a      	strne	r2, [r3, #4]
 800131e:	e7ec      	b.n	80012fa <_malloc_r+0x9a>
 8001320:	4623      	mov	r3, r4
 8001322:	6864      	ldr	r4, [r4, #4]
 8001324:	e7b2      	b.n	800128c <_malloc_r+0x2c>
 8001326:	460c      	mov	r4, r1
 8001328:	6849      	ldr	r1, [r1, #4]
 800132a:	e7b9      	b.n	80012a0 <_malloc_r+0x40>
 800132c:	230c      	movs	r3, #12
 800132e:	6033      	str	r3, [r6, #0]
 8001330:	4630      	mov	r0, r6
 8001332:	f000 f80b 	bl	800134c <__malloc_unlock>
 8001336:	e7a2      	b.n	800127e <_malloc_r+0x1e>
 8001338:	6005      	str	r5, [r0, #0]
 800133a:	e7de      	b.n	80012fa <_malloc_r+0x9a>
 800133c:	200001ec 	.word	0x200001ec

08001340 <__malloc_lock>:
 8001340:	4801      	ldr	r0, [pc, #4]	; (8001348 <__malloc_lock+0x8>)
 8001342:	f7ff bf1a 	b.w	800117a <__retarget_lock_acquire_recursive>
 8001346:	bf00      	nop
 8001348:	200001e4 	.word	0x200001e4

0800134c <__malloc_unlock>:
 800134c:	4801      	ldr	r0, [pc, #4]	; (8001354 <__malloc_unlock+0x8>)
 800134e:	f7ff bf1a 	b.w	8001186 <__retarget_lock_release_recursive>
 8001352:	bf00      	nop
 8001354:	200001e4 	.word	0x200001e4

08001358 <__ssputs_r>:
 8001358:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 800135c:	688e      	ldr	r6, [r1, #8]
 800135e:	461f      	mov	r7, r3
 8001360:	42be      	cmp	r6, r7
 8001362:	680b      	ldr	r3, [r1, #0]
 8001364:	4682      	mov	sl, r0
 8001366:	460c      	mov	r4, r1
 8001368:	4690      	mov	r8, r2
 800136a:	d82d      	bhi.n	80013c8 <__ssputs_r+0x70>
 800136c:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
 8001370:	f412 6f90 	tst.w	r2, #1152	; 0x480
 8001374:	d026      	beq.n	80013c4 <__ssputs_r+0x6c>
 8001376:	6965      	ldr	r5, [r4, #20]
 8001378:	6909      	ldr	r1, [r1, #16]
 800137a:	eb05 0545 	add.w	r5, r5, r5, lsl #1
 800137e:	eba3 0901 	sub.w	r9, r3, r1
 8001382:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
 8001386:	1c7b      	adds	r3, r7, #1
 8001388:	444b      	add	r3, r9
 800138a:	106d      	asrs	r5, r5, #1
 800138c:	429d      	cmp	r5, r3
 800138e:	bf38      	it	cc
 8001390:	461d      	movcc	r5, r3
 8001392:	0553      	lsls	r3, r2, #21
 8001394:	d527      	bpl.n	80013e6 <__ssputs_r+0x8e>
 8001396:	4629      	mov	r1, r5
 8001398:	f7ff ff62 	bl	8001260 <_malloc_r>
 800139c:	4606      	mov	r6, r0
 800139e:	b360      	cbz	r0, 80013fa <__ssputs_r+0xa2>
 80013a0:	6921      	ldr	r1, [r4, #16]
 80013a2:	464a      	mov	r2, r9
 80013a4:	f000 fc2e 	bl	8001c04 <memcpy>
 80013a8:	89a3      	ldrh	r3, [r4, #12]
 80013aa:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
 80013ae:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 80013b2:	81a3      	strh	r3, [r4, #12]
 80013b4:	6126      	str	r6, [r4, #16]
 80013b6:	6165      	str	r5, [r4, #20]
 80013b8:	444e      	add	r6, r9
 80013ba:	eba5 0509 	sub.w	r5, r5, r9
 80013be:	6026      	str	r6, [r4, #0]
 80013c0:	60a5      	str	r5, [r4, #8]
 80013c2:	463e      	mov	r6, r7
 80013c4:	42be      	cmp	r6, r7
 80013c6:	d900      	bls.n	80013ca <__ssputs_r+0x72>
 80013c8:	463e      	mov	r6, r7
 80013ca:	6820      	ldr	r0, [r4, #0]
 80013cc:	4632      	mov	r2, r6
 80013ce:	4641      	mov	r1, r8
 80013d0:	f000 fbee 	bl	8001bb0 <memmove>
 80013d4:	68a3      	ldr	r3, [r4, #8]
 80013d6:	1b9b      	subs	r3, r3, r6
 80013d8:	60a3      	str	r3, [r4, #8]
 80013da:	6823      	ldr	r3, [r4, #0]
 80013dc:	4433      	add	r3, r6
 80013de:	6023      	str	r3, [r4, #0]
 80013e0:	2000      	movs	r0, #0
 80013e2:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 80013e6:	462a      	mov	r2, r5
 80013e8:	f000 fc1a 	bl	8001c20 <_realloc_r>
 80013ec:	4606      	mov	r6, r0
 80013ee:	2800      	cmp	r0, #0
 80013f0:	d1e0      	bne.n	80013b4 <__ssputs_r+0x5c>
 80013f2:	6921      	ldr	r1, [r4, #16]
 80013f4:	4650      	mov	r0, sl
 80013f6:	f7ff fec7 	bl	8001188 <_free_r>
 80013fa:	230c      	movs	r3, #12
 80013fc:	f8ca 3000 	str.w	r3, [sl]
 8001400:	89a3      	ldrh	r3, [r4, #12]
 8001402:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8001406:	81a3      	strh	r3, [r4, #12]
 8001408:	f04f 30ff 	mov.w	r0, #4294967295
 800140c:	e7e9      	b.n	80013e2 <__ssputs_r+0x8a>

0800140e <__ssprint_r>:
 800140e:	6893      	ldr	r3, [r2, #8]
 8001410:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8001414:	f8d2 a000 	ldr.w	sl, [r2]
 8001418:	4680      	mov	r8, r0
 800141a:	460c      	mov	r4, r1
 800141c:	4617      	mov	r7, r2
 800141e:	2b00      	cmp	r3, #0
 8001420:	d157      	bne.n	80014d2 <__ssprint_r+0xc4>
 8001422:	2000      	movs	r0, #0
 8001424:	2300      	movs	r3, #0
 8001426:	607b      	str	r3, [r7, #4]
 8001428:	b003      	add	sp, #12
 800142a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 800142e:	f8da 3000 	ldr.w	r3, [sl]
 8001432:	f8da b004 	ldr.w	fp, [sl, #4]
 8001436:	9301      	str	r3, [sp, #4]
 8001438:	f10a 0a08 	add.w	sl, sl, #8
 800143c:	68a6      	ldr	r6, [r4, #8]
 800143e:	6820      	ldr	r0, [r4, #0]
 8001440:	f1bb 0f00 	cmp.w	fp, #0
 8001444:	d0f3      	beq.n	800142e <__ssprint_r+0x20>
 8001446:	45b3      	cmp	fp, r6
 8001448:	d32e      	bcc.n	80014a8 <__ssprint_r+0x9a>
 800144a:	f9b4 200c 	ldrsh.w	r2, [r4, #12]
 800144e:	f412 6f90 	tst.w	r2, #1152	; 0x480
 8001452:	d029      	beq.n	80014a8 <__ssprint_r+0x9a>
 8001454:	6921      	ldr	r1, [r4, #16]
 8001456:	6965      	ldr	r5, [r4, #20]
 8001458:	eba0 0901 	sub.w	r9, r0, r1
 800145c:	eb05 0545 	add.w	r5, r5, r5, lsl #1
 8001460:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
 8001464:	f109 0001 	add.w	r0, r9, #1
 8001468:	106d      	asrs	r5, r5, #1
 800146a:	4458      	add	r0, fp
 800146c:	4285      	cmp	r5, r0
 800146e:	bf38      	it	cc
 8001470:	4605      	movcc	r5, r0
 8001472:	0553      	lsls	r3, r2, #21
 8001474:	d531      	bpl.n	80014da <__ssprint_r+0xcc>
 8001476:	4629      	mov	r1, r5
 8001478:	4640      	mov	r0, r8
 800147a:	f7ff fef1 	bl	8001260 <_malloc_r>
 800147e:	4606      	mov	r6, r0
 8001480:	2800      	cmp	r0, #0
 8001482:	d035      	beq.n	80014f0 <__ssprint_r+0xe2>
 8001484:	464a      	mov	r2, r9
 8001486:	6921      	ldr	r1, [r4, #16]
 8001488:	f000 fbbc 	bl	8001c04 <memcpy>
 800148c:	89a2      	ldrh	r2, [r4, #12]
 800148e:	f422 6290 	bic.w	r2, r2, #1152	; 0x480
 8001492:	f042 0280 	orr.w	r2, r2, #128	; 0x80
 8001496:	81a2      	strh	r2, [r4, #12]
 8001498:	6126      	str	r6, [r4, #16]
 800149a:	6165      	str	r5, [r4, #20]
 800149c:	444e      	add	r6, r9
 800149e:	eba5 0509 	sub.w	r5, r5, r9
 80014a2:	6026      	str	r6, [r4, #0]
 80014a4:	60a5      	str	r5, [r4, #8]
 80014a6:	465e      	mov	r6, fp
 80014a8:	455e      	cmp	r6, fp
 80014aa:	bf28      	it	cs
 80014ac:	465e      	movcs	r6, fp
 80014ae:	4632      	mov	r2, r6
 80014b0:	9901      	ldr	r1, [sp, #4]
 80014b2:	6820      	ldr	r0, [r4, #0]
 80014b4:	f000 fb7c 	bl	8001bb0 <memmove>
 80014b8:	68a2      	ldr	r2, [r4, #8]
 80014ba:	1b92      	subs	r2, r2, r6
 80014bc:	60a2      	str	r2, [r4, #8]
 80014be:	6822      	ldr	r2, [r4, #0]
 80014c0:	4432      	add	r2, r6
 80014c2:	6022      	str	r2, [r4, #0]
 80014c4:	68ba      	ldr	r2, [r7, #8]
 80014c6:	eba2 030b 	sub.w	r3, r2, fp
 80014ca:	60bb      	str	r3, [r7, #8]
 80014cc:	2b00      	cmp	r3, #0
 80014ce:	d1ae      	bne.n	800142e <__ssprint_r+0x20>
 80014d0:	e7a7      	b.n	8001422 <__ssprint_r+0x14>
 80014d2:	2300      	movs	r3, #0
 80014d4:	9301      	str	r3, [sp, #4]
 80014d6:	469b      	mov	fp, r3
 80014d8:	e7b0      	b.n	800143c <__ssprint_r+0x2e>
 80014da:	462a      	mov	r2, r5
 80014dc:	4640      	mov	r0, r8
 80014de:	f000 fb9f 	bl	8001c20 <_realloc_r>
 80014e2:	4606      	mov	r6, r0
 80014e4:	2800      	cmp	r0, #0
 80014e6:	d1d7      	bne.n	8001498 <__ssprint_r+0x8a>
 80014e8:	6921      	ldr	r1, [r4, #16]
 80014ea:	4640      	mov	r0, r8
 80014ec:	f7ff fe4c 	bl	8001188 <_free_r>
 80014f0:	230c      	movs	r3, #12
 80014f2:	f8c8 3000 	str.w	r3, [r8]
 80014f6:	89a3      	ldrh	r3, [r4, #12]
 80014f8:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 80014fc:	81a3      	strh	r3, [r4, #12]
 80014fe:	2300      	movs	r3, #0
 8001500:	60bb      	str	r3, [r7, #8]
 8001502:	f04f 30ff 	mov.w	r0, #4294967295
 8001506:	e78d      	b.n	8001424 <__ssprint_r+0x16>

08001508 <_svfiprintf_r>:
 8001508:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 800150c:	4698      	mov	r8, r3
 800150e:	898b      	ldrh	r3, [r1, #12]
 8001510:	061b      	lsls	r3, r3, #24
 8001512:	b09d      	sub	sp, #116	; 0x74
 8001514:	4607      	mov	r7, r0
 8001516:	460d      	mov	r5, r1
 8001518:	4614      	mov	r4, r2
 800151a:	d510      	bpl.n	800153e <_svfiprintf_r+0x36>
 800151c:	690b      	ldr	r3, [r1, #16]
 800151e:	b973      	cbnz	r3, 800153e <_svfiprintf_r+0x36>
 8001520:	2140      	movs	r1, #64	; 0x40
 8001522:	f7ff fe9d 	bl	8001260 <_malloc_r>
 8001526:	6028      	str	r0, [r5, #0]
 8001528:	6128      	str	r0, [r5, #16]
 800152a:	b930      	cbnz	r0, 800153a <_svfiprintf_r+0x32>
 800152c:	230c      	movs	r3, #12
 800152e:	603b      	str	r3, [r7, #0]
 8001530:	f04f 30ff 	mov.w	r0, #4294967295
 8001534:	b01d      	add	sp, #116	; 0x74
 8001536:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 800153a:	2340      	movs	r3, #64	; 0x40
 800153c:	616b      	str	r3, [r5, #20]
 800153e:	2300      	movs	r3, #0
 8001540:	9309      	str	r3, [sp, #36]	; 0x24
 8001542:	2320      	movs	r3, #32
 8001544:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
 8001548:	f8cd 800c 	str.w	r8, [sp, #12]
 800154c:	2330      	movs	r3, #48	; 0x30
 800154e:	f8df 819c 	ldr.w	r8, [pc, #412]	; 80016ec <_svfiprintf_r+0x1e4>
 8001552:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
 8001556:	f04f 0901 	mov.w	r9, #1
 800155a:	4623      	mov	r3, r4
 800155c:	469a      	mov	sl, r3
 800155e:	f813 2b01 	ldrb.w	r2, [r3], #1
 8001562:	b10a      	cbz	r2, 8001568 <_svfiprintf_r+0x60>
 8001564:	2a25      	cmp	r2, #37	; 0x25
 8001566:	d1f9      	bne.n	800155c <_svfiprintf_r+0x54>
 8001568:	ebba 0b04 	subs.w	fp, sl, r4
 800156c:	d00b      	beq.n	8001586 <_svfiprintf_r+0x7e>
 800156e:	465b      	mov	r3, fp
 8001570:	4622      	mov	r2, r4
 8001572:	4629      	mov	r1, r5
 8001574:	4638      	mov	r0, r7
 8001576:	f7ff feef 	bl	8001358 <__ssputs_r>
 800157a:	3001      	adds	r0, #1
 800157c:	f000 80a7 	beq.w	80016ce <_svfiprintf_r+0x1c6>
 8001580:	9a09      	ldr	r2, [sp, #36]	; 0x24
 8001582:	445a      	add	r2, fp
 8001584:	9209      	str	r2, [sp, #36]	; 0x24
 8001586:	f89a 3000 	ldrb.w	r3, [sl]
 800158a:	2b00      	cmp	r3, #0
 800158c:	f000 809f 	beq.w	80016ce <_svfiprintf_r+0x1c6>
 8001590:	2300      	movs	r3, #0
 8001592:	f04f 32ff 	mov.w	r2, #4294967295
 8001596:	e9cd 2305 	strd	r2, r3, [sp, #20]
 800159a:	f10a 0a01 	add.w	sl, sl, #1
 800159e:	9304      	str	r3, [sp, #16]
 80015a0:	9307      	str	r3, [sp, #28]
 80015a2:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
 80015a6:	931a      	str	r3, [sp, #104]	; 0x68
 80015a8:	4654      	mov	r4, sl
 80015aa:	2205      	movs	r2, #5
 80015ac:	f814 1b01 	ldrb.w	r1, [r4], #1
 80015b0:	484e      	ldr	r0, [pc, #312]	; (80016ec <_svfiprintf_r+0x1e4>)
 80015b2:	f7ff fa8d 	bl	8000ad0 <memchr>
 80015b6:	9a04      	ldr	r2, [sp, #16]
 80015b8:	b9d8      	cbnz	r0, 80015f2 <_svfiprintf_r+0xea>
 80015ba:	06d0      	lsls	r0, r2, #27
 80015bc:	bf44      	itt	mi
 80015be:	2320      	movmi	r3, #32
 80015c0:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 80015c4:	0711      	lsls	r1, r2, #28
 80015c6:	bf44      	itt	mi
 80015c8:	232b      	movmi	r3, #43	; 0x2b
 80015ca:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 80015ce:	f89a 3000 	ldrb.w	r3, [sl]
 80015d2:	2b2a      	cmp	r3, #42	; 0x2a
 80015d4:	d015      	beq.n	8001602 <_svfiprintf_r+0xfa>
 80015d6:	9a07      	ldr	r2, [sp, #28]
 80015d8:	4654      	mov	r4, sl
 80015da:	2000      	movs	r0, #0
 80015dc:	f04f 0c0a 	mov.w	ip, #10
 80015e0:	4621      	mov	r1, r4
 80015e2:	f811 3b01 	ldrb.w	r3, [r1], #1
 80015e6:	3b30      	subs	r3, #48	; 0x30
 80015e8:	2b09      	cmp	r3, #9
 80015ea:	d94b      	bls.n	8001684 <_svfiprintf_r+0x17c>
 80015ec:	b1b0      	cbz	r0, 800161c <_svfiprintf_r+0x114>
 80015ee:	9207      	str	r2, [sp, #28]
 80015f0:	e014      	b.n	800161c <_svfiprintf_r+0x114>
 80015f2:	eba0 0308 	sub.w	r3, r0, r8
 80015f6:	fa09 f303 	lsl.w	r3, r9, r3
 80015fa:	4313      	orrs	r3, r2
 80015fc:	9304      	str	r3, [sp, #16]
 80015fe:	46a2      	mov	sl, r4
 8001600:	e7d2      	b.n	80015a8 <_svfiprintf_r+0xa0>
 8001602:	9b03      	ldr	r3, [sp, #12]
 8001604:	1d19      	adds	r1, r3, #4
 8001606:	681b      	ldr	r3, [r3, #0]
 8001608:	9103      	str	r1, [sp, #12]
 800160a:	2b00      	cmp	r3, #0
 800160c:	bfbb      	ittet	lt
 800160e:	425b      	neglt	r3, r3
 8001610:	f042 0202 	orrlt.w	r2, r2, #2
 8001614:	9307      	strge	r3, [sp, #28]
 8001616:	9307      	strlt	r3, [sp, #28]
 8001618:	bfb8      	it	lt
 800161a:	9204      	strlt	r2, [sp, #16]
 800161c:	7823      	ldrb	r3, [r4, #0]
 800161e:	2b2e      	cmp	r3, #46	; 0x2e
 8001620:	d10a      	bne.n	8001638 <_svfiprintf_r+0x130>
 8001622:	7863      	ldrb	r3, [r4, #1]
 8001624:	2b2a      	cmp	r3, #42	; 0x2a
 8001626:	d132      	bne.n	800168e <_svfiprintf_r+0x186>
 8001628:	9b03      	ldr	r3, [sp, #12]
 800162a:	1d1a      	adds	r2, r3, #4
 800162c:	681b      	ldr	r3, [r3, #0]
 800162e:	9203      	str	r2, [sp, #12]
 8001630:	ea43 73e3 	orr.w	r3, r3, r3, asr #31
 8001634:	3402      	adds	r4, #2
 8001636:	9305      	str	r3, [sp, #20]
 8001638:	f8df a0b4 	ldr.w	sl, [pc, #180]	; 80016f0 <_svfiprintf_r+0x1e8>
 800163c:	7821      	ldrb	r1, [r4, #0]
 800163e:	2203      	movs	r2, #3
 8001640:	4650      	mov	r0, sl
 8001642:	f7ff fa45 	bl	8000ad0 <memchr>
 8001646:	b138      	cbz	r0, 8001658 <_svfiprintf_r+0x150>
 8001648:	9b04      	ldr	r3, [sp, #16]
 800164a:	eba0 000a 	sub.w	r0, r0, sl
 800164e:	2240      	movs	r2, #64	; 0x40
 8001650:	4082      	lsls	r2, r0
 8001652:	4313      	orrs	r3, r2
 8001654:	3401      	adds	r4, #1
 8001656:	9304      	str	r3, [sp, #16]
 8001658:	f814 1b01 	ldrb.w	r1, [r4], #1
 800165c:	4825      	ldr	r0, [pc, #148]	; (80016f4 <_svfiprintf_r+0x1ec>)
 800165e:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
 8001662:	2206      	movs	r2, #6
 8001664:	f7ff fa34 	bl	8000ad0 <memchr>
 8001668:	2800      	cmp	r0, #0
 800166a:	d036      	beq.n	80016da <_svfiprintf_r+0x1d2>
 800166c:	4b22      	ldr	r3, [pc, #136]	; (80016f8 <_svfiprintf_r+0x1f0>)
 800166e:	bb1b      	cbnz	r3, 80016b8 <_svfiprintf_r+0x1b0>
 8001670:	9b03      	ldr	r3, [sp, #12]
 8001672:	3307      	adds	r3, #7
 8001674:	f023 0307 	bic.w	r3, r3, #7
 8001678:	3308      	adds	r3, #8
 800167a:	9303      	str	r3, [sp, #12]
 800167c:	9b09      	ldr	r3, [sp, #36]	; 0x24
 800167e:	4433      	add	r3, r6
 8001680:	9309      	str	r3, [sp, #36]	; 0x24
 8001682:	e76a      	b.n	800155a <_svfiprintf_r+0x52>
 8001684:	fb0c 3202 	mla	r2, ip, r2, r3
 8001688:	460c      	mov	r4, r1
 800168a:	2001      	movs	r0, #1
 800168c:	e7a8      	b.n	80015e0 <_svfiprintf_r+0xd8>
 800168e:	2300      	movs	r3, #0
 8001690:	3401      	adds	r4, #1
 8001692:	9305      	str	r3, [sp, #20]
 8001694:	4619      	mov	r1, r3
 8001696:	f04f 0c0a 	mov.w	ip, #10
 800169a:	4620      	mov	r0, r4
 800169c:	f810 2b01 	ldrb.w	r2, [r0], #1
 80016a0:	3a30      	subs	r2, #48	; 0x30
 80016a2:	2a09      	cmp	r2, #9
 80016a4:	d903      	bls.n	80016ae <_svfiprintf_r+0x1a6>
 80016a6:	2b00      	cmp	r3, #0
 80016a8:	d0c6      	beq.n	8001638 <_svfiprintf_r+0x130>
 80016aa:	9105      	str	r1, [sp, #20]
 80016ac:	e7c4      	b.n	8001638 <_svfiprintf_r+0x130>
 80016ae:	fb0c 2101 	mla	r1, ip, r1, r2
 80016b2:	4604      	mov	r4, r0
 80016b4:	2301      	movs	r3, #1
 80016b6:	e7f0      	b.n	800169a <_svfiprintf_r+0x192>
 80016b8:	ab03      	add	r3, sp, #12
 80016ba:	9300      	str	r3, [sp, #0]
 80016bc:	462a      	mov	r2, r5
 80016be:	4b0f      	ldr	r3, [pc, #60]	; (80016fc <_svfiprintf_r+0x1f4>)
 80016c0:	a904      	add	r1, sp, #16
 80016c2:	4638      	mov	r0, r7
 80016c4:	f3af 8000 	nop.w
 80016c8:	1c42      	adds	r2, r0, #1
 80016ca:	4606      	mov	r6, r0
 80016cc:	d1d6      	bne.n	800167c <_svfiprintf_r+0x174>
 80016ce:	89ab      	ldrh	r3, [r5, #12]
 80016d0:	065b      	lsls	r3, r3, #25
 80016d2:	f53f af2d 	bmi.w	8001530 <_svfiprintf_r+0x28>
 80016d6:	9809      	ldr	r0, [sp, #36]	; 0x24
 80016d8:	e72c      	b.n	8001534 <_svfiprintf_r+0x2c>
 80016da:	ab03      	add	r3, sp, #12
 80016dc:	9300      	str	r3, [sp, #0]
 80016de:	462a      	mov	r2, r5
 80016e0:	4b06      	ldr	r3, [pc, #24]	; (80016fc <_svfiprintf_r+0x1f4>)
 80016e2:	a904      	add	r1, sp, #16
 80016e4:	4638      	mov	r0, r7
 80016e6:	f000 f879 	bl	80017dc <_printf_i>
 80016ea:	e7ed      	b.n	80016c8 <_svfiprintf_r+0x1c0>
 80016ec:	08001e45 	.word	0x08001e45
 80016f0:	08001e4b 	.word	0x08001e4b
 80016f4:	08001e4f 	.word	0x08001e4f
 80016f8:	00000000 	.word	0x00000000
 80016fc:	08001359 	.word	0x08001359

08001700 <_printf_common>:
 8001700:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8001704:	4616      	mov	r6, r2
 8001706:	4698      	mov	r8, r3
 8001708:	688a      	ldr	r2, [r1, #8]
 800170a:	690b      	ldr	r3, [r1, #16]
 800170c:	f8dd 9020 	ldr.w	r9, [sp, #32]
 8001710:	4293      	cmp	r3, r2
 8001712:	bfb8      	it	lt
 8001714:	4613      	movlt	r3, r2
 8001716:	6033      	str	r3, [r6, #0]
 8001718:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
 800171c:	4607      	mov	r7, r0
 800171e:	460c      	mov	r4, r1
 8001720:	b10a      	cbz	r2, 8001726 <_printf_common+0x26>
 8001722:	3301      	adds	r3, #1
 8001724:	6033      	str	r3, [r6, #0]
 8001726:	6823      	ldr	r3, [r4, #0]
 8001728:	0699      	lsls	r1, r3, #26
 800172a:	bf42      	ittt	mi
 800172c:	6833      	ldrmi	r3, [r6, #0]
 800172e:	3302      	addmi	r3, #2
 8001730:	6033      	strmi	r3, [r6, #0]
 8001732:	6825      	ldr	r5, [r4, #0]
 8001734:	f015 0506 	ands.w	r5, r5, #6
 8001738:	d106      	bne.n	8001748 <_printf_common+0x48>
 800173a:	f104 0a19 	add.w	sl, r4, #25
 800173e:	68e3      	ldr	r3, [r4, #12]
 8001740:	6832      	ldr	r2, [r6, #0]
 8001742:	1a9b      	subs	r3, r3, r2
 8001744:	42ab      	cmp	r3, r5
 8001746:	dc26      	bgt.n	8001796 <_printf_common+0x96>
 8001748:	f894 3043 	ldrb.w	r3, [r4, #67]	; 0x43
 800174c:	6822      	ldr	r2, [r4, #0]
 800174e:	3b00      	subs	r3, #0
 8001750:	bf18      	it	ne
 8001752:	2301      	movne	r3, #1
 8001754:	0692      	lsls	r2, r2, #26
 8001756:	d42b      	bmi.n	80017b0 <_printf_common+0xb0>
 8001758:	f104 0243 	add.w	r2, r4, #67	; 0x43
 800175c:	4641      	mov	r1, r8
 800175e:	4638      	mov	r0, r7
 8001760:	47c8      	blx	r9
 8001762:	3001      	adds	r0, #1
 8001764:	d01e      	beq.n	80017a4 <_printf_common+0xa4>
 8001766:	6823      	ldr	r3, [r4, #0]
 8001768:	6922      	ldr	r2, [r4, #16]
 800176a:	f003 0306 	and.w	r3, r3, #6
 800176e:	2b04      	cmp	r3, #4
 8001770:	bf02      	ittt	eq
 8001772:	68e5      	ldreq	r5, [r4, #12]
 8001774:	6833      	ldreq	r3, [r6, #0]
 8001776:	1aed      	subeq	r5, r5, r3
 8001778:	68a3      	ldr	r3, [r4, #8]
 800177a:	bf0c      	ite	eq
 800177c:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
 8001780:	2500      	movne	r5, #0
 8001782:	4293      	cmp	r3, r2
 8001784:	bfc4      	itt	gt
 8001786:	1a9b      	subgt	r3, r3, r2
 8001788:	18ed      	addgt	r5, r5, r3
 800178a:	2600      	movs	r6, #0
 800178c:	341a      	adds	r4, #26
 800178e:	42b5      	cmp	r5, r6
 8001790:	d11a      	bne.n	80017c8 <_printf_common+0xc8>
 8001792:	2000      	movs	r0, #0
 8001794:	e008      	b.n	80017a8 <_printf_common+0xa8>
 8001796:	2301      	movs	r3, #1
 8001798:	4652      	mov	r2, sl
 800179a:	4641      	mov	r1, r8
 800179c:	4638      	mov	r0, r7
 800179e:	47c8      	blx	r9
 80017a0:	3001      	adds	r0, #1
 80017a2:	d103      	bne.n	80017ac <_printf_common+0xac>
 80017a4:	f04f 30ff 	mov.w	r0, #4294967295
 80017a8:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 80017ac:	3501      	adds	r5, #1
 80017ae:	e7c6      	b.n	800173e <_printf_common+0x3e>
 80017b0:	18e1      	adds	r1, r4, r3
 80017b2:	1c5a      	adds	r2, r3, #1
 80017b4:	2030      	movs	r0, #48	; 0x30
 80017b6:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
 80017ba:	4422      	add	r2, r4
 80017bc:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
 80017c0:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
 80017c4:	3302      	adds	r3, #2
 80017c6:	e7c7      	b.n	8001758 <_printf_common+0x58>
 80017c8:	2301      	movs	r3, #1
 80017ca:	4622      	mov	r2, r4
 80017cc:	4641      	mov	r1, r8
 80017ce:	4638      	mov	r0, r7
 80017d0:	47c8      	blx	r9
 80017d2:	3001      	adds	r0, #1
 80017d4:	d0e6      	beq.n	80017a4 <_printf_common+0xa4>
 80017d6:	3601      	adds	r6, #1
 80017d8:	e7d9      	b.n	800178e <_printf_common+0x8e>
	...

080017dc <_printf_i>:
 80017dc:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
 80017e0:	7e0f      	ldrb	r7, [r1, #24]
 80017e2:	9d0c      	ldr	r5, [sp, #48]	; 0x30
 80017e4:	2f78      	cmp	r7, #120	; 0x78
 80017e6:	4691      	mov	r9, r2
 80017e8:	4680      	mov	r8, r0
 80017ea:	460c      	mov	r4, r1
 80017ec:	469a      	mov	sl, r3
 80017ee:	f101 0243 	add.w	r2, r1, #67	; 0x43
 80017f2:	d807      	bhi.n	8001804 <_printf_i+0x28>
 80017f4:	2f62      	cmp	r7, #98	; 0x62
 80017f6:	d80a      	bhi.n	800180e <_printf_i+0x32>
 80017f8:	2f00      	cmp	r7, #0
 80017fa:	f000 80e0 	beq.w	80019be <_printf_i+0x1e2>
 80017fe:	2f58      	cmp	r7, #88	; 0x58
 8001800:	f000 80bb 	beq.w	800197a <_printf_i+0x19e>
 8001804:	f104 0642 	add.w	r6, r4, #66	; 0x42
 8001808:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
 800180c:	e03a      	b.n	8001884 <_printf_i+0xa8>
 800180e:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
 8001812:	2b15      	cmp	r3, #21
 8001814:	d8f6      	bhi.n	8001804 <_printf_i+0x28>
 8001816:	a101      	add	r1, pc, #4	; (adr r1, 800181c <_printf_i+0x40>)
 8001818:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
 800181c:	08001875 	.word	0x08001875
 8001820:	08001889 	.word	0x08001889
 8001824:	08001805 	.word	0x08001805
 8001828:	08001805 	.word	0x08001805
 800182c:	08001805 	.word	0x08001805
 8001830:	08001805 	.word	0x08001805
 8001834:	08001889 	.word	0x08001889
 8001838:	08001805 	.word	0x08001805
 800183c:	08001805 	.word	0x08001805
 8001840:	08001805 	.word	0x08001805
 8001844:	08001805 	.word	0x08001805
 8001848:	080019a5 	.word	0x080019a5
 800184c:	08001919 	.word	0x08001919
 8001850:	0800195b 	.word	0x0800195b
 8001854:	08001805 	.word	0x08001805
 8001858:	08001805 	.word	0x08001805
 800185c:	080019c7 	.word	0x080019c7
 8001860:	08001805 	.word	0x08001805
 8001864:	08001919 	.word	0x08001919
 8001868:	08001805 	.word	0x08001805
 800186c:	08001805 	.word	0x08001805
 8001870:	08001963 	.word	0x08001963
 8001874:	682b      	ldr	r3, [r5, #0]
 8001876:	1d1a      	adds	r2, r3, #4
 8001878:	681b      	ldr	r3, [r3, #0]
 800187a:	602a      	str	r2, [r5, #0]
 800187c:	f104 0642 	add.w	r6, r4, #66	; 0x42
 8001880:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
 8001884:	2301      	movs	r3, #1
 8001886:	e0ab      	b.n	80019e0 <_printf_i+0x204>
 8001888:	6823      	ldr	r3, [r4, #0]
 800188a:	6829      	ldr	r1, [r5, #0]
 800188c:	061f      	lsls	r7, r3, #24
 800188e:	f101 0004 	add.w	r0, r1, #4
 8001892:	6028      	str	r0, [r5, #0]
 8001894:	d501      	bpl.n	800189a <_printf_i+0xbe>
 8001896:	680d      	ldr	r5, [r1, #0]
 8001898:	e003      	b.n	80018a2 <_printf_i+0xc6>
 800189a:	065e      	lsls	r6, r3, #25
 800189c:	d5fb      	bpl.n	8001896 <_printf_i+0xba>
 800189e:	f9b1 5000 	ldrsh.w	r5, [r1]
 80018a2:	6861      	ldr	r1, [r4, #4]
 80018a4:	2d00      	cmp	r5, #0
 80018a6:	da7a      	bge.n	800199e <_printf_i+0x1c2>
 80018a8:	202d      	movs	r0, #45	; 0x2d
 80018aa:	2900      	cmp	r1, #0
 80018ac:	f884 0043 	strb.w	r0, [r4, #67]	; 0x43
 80018b0:	60a1      	str	r1, [r4, #8]
 80018b2:	da2d      	bge.n	8001910 <_printf_i+0x134>
 80018b4:	485e      	ldr	r0, [pc, #376]	; (8001a30 <_printf_i+0x254>)
 80018b6:	426d      	negs	r5, r5
 80018b8:	230a      	movs	r3, #10
 80018ba:	4616      	mov	r6, r2
 80018bc:	fbb5 f1f3 	udiv	r1, r5, r3
 80018c0:	fb03 5711 	mls	r7, r3, r1, r5
 80018c4:	5dc7      	ldrb	r7, [r0, r7]
 80018c6:	f806 7d01 	strb.w	r7, [r6, #-1]!
 80018ca:	462f      	mov	r7, r5
 80018cc:	42bb      	cmp	r3, r7
 80018ce:	460d      	mov	r5, r1
 80018d0:	d9f4      	bls.n	80018bc <_printf_i+0xe0>
 80018d2:	2b08      	cmp	r3, #8
 80018d4:	d10b      	bne.n	80018ee <_printf_i+0x112>
 80018d6:	6823      	ldr	r3, [r4, #0]
 80018d8:	07df      	lsls	r7, r3, #31
 80018da:	d508      	bpl.n	80018ee <_printf_i+0x112>
 80018dc:	6923      	ldr	r3, [r4, #16]
 80018de:	6861      	ldr	r1, [r4, #4]
 80018e0:	4299      	cmp	r1, r3
 80018e2:	bfde      	ittt	le
 80018e4:	2330      	movle	r3, #48	; 0x30
 80018e6:	f806 3c01 	strble.w	r3, [r6, #-1]
 80018ea:	f106 36ff 	addle.w	r6, r6, #4294967295
 80018ee:	1b92      	subs	r2, r2, r6
 80018f0:	6122      	str	r2, [r4, #16]
 80018f2:	f8cd a000 	str.w	sl, [sp]
 80018f6:	464b      	mov	r3, r9
 80018f8:	aa03      	add	r2, sp, #12
 80018fa:	4621      	mov	r1, r4
 80018fc:	4640      	mov	r0, r8
 80018fe:	f7ff feff 	bl	8001700 <_printf_common>
 8001902:	3001      	adds	r0, #1
 8001904:	d171      	bne.n	80019ea <_printf_i+0x20e>
 8001906:	f04f 30ff 	mov.w	r0, #4294967295
 800190a:	b004      	add	sp, #16
 800190c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8001910:	f023 0304 	bic.w	r3, r3, #4
 8001914:	6023      	str	r3, [r4, #0]
 8001916:	e7cd      	b.n	80018b4 <_printf_i+0xd8>
 8001918:	682b      	ldr	r3, [r5, #0]
 800191a:	6820      	ldr	r0, [r4, #0]
 800191c:	1d19      	adds	r1, r3, #4
 800191e:	6029      	str	r1, [r5, #0]
 8001920:	0605      	lsls	r5, r0, #24
 8001922:	d501      	bpl.n	8001928 <_printf_i+0x14c>
 8001924:	681d      	ldr	r5, [r3, #0]
 8001926:	e002      	b.n	800192e <_printf_i+0x152>
 8001928:	0641      	lsls	r1, r0, #25
 800192a:	d5fb      	bpl.n	8001924 <_printf_i+0x148>
 800192c:	881d      	ldrh	r5, [r3, #0]
 800192e:	4840      	ldr	r0, [pc, #256]	; (8001a30 <_printf_i+0x254>)
 8001930:	2f6f      	cmp	r7, #111	; 0x6f
 8001932:	bf14      	ite	ne
 8001934:	230a      	movne	r3, #10
 8001936:	2308      	moveq	r3, #8
 8001938:	2100      	movs	r1, #0
 800193a:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
 800193e:	6866      	ldr	r6, [r4, #4]
 8001940:	60a6      	str	r6, [r4, #8]
 8001942:	2e00      	cmp	r6, #0
 8001944:	dbb9      	blt.n	80018ba <_printf_i+0xde>
 8001946:	6821      	ldr	r1, [r4, #0]
 8001948:	f021 0104 	bic.w	r1, r1, #4
 800194c:	6021      	str	r1, [r4, #0]
 800194e:	2d00      	cmp	r5, #0
 8001950:	d1b3      	bne.n	80018ba <_printf_i+0xde>
 8001952:	2e00      	cmp	r6, #0
 8001954:	d1b1      	bne.n	80018ba <_printf_i+0xde>
 8001956:	4616      	mov	r6, r2
 8001958:	e7bb      	b.n	80018d2 <_printf_i+0xf6>
 800195a:	6823      	ldr	r3, [r4, #0]
 800195c:	f043 0320 	orr.w	r3, r3, #32
 8001960:	6023      	str	r3, [r4, #0]
 8001962:	4834      	ldr	r0, [pc, #208]	; (8001a34 <_printf_i+0x258>)
 8001964:	2778      	movs	r7, #120	; 0x78
 8001966:	f884 7045 	strb.w	r7, [r4, #69]	; 0x45
 800196a:	6829      	ldr	r1, [r5, #0]
 800196c:	6823      	ldr	r3, [r4, #0]
 800196e:	1d0e      	adds	r6, r1, #4
 8001970:	602e      	str	r6, [r5, #0]
 8001972:	061e      	lsls	r6, r3, #24
 8001974:	d503      	bpl.n	800197e <_printf_i+0x1a2>
 8001976:	680d      	ldr	r5, [r1, #0]
 8001978:	e004      	b.n	8001984 <_printf_i+0x1a8>
 800197a:	482d      	ldr	r0, [pc, #180]	; (8001a30 <_printf_i+0x254>)
 800197c:	e7f3      	b.n	8001966 <_printf_i+0x18a>
 800197e:	065d      	lsls	r5, r3, #25
 8001980:	d5f9      	bpl.n	8001976 <_printf_i+0x19a>
 8001982:	880d      	ldrh	r5, [r1, #0]
 8001984:	07d9      	lsls	r1, r3, #31
 8001986:	bf44      	itt	mi
 8001988:	f043 0320 	orrmi.w	r3, r3, #32
 800198c:	6023      	strmi	r3, [r4, #0]
 800198e:	b10d      	cbz	r5, 8001994 <_printf_i+0x1b8>
 8001990:	2310      	movs	r3, #16
 8001992:	e7d1      	b.n	8001938 <_printf_i+0x15c>
 8001994:	6823      	ldr	r3, [r4, #0]
 8001996:	f023 0320 	bic.w	r3, r3, #32
 800199a:	6023      	str	r3, [r4, #0]
 800199c:	e7f8      	b.n	8001990 <_printf_i+0x1b4>
 800199e:	4824      	ldr	r0, [pc, #144]	; (8001a30 <_printf_i+0x254>)
 80019a0:	230a      	movs	r3, #10
 80019a2:	e7cc      	b.n	800193e <_printf_i+0x162>
 80019a4:	682b      	ldr	r3, [r5, #0]
 80019a6:	6826      	ldr	r6, [r4, #0]
 80019a8:	6961      	ldr	r1, [r4, #20]
 80019aa:	1d18      	adds	r0, r3, #4
 80019ac:	6028      	str	r0, [r5, #0]
 80019ae:	0635      	lsls	r5, r6, #24
 80019b0:	681b      	ldr	r3, [r3, #0]
 80019b2:	d501      	bpl.n	80019b8 <_printf_i+0x1dc>
 80019b4:	6019      	str	r1, [r3, #0]
 80019b6:	e002      	b.n	80019be <_printf_i+0x1e2>
 80019b8:	0670      	lsls	r0, r6, #25
 80019ba:	d5fb      	bpl.n	80019b4 <_printf_i+0x1d8>
 80019bc:	8019      	strh	r1, [r3, #0]
 80019be:	2300      	movs	r3, #0
 80019c0:	6123      	str	r3, [r4, #16]
 80019c2:	4616      	mov	r6, r2
 80019c4:	e795      	b.n	80018f2 <_printf_i+0x116>
 80019c6:	682b      	ldr	r3, [r5, #0]
 80019c8:	1d1a      	adds	r2, r3, #4
 80019ca:	602a      	str	r2, [r5, #0]
 80019cc:	681e      	ldr	r6, [r3, #0]
 80019ce:	6862      	ldr	r2, [r4, #4]
 80019d0:	2100      	movs	r1, #0
 80019d2:	4630      	mov	r0, r6
 80019d4:	f7ff f87c 	bl	8000ad0 <memchr>
 80019d8:	b108      	cbz	r0, 80019de <_printf_i+0x202>
 80019da:	1b80      	subs	r0, r0, r6
 80019dc:	6060      	str	r0, [r4, #4]
 80019de:	6863      	ldr	r3, [r4, #4]
 80019e0:	6123      	str	r3, [r4, #16]
 80019e2:	2300      	movs	r3, #0
 80019e4:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 80019e8:	e783      	b.n	80018f2 <_printf_i+0x116>
 80019ea:	6923      	ldr	r3, [r4, #16]
 80019ec:	4632      	mov	r2, r6
 80019ee:	4649      	mov	r1, r9
 80019f0:	4640      	mov	r0, r8
 80019f2:	47d0      	blx	sl
 80019f4:	3001      	adds	r0, #1
 80019f6:	d086      	beq.n	8001906 <_printf_i+0x12a>
 80019f8:	6823      	ldr	r3, [r4, #0]
 80019fa:	079b      	lsls	r3, r3, #30
 80019fc:	d414      	bmi.n	8001a28 <_printf_i+0x24c>
 80019fe:	68e0      	ldr	r0, [r4, #12]
 8001a00:	9b03      	ldr	r3, [sp, #12]
 8001a02:	4298      	cmp	r0, r3
 8001a04:	bfb8      	it	lt
 8001a06:	4618      	movlt	r0, r3
 8001a08:	e77f      	b.n	800190a <_printf_i+0x12e>
 8001a0a:	2301      	movs	r3, #1
 8001a0c:	4632      	mov	r2, r6
 8001a0e:	4649      	mov	r1, r9
 8001a10:	4640      	mov	r0, r8
 8001a12:	47d0      	blx	sl
 8001a14:	3001      	adds	r0, #1
 8001a16:	f43f af76 	beq.w	8001906 <_printf_i+0x12a>
 8001a1a:	3501      	adds	r5, #1
 8001a1c:	68e3      	ldr	r3, [r4, #12]
 8001a1e:	9903      	ldr	r1, [sp, #12]
 8001a20:	1a5b      	subs	r3, r3, r1
 8001a22:	42ab      	cmp	r3, r5
 8001a24:	dcf1      	bgt.n	8001a0a <_printf_i+0x22e>
 8001a26:	e7ea      	b.n	80019fe <_printf_i+0x222>
 8001a28:	2500      	movs	r5, #0
 8001a2a:	f104 0619 	add.w	r6, r4, #25
 8001a2e:	e7f5      	b.n	8001a1c <_printf_i+0x240>
 8001a30:	08001e56 	.word	0x08001e56
 8001a34:	08001e67 	.word	0x08001e67

08001a38 <__sflush_r>:
 8001a38:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
 8001a3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001a3e:	0717      	lsls	r7, r2, #28
 8001a40:	4605      	mov	r5, r0
 8001a42:	460c      	mov	r4, r1
 8001a44:	d456      	bmi.n	8001af4 <__sflush_r+0xbc>
 8001a46:	684b      	ldr	r3, [r1, #4]
 8001a48:	2b00      	cmp	r3, #0
 8001a4a:	dc02      	bgt.n	8001a52 <__sflush_r+0x1a>
 8001a4c:	6c0b      	ldr	r3, [r1, #64]	; 0x40
 8001a4e:	2b00      	cmp	r3, #0
 8001a50:	dd3d      	ble.n	8001ace <__sflush_r+0x96>
 8001a52:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 8001a54:	2e00      	cmp	r6, #0
 8001a56:	d03a      	beq.n	8001ace <__sflush_r+0x96>
 8001a58:	2300      	movs	r3, #0
 8001a5a:	f412 5280 	ands.w	r2, r2, #4096	; 0x1000
 8001a5e:	682f      	ldr	r7, [r5, #0]
 8001a60:	6a21      	ldr	r1, [r4, #32]
 8001a62:	602b      	str	r3, [r5, #0]
 8001a64:	d025      	beq.n	8001ab2 <__sflush_r+0x7a>
 8001a66:	6d62      	ldr	r2, [r4, #84]	; 0x54
 8001a68:	89a3      	ldrh	r3, [r4, #12]
 8001a6a:	0758      	lsls	r0, r3, #29
 8001a6c:	d505      	bpl.n	8001a7a <__sflush_r+0x42>
 8001a6e:	6863      	ldr	r3, [r4, #4]
 8001a70:	1ad2      	subs	r2, r2, r3
 8001a72:	6b63      	ldr	r3, [r4, #52]	; 0x34
 8001a74:	b10b      	cbz	r3, 8001a7a <__sflush_r+0x42>
 8001a76:	6c23      	ldr	r3, [r4, #64]	; 0x40
 8001a78:	1ad2      	subs	r2, r2, r3
 8001a7a:	6a21      	ldr	r1, [r4, #32]
 8001a7c:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 8001a7e:	2300      	movs	r3, #0
 8001a80:	4628      	mov	r0, r5
 8001a82:	47b0      	blx	r6
 8001a84:	1c41      	adds	r1, r0, #1
 8001a86:	d024      	beq.n	8001ad2 <__sflush_r+0x9a>
 8001a88:	2300      	movs	r3, #0
 8001a8a:	6063      	str	r3, [r4, #4]
 8001a8c:	6923      	ldr	r3, [r4, #16]
 8001a8e:	6023      	str	r3, [r4, #0]
 8001a90:	89a3      	ldrh	r3, [r4, #12]
 8001a92:	04da      	lsls	r2, r3, #19
 8001a94:	d500      	bpl.n	8001a98 <__sflush_r+0x60>
 8001a96:	6560      	str	r0, [r4, #84]	; 0x54
 8001a98:	6b61      	ldr	r1, [r4, #52]	; 0x34
 8001a9a:	602f      	str	r7, [r5, #0]
 8001a9c:	b1b9      	cbz	r1, 8001ace <__sflush_r+0x96>
 8001a9e:	f104 0344 	add.w	r3, r4, #68	; 0x44
 8001aa2:	4299      	cmp	r1, r3
 8001aa4:	d002      	beq.n	8001aac <__sflush_r+0x74>
 8001aa6:	4628      	mov	r0, r5
 8001aa8:	f7ff fb6e 	bl	8001188 <_free_r>
 8001aac:	2300      	movs	r3, #0
 8001aae:	6363      	str	r3, [r4, #52]	; 0x34
 8001ab0:	e00d      	b.n	8001ace <__sflush_r+0x96>
 8001ab2:	2301      	movs	r3, #1
 8001ab4:	4628      	mov	r0, r5
 8001ab6:	47b0      	blx	r6
 8001ab8:	1c46      	adds	r6, r0, #1
 8001aba:	4602      	mov	r2, r0
 8001abc:	d1d4      	bne.n	8001a68 <__sflush_r+0x30>
 8001abe:	682b      	ldr	r3, [r5, #0]
 8001ac0:	2b00      	cmp	r3, #0
 8001ac2:	d0d1      	beq.n	8001a68 <__sflush_r+0x30>
 8001ac4:	2b1d      	cmp	r3, #29
 8001ac6:	d001      	beq.n	8001acc <__sflush_r+0x94>
 8001ac8:	2b16      	cmp	r3, #22
 8001aca:	d12a      	bne.n	8001b22 <__sflush_r+0xea>
 8001acc:	602f      	str	r7, [r5, #0]
 8001ace:	2000      	movs	r0, #0
 8001ad0:	e02e      	b.n	8001b30 <__sflush_r+0xf8>
 8001ad2:	682a      	ldr	r2, [r5, #0]
 8001ad4:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001ad8:	b142      	cbz	r2, 8001aec <__sflush_r+0xb4>
 8001ada:	2a1d      	cmp	r2, #29
 8001adc:	d001      	beq.n	8001ae2 <__sflush_r+0xaa>
 8001ade:	2a16      	cmp	r2, #22
 8001ae0:	d121      	bne.n	8001b26 <__sflush_r+0xee>
 8001ae2:	2300      	movs	r3, #0
 8001ae4:	6063      	str	r3, [r4, #4]
 8001ae6:	6923      	ldr	r3, [r4, #16]
 8001ae8:	6023      	str	r3, [r4, #0]
 8001aea:	e7d5      	b.n	8001a98 <__sflush_r+0x60>
 8001aec:	6062      	str	r2, [r4, #4]
 8001aee:	6922      	ldr	r2, [r4, #16]
 8001af0:	6022      	str	r2, [r4, #0]
 8001af2:	e7ce      	b.n	8001a92 <__sflush_r+0x5a>
 8001af4:	690f      	ldr	r7, [r1, #16]
 8001af6:	2f00      	cmp	r7, #0
 8001af8:	d0e9      	beq.n	8001ace <__sflush_r+0x96>
 8001afa:	0793      	lsls	r3, r2, #30
 8001afc:	680e      	ldr	r6, [r1, #0]
 8001afe:	bf08      	it	eq
 8001b00:	694b      	ldreq	r3, [r1, #20]
 8001b02:	600f      	str	r7, [r1, #0]
 8001b04:	bf18      	it	ne
 8001b06:	2300      	movne	r3, #0
 8001b08:	1bf6      	subs	r6, r6, r7
 8001b0a:	608b      	str	r3, [r1, #8]
 8001b0c:	2e00      	cmp	r6, #0
 8001b0e:	ddde      	ble.n	8001ace <__sflush_r+0x96>
 8001b10:	6a21      	ldr	r1, [r4, #32]
 8001b12:	f8d4 c028 	ldr.w	ip, [r4, #40]	; 0x28
 8001b16:	4633      	mov	r3, r6
 8001b18:	463a      	mov	r2, r7
 8001b1a:	4628      	mov	r0, r5
 8001b1c:	47e0      	blx	ip
 8001b1e:	2800      	cmp	r0, #0
 8001b20:	dc07      	bgt.n	8001b32 <__sflush_r+0xfa>
 8001b22:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001b26:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8001b2a:	81a3      	strh	r3, [r4, #12]
 8001b2c:	f04f 30ff 	mov.w	r0, #4294967295
 8001b30:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001b32:	4407      	add	r7, r0
 8001b34:	1a36      	subs	r6, r6, r0
 8001b36:	e7e9      	b.n	8001b0c <__sflush_r+0xd4>

08001b38 <_fflush_r>:
 8001b38:	b538      	push	{r3, r4, r5, lr}
 8001b3a:	690b      	ldr	r3, [r1, #16]
 8001b3c:	4605      	mov	r5, r0
 8001b3e:	460c      	mov	r4, r1
 8001b40:	b913      	cbnz	r3, 8001b48 <_fflush_r+0x10>
 8001b42:	2500      	movs	r5, #0
 8001b44:	4628      	mov	r0, r5
 8001b46:	bd38      	pop	{r3, r4, r5, pc}
 8001b48:	b118      	cbz	r0, 8001b52 <_fflush_r+0x1a>
 8001b4a:	6a03      	ldr	r3, [r0, #32]
 8001b4c:	b90b      	cbnz	r3, 8001b52 <_fflush_r+0x1a>
 8001b4e:	f7ff f94b 	bl	8000de8 <__sinit>
 8001b52:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001b56:	2b00      	cmp	r3, #0
 8001b58:	d0f3      	beq.n	8001b42 <_fflush_r+0xa>
 8001b5a:	6e62      	ldr	r2, [r4, #100]	; 0x64
 8001b5c:	07d0      	lsls	r0, r2, #31
 8001b5e:	d404      	bmi.n	8001b6a <_fflush_r+0x32>
 8001b60:	0599      	lsls	r1, r3, #22
 8001b62:	d402      	bmi.n	8001b6a <_fflush_r+0x32>
 8001b64:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8001b66:	f7ff fb08 	bl	800117a <__retarget_lock_acquire_recursive>
 8001b6a:	4628      	mov	r0, r5
 8001b6c:	4621      	mov	r1, r4
 8001b6e:	f7ff ff63 	bl	8001a38 <__sflush_r>
 8001b72:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8001b74:	07da      	lsls	r2, r3, #31
 8001b76:	4605      	mov	r5, r0
 8001b78:	d4e4      	bmi.n	8001b44 <_fflush_r+0xc>
 8001b7a:	89a3      	ldrh	r3, [r4, #12]
 8001b7c:	059b      	lsls	r3, r3, #22
 8001b7e:	d4e1      	bmi.n	8001b44 <_fflush_r+0xc>
 8001b80:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8001b82:	f7ff fb00 	bl	8001186 <__retarget_lock_release_recursive>
 8001b86:	e7dd      	b.n	8001b44 <_fflush_r+0xc>

08001b88 <fflush>:
 8001b88:	4601      	mov	r1, r0
 8001b8a:	b920      	cbnz	r0, 8001b96 <fflush+0xe>
 8001b8c:	4a04      	ldr	r2, [pc, #16]	; (8001ba0 <fflush+0x18>)
 8001b8e:	4905      	ldr	r1, [pc, #20]	; (8001ba4 <fflush+0x1c>)
 8001b90:	4805      	ldr	r0, [pc, #20]	; (8001ba8 <fflush+0x20>)
 8001b92:	f7ff b95d 	b.w	8000e50 <_fwalk_sglue>
 8001b96:	4b05      	ldr	r3, [pc, #20]	; (8001bac <fflush+0x24>)
 8001b98:	6818      	ldr	r0, [r3, #0]
 8001b9a:	f7ff bfcd 	b.w	8001b38 <_fflush_r>
 8001b9e:	bf00      	nop
 8001ba0:	20000014 	.word	0x20000014
 8001ba4:	08001b39 	.word	0x08001b39
 8001ba8:	20000024 	.word	0x20000024
 8001bac:	20000020 	.word	0x20000020

08001bb0 <memmove>:
 8001bb0:	4288      	cmp	r0, r1
 8001bb2:	b510      	push	{r4, lr}
 8001bb4:	eb01 0402 	add.w	r4, r1, r2
 8001bb8:	d902      	bls.n	8001bc0 <memmove+0x10>
 8001bba:	4284      	cmp	r4, r0
 8001bbc:	4623      	mov	r3, r4
 8001bbe:	d807      	bhi.n	8001bd0 <memmove+0x20>
 8001bc0:	1e43      	subs	r3, r0, #1
 8001bc2:	42a1      	cmp	r1, r4
 8001bc4:	d008      	beq.n	8001bd8 <memmove+0x28>
 8001bc6:	f811 2b01 	ldrb.w	r2, [r1], #1
 8001bca:	f803 2f01 	strb.w	r2, [r3, #1]!
 8001bce:	e7f8      	b.n	8001bc2 <memmove+0x12>
 8001bd0:	4402      	add	r2, r0
 8001bd2:	4601      	mov	r1, r0
 8001bd4:	428a      	cmp	r2, r1
 8001bd6:	d100      	bne.n	8001bda <memmove+0x2a>
 8001bd8:	bd10      	pop	{r4, pc}
 8001bda:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
 8001bde:	f802 4d01 	strb.w	r4, [r2, #-1]!
 8001be2:	e7f7      	b.n	8001bd4 <memmove+0x24>

08001be4 <_sbrk_r>:
 8001be4:	b538      	push	{r3, r4, r5, lr}
 8001be6:	4d06      	ldr	r5, [pc, #24]	; (8001c00 <_sbrk_r+0x1c>)
 8001be8:	2300      	movs	r3, #0
 8001bea:	4604      	mov	r4, r0
 8001bec:	4608      	mov	r0, r1
 8001bee:	602b      	str	r3, [r5, #0]
 8001bf0:	f7fe fe0d 	bl	800080e <_sbrk>
 8001bf4:	1c43      	adds	r3, r0, #1
 8001bf6:	d102      	bne.n	8001bfe <_sbrk_r+0x1a>
 8001bf8:	682b      	ldr	r3, [r5, #0]
 8001bfa:	b103      	cbz	r3, 8001bfe <_sbrk_r+0x1a>
 8001bfc:	6023      	str	r3, [r4, #0]
 8001bfe:	bd38      	pop	{r3, r4, r5, pc}
 8001c00:	200001dc 	.word	0x200001dc

08001c04 <memcpy>:
 8001c04:	440a      	add	r2, r1
 8001c06:	4291      	cmp	r1, r2
 8001c08:	f100 33ff 	add.w	r3, r0, #4294967295
 8001c0c:	d100      	bne.n	8001c10 <memcpy+0xc>
 8001c0e:	4770      	bx	lr
 8001c10:	b510      	push	{r4, lr}
 8001c12:	f811 4b01 	ldrb.w	r4, [r1], #1
 8001c16:	f803 4f01 	strb.w	r4, [r3, #1]!
 8001c1a:	4291      	cmp	r1, r2
 8001c1c:	d1f9      	bne.n	8001c12 <memcpy+0xe>
 8001c1e:	bd10      	pop	{r4, pc}

08001c20 <_realloc_r>:
 8001c20:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001c24:	4680      	mov	r8, r0
 8001c26:	4615      	mov	r5, r2
 8001c28:	460c      	mov	r4, r1
 8001c2a:	b921      	cbnz	r1, 8001c36 <_realloc_r+0x16>
 8001c2c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 8001c30:	4611      	mov	r1, r2
 8001c32:	f7ff bb15 	b.w	8001260 <_malloc_r>
 8001c36:	b92a      	cbnz	r2, 8001c44 <_realloc_r+0x24>
 8001c38:	f7ff faa6 	bl	8001188 <_free_r>
 8001c3c:	2400      	movs	r4, #0
 8001c3e:	4620      	mov	r0, r4
 8001c40:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001c44:	f000 f81a 	bl	8001c7c <_malloc_usable_size_r>
 8001c48:	4285      	cmp	r5, r0
 8001c4a:	4606      	mov	r6, r0
 8001c4c:	d802      	bhi.n	8001c54 <_realloc_r+0x34>
 8001c4e:	ebb5 0f50 	cmp.w	r5, r0, lsr #1
 8001c52:	d8f4      	bhi.n	8001c3e <_realloc_r+0x1e>
 8001c54:	4629      	mov	r1, r5
 8001c56:	4640      	mov	r0, r8
 8001c58:	f7ff fb02 	bl	8001260 <_malloc_r>
 8001c5c:	4607      	mov	r7, r0
 8001c5e:	2800      	cmp	r0, #0
 8001c60:	d0ec      	beq.n	8001c3c <_realloc_r+0x1c>
 8001c62:	42b5      	cmp	r5, r6
 8001c64:	462a      	mov	r2, r5
 8001c66:	4621      	mov	r1, r4
 8001c68:	bf28      	it	cs
 8001c6a:	4632      	movcs	r2, r6
 8001c6c:	f7ff ffca 	bl	8001c04 <memcpy>
 8001c70:	4621      	mov	r1, r4
 8001c72:	4640      	mov	r0, r8
 8001c74:	f7ff fa88 	bl	8001188 <_free_r>
 8001c78:	463c      	mov	r4, r7
 8001c7a:	e7e0      	b.n	8001c3e <_realloc_r+0x1e>

08001c7c <_malloc_usable_size_r>:
 8001c7c:	f851 3c04 	ldr.w	r3, [r1, #-4]
 8001c80:	1f18      	subs	r0, r3, #4
 8001c82:	2b00      	cmp	r3, #0
 8001c84:	bfbc      	itt	lt
 8001c86:	580b      	ldrlt	r3, [r1, r0]
 8001c88:	18c0      	addlt	r0, r0, r3
 8001c8a:	4770      	bx	lr
 8001c8c:	64726168 	.word	0x64726168
 8001c90:	6c756166 	.word	0x6c756166
 8001c94:	61685f74 	.word	0x61685f74
 8001c98:	656c646e 	.word	0x656c646e
 8001c9c:	00000072 	.word	0x00000072
 8001ca0:	5f717269 	.word	0x5f717269
 8001ca4:	7473696c 	.word	0x7473696c
 8001ca8:	00000000 	.word	0x00000000
 8001cac:	73616c66 	.word	0x73616c66
 8001cb0:	3e2d2068 	.word	0x3e2d2068
 8001cb4:	61727320 	.word	0x61727320
 8001cb8:	30203a6d 	.word	0x30203a6d
 8001cbc:	586c2578 	.word	0x586c2578
 8001cc0:	203e2d20 	.word	0x203e2d20
 8001cc4:	6c257830 	.word	0x6c257830
 8001cc8:	00000058 	.word	0x00000058
 8001ccc:	6b636974 	.word	0x6b636974
 8001cd0:	25203a73 	.word	0x25203a73
 8001cd4:	0000646c 	.word	0x0000646c
 8001cd8:	0000000a 	.word	0x0000000a
 8001cdc:	52415355 	.word	0x52415355
 8001ce0:	00003154 	.word	0x00003154
 8001ce4:	52415355 	.word	0x52415355
 8001ce8:	00003254 	.word	0x00003254
 8001cec:	4e4b4e55 	.word	0x4e4b4e55
 8001cf0:	204e574f 	.word	0x204e574f
 8001cf4:	4e414843 	.word	0x4e414843
 8001cf8:	004c454e 	.word	0x004c454e
 8001cfc:	0000203a 	.word	0x0000203a
 8001d00:	6b636974 	.word	0x6b636974
 8001d04:	00000073 	.word	0x00000073
 8001d08:	72617473 	.word	0x72617473
 8001d0c:	25203a74 	.word	0x25203a74
 8001d10:	0000646c 	.word	0x0000646c
 8001d14:	3a646e65 	.word	0x3a646e65
 8001d18:	646c2520 	.word	0x646c2520
 8001d1c:	00000000 	.word	0x00000000

08001d20 <all_implied_fbits>:
 8001d20:	410c413e 41274111 41034136 41154106     >A.A.A'A6A.A.A.A
 8001d30:	410e410f 41134126 41024129 410a4119     .A.A&A.A)A.A.A.A
 8001d40:	0000410b                                .A..

08001d44 <_ctype_>:
 8001d44:	20202000 20202020 28282020 20282828     .         ((((( 
 8001d54:	20202020 20202020 20202020 20202020                     
 8001d64:	10108820 10101010 10101010 10101010      ...............
 8001d74:	04040410 04040404 10040404 10101010     ................
 8001d84:	41411010 41414141 01010101 01010101     ..AAAAAA........
 8001d94:	01010101 01010101 01010101 10101010     ................
 8001da4:	42421010 42424242 02020202 02020202     ..BBBBBB........
 8001db4:	02020202 02020202 02020202 10101010     ................
 8001dc4:	00000020 00000000 00000000 00000000      ...............
	...
 8001e44:	302d2300 6800202b 65004c6c 46456766     .#-0+ .hlL.efgEF
 8001e54:	31300047 35343332 39383736 44434241     G.0123456789ABCD
 8001e64:	30004645 34333231 38373635 63626139     EF.0123456789abc
 8001e74:	00666564                                def.

08001e78 <all_implied_fbits>:
 8001e78:	410c413e 41274111 41034136 41154106     >A.A.A'A6A.A.A.A
 8001e88:	410e410f 41134126 41024129 410a4119     .A.A&A.A)A.A.A.A
 8001e98:	0000410b                                .A..

08001e9c <_init>:
 8001e9c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001e9e:	bf00      	nop
 8001ea0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001ea2:	bc08      	pop	{r3}
 8001ea4:	469e      	mov	lr, r3
 8001ea6:	4770      	bx	lr

08001ea8 <_fini>:
 8001ea8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001eaa:	bf00      	nop
 8001eac:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001eae:	bc08      	pop	{r3}
 8001eb0:	469e      	mov	lr, r3
 8001eb2:	4770      	bx	lr

08001eb4 <__EH_FRAME_BEGIN__>:
 8001eb4:	0010 0000 0000 0000 7a01 0052 7c02 010e     .........zR..|..
 8001ec4:	0c1b 000d 0010 0000 0018 0000 ebe4 ffff     ................
 8001ed4:	0010 0000 4700 000e 0010 0000 0000 0000     .....G..........
 8001ee4:	7a01 0052 7c02 010e 0c1b 000d 002c 0000     .zR..|......,...
 8001ef4:	0018 0000 ebd8 ffff 009e 0000 5100 100e     .............Q..
 8001f04:	0484 0385 0286 0187 c75b c5c6 0ec4 4d00     ........[......M
 8001f14:	000e 0e42 5300 c6c7 c4c5 000e               ..B..S......

08001f20 <__FRAME_END__>:
 8001f20:	0000 0000 e1bc 7fff 0001 0000               ............
