
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
 8000102:	f001 f8bf 	bl	8001284 <memset>
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
 800012a:	f001 f94f 	bl	80013cc <__libc_init_array>
 800012e:	0020      	movs	r0, r4
 8000130:	0029      	movs	r1, r5
 8000132:	f000 f84b 	bl	80001cc <main>
 8000136:	f000 fdb9 	bl	8000cac <exit>
 800013a:	bf00      	nop
 800013c:	00080000 	.word	0x00080000
	...
 800014c:	20000084 	.word	0x20000084
 8000150:	200001f8 	.word	0x200001f8
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
 800016e:	f000 fcac 	bl	8000aca <usart_receive>
 8000172:	7bfb      	ldrb	r3, [r7, #15]
 8000174:	4618      	mov	r0, r3
 8000176:	f000 f80d 	bl	8000194 <capsbit>
 800017a:	4603      	mov	r3, r0
 800017c:	73fb      	strb	r3, [r7, #15]
 800017e:	f107 030f 	add.w	r3, r7, #15
 8000182:	461a      	mov	r2, r3
 8000184:	2101      	movs	r1, #1
 8000186:	6878      	ldr	r0, [r7, #4]
 8000188:	f000 fc68 	bl	8000a5c <usart_transmit>
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
 80001c8:	08002100 	.word	0x08002100

080001cc <main>:
 80001cc:	b580      	push	{r7, lr}
 80001ce:	af00      	add	r7, sp, #0
 80001d0:	f000 f81a 	bl	8000208 <fusecore>
 80001d4:	4b09      	ldr	r3, [pc, #36]	; (80001fc <main+0x30>)
 80001d6:	220a      	movs	r2, #10
 80001d8:	609a      	str	r2, [r3, #8]
 80001da:	4b08      	ldr	r3, [pc, #32]	; (80001fc <main+0x30>)
 80001dc:	2214      	movs	r2, #20
 80001de:	60da      	str	r2, [r3, #12]
 80001e0:	4807      	ldr	r0, [pc, #28]	; (8000200 <main+0x34>)
 80001e2:	f000 ff01 	bl	8000fe8 <puts>
 80001e6:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80001ea:	f000 fbd1 	bl	8000990 <delay_ms>
 80001ee:	210d      	movs	r1, #13
 80001f0:	4804      	ldr	r0, [pc, #16]	; (8000204 <main+0x38>)
 80001f2:	f000 f91d 	bl	8000430 <gpio_toggle_pin>
 80001f6:	bf00      	nop
 80001f8:	e7f2      	b.n	80001e0 <main+0x14>
 80001fa:	bf00      	nop
 80001fc:	20000000 	.word	0x20000000
 8000200:	08002038 	.word	0x08002038
 8000204:	40020800 	.word	0x40020800

08000208 <fusecore>:
 8000208:	b580      	push	{r7, lr}
 800020a:	af00      	add	r7, sp, #0
 800020c:	f000 f84e 	bl	80002ac <gpio_init>
 8000210:	f000 f868 	bl	80002e4 <usart1_init>
 8000214:	f000 f812 	bl	800023c <usart2_init>
 8000218:	f000 f858 	bl	80002cc <nvic_init>
 800021c:	4b05      	ldr	r3, [pc, #20]	; (8000234 <fusecore+0x2c>)
 800021e:	681b      	ldr	r3, [r3, #0]
 8000220:	4a05      	ldr	r2, [pc, #20]	; (8000238 <fusecore+0x30>)
 8000222:	fba2 2303 	umull	r2, r3, r2, r3
 8000226:	099b      	lsrs	r3, r3, #6
 8000228:	4618      	mov	r0, r3
 800022a:	f000 fb7f 	bl	800092c <systick_init>
 800022e:	bf00      	nop
 8000230:	bd80      	pop	{r7, pc}
 8000232:	bf00      	nop
 8000234:	20000014 	.word	0x20000014
 8000238:	10624dd3 	.word	0x10624dd3

0800023c <usart2_init>:
 800023c:	b580      	push	{r7, lr}
 800023e:	af00      	add	r7, sp, #0
 8000240:	2101      	movs	r1, #1
 8000242:	2000      	movs	r0, #0
 8000244:	f000 fa68 	bl	8000718 <rcc_periph_clock_enable>
 8000248:	2202      	movs	r2, #2
 800024a:	2102      	movs	r1, #2
 800024c:	4815      	ldr	r0, [pc, #84]	; (80002a4 <usart2_init+0x68>)
 800024e:	f000 f87f 	bl	8000350 <gpio_mode_setup>
 8000252:	2202      	movs	r2, #2
 8000254:	2103      	movs	r1, #3
 8000256:	4813      	ldr	r0, [pc, #76]	; (80002a4 <usart2_init+0x68>)
 8000258:	f000 f87a 	bl	8000350 <gpio_mode_setup>
 800025c:	2207      	movs	r2, #7
 800025e:	2102      	movs	r1, #2
 8000260:	4810      	ldr	r0, [pc, #64]	; (80002a4 <usart2_init+0x68>)
 8000262:	f000 f898 	bl	8000396 <gpio_af_setup>
 8000266:	2207      	movs	r2, #7
 8000268:	2103      	movs	r1, #3
 800026a:	480e      	ldr	r0, [pc, #56]	; (80002a4 <usart2_init+0x68>)
 800026c:	f000 f893 	bl	8000396 <gpio_af_setup>
 8000270:	f44f 3100 	mov.w	r1, #131072	; 0x20000
 8000274:	2001      	movs	r0, #1
 8000276:	f000 fa4f 	bl	8000718 <rcc_periph_clock_enable>
 800027a:	f44f 5116 	mov.w	r1, #9600	; 0x2580
 800027e:	480a      	ldr	r0, [pc, #40]	; (80002a8 <usart2_init+0x6c>)
 8000280:	f000 fbce 	bl	8000a20 <usart_set_baudrate>
 8000284:	210c      	movs	r1, #12
 8000286:	4808      	ldr	r0, [pc, #32]	; (80002a8 <usart2_init+0x6c>)
 8000288:	f000 fbb7 	bl	80009fa <usart_set_mode>
 800028c:	4806      	ldr	r0, [pc, #24]	; (80002a8 <usart2_init+0x6c>)
 800028e:	f000 fc4f 	bl	8000b30 <usart_irq_enable>
 8000292:	4805      	ldr	r0, [pc, #20]	; (80002a8 <usart2_init+0x6c>)
 8000294:	f000 fba0 	bl	80009d8 <usart_enable>
 8000298:	4803      	ldr	r0, [pc, #12]	; (80002a8 <usart2_init+0x6c>)
 800029a:	f000 fc5a 	bl	8000b52 <usart_init_send>
 800029e:	bf00      	nop
 80002a0:	bd80      	pop	{r7, pc}
 80002a2:	bf00      	nop
 80002a4:	40020000 	.word	0x40020000
 80002a8:	40004400 	.word	0x40004400

080002ac <gpio_init>:
 80002ac:	b580      	push	{r7, lr}
 80002ae:	af00      	add	r7, sp, #0
 80002b0:	2104      	movs	r1, #4
 80002b2:	2000      	movs	r0, #0
 80002b4:	f000 fa30 	bl	8000718 <rcc_periph_clock_enable>
 80002b8:	2201      	movs	r2, #1
 80002ba:	210d      	movs	r1, #13
 80002bc:	4802      	ldr	r0, [pc, #8]	; (80002c8 <gpio_init+0x1c>)
 80002be:	f000 f847 	bl	8000350 <gpio_mode_setup>
 80002c2:	bf00      	nop
 80002c4:	bd80      	pop	{r7, pc}
 80002c6:	bf00      	nop
 80002c8:	40020800 	.word	0x40020800

080002cc <nvic_init>:
 80002cc:	b580      	push	{r7, lr}
 80002ce:	af00      	add	r7, sp, #0
 80002d0:	f000 fa1c 	bl	800070c <nvic_global_enable>
 80002d4:	2026      	movs	r0, #38	; 0x26
 80002d6:	f000 f9f5 	bl	80006c4 <nvic_irq_setup>
 80002da:	2025      	movs	r0, #37	; 0x25
 80002dc:	f000 f9f2 	bl	80006c4 <nvic_irq_setup>
 80002e0:	bf00      	nop
 80002e2:	bd80      	pop	{r7, pc}

080002e4 <usart1_init>:
 80002e4:	b580      	push	{r7, lr}
 80002e6:	af00      	add	r7, sp, #0
 80002e8:	2101      	movs	r1, #1
 80002ea:	2000      	movs	r0, #0
 80002ec:	f000 fa14 	bl	8000718 <rcc_periph_clock_enable>
 80002f0:	2202      	movs	r2, #2
 80002f2:	2109      	movs	r1, #9
 80002f4:	4814      	ldr	r0, [pc, #80]	; (8000348 <usart1_init+0x64>)
 80002f6:	f000 f82b 	bl	8000350 <gpio_mode_setup>
 80002fa:	2202      	movs	r2, #2
 80002fc:	210a      	movs	r1, #10
 80002fe:	4812      	ldr	r0, [pc, #72]	; (8000348 <usart1_init+0x64>)
 8000300:	f000 f826 	bl	8000350 <gpio_mode_setup>
 8000304:	2207      	movs	r2, #7
 8000306:	2109      	movs	r1, #9
 8000308:	480f      	ldr	r0, [pc, #60]	; (8000348 <usart1_init+0x64>)
 800030a:	f000 f844 	bl	8000396 <gpio_af_setup>
 800030e:	2207      	movs	r2, #7
 8000310:	210a      	movs	r1, #10
 8000312:	480d      	ldr	r0, [pc, #52]	; (8000348 <usart1_init+0x64>)
 8000314:	f000 f83f 	bl	8000396 <gpio_af_setup>
 8000318:	2110      	movs	r1, #16
 800031a:	2002      	movs	r0, #2
 800031c:	f000 f9fc 	bl	8000718 <rcc_periph_clock_enable>
 8000320:	f44f 5116 	mov.w	r1, #9600	; 0x2580
 8000324:	4809      	ldr	r0, [pc, #36]	; (800034c <usart1_init+0x68>)
 8000326:	f000 fb7b 	bl	8000a20 <usart_set_baudrate>
 800032a:	210c      	movs	r1, #12
 800032c:	4807      	ldr	r0, [pc, #28]	; (800034c <usart1_init+0x68>)
 800032e:	f000 fb64 	bl	80009fa <usart_set_mode>
 8000332:	4806      	ldr	r0, [pc, #24]	; (800034c <usart1_init+0x68>)
 8000334:	f000 fbfc 	bl	8000b30 <usart_irq_enable>
 8000338:	4804      	ldr	r0, [pc, #16]	; (800034c <usart1_init+0x68>)
 800033a:	f000 fb4d 	bl	80009d8 <usart_enable>
 800033e:	4803      	ldr	r0, [pc, #12]	; (800034c <usart1_init+0x68>)
 8000340:	f000 fc07 	bl	8000b52 <usart_init_send>
 8000344:	bf00      	nop
 8000346:	bd80      	pop	{r7, pc}
 8000348:	40020000 	.word	0x40020000
 800034c:	40011000 	.word	0x40011000

08000350 <gpio_mode_setup>:
 8000350:	b480      	push	{r7}
 8000352:	b087      	sub	sp, #28
 8000354:	af00      	add	r7, sp, #0
 8000356:	60f8      	str	r0, [r7, #12]
 8000358:	60b9      	str	r1, [r7, #8]
 800035a:	607a      	str	r2, [r7, #4]
 800035c:	68fb      	ldr	r3, [r7, #12]
 800035e:	681b      	ldr	r3, [r3, #0]
 8000360:	617b      	str	r3, [r7, #20]
 8000362:	68bb      	ldr	r3, [r7, #8]
 8000364:	005b      	lsls	r3, r3, #1
 8000366:	2203      	movs	r2, #3
 8000368:	fa02 f303 	lsl.w	r3, r2, r3
 800036c:	43db      	mvns	r3, r3
 800036e:	461a      	mov	r2, r3
 8000370:	697b      	ldr	r3, [r7, #20]
 8000372:	4013      	ands	r3, r2
 8000374:	617b      	str	r3, [r7, #20]
 8000376:	68bb      	ldr	r3, [r7, #8]
 8000378:	005b      	lsls	r3, r3, #1
 800037a:	687a      	ldr	r2, [r7, #4]
 800037c:	fa02 f303 	lsl.w	r3, r2, r3
 8000380:	697a      	ldr	r2, [r7, #20]
 8000382:	4313      	orrs	r3, r2
 8000384:	617b      	str	r3, [r7, #20]
 8000386:	68fb      	ldr	r3, [r7, #12]
 8000388:	697a      	ldr	r2, [r7, #20]
 800038a:	601a      	str	r2, [r3, #0]
 800038c:	bf00      	nop
 800038e:	371c      	adds	r7, #28
 8000390:	46bd      	mov	sp, r7
 8000392:	bc80      	pop	{r7}
 8000394:	4770      	bx	lr

08000396 <gpio_af_setup>:
 8000396:	b480      	push	{r7}
 8000398:	b089      	sub	sp, #36	; 0x24
 800039a:	af00      	add	r7, sp, #0
 800039c:	60f8      	str	r0, [r7, #12]
 800039e:	60b9      	str	r1, [r7, #8]
 80003a0:	607a      	str	r2, [r7, #4]
 80003a2:	2308      	movs	r3, #8
 80003a4:	77fb      	strb	r3, [r7, #31]
 80003a6:	2304      	movs	r3, #4
 80003a8:	77bb      	strb	r3, [r7, #30]
 80003aa:	7ffb      	ldrb	r3, [r7, #31]
 80003ac:	68ba      	ldr	r2, [r7, #8]
 80003ae:	429a      	cmp	r2, r3
 80003b0:	d907      	bls.n	80003c2 <gpio_af_setup+0x2c>
 80003b2:	7ffa      	ldrb	r2, [r7, #31]
 80003b4:	68bb      	ldr	r3, [r7, #8]
 80003b6:	fbb3 f1f2 	udiv	r1, r3, r2
 80003ba:	fb01 f202 	mul.w	r2, r1, r2
 80003be:	1a9b      	subs	r3, r3, r2
 80003c0:	e000      	b.n	80003c4 <gpio_af_setup+0x2e>
 80003c2:	68bb      	ldr	r3, [r7, #8]
 80003c4:	61bb      	str	r3, [r7, #24]
 80003c6:	7ffb      	ldrb	r3, [r7, #31]
 80003c8:	68ba      	ldr	r2, [r7, #8]
 80003ca:	429a      	cmp	r2, r3
 80003cc:	d203      	bcs.n	80003d6 <gpio_af_setup+0x40>
 80003ce:	68fb      	ldr	r3, [r7, #12]
 80003d0:	3320      	adds	r3, #32
 80003d2:	681b      	ldr	r3, [r3, #0]
 80003d4:	e002      	b.n	80003dc <gpio_af_setup+0x46>
 80003d6:	68fb      	ldr	r3, [r7, #12]
 80003d8:	3324      	adds	r3, #36	; 0x24
 80003da:	681b      	ldr	r3, [r3, #0]
 80003dc:	617b      	str	r3, [r7, #20]
 80003de:	7fbb      	ldrb	r3, [r7, #30]
 80003e0:	69ba      	ldr	r2, [r7, #24]
 80003e2:	fb02 f303 	mul.w	r3, r2, r3
 80003e6:	220f      	movs	r2, #15
 80003e8:	fa02 f303 	lsl.w	r3, r2, r3
 80003ec:	43db      	mvns	r3, r3
 80003ee:	697a      	ldr	r2, [r7, #20]
 80003f0:	4013      	ands	r3, r2
 80003f2:	617b      	str	r3, [r7, #20]
 80003f4:	7fbb      	ldrb	r3, [r7, #30]
 80003f6:	69ba      	ldr	r2, [r7, #24]
 80003f8:	fb02 f303 	mul.w	r3, r2, r3
 80003fc:	687a      	ldr	r2, [r7, #4]
 80003fe:	fa02 f303 	lsl.w	r3, r2, r3
 8000402:	697a      	ldr	r2, [r7, #20]
 8000404:	4313      	orrs	r3, r2
 8000406:	617b      	str	r3, [r7, #20]
 8000408:	7ffb      	ldrb	r3, [r7, #31]
 800040a:	68ba      	ldr	r2, [r7, #8]
 800040c:	429a      	cmp	r2, r3
 800040e:	d205      	bcs.n	800041c <gpio_af_setup+0x86>
 8000410:	68fb      	ldr	r3, [r7, #12]
 8000412:	3320      	adds	r3, #32
 8000414:	461a      	mov	r2, r3
 8000416:	697b      	ldr	r3, [r7, #20]
 8000418:	6013      	str	r3, [r2, #0]
 800041a:	e004      	b.n	8000426 <gpio_af_setup+0x90>
 800041c:	68fb      	ldr	r3, [r7, #12]
 800041e:	3324      	adds	r3, #36	; 0x24
 8000420:	461a      	mov	r2, r3
 8000422:	697b      	ldr	r3, [r7, #20]
 8000424:	6013      	str	r3, [r2, #0]
 8000426:	bf00      	nop
 8000428:	3724      	adds	r7, #36	; 0x24
 800042a:	46bd      	mov	sp, r7
 800042c:	bc80      	pop	{r7}
 800042e:	4770      	bx	lr

08000430 <gpio_toggle_pin>:
 8000430:	b480      	push	{r7}
 8000432:	b083      	sub	sp, #12
 8000434:	af00      	add	r7, sp, #0
 8000436:	6078      	str	r0, [r7, #4]
 8000438:	6039      	str	r1, [r7, #0]
 800043a:	687b      	ldr	r3, [r7, #4]
 800043c:	3314      	adds	r3, #20
 800043e:	681b      	ldr	r3, [r3, #0]
 8000440:	2101      	movs	r1, #1
 8000442:	683a      	ldr	r2, [r7, #0]
 8000444:	fa01 f202 	lsl.w	r2, r1, r2
 8000448:	4611      	mov	r1, r2
 800044a:	687a      	ldr	r2, [r7, #4]
 800044c:	3214      	adds	r2, #20
 800044e:	404b      	eors	r3, r1
 8000450:	6013      	str	r3, [r2, #0]
 8000452:	bf00      	nop
 8000454:	370c      	adds	r7, #12
 8000456:	46bd      	mov	sp, r7
 8000458:	bc80      	pop	{r7}
 800045a:	4770      	bx	lr

0800045c <nmi_handler>:
 800045c:	b580      	push	{r7, lr}
 800045e:	af00      	add	r7, sp, #0
 8000460:	4a03      	ldr	r2, [pc, #12]	; (8000470 <nmi_handler+0x14>)
 8000462:	4904      	ldr	r1, [pc, #16]	; (8000474 <nmi_handler+0x18>)
 8000464:	4804      	ldr	r0, [pc, #16]	; (8000478 <nmi_handler+0x1c>)
 8000466:	f000 f859 	bl	800051c <tags_log>
 800046a:	bf00      	nop
 800046c:	e7fd      	b.n	800046a <nmi_handler+0xe>
 800046e:	bf00      	nop
 8000470:	08002044 	.word	0x08002044
 8000474:	08002050 	.word	0x08002050
 8000478:	40011000 	.word	0x40011000

0800047c <hardfault_handler>:
 800047c:	b580      	push	{r7, lr}
 800047e:	b094      	sub	sp, #80	; 0x50
 8000480:	af02      	add	r7, sp, #8
 8000482:	4a11      	ldr	r2, [pc, #68]	; (80004c8 <hardfault_handler+0x4c>)
 8000484:	4911      	ldr	r1, [pc, #68]	; (80004cc <hardfault_handler+0x50>)
 8000486:	4812      	ldr	r0, [pc, #72]	; (80004d0 <hardfault_handler+0x54>)
 8000488:	f000 f848 	bl	800051c <tags_log>
 800048c:	2300      	movs	r3, #0
 800048e:	647b      	str	r3, [r7, #68]	; 0x44
 8000490:	e015      	b.n	80004be <hardfault_handler+0x42>
 8000492:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8000494:	009a      	lsls	r2, r3, #2
 8000496:	490f      	ldr	r1, [pc, #60]	; (80004d4 <hardfault_handler+0x58>)
 8000498:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800049a:	f851 3023 	ldr.w	r3, [r1, r3, lsl #2]
 800049e:	1d38      	adds	r0, r7, #4
 80004a0:	9300      	str	r3, [sp, #0]
 80004a2:	4613      	mov	r3, r2
 80004a4:	4a0c      	ldr	r2, [pc, #48]	; (80004d8 <hardfault_handler+0x5c>)
 80004a6:	2140      	movs	r1, #64	; 0x40
 80004a8:	f000 fdd6 	bl	8001058 <sniprintf>
 80004ac:	1d3b      	adds	r3, r7, #4
 80004ae:	461a      	mov	r2, r3
 80004b0:	4906      	ldr	r1, [pc, #24]	; (80004cc <hardfault_handler+0x50>)
 80004b2:	4807      	ldr	r0, [pc, #28]	; (80004d0 <hardfault_handler+0x54>)
 80004b4:	f000 f832 	bl	800051c <tags_log>
 80004b8:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 80004ba:	3301      	adds	r3, #1
 80004bc:	647b      	str	r3, [r7, #68]	; 0x44
 80004be:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 80004c0:	2b35      	cmp	r3, #53	; 0x35
 80004c2:	d9e6      	bls.n	8000492 <hardfault_handler+0x16>
 80004c4:	bf00      	nop
 80004c6:	e7fd      	b.n	80004c4 <hardfault_handler+0x48>
 80004c8:	0800205c 	.word	0x0800205c
 80004cc:	08002050 	.word	0x08002050
 80004d0:	40011000 	.word	0x40011000
 80004d4:	08000000 	.word	0x08000000
 80004d8:	08002070 	.word	0x08002070

080004dc <usart1_IRQhandler>:
 80004dc:	b580      	push	{r7, lr}
 80004de:	af00      	add	r7, sp, #0
 80004e0:	4b05      	ldr	r3, [pc, #20]	; (80004f8 <usart1_IRQhandler+0x1c>)
 80004e2:	681b      	ldr	r3, [r3, #0]
 80004e4:	f003 0320 	and.w	r3, r3, #32
 80004e8:	2b00      	cmp	r3, #0
 80004ea:	d002      	beq.n	80004f2 <usart1_IRQhandler+0x16>
 80004ec:	4802      	ldr	r0, [pc, #8]	; (80004f8 <usart1_IRQhandler+0x1c>)
 80004ee:	f7ff fe35 	bl	800015c <capslock>
 80004f2:	bf00      	nop
 80004f4:	bd80      	pop	{r7, pc}
 80004f6:	bf00      	nop
 80004f8:	40011000 	.word	0x40011000

080004fc <usart2_IRQhandler>:
 80004fc:	b580      	push	{r7, lr}
 80004fe:	af00      	add	r7, sp, #0
 8000500:	4b05      	ldr	r3, [pc, #20]	; (8000518 <usart2_IRQhandler+0x1c>)
 8000502:	681b      	ldr	r3, [r3, #0]
 8000504:	f003 0320 	and.w	r3, r3, #32
 8000508:	2b00      	cmp	r3, #0
 800050a:	d002      	beq.n	8000512 <usart2_IRQhandler+0x16>
 800050c:	4802      	ldr	r0, [pc, #8]	; (8000518 <usart2_IRQhandler+0x1c>)
 800050e:	f7ff fe25 	bl	800015c <capslock>
 8000512:	bf00      	nop
 8000514:	bd80      	pop	{r7, pc}
 8000516:	bf00      	nop
 8000518:	40004400 	.word	0x40004400

0800051c <tags_log>:
 800051c:	b580      	push	{r7, lr}
 800051e:	b084      	sub	sp, #16
 8000520:	af00      	add	r7, sp, #0
 8000522:	60f8      	str	r0, [r7, #12]
 8000524:	60b9      	str	r1, [r7, #8]
 8000526:	607a      	str	r2, [r7, #4]
 8000528:	68fb      	ldr	r3, [r7, #12]
 800052a:	4a08      	ldr	r2, [pc, #32]	; (800054c <tags_log+0x30>)
 800052c:	4293      	cmp	r3, r2
 800052e:	d003      	beq.n	8000538 <tags_log+0x1c>
 8000530:	68fb      	ldr	r3, [r7, #12]
 8000532:	4a07      	ldr	r2, [pc, #28]	; (8000550 <tags_log+0x34>)
 8000534:	4293      	cmp	r3, r2
 8000536:	d104      	bne.n	8000542 <tags_log+0x26>
 8000538:	687a      	ldr	r2, [r7, #4]
 800053a:	68b9      	ldr	r1, [r7, #8]
 800053c:	68f8      	ldr	r0, [r7, #12]
 800053e:	f000 f845 	bl	80005cc <tag_send>
 8000542:	bf00      	nop
 8000544:	3710      	adds	r7, #16
 8000546:	46bd      	mov	sp, r7
 8000548:	bd80      	pop	{r7, pc}
 800054a:	bf00      	nop
 800054c:	40011000 	.word	0x40011000
 8000550:	40004400 	.word	0x40004400

08000554 <dump_sram>:
 8000554:	b580      	push	{r7, lr}
 8000556:	b096      	sub	sp, #88	; 0x58
 8000558:	af02      	add	r7, sp, #8
 800055a:	6078      	str	r0, [r7, #4]
 800055c:	687b      	ldr	r3, [r7, #4]
 800055e:	64bb      	str	r3, [r7, #72]	; 0x48
 8000560:	4b17      	ldr	r3, [pc, #92]	; (80005c0 <dump_sram+0x6c>)
 8000562:	689b      	ldr	r3, [r3, #8]
 8000564:	425b      	negs	r3, r3
 8000566:	6cba      	ldr	r2, [r7, #72]	; 0x48
 8000568:	4413      	add	r3, r2
 800056a:	64bb      	str	r3, [r7, #72]	; 0x48
 800056c:	2300      	movs	r3, #0
 800056e:	64fb      	str	r3, [r7, #76]	; 0x4c
 8000570:	e01b      	b.n	80005aa <dump_sram+0x56>
 8000572:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8000574:	781b      	ldrb	r3, [r3, #0]
 8000576:	461a      	mov	r2, r3
 8000578:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 800057a:	781b      	ldrb	r3, [r3, #0]
 800057c:	f107 0008 	add.w	r0, r7, #8
 8000580:	9301      	str	r3, [sp, #4]
 8000582:	9200      	str	r2, [sp, #0]
 8000584:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8000586:	4a0f      	ldr	r2, [pc, #60]	; (80005c4 <dump_sram+0x70>)
 8000588:	2140      	movs	r1, #64	; 0x40
 800058a:	f000 fd65 	bl	8001058 <sniprintf>
 800058e:	4b0c      	ldr	r3, [pc, #48]	; (80005c0 <dump_sram+0x6c>)
 8000590:	685b      	ldr	r3, [r3, #4]
 8000592:	f107 0208 	add.w	r2, r7, #8
 8000596:	490c      	ldr	r1, [pc, #48]	; (80005c8 <dump_sram+0x74>)
 8000598:	4618      	mov	r0, r3
 800059a:	f7ff ffbf 	bl	800051c <tags_log>
 800059e:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 80005a0:	3301      	adds	r3, #1
 80005a2:	64bb      	str	r3, [r7, #72]	; 0x48
 80005a4:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 80005a6:	3301      	adds	r3, #1
 80005a8:	64fb      	str	r3, [r7, #76]	; 0x4c
 80005aa:	4b05      	ldr	r3, [pc, #20]	; (80005c0 <dump_sram+0x6c>)
 80005ac:	68db      	ldr	r3, [r3, #12]
 80005ae:	6cfa      	ldr	r2, [r7, #76]	; 0x4c
 80005b0:	429a      	cmp	r2, r3
 80005b2:	d3de      	bcc.n	8000572 <dump_sram+0x1e>
 80005b4:	bf00      	nop
 80005b6:	bf00      	nop
 80005b8:	3750      	adds	r7, #80	; 0x50
 80005ba:	46bd      	mov	sp, r7
 80005bc:	bd80      	pop	{r7, pc}
 80005be:	bf00      	nop
 80005c0:	20000000 	.word	0x20000000
 80005c4:	08002090 	.word	0x08002090
 80005c8:	080020ac 	.word	0x080020ac

080005cc <tag_send>:
 80005cc:	b580      	push	{r7, lr}
 80005ce:	b084      	sub	sp, #16
 80005d0:	af00      	add	r7, sp, #0
 80005d2:	60f8      	str	r0, [r7, #12]
 80005d4:	60b9      	str	r1, [r7, #8]
 80005d6:	607a      	str	r2, [r7, #4]
 80005d8:	68b8      	ldr	r0, [r7, #8]
 80005da:	f000 fac7 	bl	8000b6c <strlen>
 80005de:	4603      	mov	r3, r0
 80005e0:	68ba      	ldr	r2, [r7, #8]
 80005e2:	4619      	mov	r1, r3
 80005e4:	68f8      	ldr	r0, [r7, #12]
 80005e6:	f000 fa39 	bl	8000a5c <usart_transmit>
 80005ea:	4b18      	ldr	r3, [pc, #96]	; (800064c <tag_send+0x80>)
 80005ec:	681b      	ldr	r3, [r3, #0]
 80005ee:	4618      	mov	r0, r3
 80005f0:	f000 fabc 	bl	8000b6c <strlen>
 80005f4:	4601      	mov	r1, r0
 80005f6:	4b15      	ldr	r3, [pc, #84]	; (800064c <tag_send+0x80>)
 80005f8:	681b      	ldr	r3, [r3, #0]
 80005fa:	461a      	mov	r2, r3
 80005fc:	68f8      	ldr	r0, [r7, #12]
 80005fe:	f000 fa2d 	bl	8000a5c <usart_transmit>
 8000602:	4b13      	ldr	r3, [pc, #76]	; (8000650 <tag_send+0x84>)
 8000604:	781b      	ldrb	r3, [r3, #0]
 8000606:	2b00      	cmp	r3, #0
 8000608:	d00e      	beq.n	8000628 <tag_send+0x5c>
 800060a:	68f8      	ldr	r0, [r7, #12]
 800060c:	f000 f824 	bl	8000658 <channel_send>
 8000610:	4b0e      	ldr	r3, [pc, #56]	; (800064c <tag_send+0x80>)
 8000612:	681b      	ldr	r3, [r3, #0]
 8000614:	4618      	mov	r0, r3
 8000616:	f000 faa9 	bl	8000b6c <strlen>
 800061a:	4601      	mov	r1, r0
 800061c:	4b0b      	ldr	r3, [pc, #44]	; (800064c <tag_send+0x80>)
 800061e:	681b      	ldr	r3, [r3, #0]
 8000620:	461a      	mov	r2, r3
 8000622:	68f8      	ldr	r0, [r7, #12]
 8000624:	f000 fa1a 	bl	8000a5c <usart_transmit>
 8000628:	6878      	ldr	r0, [r7, #4]
 800062a:	f000 fa9f 	bl	8000b6c <strlen>
 800062e:	4603      	mov	r3, r0
 8000630:	687a      	ldr	r2, [r7, #4]
 8000632:	4619      	mov	r1, r3
 8000634:	68f8      	ldr	r0, [r7, #12]
 8000636:	f000 fa11 	bl	8000a5c <usart_transmit>
 800063a:	4a06      	ldr	r2, [pc, #24]	; (8000654 <tag_send+0x88>)
 800063c:	2101      	movs	r1, #1
 800063e:	68f8      	ldr	r0, [r7, #12]
 8000640:	f000 fa0c 	bl	8000a5c <usart_transmit>
 8000644:	bf00      	nop
 8000646:	3710      	adds	r7, #16
 8000648:	46bd      	mov	sp, r7
 800064a:	bd80      	pop	{r7, pc}
 800064c:	20000010 	.word	0x20000010
 8000650:	20000000 	.word	0x20000000
 8000654:	080020b4 	.word	0x080020b4

08000658 <channel_send>:
 8000658:	b580      	push	{r7, lr}
 800065a:	b084      	sub	sp, #16
 800065c:	af00      	add	r7, sp, #0
 800065e:	6078      	str	r0, [r7, #4]
 8000660:	6878      	ldr	r0, [r7, #4]
 8000662:	f000 f80e 	bl	8000682 <get_channel_name>
 8000666:	60f8      	str	r0, [r7, #12]
 8000668:	68f8      	ldr	r0, [r7, #12]
 800066a:	f000 fa7f 	bl	8000b6c <strlen>
 800066e:	4603      	mov	r3, r0
 8000670:	68fa      	ldr	r2, [r7, #12]
 8000672:	4619      	mov	r1, r3
 8000674:	6878      	ldr	r0, [r7, #4]
 8000676:	f000 f9f1 	bl	8000a5c <usart_transmit>
 800067a:	bf00      	nop
 800067c:	3710      	adds	r7, #16
 800067e:	46bd      	mov	sp, r7
 8000680:	bd80      	pop	{r7, pc}

08000682 <get_channel_name>:
 8000682:	b480      	push	{r7}
 8000684:	b083      	sub	sp, #12
 8000686:	af00      	add	r7, sp, #0
 8000688:	6078      	str	r0, [r7, #4]
 800068a:	687b      	ldr	r3, [r7, #4]
 800068c:	4a08      	ldr	r2, [pc, #32]	; (80006b0 <get_channel_name+0x2e>)
 800068e:	4293      	cmp	r3, r2
 8000690:	d005      	beq.n	800069e <get_channel_name+0x1c>
 8000692:	687b      	ldr	r3, [r7, #4]
 8000694:	4a07      	ldr	r2, [pc, #28]	; (80006b4 <get_channel_name+0x32>)
 8000696:	4293      	cmp	r3, r2
 8000698:	d103      	bne.n	80006a2 <get_channel_name+0x20>
 800069a:	4b07      	ldr	r3, [pc, #28]	; (80006b8 <get_channel_name+0x36>)
 800069c:	e002      	b.n	80006a4 <get_channel_name+0x22>
 800069e:	4b07      	ldr	r3, [pc, #28]	; (80006bc <get_channel_name+0x3a>)
 80006a0:	e000      	b.n	80006a4 <get_channel_name+0x22>
 80006a2:	4b07      	ldr	r3, [pc, #28]	; (80006c0 <get_channel_name+0x3e>)
 80006a4:	4618      	mov	r0, r3
 80006a6:	370c      	adds	r7, #12
 80006a8:	46bd      	mov	sp, r7
 80006aa:	bc80      	pop	{r7}
 80006ac:	4770      	bx	lr
 80006ae:	bf00      	nop
 80006b0:	40004400 	.word	0x40004400
 80006b4:	40011000 	.word	0x40011000
 80006b8:	080020b8 	.word	0x080020b8
 80006bc:	080020c0 	.word	0x080020c0
 80006c0:	080020c8 	.word	0x080020c8

080006c4 <nvic_irq_setup>:
 80006c4:	b480      	push	{r7}
 80006c6:	b085      	sub	sp, #20
 80006c8:	af00      	add	r7, sp, #0
 80006ca:	6078      	str	r0, [r7, #4]
 80006cc:	687b      	ldr	r3, [r7, #4]
 80006ce:	095b      	lsrs	r3, r3, #5
 80006d0:	60fb      	str	r3, [r7, #12]
 80006d2:	687b      	ldr	r3, [r7, #4]
 80006d4:	f003 031f 	and.w	r3, r3, #31
 80006d8:	60bb      	str	r3, [r7, #8]
 80006da:	68fb      	ldr	r3, [r7, #12]
 80006dc:	f103 2338 	add.w	r3, r3, #939538432	; 0x38003800
 80006e0:	3340      	adds	r3, #64	; 0x40
 80006e2:	009b      	lsls	r3, r3, #2
 80006e4:	681a      	ldr	r2, [r3, #0]
 80006e6:	2101      	movs	r1, #1
 80006e8:	68bb      	ldr	r3, [r7, #8]
 80006ea:	fa01 f303 	lsl.w	r3, r1, r3
 80006ee:	4618      	mov	r0, r3
 80006f0:	68fb      	ldr	r3, [r7, #12]
 80006f2:	f103 2338 	add.w	r3, r3, #939538432	; 0x38003800
 80006f6:	3340      	adds	r3, #64	; 0x40
 80006f8:	009b      	lsls	r3, r3, #2
 80006fa:	4619      	mov	r1, r3
 80006fc:	ea42 0300 	orr.w	r3, r2, r0
 8000700:	600b      	str	r3, [r1, #0]
 8000702:	bf00      	nop
 8000704:	3714      	adds	r7, #20
 8000706:	46bd      	mov	sp, r7
 8000708:	bc80      	pop	{r7}
 800070a:	4770      	bx	lr

0800070c <nvic_global_enable>:
 800070c:	b580      	push	{r7, lr}
 800070e:	af00      	add	r7, sp, #0
 8000710:	f000 f880 	bl	8000814 <_enable_irq>
 8000714:	bf00      	nop
 8000716:	bd80      	pop	{r7, pc}

08000718 <rcc_periph_clock_enable>:
 8000718:	b480      	push	{r7}
 800071a:	b083      	sub	sp, #12
 800071c:	af00      	add	r7, sp, #0
 800071e:	6078      	str	r0, [r7, #4]
 8000720:	6039      	str	r1, [r7, #0]
 8000722:	687b      	ldr	r3, [r7, #4]
 8000724:	2b00      	cmp	r3, #0
 8000726:	d106      	bne.n	8000736 <rcc_periph_clock_enable+0x1e>
 8000728:	4b0f      	ldr	r3, [pc, #60]	; (8000768 <rcc_periph_clock_enable+0x50>)
 800072a:	681a      	ldr	r2, [r3, #0]
 800072c:	490e      	ldr	r1, [pc, #56]	; (8000768 <rcc_periph_clock_enable+0x50>)
 800072e:	683b      	ldr	r3, [r7, #0]
 8000730:	4313      	orrs	r3, r2
 8000732:	600b      	str	r3, [r1, #0]
 8000734:	e012      	b.n	800075c <rcc_periph_clock_enable+0x44>
 8000736:	687b      	ldr	r3, [r7, #4]
 8000738:	2b01      	cmp	r3, #1
 800073a:	d106      	bne.n	800074a <rcc_periph_clock_enable+0x32>
 800073c:	4b0b      	ldr	r3, [pc, #44]	; (800076c <rcc_periph_clock_enable+0x54>)
 800073e:	681a      	ldr	r2, [r3, #0]
 8000740:	490a      	ldr	r1, [pc, #40]	; (800076c <rcc_periph_clock_enable+0x54>)
 8000742:	683b      	ldr	r3, [r7, #0]
 8000744:	4313      	orrs	r3, r2
 8000746:	600b      	str	r3, [r1, #0]
 8000748:	e008      	b.n	800075c <rcc_periph_clock_enable+0x44>
 800074a:	687b      	ldr	r3, [r7, #4]
 800074c:	2b02      	cmp	r3, #2
 800074e:	d105      	bne.n	800075c <rcc_periph_clock_enable+0x44>
 8000750:	4b07      	ldr	r3, [pc, #28]	; (8000770 <rcc_periph_clock_enable+0x58>)
 8000752:	681a      	ldr	r2, [r3, #0]
 8000754:	4906      	ldr	r1, [pc, #24]	; (8000770 <rcc_periph_clock_enable+0x58>)
 8000756:	683b      	ldr	r3, [r7, #0]
 8000758:	4313      	orrs	r3, r2
 800075a:	600b      	str	r3, [r1, #0]
 800075c:	bf00      	nop
 800075e:	370c      	adds	r7, #12
 8000760:	46bd      	mov	sp, r7
 8000762:	bc80      	pop	{r7}
 8000764:	4770      	bx	lr
 8000766:	bf00      	nop
 8000768:	40023830 	.word	0x40023830
 800076c:	40023840 	.word	0x40023840
 8000770:	40023844 	.word	0x40023844

08000774 <systick_handler>:
 8000774:	b480      	push	{r7}
 8000776:	af00      	add	r7, sp, #0
 8000778:	4b04      	ldr	r3, [pc, #16]	; (800078c <systick_handler+0x18>)
 800077a:	681b      	ldr	r3, [r3, #0]
 800077c:	3301      	adds	r3, #1
 800077e:	4a03      	ldr	r2, [pc, #12]	; (800078c <systick_handler+0x18>)
 8000780:	6013      	str	r3, [r2, #0]
 8000782:	bf00      	nop
 8000784:	46bd      	mov	sp, r7
 8000786:	bc80      	pop	{r7}
 8000788:	4770      	bx	lr
 800078a:	bf00      	nop
 800078c:	20000084 	.word	0x20000084

08000790 <reset_handler>:
 8000790:	b580      	push	{r7, lr}
 8000792:	b088      	sub	sp, #32
 8000794:	af00      	add	r7, sp, #0
 8000796:	4a1a      	ldr	r2, [pc, #104]	; (8000800 <reset_handler+0x70>)
 8000798:	4b1a      	ldr	r3, [pc, #104]	; (8000804 <reset_handler+0x74>)
 800079a:	1ad3      	subs	r3, r2, r3
 800079c:	617b      	str	r3, [r7, #20]
 800079e:	4b1a      	ldr	r3, [pc, #104]	; (8000808 <reset_handler+0x78>)
 80007a0:	613b      	str	r3, [r7, #16]
 80007a2:	4b18      	ldr	r3, [pc, #96]	; (8000804 <reset_handler+0x74>)
 80007a4:	60fb      	str	r3, [r7, #12]
 80007a6:	2300      	movs	r3, #0
 80007a8:	61fb      	str	r3, [r7, #28]
 80007aa:	e00a      	b.n	80007c2 <reset_handler+0x32>
 80007ac:	693a      	ldr	r2, [r7, #16]
 80007ae:	69fb      	ldr	r3, [r7, #28]
 80007b0:	441a      	add	r2, r3
 80007b2:	68f9      	ldr	r1, [r7, #12]
 80007b4:	69fb      	ldr	r3, [r7, #28]
 80007b6:	440b      	add	r3, r1
 80007b8:	7812      	ldrb	r2, [r2, #0]
 80007ba:	701a      	strb	r2, [r3, #0]
 80007bc:	69fb      	ldr	r3, [r7, #28]
 80007be:	3301      	adds	r3, #1
 80007c0:	61fb      	str	r3, [r7, #28]
 80007c2:	69fa      	ldr	r2, [r7, #28]
 80007c4:	697b      	ldr	r3, [r7, #20]
 80007c6:	429a      	cmp	r2, r3
 80007c8:	d3f0      	bcc.n	80007ac <reset_handler+0x1c>
 80007ca:	4a10      	ldr	r2, [pc, #64]	; (800080c <reset_handler+0x7c>)
 80007cc:	4b10      	ldr	r3, [pc, #64]	; (8000810 <reset_handler+0x80>)
 80007ce:	1ad3      	subs	r3, r2, r3
 80007d0:	60bb      	str	r3, [r7, #8]
 80007d2:	4b0f      	ldr	r3, [pc, #60]	; (8000810 <reset_handler+0x80>)
 80007d4:	607b      	str	r3, [r7, #4]
 80007d6:	2300      	movs	r3, #0
 80007d8:	61bb      	str	r3, [r7, #24]
 80007da:	e007      	b.n	80007ec <reset_handler+0x5c>
 80007dc:	687a      	ldr	r2, [r7, #4]
 80007de:	69bb      	ldr	r3, [r7, #24]
 80007e0:	4413      	add	r3, r2
 80007e2:	2200      	movs	r2, #0
 80007e4:	701a      	strb	r2, [r3, #0]
 80007e6:	69bb      	ldr	r3, [r7, #24]
 80007e8:	3301      	adds	r3, #1
 80007ea:	61bb      	str	r3, [r7, #24]
 80007ec:	69ba      	ldr	r2, [r7, #24]
 80007ee:	68bb      	ldr	r3, [r7, #8]
 80007f0:	429a      	cmp	r2, r3
 80007f2:	d3f3      	bcc.n	80007dc <reset_handler+0x4c>
 80007f4:	f7ff fcea 	bl	80001cc <main>
 80007f8:	bf00      	nop
 80007fa:	3720      	adds	r7, #32
 80007fc:	46bd      	mov	sp, r7
 80007fe:	bd80      	pop	{r7, pc}
 8000800:	20000084 	.word	0x20000084
 8000804:	20000000 	.word	0x20000000
 8000808:	080022e8 	.word	0x080022e8
 800080c:	200001f8 	.word	0x200001f8
 8000810:	20000084 	.word	0x20000084

08000814 <_enable_irq>:
 8000814:	b580      	push	{r7, lr}
 8000816:	af00      	add	r7, sp, #0
 8000818:	f000 f802 	bl	8000820 <__enable_irq>
 800081c:	bf00      	nop
 800081e:	bd80      	pop	{r7, pc}

08000820 <__enable_irq>:
 8000820:	b480      	push	{r7}
 8000822:	af00      	add	r7, sp, #0
 8000824:	b662      	cpsie	i
 8000826:	bf00      	nop
 8000828:	46bd      	mov	sp, r7
 800082a:	bc80      	pop	{r7}
 800082c:	4770      	bx	lr
	...

08000830 <_fstat>:
 8000830:	b480      	push	{r7}
 8000832:	b083      	sub	sp, #12
 8000834:	af00      	add	r7, sp, #0
 8000836:	6078      	str	r0, [r7, #4]
 8000838:	6039      	str	r1, [r7, #0]
 800083a:	f04f 33ff 	mov.w	r3, #4294967295
 800083e:	4618      	mov	r0, r3
 8000840:	370c      	adds	r7, #12
 8000842:	46bd      	mov	sp, r7
 8000844:	bc80      	pop	{r7}
 8000846:	4770      	bx	lr

08000848 <_isatty>:
 8000848:	b480      	push	{r7}
 800084a:	b083      	sub	sp, #12
 800084c:	af00      	add	r7, sp, #0
 800084e:	6078      	str	r0, [r7, #4]
 8000850:	2301      	movs	r3, #1
 8000852:	4618      	mov	r0, r3
 8000854:	370c      	adds	r7, #12
 8000856:	46bd      	mov	sp, r7
 8000858:	bc80      	pop	{r7}
 800085a:	4770      	bx	lr

0800085c <_close>:
 800085c:	b480      	push	{r7}
 800085e:	b083      	sub	sp, #12
 8000860:	af00      	add	r7, sp, #0
 8000862:	6078      	str	r0, [r7, #4]
 8000864:	f04f 33ff 	mov.w	r3, #4294967295
 8000868:	4618      	mov	r0, r3
 800086a:	370c      	adds	r7, #12
 800086c:	46bd      	mov	sp, r7
 800086e:	bc80      	pop	{r7}
 8000870:	4770      	bx	lr

08000872 <_lseek>:
 8000872:	b480      	push	{r7}
 8000874:	b085      	sub	sp, #20
 8000876:	af00      	add	r7, sp, #0
 8000878:	60f8      	str	r0, [r7, #12]
 800087a:	60b9      	str	r1, [r7, #8]
 800087c:	607a      	str	r2, [r7, #4]
 800087e:	2300      	movs	r3, #0
 8000880:	4618      	mov	r0, r3
 8000882:	3714      	adds	r7, #20
 8000884:	46bd      	mov	sp, r7
 8000886:	bc80      	pop	{r7}
 8000888:	4770      	bx	lr

0800088a <_exit>:
 800088a:	b480      	push	{r7}
 800088c:	b083      	sub	sp, #12
 800088e:	af00      	add	r7, sp, #0
 8000890:	6078      	str	r0, [r7, #4]
 8000892:	bf00      	nop
 8000894:	e7fd      	b.n	8000892 <_exit+0x8>

08000896 <_read>:
 8000896:	b480      	push	{r7}
 8000898:	b085      	sub	sp, #20
 800089a:	af00      	add	r7, sp, #0
 800089c:	60f8      	str	r0, [r7, #12]
 800089e:	60b9      	str	r1, [r7, #8]
 80008a0:	607a      	str	r2, [r7, #4]
 80008a2:	687b      	ldr	r3, [r7, #4]
 80008a4:	4618      	mov	r0, r3
 80008a6:	3714      	adds	r7, #20
 80008a8:	46bd      	mov	sp, r7
 80008aa:	bc80      	pop	{r7}
 80008ac:	4770      	bx	lr

080008ae <_write>:
 80008ae:	b580      	push	{r7, lr}
 80008b0:	b084      	sub	sp, #16
 80008b2:	af00      	add	r7, sp, #0
 80008b4:	60f8      	str	r0, [r7, #12]
 80008b6:	60b9      	str	r1, [r7, #8]
 80008b8:	607a      	str	r2, [r7, #4]
 80008ba:	68fb      	ldr	r3, [r7, #12]
 80008bc:	2b01      	cmp	r3, #1
 80008be:	d105      	bne.n	80008cc <_write+0x1e>
 80008c0:	687b      	ldr	r3, [r7, #4]
 80008c2:	68ba      	ldr	r2, [r7, #8]
 80008c4:	4619      	mov	r1, r3
 80008c6:	4804      	ldr	r0, [pc, #16]	; (80008d8 <_write+0x2a>)
 80008c8:	f000 f8c8 	bl	8000a5c <usart_transmit>
 80008cc:	f04f 33ff 	mov.w	r3, #4294967295
 80008d0:	4618      	mov	r0, r3
 80008d2:	3710      	adds	r7, #16
 80008d4:	46bd      	mov	sp, r7
 80008d6:	bd80      	pop	{r7, pc}
 80008d8:	40011000 	.word	0x40011000

080008dc <_sbrk>:
 80008dc:	b480      	push	{r7}
 80008de:	b085      	sub	sp, #20
 80008e0:	af00      	add	r7, sp, #0
 80008e2:	6078      	str	r0, [r7, #4]
 80008e4:	4b0f      	ldr	r3, [pc, #60]	; (8000924 <_sbrk+0x48>)
 80008e6:	681b      	ldr	r3, [r3, #0]
 80008e8:	2b00      	cmp	r3, #0
 80008ea:	d102      	bne.n	80008f2 <_sbrk+0x16>
 80008ec:	4b0d      	ldr	r3, [pc, #52]	; (8000924 <_sbrk+0x48>)
 80008ee:	4a0e      	ldr	r2, [pc, #56]	; (8000928 <_sbrk+0x4c>)
 80008f0:	601a      	str	r2, [r3, #0]
 80008f2:	4b0c      	ldr	r3, [pc, #48]	; (8000924 <_sbrk+0x48>)
 80008f4:	681b      	ldr	r3, [r3, #0]
 80008f6:	60fb      	str	r3, [r7, #12]
 80008f8:	4b0a      	ldr	r3, [pc, #40]	; (8000924 <_sbrk+0x48>)
 80008fa:	681a      	ldr	r2, [r3, #0]
 80008fc:	687b      	ldr	r3, [r7, #4]
 80008fe:	4413      	add	r3, r2
 8000900:	466a      	mov	r2, sp
 8000902:	4293      	cmp	r3, r2
 8000904:	d901      	bls.n	800090a <_sbrk+0x2e>
 8000906:	bf00      	nop
 8000908:	e7fd      	b.n	8000906 <_sbrk+0x2a>
 800090a:	4b06      	ldr	r3, [pc, #24]	; (8000924 <_sbrk+0x48>)
 800090c:	681a      	ldr	r2, [r3, #0]
 800090e:	687b      	ldr	r3, [r7, #4]
 8000910:	4413      	add	r3, r2
 8000912:	4a04      	ldr	r2, [pc, #16]	; (8000924 <_sbrk+0x48>)
 8000914:	6013      	str	r3, [r2, #0]
 8000916:	68fb      	ldr	r3, [r7, #12]
 8000918:	4618      	mov	r0, r3
 800091a:	3714      	adds	r7, #20
 800091c:	46bd      	mov	sp, r7
 800091e:	bc80      	pop	{r7}
 8000920:	4770      	bx	lr
 8000922:	bf00      	nop
 8000924:	20000088 	.word	0x20000088
 8000928:	200001f8 	.word	0x200001f8

0800092c <systick_init>:
 800092c:	b580      	push	{r7, lr}
 800092e:	b082      	sub	sp, #8
 8000930:	af00      	add	r7, sp, #0
 8000932:	6078      	str	r0, [r7, #4]
 8000934:	6878      	ldr	r0, [r7, #4]
 8000936:	f000 f804 	bl	8000942 <SysTick_Config>
 800093a:	bf00      	nop
 800093c:	3708      	adds	r7, #8
 800093e:	46bd      	mov	sp, r7
 8000940:	bd80      	pop	{r7, pc}

08000942 <SysTick_Config>:
 8000942:	b480      	push	{r7}
 8000944:	b083      	sub	sp, #12
 8000946:	af00      	add	r7, sp, #0
 8000948:	6078      	str	r0, [r7, #4]
 800094a:	687b      	ldr	r3, [r7, #4]
 800094c:	3b01      	subs	r3, #1
 800094e:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
 8000952:	d210      	bcs.n	8000976 <SysTick_Config+0x34>
 8000954:	4a0a      	ldr	r2, [pc, #40]	; (8000980 <SysTick_Config+0x3e>)
 8000956:	687b      	ldr	r3, [r7, #4]
 8000958:	3b01      	subs	r3, #1
 800095a:	6013      	str	r3, [r2, #0]
 800095c:	4b09      	ldr	r3, [pc, #36]	; (8000984 <SysTick_Config+0x42>)
 800095e:	2200      	movs	r2, #0
 8000960:	601a      	str	r2, [r3, #0]
 8000962:	4b09      	ldr	r3, [pc, #36]	; (8000988 <SysTick_Config+0x46>)
 8000964:	2207      	movs	r2, #7
 8000966:	601a      	str	r2, [r3, #0]
 8000968:	4b08      	ldr	r3, [pc, #32]	; (800098c <SysTick_Config+0x4a>)
 800096a:	681b      	ldr	r3, [r3, #0]
 800096c:	4a07      	ldr	r2, [pc, #28]	; (800098c <SysTick_Config+0x4a>)
 800096e:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
 8000972:	6013      	str	r3, [r2, #0]
 8000974:	e000      	b.n	8000978 <SysTick_Config+0x36>
 8000976:	bf00      	nop
 8000978:	370c      	adds	r7, #12
 800097a:	46bd      	mov	sp, r7
 800097c:	bc80      	pop	{r7}
 800097e:	4770      	bx	lr
 8000980:	e000e014 	.word	0xe000e014
 8000984:	e000e018 	.word	0xe000e018
 8000988:	e000e010 	.word	0xe000e010
 800098c:	40023844 	.word	0x40023844

08000990 <delay_ms>:
 8000990:	b480      	push	{r7}
 8000992:	b085      	sub	sp, #20
 8000994:	af00      	add	r7, sp, #0
 8000996:	6078      	str	r0, [r7, #4]
 8000998:	4b0e      	ldr	r3, [pc, #56]	; (80009d4 <delay_ms+0x44>)
 800099a:	681b      	ldr	r3, [r3, #0]
 800099c:	60fb      	str	r3, [r7, #12]
 800099e:	68fa      	ldr	r2, [r7, #12]
 80009a0:	687b      	ldr	r3, [r7, #4]
 80009a2:	4413      	add	r3, r2
 80009a4:	60bb      	str	r3, [r7, #8]
 80009a6:	68ba      	ldr	r2, [r7, #8]
 80009a8:	68fb      	ldr	r3, [r7, #12]
 80009aa:	429a      	cmp	r2, r3
 80009ac:	d205      	bcs.n	80009ba <delay_ms+0x2a>
 80009ae:	bf00      	nop
 80009b0:	4b08      	ldr	r3, [pc, #32]	; (80009d4 <delay_ms+0x44>)
 80009b2:	681b      	ldr	r3, [r3, #0]
 80009b4:	68fa      	ldr	r2, [r7, #12]
 80009b6:	429a      	cmp	r2, r3
 80009b8:	d3fa      	bcc.n	80009b0 <delay_ms+0x20>
 80009ba:	bf00      	nop
 80009bc:	4b05      	ldr	r3, [pc, #20]	; (80009d4 <delay_ms+0x44>)
 80009be:	681b      	ldr	r3, [r3, #0]
 80009c0:	68ba      	ldr	r2, [r7, #8]
 80009c2:	429a      	cmp	r2, r3
 80009c4:	d8fa      	bhi.n	80009bc <delay_ms+0x2c>
 80009c6:	bf00      	nop
 80009c8:	bf00      	nop
 80009ca:	3714      	adds	r7, #20
 80009cc:	46bd      	mov	sp, r7
 80009ce:	bc80      	pop	{r7}
 80009d0:	4770      	bx	lr
 80009d2:	bf00      	nop
 80009d4:	20000084 	.word	0x20000084

080009d8 <usart_enable>:
 80009d8:	b480      	push	{r7}
 80009da:	b083      	sub	sp, #12
 80009dc:	af00      	add	r7, sp, #0
 80009de:	6078      	str	r0, [r7, #4]
 80009e0:	687b      	ldr	r3, [r7, #4]
 80009e2:	330c      	adds	r3, #12
 80009e4:	681b      	ldr	r3, [r3, #0]
 80009e6:	687a      	ldr	r2, [r7, #4]
 80009e8:	320c      	adds	r2, #12
 80009ea:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 80009ee:	6013      	str	r3, [r2, #0]
 80009f0:	bf00      	nop
 80009f2:	370c      	adds	r7, #12
 80009f4:	46bd      	mov	sp, r7
 80009f6:	bc80      	pop	{r7}
 80009f8:	4770      	bx	lr

080009fa <usart_set_mode>:
 80009fa:	b480      	push	{r7}
 80009fc:	b083      	sub	sp, #12
 80009fe:	af00      	add	r7, sp, #0
 8000a00:	6078      	str	r0, [r7, #4]
 8000a02:	6039      	str	r1, [r7, #0]
 8000a04:	687b      	ldr	r3, [r7, #4]
 8000a06:	330c      	adds	r3, #12
 8000a08:	681a      	ldr	r2, [r3, #0]
 8000a0a:	687b      	ldr	r3, [r7, #4]
 8000a0c:	330c      	adds	r3, #12
 8000a0e:	4619      	mov	r1, r3
 8000a10:	683b      	ldr	r3, [r7, #0]
 8000a12:	4313      	orrs	r3, r2
 8000a14:	600b      	str	r3, [r1, #0]
 8000a16:	bf00      	nop
 8000a18:	370c      	adds	r7, #12
 8000a1a:	46bd      	mov	sp, r7
 8000a1c:	bc80      	pop	{r7}
 8000a1e:	4770      	bx	lr

08000a20 <usart_set_baudrate>:
 8000a20:	b480      	push	{r7}
 8000a22:	b085      	sub	sp, #20
 8000a24:	af00      	add	r7, sp, #0
 8000a26:	6078      	str	r0, [r7, #4]
 8000a28:	6039      	str	r1, [r7, #0]
 8000a2a:	687b      	ldr	r3, [r7, #4]
 8000a2c:	3308      	adds	r3, #8
 8000a2e:	681b      	ldr	r3, [r3, #0]
 8000a30:	60fb      	str	r3, [r7, #12]
 8000a32:	4b09      	ldr	r3, [pc, #36]	; (8000a58 <usart_set_baudrate+0x38>)
 8000a34:	681a      	ldr	r2, [r3, #0]
 8000a36:	683b      	ldr	r3, [r7, #0]
 8000a38:	011b      	lsls	r3, r3, #4
 8000a3a:	fbb2 f3f3 	udiv	r3, r2, r3
 8000a3e:	011b      	lsls	r3, r3, #4
 8000a40:	60fb      	str	r3, [r7, #12]
 8000a42:	687b      	ldr	r3, [r7, #4]
 8000a44:	3308      	adds	r3, #8
 8000a46:	461a      	mov	r2, r3
 8000a48:	68fb      	ldr	r3, [r7, #12]
 8000a4a:	6013      	str	r3, [r2, #0]
 8000a4c:	bf00      	nop
 8000a4e:	3714      	adds	r7, #20
 8000a50:	46bd      	mov	sp, r7
 8000a52:	bc80      	pop	{r7}
 8000a54:	4770      	bx	lr
 8000a56:	bf00      	nop
 8000a58:	20000014 	.word	0x20000014

08000a5c <usart_transmit>:
 8000a5c:	b580      	push	{r7, lr}
 8000a5e:	b086      	sub	sp, #24
 8000a60:	af00      	add	r7, sp, #0
 8000a62:	60f8      	str	r0, [r7, #12]
 8000a64:	60b9      	str	r1, [r7, #8]
 8000a66:	607a      	str	r2, [r7, #4]
 8000a68:	687b      	ldr	r3, [r7, #4]
 8000a6a:	613b      	str	r3, [r7, #16]
 8000a6c:	2300      	movs	r3, #0
 8000a6e:	617b      	str	r3, [r7, #20]
 8000a70:	e00a      	b.n	8000a88 <usart_transmit+0x2c>
 8000a72:	693b      	ldr	r3, [r7, #16]
 8000a74:	1c5a      	adds	r2, r3, #1
 8000a76:	613a      	str	r2, [r7, #16]
 8000a78:	781b      	ldrb	r3, [r3, #0]
 8000a7a:	4619      	mov	r1, r3
 8000a7c:	68f8      	ldr	r0, [r7, #12]
 8000a7e:	f000 f80c 	bl	8000a9a <usart_send_byte>
 8000a82:	697b      	ldr	r3, [r7, #20]
 8000a84:	3301      	adds	r3, #1
 8000a86:	617b      	str	r3, [r7, #20]
 8000a88:	697a      	ldr	r2, [r7, #20]
 8000a8a:	68bb      	ldr	r3, [r7, #8]
 8000a8c:	429a      	cmp	r2, r3
 8000a8e:	d3f0      	bcc.n	8000a72 <usart_transmit+0x16>
 8000a90:	bf00      	nop
 8000a92:	bf00      	nop
 8000a94:	3718      	adds	r7, #24
 8000a96:	46bd      	mov	sp, r7
 8000a98:	bd80      	pop	{r7, pc}

08000a9a <usart_send_byte>:
 8000a9a:	b480      	push	{r7}
 8000a9c:	b083      	sub	sp, #12
 8000a9e:	af00      	add	r7, sp, #0
 8000aa0:	6078      	str	r0, [r7, #4]
 8000aa2:	460b      	mov	r3, r1
 8000aa4:	70fb      	strb	r3, [r7, #3]
 8000aa6:	687b      	ldr	r3, [r7, #4]
 8000aa8:	3304      	adds	r3, #4
 8000aaa:	461a      	mov	r2, r3
 8000aac:	78fb      	ldrb	r3, [r7, #3]
 8000aae:	6013      	str	r3, [r2, #0]
 8000ab0:	bf00      	nop
 8000ab2:	687b      	ldr	r3, [r7, #4]
 8000ab4:	681b      	ldr	r3, [r3, #0]
 8000ab6:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8000aba:	2b00      	cmp	r3, #0
 8000abc:	d0f9      	beq.n	8000ab2 <usart_send_byte+0x18>
 8000abe:	bf00      	nop
 8000ac0:	bf00      	nop
 8000ac2:	370c      	adds	r7, #12
 8000ac4:	46bd      	mov	sp, r7
 8000ac6:	bc80      	pop	{r7}
 8000ac8:	4770      	bx	lr

08000aca <usart_receive>:
 8000aca:	b590      	push	{r4, r7, lr}
 8000acc:	b087      	sub	sp, #28
 8000ace:	af00      	add	r7, sp, #0
 8000ad0:	60f8      	str	r0, [r7, #12]
 8000ad2:	60b9      	str	r1, [r7, #8]
 8000ad4:	607a      	str	r2, [r7, #4]
 8000ad6:	687b      	ldr	r3, [r7, #4]
 8000ad8:	613b      	str	r3, [r7, #16]
 8000ada:	2300      	movs	r3, #0
 8000adc:	617b      	str	r3, [r7, #20]
 8000ade:	e00a      	b.n	8000af6 <usart_receive+0x2c>
 8000ae0:	693c      	ldr	r4, [r7, #16]
 8000ae2:	1c63      	adds	r3, r4, #1
 8000ae4:	613b      	str	r3, [r7, #16]
 8000ae6:	68f8      	ldr	r0, [r7, #12]
 8000ae8:	f000 f80e 	bl	8000b08 <usart_get_byte>
 8000aec:	4603      	mov	r3, r0
 8000aee:	7023      	strb	r3, [r4, #0]
 8000af0:	697b      	ldr	r3, [r7, #20]
 8000af2:	3301      	adds	r3, #1
 8000af4:	617b      	str	r3, [r7, #20]
 8000af6:	697a      	ldr	r2, [r7, #20]
 8000af8:	68bb      	ldr	r3, [r7, #8]
 8000afa:	429a      	cmp	r2, r3
 8000afc:	d3f0      	bcc.n	8000ae0 <usart_receive+0x16>
 8000afe:	bf00      	nop
 8000b00:	bf00      	nop
 8000b02:	371c      	adds	r7, #28
 8000b04:	46bd      	mov	sp, r7
 8000b06:	bd90      	pop	{r4, r7, pc}

08000b08 <usart_get_byte>:
 8000b08:	b480      	push	{r7}
 8000b0a:	b083      	sub	sp, #12
 8000b0c:	af00      	add	r7, sp, #0
 8000b0e:	6078      	str	r0, [r7, #4]
 8000b10:	bf00      	nop
 8000b12:	687b      	ldr	r3, [r7, #4]
 8000b14:	681b      	ldr	r3, [r3, #0]
 8000b16:	f003 0320 	and.w	r3, r3, #32
 8000b1a:	2b00      	cmp	r3, #0
 8000b1c:	d0f9      	beq.n	8000b12 <usart_get_byte+0xa>
 8000b1e:	687b      	ldr	r3, [r7, #4]
 8000b20:	3304      	adds	r3, #4
 8000b22:	681b      	ldr	r3, [r3, #0]
 8000b24:	b2db      	uxtb	r3, r3
 8000b26:	4618      	mov	r0, r3
 8000b28:	370c      	adds	r7, #12
 8000b2a:	46bd      	mov	sp, r7
 8000b2c:	bc80      	pop	{r7}
 8000b2e:	4770      	bx	lr

08000b30 <usart_irq_enable>:
 8000b30:	b480      	push	{r7}
 8000b32:	b083      	sub	sp, #12
 8000b34:	af00      	add	r7, sp, #0
 8000b36:	6078      	str	r0, [r7, #4]
 8000b38:	687b      	ldr	r3, [r7, #4]
 8000b3a:	330c      	adds	r3, #12
 8000b3c:	681b      	ldr	r3, [r3, #0]
 8000b3e:	687a      	ldr	r2, [r7, #4]
 8000b40:	320c      	adds	r2, #12
 8000b42:	f043 0320 	orr.w	r3, r3, #32
 8000b46:	6013      	str	r3, [r2, #0]
 8000b48:	bf00      	nop
 8000b4a:	370c      	adds	r7, #12
 8000b4c:	46bd      	mov	sp, r7
 8000b4e:	bc80      	pop	{r7}
 8000b50:	4770      	bx	lr

08000b52 <usart_init_send>:
 8000b52:	b580      	push	{r7, lr}
 8000b54:	b082      	sub	sp, #8
 8000b56:	af00      	add	r7, sp, #0
 8000b58:	6078      	str	r0, [r7, #4]
 8000b5a:	2100      	movs	r1, #0
 8000b5c:	6878      	ldr	r0, [r7, #4]
 8000b5e:	f7ff ff9c 	bl	8000a9a <usart_send_byte>
 8000b62:	bf00      	nop
 8000b64:	3708      	adds	r7, #8
 8000b66:	46bd      	mov	sp, r7
 8000b68:	bd80      	pop	{r7, pc}
 8000b6a:	bf00      	nop

08000b6c <strlen>:
 8000b6c:	4603      	mov	r3, r0
 8000b6e:	f813 2b01 	ldrb.w	r2, [r3], #1
 8000b72:	2a00      	cmp	r2, #0
 8000b74:	d1fb      	bne.n	8000b6e <strlen+0x2>
 8000b76:	1a18      	subs	r0, r3, r0
 8000b78:	3801      	subs	r0, #1
 8000b7a:	4770      	bx	lr
 8000b7c:	0000      	movs	r0, r0
	...

08000b80 <memchr>:
 8000b80:	f001 01ff 	and.w	r1, r1, #255	; 0xff
 8000b84:	2a10      	cmp	r2, #16
 8000b86:	db2b      	blt.n	8000be0 <memchr+0x60>
 8000b88:	f010 0f07 	tst.w	r0, #7
 8000b8c:	d008      	beq.n	8000ba0 <memchr+0x20>
 8000b8e:	f810 3b01 	ldrb.w	r3, [r0], #1
 8000b92:	3a01      	subs	r2, #1
 8000b94:	428b      	cmp	r3, r1
 8000b96:	d02d      	beq.n	8000bf4 <memchr+0x74>
 8000b98:	f010 0f07 	tst.w	r0, #7
 8000b9c:	b342      	cbz	r2, 8000bf0 <memchr+0x70>
 8000b9e:	d1f6      	bne.n	8000b8e <memchr+0xe>
 8000ba0:	b4f0      	push	{r4, r5, r6, r7}
 8000ba2:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
 8000ba6:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
 8000baa:	f022 0407 	bic.w	r4, r2, #7
 8000bae:	f07f 0700 	mvns.w	r7, #0
 8000bb2:	2300      	movs	r3, #0
 8000bb4:	e8f0 5602 	ldrd	r5, r6, [r0], #8
 8000bb8:	3c08      	subs	r4, #8
 8000bba:	ea85 0501 	eor.w	r5, r5, r1
 8000bbe:	ea86 0601 	eor.w	r6, r6, r1
 8000bc2:	fa85 f547 	uadd8	r5, r5, r7
 8000bc6:	faa3 f587 	sel	r5, r3, r7
 8000bca:	fa86 f647 	uadd8	r6, r6, r7
 8000bce:	faa5 f687 	sel	r6, r5, r7
 8000bd2:	b98e      	cbnz	r6, 8000bf8 <memchr+0x78>
 8000bd4:	d1ee      	bne.n	8000bb4 <memchr+0x34>
 8000bd6:	bcf0      	pop	{r4, r5, r6, r7}
 8000bd8:	f001 01ff 	and.w	r1, r1, #255	; 0xff
 8000bdc:	f002 0207 	and.w	r2, r2, #7
 8000be0:	b132      	cbz	r2, 8000bf0 <memchr+0x70>
 8000be2:	f810 3b01 	ldrb.w	r3, [r0], #1
 8000be6:	3a01      	subs	r2, #1
 8000be8:	ea83 0301 	eor.w	r3, r3, r1
 8000bec:	b113      	cbz	r3, 8000bf4 <memchr+0x74>
 8000bee:	d1f8      	bne.n	8000be2 <memchr+0x62>
 8000bf0:	2000      	movs	r0, #0
 8000bf2:	4770      	bx	lr
 8000bf4:	3801      	subs	r0, #1
 8000bf6:	4770      	bx	lr
 8000bf8:	2d00      	cmp	r5, #0
 8000bfa:	bf06      	itte	eq
 8000bfc:	4635      	moveq	r5, r6
 8000bfe:	3803      	subeq	r0, #3
 8000c00:	3807      	subne	r0, #7
 8000c02:	f015 0f01 	tst.w	r5, #1
 8000c06:	d107      	bne.n	8000c18 <memchr+0x98>
 8000c08:	3001      	adds	r0, #1
 8000c0a:	f415 7f80 	tst.w	r5, #256	; 0x100
 8000c0e:	bf02      	ittt	eq
 8000c10:	3001      	addeq	r0, #1
 8000c12:	f415 3fc0 	tsteq.w	r5, #98304	; 0x18000
 8000c16:	3001      	addeq	r0, #1
 8000c18:	3801      	subs	r0, #1
 8000c1a:	bcf0      	pop	{r4, r5, r6, r7}
 8000c1c:	4770      	bx	lr
 8000c1e:	bf00      	nop

08000c20 <deregister_tm_clones>:
 8000c20:	4803      	ldr	r0, [pc, #12]	; (8000c30 <deregister_tm_clones+0x10>)
 8000c22:	4b04      	ldr	r3, [pc, #16]	; (8000c34 <deregister_tm_clones+0x14>)
 8000c24:	4283      	cmp	r3, r0
 8000c26:	d002      	beq.n	8000c2e <deregister_tm_clones+0xe>
 8000c28:	4b03      	ldr	r3, [pc, #12]	; (8000c38 <deregister_tm_clones+0x18>)
 8000c2a:	b103      	cbz	r3, 8000c2e <deregister_tm_clones+0xe>
 8000c2c:	4718      	bx	r3
 8000c2e:	4770      	bx	lr
 8000c30:	20000084 	.word	0x20000084
 8000c34:	20000084 	.word	0x20000084
 8000c38:	00000000 	.word	0x00000000

08000c3c <register_tm_clones>:
 8000c3c:	4805      	ldr	r0, [pc, #20]	; (8000c54 <register_tm_clones+0x18>)
 8000c3e:	4b06      	ldr	r3, [pc, #24]	; (8000c58 <register_tm_clones+0x1c>)
 8000c40:	1a1b      	subs	r3, r3, r0
 8000c42:	0fd9      	lsrs	r1, r3, #31
 8000c44:	eb01 01a3 	add.w	r1, r1, r3, asr #2
 8000c48:	1049      	asrs	r1, r1, #1
 8000c4a:	d002      	beq.n	8000c52 <register_tm_clones+0x16>
 8000c4c:	4b03      	ldr	r3, [pc, #12]	; (8000c5c <register_tm_clones+0x20>)
 8000c4e:	b103      	cbz	r3, 8000c52 <register_tm_clones+0x16>
 8000c50:	4718      	bx	r3
 8000c52:	4770      	bx	lr
 8000c54:	20000084 	.word	0x20000084
 8000c58:	20000084 	.word	0x20000084
 8000c5c:	00000000 	.word	0x00000000

08000c60 <__do_global_dtors_aux>:
 8000c60:	b510      	push	{r4, lr}
 8000c62:	4c06      	ldr	r4, [pc, #24]	; (8000c7c <__do_global_dtors_aux+0x1c>)
 8000c64:	7823      	ldrb	r3, [r4, #0]
 8000c66:	b943      	cbnz	r3, 8000c7a <__do_global_dtors_aux+0x1a>
 8000c68:	f7ff ffda 	bl	8000c20 <deregister_tm_clones>
 8000c6c:	4b04      	ldr	r3, [pc, #16]	; (8000c80 <__do_global_dtors_aux+0x20>)
 8000c6e:	b113      	cbz	r3, 8000c76 <__do_global_dtors_aux+0x16>
 8000c70:	4804      	ldr	r0, [pc, #16]	; (8000c84 <__do_global_dtors_aux+0x24>)
 8000c72:	f3af 8000 	nop.w
 8000c76:	2301      	movs	r3, #1
 8000c78:	7023      	strb	r3, [r4, #0]
 8000c7a:	bd10      	pop	{r4, pc}
 8000c7c:	2000008c 	.word	0x2000008c
 8000c80:	00000000 	.word	0x00000000
 8000c84:	08002270 	.word	0x08002270

08000c88 <frame_dummy>:
 8000c88:	b508      	push	{r3, lr}
 8000c8a:	4b05      	ldr	r3, [pc, #20]	; (8000ca0 <frame_dummy+0x18>)
 8000c8c:	b11b      	cbz	r3, 8000c96 <frame_dummy+0xe>
 8000c8e:	4905      	ldr	r1, [pc, #20]	; (8000ca4 <frame_dummy+0x1c>)
 8000c90:	4805      	ldr	r0, [pc, #20]	; (8000ca8 <frame_dummy+0x20>)
 8000c92:	f3af 8000 	nop.w
 8000c96:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c9a:	f7ff bfcf 	b.w	8000c3c <register_tm_clones>
 8000c9e:	bf00      	nop
 8000ca0:	00000000 	.word	0x00000000
 8000ca4:	20000090 	.word	0x20000090
 8000ca8:	08002270 	.word	0x08002270

08000cac <exit>:
 8000cac:	b508      	push	{r3, lr}
 8000cae:	4b06      	ldr	r3, [pc, #24]	; (8000cc8 <exit+0x1c>)
 8000cb0:	4604      	mov	r4, r0
 8000cb2:	b113      	cbz	r3, 8000cba <exit+0xe>
 8000cb4:	2100      	movs	r1, #0
 8000cb6:	f3af 8000 	nop.w
 8000cba:	4b04      	ldr	r3, [pc, #16]	; (8000ccc <exit+0x20>)
 8000cbc:	681b      	ldr	r3, [r3, #0]
 8000cbe:	b103      	cbz	r3, 8000cc2 <exit+0x16>
 8000cc0:	4798      	blx	r3
 8000cc2:	4620      	mov	r0, r4
 8000cc4:	f7ff fde1 	bl	800088a <_exit>
 8000cc8:	00000000 	.word	0x00000000
 8000ccc:	200001e0 	.word	0x200001e0

08000cd0 <std>:
 8000cd0:	2300      	movs	r3, #0
 8000cd2:	b510      	push	{r4, lr}
 8000cd4:	4604      	mov	r4, r0
 8000cd6:	e9c0 3300 	strd	r3, r3, [r0]
 8000cda:	e9c0 3304 	strd	r3, r3, [r0, #16]
 8000cde:	6083      	str	r3, [r0, #8]
 8000ce0:	8181      	strh	r1, [r0, #12]
 8000ce2:	6643      	str	r3, [r0, #100]	; 0x64
 8000ce4:	81c2      	strh	r2, [r0, #14]
 8000ce6:	6183      	str	r3, [r0, #24]
 8000ce8:	4619      	mov	r1, r3
 8000cea:	2208      	movs	r2, #8
 8000cec:	305c      	adds	r0, #92	; 0x5c
 8000cee:	f000 fac9 	bl	8001284 <memset>
 8000cf2:	4b05      	ldr	r3, [pc, #20]	; (8000d08 <std+0x38>)
 8000cf4:	6263      	str	r3, [r4, #36]	; 0x24
 8000cf6:	4b05      	ldr	r3, [pc, #20]	; (8000d0c <std+0x3c>)
 8000cf8:	62a3      	str	r3, [r4, #40]	; 0x28
 8000cfa:	4b05      	ldr	r3, [pc, #20]	; (8000d10 <std+0x40>)
 8000cfc:	62e3      	str	r3, [r4, #44]	; 0x2c
 8000cfe:	4b05      	ldr	r3, [pc, #20]	; (8000d14 <std+0x44>)
 8000d00:	6224      	str	r4, [r4, #32]
 8000d02:	6323      	str	r3, [r4, #48]	; 0x30
 8000d04:	bd10      	pop	{r4, pc}
 8000d06:	bf00      	nop
 8000d08:	080010c1 	.word	0x080010c1
 8000d0c:	080010e7 	.word	0x080010e7
 8000d10:	0800111f 	.word	0x0800111f
 8000d14:	08001143 	.word	0x08001143

08000d18 <stdio_exit_handler>:
 8000d18:	4a02      	ldr	r2, [pc, #8]	; (8000d24 <stdio_exit_handler+0xc>)
 8000d1a:	4903      	ldr	r1, [pc, #12]	; (8000d28 <stdio_exit_handler+0x10>)
 8000d1c:	4803      	ldr	r0, [pc, #12]	; (8000d2c <stdio_exit_handler+0x14>)
 8000d1e:	f000 b8ef 	b.w	8000f00 <_fwalk_sglue>
 8000d22:	bf00      	nop
 8000d24:	20000020 	.word	0x20000020
 8000d28:	08001ddd 	.word	0x08001ddd
 8000d2c:	20000030 	.word	0x20000030

08000d30 <cleanup_stdio>:
 8000d30:	6841      	ldr	r1, [r0, #4]
 8000d32:	4b0c      	ldr	r3, [pc, #48]	; (8000d64 <cleanup_stdio+0x34>)
 8000d34:	4299      	cmp	r1, r3
 8000d36:	b510      	push	{r4, lr}
 8000d38:	4604      	mov	r4, r0
 8000d3a:	d001      	beq.n	8000d40 <cleanup_stdio+0x10>
 8000d3c:	f001 f84e 	bl	8001ddc <_fflush_r>
 8000d40:	68a1      	ldr	r1, [r4, #8]
 8000d42:	4b09      	ldr	r3, [pc, #36]	; (8000d68 <cleanup_stdio+0x38>)
 8000d44:	4299      	cmp	r1, r3
 8000d46:	d002      	beq.n	8000d4e <cleanup_stdio+0x1e>
 8000d48:	4620      	mov	r0, r4
 8000d4a:	f001 f847 	bl	8001ddc <_fflush_r>
 8000d4e:	68e1      	ldr	r1, [r4, #12]
 8000d50:	4b06      	ldr	r3, [pc, #24]	; (8000d6c <cleanup_stdio+0x3c>)
 8000d52:	4299      	cmp	r1, r3
 8000d54:	d004      	beq.n	8000d60 <cleanup_stdio+0x30>
 8000d56:	4620      	mov	r0, r4
 8000d58:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000d5c:	f001 b83e 	b.w	8001ddc <_fflush_r>
 8000d60:	bd10      	pop	{r4, pc}
 8000d62:	bf00      	nop
 8000d64:	200000a8 	.word	0x200000a8
 8000d68:	20000110 	.word	0x20000110
 8000d6c:	20000178 	.word	0x20000178

08000d70 <__fp_lock>:
 8000d70:	b508      	push	{r3, lr}
 8000d72:	6e4b      	ldr	r3, [r1, #100]	; 0x64
 8000d74:	07da      	lsls	r2, r3, #31
 8000d76:	d405      	bmi.n	8000d84 <__fp_lock+0x14>
 8000d78:	898b      	ldrh	r3, [r1, #12]
 8000d7a:	059b      	lsls	r3, r3, #22
 8000d7c:	d402      	bmi.n	8000d84 <__fp_lock+0x14>
 8000d7e:	6d88      	ldr	r0, [r1, #88]	; 0x58
 8000d80:	f000 fb4d 	bl	800141e <__retarget_lock_acquire_recursive>
 8000d84:	2000      	movs	r0, #0
 8000d86:	bd08      	pop	{r3, pc}

08000d88 <__fp_unlock>:
 8000d88:	b508      	push	{r3, lr}
 8000d8a:	6e4b      	ldr	r3, [r1, #100]	; 0x64
 8000d8c:	07da      	lsls	r2, r3, #31
 8000d8e:	d405      	bmi.n	8000d9c <__fp_unlock+0x14>
 8000d90:	898b      	ldrh	r3, [r1, #12]
 8000d92:	059b      	lsls	r3, r3, #22
 8000d94:	d402      	bmi.n	8000d9c <__fp_unlock+0x14>
 8000d96:	6d88      	ldr	r0, [r1, #88]	; 0x58
 8000d98:	f000 fb47 	bl	800142a <__retarget_lock_release_recursive>
 8000d9c:	2000      	movs	r0, #0
 8000d9e:	bd08      	pop	{r3, pc}

08000da0 <global_stdio_init.part.0>:
 8000da0:	b510      	push	{r4, lr}
 8000da2:	4b0b      	ldr	r3, [pc, #44]	; (8000dd0 <global_stdio_init.part.0+0x30>)
 8000da4:	4c0b      	ldr	r4, [pc, #44]	; (8000dd4 <global_stdio_init.part.0+0x34>)
 8000da6:	4a0c      	ldr	r2, [pc, #48]	; (8000dd8 <global_stdio_init.part.0+0x38>)
 8000da8:	601a      	str	r2, [r3, #0]
 8000daa:	4620      	mov	r0, r4
 8000dac:	2200      	movs	r2, #0
 8000dae:	2104      	movs	r1, #4
 8000db0:	f7ff ff8e 	bl	8000cd0 <std>
 8000db4:	f104 0068 	add.w	r0, r4, #104	; 0x68
 8000db8:	2201      	movs	r2, #1
 8000dba:	2109      	movs	r1, #9
 8000dbc:	f7ff ff88 	bl	8000cd0 <std>
 8000dc0:	f104 00d0 	add.w	r0, r4, #208	; 0xd0
 8000dc4:	2202      	movs	r2, #2
 8000dc6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000dca:	2112      	movs	r1, #18
 8000dcc:	f7ff bf80 	b.w	8000cd0 <std>
 8000dd0:	200001e0 	.word	0x200001e0
 8000dd4:	200000a8 	.word	0x200000a8
 8000dd8:	08000d19 	.word	0x08000d19

08000ddc <__sfp_lock_acquire>:
 8000ddc:	4801      	ldr	r0, [pc, #4]	; (8000de4 <__sfp_lock_acquire+0x8>)
 8000dde:	f000 bb1e 	b.w	800141e <__retarget_lock_acquire_recursive>
 8000de2:	bf00      	nop
 8000de4:	200001ef 	.word	0x200001ef

08000de8 <__sfp_lock_release>:
 8000de8:	4801      	ldr	r0, [pc, #4]	; (8000df0 <__sfp_lock_release+0x8>)
 8000dea:	f000 bb1e 	b.w	800142a <__retarget_lock_release_recursive>
 8000dee:	bf00      	nop
 8000df0:	200001ef 	.word	0x200001ef

08000df4 <__sfp>:
 8000df4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000df6:	4607      	mov	r7, r0
 8000df8:	f7ff fff0 	bl	8000ddc <__sfp_lock_acquire>
 8000dfc:	4b23      	ldr	r3, [pc, #140]	; (8000e8c <__sfp+0x98>)
 8000dfe:	681b      	ldr	r3, [r3, #0]
 8000e00:	b90b      	cbnz	r3, 8000e06 <__sfp+0x12>
 8000e02:	f7ff ffcd 	bl	8000da0 <global_stdio_init.part.0>
 8000e06:	4e22      	ldr	r6, [pc, #136]	; (8000e90 <__sfp+0x9c>)
 8000e08:	e9d6 3401 	ldrd	r3, r4, [r6, #4]
 8000e0c:	3b01      	subs	r3, #1
 8000e0e:	d50f      	bpl.n	8000e30 <__sfp+0x3c>
 8000e10:	6835      	ldr	r5, [r6, #0]
 8000e12:	2d00      	cmp	r5, #0
 8000e14:	d137      	bne.n	8000e86 <__sfp+0x92>
 8000e16:	f44f 71d6 	mov.w	r1, #428	; 0x1ac
 8000e1a:	4638      	mov	r0, r7
 8000e1c:	f000 fb72 	bl	8001504 <_malloc_r>
 8000e20:	4604      	mov	r4, r0
 8000e22:	bb28      	cbnz	r0, 8000e70 <__sfp+0x7c>
 8000e24:	6030      	str	r0, [r6, #0]
 8000e26:	f7ff ffdf 	bl	8000de8 <__sfp_lock_release>
 8000e2a:	230c      	movs	r3, #12
 8000e2c:	603b      	str	r3, [r7, #0]
 8000e2e:	e01b      	b.n	8000e68 <__sfp+0x74>
 8000e30:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
 8000e34:	b9d5      	cbnz	r5, 8000e6c <__sfp+0x78>
 8000e36:	4b17      	ldr	r3, [pc, #92]	; (8000e94 <__sfp+0xa0>)
 8000e38:	60e3      	str	r3, [r4, #12]
 8000e3a:	f104 0058 	add.w	r0, r4, #88	; 0x58
 8000e3e:	6665      	str	r5, [r4, #100]	; 0x64
 8000e40:	f000 fae9 	bl	8001416 <__retarget_lock_init_recursive>
 8000e44:	f7ff ffd0 	bl	8000de8 <__sfp_lock_release>
 8000e48:	e9c4 5501 	strd	r5, r5, [r4, #4]
 8000e4c:	e9c4 5504 	strd	r5, r5, [r4, #16]
 8000e50:	6025      	str	r5, [r4, #0]
 8000e52:	61a5      	str	r5, [r4, #24]
 8000e54:	2208      	movs	r2, #8
 8000e56:	4629      	mov	r1, r5
 8000e58:	f104 005c 	add.w	r0, r4, #92	; 0x5c
 8000e5c:	f000 fa12 	bl	8001284 <memset>
 8000e60:	e9c4 550d 	strd	r5, r5, [r4, #52]	; 0x34
 8000e64:	e9c4 5512 	strd	r5, r5, [r4, #72]	; 0x48
 8000e68:	4620      	mov	r0, r4
 8000e6a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000e6c:	3468      	adds	r4, #104	; 0x68
 8000e6e:	e7cd      	b.n	8000e0c <__sfp+0x18>
 8000e70:	2304      	movs	r3, #4
 8000e72:	6005      	str	r5, [r0, #0]
 8000e74:	6043      	str	r3, [r0, #4]
 8000e76:	300c      	adds	r0, #12
 8000e78:	60a0      	str	r0, [r4, #8]
 8000e7a:	f44f 72d0 	mov.w	r2, #416	; 0x1a0
 8000e7e:	4629      	mov	r1, r5
 8000e80:	f000 fa00 	bl	8001284 <memset>
 8000e84:	6034      	str	r4, [r6, #0]
 8000e86:	6836      	ldr	r6, [r6, #0]
 8000e88:	e7be      	b.n	8000e08 <__sfp+0x14>
 8000e8a:	bf00      	nop
 8000e8c:	200001e0 	.word	0x200001e0
 8000e90:	20000020 	.word	0x20000020
 8000e94:	ffff0001 	.word	0xffff0001

08000e98 <__sinit>:
 8000e98:	b510      	push	{r4, lr}
 8000e9a:	4604      	mov	r4, r0
 8000e9c:	f7ff ff9e 	bl	8000ddc <__sfp_lock_acquire>
 8000ea0:	6a23      	ldr	r3, [r4, #32]
 8000ea2:	b11b      	cbz	r3, 8000eac <__sinit+0x14>
 8000ea4:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000ea8:	f7ff bf9e 	b.w	8000de8 <__sfp_lock_release>
 8000eac:	4b04      	ldr	r3, [pc, #16]	; (8000ec0 <__sinit+0x28>)
 8000eae:	6223      	str	r3, [r4, #32]
 8000eb0:	4b04      	ldr	r3, [pc, #16]	; (8000ec4 <__sinit+0x2c>)
 8000eb2:	681b      	ldr	r3, [r3, #0]
 8000eb4:	2b00      	cmp	r3, #0
 8000eb6:	d1f5      	bne.n	8000ea4 <__sinit+0xc>
 8000eb8:	f7ff ff72 	bl	8000da0 <global_stdio_init.part.0>
 8000ebc:	e7f2      	b.n	8000ea4 <__sinit+0xc>
 8000ebe:	bf00      	nop
 8000ec0:	08000d31 	.word	0x08000d31
 8000ec4:	200001e0 	.word	0x200001e0

08000ec8 <__fp_lock_all>:
 8000ec8:	b508      	push	{r3, lr}
 8000eca:	f7ff ff87 	bl	8000ddc <__sfp_lock_acquire>
 8000ece:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000ed2:	4a02      	ldr	r2, [pc, #8]	; (8000edc <__fp_lock_all+0x14>)
 8000ed4:	4902      	ldr	r1, [pc, #8]	; (8000ee0 <__fp_lock_all+0x18>)
 8000ed6:	2000      	movs	r0, #0
 8000ed8:	f000 b812 	b.w	8000f00 <_fwalk_sglue>
 8000edc:	20000020 	.word	0x20000020
 8000ee0:	08000d71 	.word	0x08000d71

08000ee4 <__fp_unlock_all>:
 8000ee4:	b508      	push	{r3, lr}
 8000ee6:	4a04      	ldr	r2, [pc, #16]	; (8000ef8 <__fp_unlock_all+0x14>)
 8000ee8:	4904      	ldr	r1, [pc, #16]	; (8000efc <__fp_unlock_all+0x18>)
 8000eea:	2000      	movs	r0, #0
 8000eec:	f000 f808 	bl	8000f00 <_fwalk_sglue>
 8000ef0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000ef4:	f7ff bf78 	b.w	8000de8 <__sfp_lock_release>
 8000ef8:	20000020 	.word	0x20000020
 8000efc:	08000d89 	.word	0x08000d89

08000f00 <_fwalk_sglue>:
 8000f00:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000f04:	4607      	mov	r7, r0
 8000f06:	4688      	mov	r8, r1
 8000f08:	4614      	mov	r4, r2
 8000f0a:	2600      	movs	r6, #0
 8000f0c:	e9d4 9501 	ldrd	r9, r5, [r4, #4]
 8000f10:	f1b9 0901 	subs.w	r9, r9, #1
 8000f14:	d505      	bpl.n	8000f22 <_fwalk_sglue+0x22>
 8000f16:	6824      	ldr	r4, [r4, #0]
 8000f18:	2c00      	cmp	r4, #0
 8000f1a:	d1f7      	bne.n	8000f0c <_fwalk_sglue+0xc>
 8000f1c:	4630      	mov	r0, r6
 8000f1e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000f22:	89ab      	ldrh	r3, [r5, #12]
 8000f24:	2b01      	cmp	r3, #1
 8000f26:	d907      	bls.n	8000f38 <_fwalk_sglue+0x38>
 8000f28:	f9b5 300e 	ldrsh.w	r3, [r5, #14]
 8000f2c:	3301      	adds	r3, #1
 8000f2e:	d003      	beq.n	8000f38 <_fwalk_sglue+0x38>
 8000f30:	4629      	mov	r1, r5
 8000f32:	4638      	mov	r0, r7
 8000f34:	47c0      	blx	r8
 8000f36:	4306      	orrs	r6, r0
 8000f38:	3568      	adds	r5, #104	; 0x68
 8000f3a:	e7e9      	b.n	8000f10 <_fwalk_sglue+0x10>

08000f3c <_puts_r>:
 8000f3c:	6a03      	ldr	r3, [r0, #32]
 8000f3e:	b570      	push	{r4, r5, r6, lr}
 8000f40:	6884      	ldr	r4, [r0, #8]
 8000f42:	4605      	mov	r5, r0
 8000f44:	460e      	mov	r6, r1
 8000f46:	b90b      	cbnz	r3, 8000f4c <_puts_r+0x10>
 8000f48:	f7ff ffa6 	bl	8000e98 <__sinit>
 8000f4c:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8000f4e:	07db      	lsls	r3, r3, #31
 8000f50:	d405      	bmi.n	8000f5e <_puts_r+0x22>
 8000f52:	89a3      	ldrh	r3, [r4, #12]
 8000f54:	0598      	lsls	r0, r3, #22
 8000f56:	d402      	bmi.n	8000f5e <_puts_r+0x22>
 8000f58:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8000f5a:	f000 fa60 	bl	800141e <__retarget_lock_acquire_recursive>
 8000f5e:	89a3      	ldrh	r3, [r4, #12]
 8000f60:	0719      	lsls	r1, r3, #28
 8000f62:	d502      	bpl.n	8000f6a <_puts_r+0x2e>
 8000f64:	6923      	ldr	r3, [r4, #16]
 8000f66:	2b00      	cmp	r3, #0
 8000f68:	d135      	bne.n	8000fd6 <_puts_r+0x9a>
 8000f6a:	4621      	mov	r1, r4
 8000f6c:	4628      	mov	r0, r5
 8000f6e:	f000 f933 	bl	80011d8 <__swsetup_r>
 8000f72:	b380      	cbz	r0, 8000fd6 <_puts_r+0x9a>
 8000f74:	f04f 35ff 	mov.w	r5, #4294967295
 8000f78:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8000f7a:	07da      	lsls	r2, r3, #31
 8000f7c:	d405      	bmi.n	8000f8a <_puts_r+0x4e>
 8000f7e:	89a3      	ldrh	r3, [r4, #12]
 8000f80:	059b      	lsls	r3, r3, #22
 8000f82:	d402      	bmi.n	8000f8a <_puts_r+0x4e>
 8000f84:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8000f86:	f000 fa50 	bl	800142a <__retarget_lock_release_recursive>
 8000f8a:	4628      	mov	r0, r5
 8000f8c:	bd70      	pop	{r4, r5, r6, pc}
 8000f8e:	2b00      	cmp	r3, #0
 8000f90:	db15      	blt.n	8000fbe <_puts_r+0x82>
 8000f92:	6823      	ldr	r3, [r4, #0]
 8000f94:	1c5a      	adds	r2, r3, #1
 8000f96:	6022      	str	r2, [r4, #0]
 8000f98:	7019      	strb	r1, [r3, #0]
 8000f9a:	68a3      	ldr	r3, [r4, #8]
 8000f9c:	f816 1f01 	ldrb.w	r1, [r6, #1]!
 8000fa0:	3b01      	subs	r3, #1
 8000fa2:	60a3      	str	r3, [r4, #8]
 8000fa4:	2900      	cmp	r1, #0
 8000fa6:	d1f2      	bne.n	8000f8e <_puts_r+0x52>
 8000fa8:	2b00      	cmp	r3, #0
 8000faa:	da16      	bge.n	8000fda <_puts_r+0x9e>
 8000fac:	4622      	mov	r2, r4
 8000fae:	210a      	movs	r1, #10
 8000fb0:	4628      	mov	r0, r5
 8000fb2:	f000 f8ca 	bl	800114a <__swbuf_r>
 8000fb6:	3001      	adds	r0, #1
 8000fb8:	d0dc      	beq.n	8000f74 <_puts_r+0x38>
 8000fba:	250a      	movs	r5, #10
 8000fbc:	e7dc      	b.n	8000f78 <_puts_r+0x3c>
 8000fbe:	69a2      	ldr	r2, [r4, #24]
 8000fc0:	429a      	cmp	r2, r3
 8000fc2:	dc01      	bgt.n	8000fc8 <_puts_r+0x8c>
 8000fc4:	290a      	cmp	r1, #10
 8000fc6:	d1e4      	bne.n	8000f92 <_puts_r+0x56>
 8000fc8:	4622      	mov	r2, r4
 8000fca:	4628      	mov	r0, r5
 8000fcc:	f000 f8bd 	bl	800114a <__swbuf_r>
 8000fd0:	3001      	adds	r0, #1
 8000fd2:	d1e2      	bne.n	8000f9a <_puts_r+0x5e>
 8000fd4:	e7ce      	b.n	8000f74 <_puts_r+0x38>
 8000fd6:	3e01      	subs	r6, #1
 8000fd8:	e7df      	b.n	8000f9a <_puts_r+0x5e>
 8000fda:	6823      	ldr	r3, [r4, #0]
 8000fdc:	1c5a      	adds	r2, r3, #1
 8000fde:	6022      	str	r2, [r4, #0]
 8000fe0:	220a      	movs	r2, #10
 8000fe2:	701a      	strb	r2, [r3, #0]
 8000fe4:	e7e9      	b.n	8000fba <_puts_r+0x7e>
	...

08000fe8 <puts>:
 8000fe8:	4b02      	ldr	r3, [pc, #8]	; (8000ff4 <puts+0xc>)
 8000fea:	4601      	mov	r1, r0
 8000fec:	6818      	ldr	r0, [r3, #0]
 8000fee:	f7ff bfa5 	b.w	8000f3c <_puts_r>
 8000ff2:	bf00      	nop
 8000ff4:	2000002c 	.word	0x2000002c

08000ff8 <_sniprintf_r>:
 8000ff8:	b408      	push	{r3}
 8000ffa:	b530      	push	{r4, r5, lr}
 8000ffc:	1e14      	subs	r4, r2, #0
 8000ffe:	b09c      	sub	sp, #112	; 0x70
 8001000:	4605      	mov	r5, r0
 8001002:	da08      	bge.n	8001016 <_sniprintf_r+0x1e>
 8001004:	238b      	movs	r3, #139	; 0x8b
 8001006:	6003      	str	r3, [r0, #0]
 8001008:	f04f 30ff 	mov.w	r0, #4294967295
 800100c:	b01c      	add	sp, #112	; 0x70
 800100e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8001012:	b001      	add	sp, #4
 8001014:	4770      	bx	lr
 8001016:	f44f 7302 	mov.w	r3, #520	; 0x208
 800101a:	f8ad 3014 	strh.w	r3, [sp, #20]
 800101e:	bf14      	ite	ne
 8001020:	f104 33ff 	addne.w	r3, r4, #4294967295
 8001024:	4623      	moveq	r3, r4
 8001026:	9304      	str	r3, [sp, #16]
 8001028:	9307      	str	r3, [sp, #28]
 800102a:	f64f 73ff 	movw	r3, #65535	; 0xffff
 800102e:	9102      	str	r1, [sp, #8]
 8001030:	9106      	str	r1, [sp, #24]
 8001032:	f8ad 3016 	strh.w	r3, [sp, #22]
 8001036:	9a1f      	ldr	r2, [sp, #124]	; 0x7c
 8001038:	ab20      	add	r3, sp, #128	; 0x80
 800103a:	a902      	add	r1, sp, #8
 800103c:	9301      	str	r3, [sp, #4]
 800103e:	f000 fbb5 	bl	80017ac <_svfiprintf_r>
 8001042:	1c43      	adds	r3, r0, #1
 8001044:	bfbc      	itt	lt
 8001046:	238b      	movlt	r3, #139	; 0x8b
 8001048:	602b      	strlt	r3, [r5, #0]
 800104a:	2c00      	cmp	r4, #0
 800104c:	d0de      	beq.n	800100c <_sniprintf_r+0x14>
 800104e:	9b02      	ldr	r3, [sp, #8]
 8001050:	2200      	movs	r2, #0
 8001052:	701a      	strb	r2, [r3, #0]
 8001054:	e7da      	b.n	800100c <_sniprintf_r+0x14>
	...

08001058 <sniprintf>:
 8001058:	b40c      	push	{r2, r3}
 800105a:	b530      	push	{r4, r5, lr}
 800105c:	4b17      	ldr	r3, [pc, #92]	; (80010bc <sniprintf+0x64>)
 800105e:	1e0c      	subs	r4, r1, #0
 8001060:	681d      	ldr	r5, [r3, #0]
 8001062:	b09d      	sub	sp, #116	; 0x74
 8001064:	da08      	bge.n	8001078 <sniprintf+0x20>
 8001066:	238b      	movs	r3, #139	; 0x8b
 8001068:	602b      	str	r3, [r5, #0]
 800106a:	f04f 30ff 	mov.w	r0, #4294967295
 800106e:	b01d      	add	sp, #116	; 0x74
 8001070:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8001074:	b002      	add	sp, #8
 8001076:	4770      	bx	lr
 8001078:	f44f 7302 	mov.w	r3, #520	; 0x208
 800107c:	f8ad 3014 	strh.w	r3, [sp, #20]
 8001080:	bf14      	ite	ne
 8001082:	f104 33ff 	addne.w	r3, r4, #4294967295
 8001086:	4623      	moveq	r3, r4
 8001088:	9304      	str	r3, [sp, #16]
 800108a:	9307      	str	r3, [sp, #28]
 800108c:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001090:	9002      	str	r0, [sp, #8]
 8001092:	9006      	str	r0, [sp, #24]
 8001094:	f8ad 3016 	strh.w	r3, [sp, #22]
 8001098:	9a20      	ldr	r2, [sp, #128]	; 0x80
 800109a:	ab21      	add	r3, sp, #132	; 0x84
 800109c:	a902      	add	r1, sp, #8
 800109e:	4628      	mov	r0, r5
 80010a0:	9301      	str	r3, [sp, #4]
 80010a2:	f000 fb83 	bl	80017ac <_svfiprintf_r>
 80010a6:	1c43      	adds	r3, r0, #1
 80010a8:	bfbc      	itt	lt
 80010aa:	238b      	movlt	r3, #139	; 0x8b
 80010ac:	602b      	strlt	r3, [r5, #0]
 80010ae:	2c00      	cmp	r4, #0
 80010b0:	d0dd      	beq.n	800106e <sniprintf+0x16>
 80010b2:	9b02      	ldr	r3, [sp, #8]
 80010b4:	2200      	movs	r2, #0
 80010b6:	701a      	strb	r2, [r3, #0]
 80010b8:	e7d9      	b.n	800106e <sniprintf+0x16>
 80010ba:	bf00      	nop
 80010bc:	2000002c 	.word	0x2000002c

080010c0 <__sread>:
 80010c0:	b510      	push	{r4, lr}
 80010c2:	460c      	mov	r4, r1
 80010c4:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 80010c8:	f000 f95c 	bl	8001384 <_read_r>
 80010cc:	2800      	cmp	r0, #0
 80010ce:	bfab      	itete	ge
 80010d0:	6d63      	ldrge	r3, [r4, #84]	; 0x54
 80010d2:	89a3      	ldrhlt	r3, [r4, #12]
 80010d4:	181b      	addge	r3, r3, r0
 80010d6:	f423 5380 	biclt.w	r3, r3, #4096	; 0x1000
 80010da:	bfac      	ite	ge
 80010dc:	6563      	strge	r3, [r4, #84]	; 0x54
 80010de:	81a3      	strhlt	r3, [r4, #12]
 80010e0:	bd10      	pop	{r4, pc}

080010e2 <__seofread>:
 80010e2:	2000      	movs	r0, #0
 80010e4:	4770      	bx	lr

080010e6 <__swrite>:
 80010e6:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80010ea:	461f      	mov	r7, r3
 80010ec:	898b      	ldrh	r3, [r1, #12]
 80010ee:	05db      	lsls	r3, r3, #23
 80010f0:	4605      	mov	r5, r0
 80010f2:	460c      	mov	r4, r1
 80010f4:	4616      	mov	r6, r2
 80010f6:	d505      	bpl.n	8001104 <__swrite+0x1e>
 80010f8:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 80010fc:	2302      	movs	r3, #2
 80010fe:	2200      	movs	r2, #0
 8001100:	f000 f92e 	bl	8001360 <_lseek_r>
 8001104:	89a3      	ldrh	r3, [r4, #12]
 8001106:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
 800110a:	f423 5380 	bic.w	r3, r3, #4096	; 0x1000
 800110e:	81a3      	strh	r3, [r4, #12]
 8001110:	4632      	mov	r2, r6
 8001112:	463b      	mov	r3, r7
 8001114:	4628      	mov	r0, r5
 8001116:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 800111a:	f000 b945 	b.w	80013a8 <_write_r>

0800111e <__sseek>:
 800111e:	b510      	push	{r4, lr}
 8001120:	460c      	mov	r4, r1
 8001122:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001126:	f000 f91b 	bl	8001360 <_lseek_r>
 800112a:	1c43      	adds	r3, r0, #1
 800112c:	89a3      	ldrh	r3, [r4, #12]
 800112e:	bf15      	itete	ne
 8001130:	6560      	strne	r0, [r4, #84]	; 0x54
 8001132:	f423 5380 	biceq.w	r3, r3, #4096	; 0x1000
 8001136:	f443 5380 	orrne.w	r3, r3, #4096	; 0x1000
 800113a:	81a3      	strheq	r3, [r4, #12]
 800113c:	bf18      	it	ne
 800113e:	81a3      	strhne	r3, [r4, #12]
 8001140:	bd10      	pop	{r4, pc}

08001142 <__sclose>:
 8001142:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001146:	f000 b8a5 	b.w	8001294 <_close_r>

0800114a <__swbuf_r>:
 800114a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800114c:	460e      	mov	r6, r1
 800114e:	4614      	mov	r4, r2
 8001150:	4605      	mov	r5, r0
 8001152:	b118      	cbz	r0, 800115c <__swbuf_r+0x12>
 8001154:	6a03      	ldr	r3, [r0, #32]
 8001156:	b90b      	cbnz	r3, 800115c <__swbuf_r+0x12>
 8001158:	f7ff fe9e 	bl	8000e98 <__sinit>
 800115c:	69a3      	ldr	r3, [r4, #24]
 800115e:	60a3      	str	r3, [r4, #8]
 8001160:	89a3      	ldrh	r3, [r4, #12]
 8001162:	071a      	lsls	r2, r3, #28
 8001164:	d501      	bpl.n	800116a <__swbuf_r+0x20>
 8001166:	6923      	ldr	r3, [r4, #16]
 8001168:	b943      	cbnz	r3, 800117c <__swbuf_r+0x32>
 800116a:	4621      	mov	r1, r4
 800116c:	4628      	mov	r0, r5
 800116e:	f000 f833 	bl	80011d8 <__swsetup_r>
 8001172:	b118      	cbz	r0, 800117c <__swbuf_r+0x32>
 8001174:	f04f 37ff 	mov.w	r7, #4294967295
 8001178:	4638      	mov	r0, r7
 800117a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800117c:	6823      	ldr	r3, [r4, #0]
 800117e:	6922      	ldr	r2, [r4, #16]
 8001180:	1a98      	subs	r0, r3, r2
 8001182:	6963      	ldr	r3, [r4, #20]
 8001184:	b2f6      	uxtb	r6, r6
 8001186:	4283      	cmp	r3, r0
 8001188:	4637      	mov	r7, r6
 800118a:	dc05      	bgt.n	8001198 <__swbuf_r+0x4e>
 800118c:	4621      	mov	r1, r4
 800118e:	4628      	mov	r0, r5
 8001190:	f000 fe24 	bl	8001ddc <_fflush_r>
 8001194:	2800      	cmp	r0, #0
 8001196:	d1ed      	bne.n	8001174 <__swbuf_r+0x2a>
 8001198:	68a3      	ldr	r3, [r4, #8]
 800119a:	3b01      	subs	r3, #1
 800119c:	60a3      	str	r3, [r4, #8]
 800119e:	6823      	ldr	r3, [r4, #0]
 80011a0:	1c5a      	adds	r2, r3, #1
 80011a2:	6022      	str	r2, [r4, #0]
 80011a4:	701e      	strb	r6, [r3, #0]
 80011a6:	6962      	ldr	r2, [r4, #20]
 80011a8:	1c43      	adds	r3, r0, #1
 80011aa:	429a      	cmp	r2, r3
 80011ac:	d004      	beq.n	80011b8 <__swbuf_r+0x6e>
 80011ae:	89a3      	ldrh	r3, [r4, #12]
 80011b0:	07db      	lsls	r3, r3, #31
 80011b2:	d5e1      	bpl.n	8001178 <__swbuf_r+0x2e>
 80011b4:	2e0a      	cmp	r6, #10
 80011b6:	d1df      	bne.n	8001178 <__swbuf_r+0x2e>
 80011b8:	4621      	mov	r1, r4
 80011ba:	4628      	mov	r0, r5
 80011bc:	f000 fe0e 	bl	8001ddc <_fflush_r>
 80011c0:	2800      	cmp	r0, #0
 80011c2:	d0d9      	beq.n	8001178 <__swbuf_r+0x2e>
 80011c4:	e7d6      	b.n	8001174 <__swbuf_r+0x2a>
	...

080011c8 <__swbuf>:
 80011c8:	4b02      	ldr	r3, [pc, #8]	; (80011d4 <__swbuf+0xc>)
 80011ca:	460a      	mov	r2, r1
 80011cc:	4601      	mov	r1, r0
 80011ce:	6818      	ldr	r0, [r3, #0]
 80011d0:	f7ff bfbb 	b.w	800114a <__swbuf_r>
 80011d4:	2000002c 	.word	0x2000002c

080011d8 <__swsetup_r>:
 80011d8:	b538      	push	{r3, r4, r5, lr}
 80011da:	4b29      	ldr	r3, [pc, #164]	; (8001280 <__swsetup_r+0xa8>)
 80011dc:	4605      	mov	r5, r0
 80011de:	6818      	ldr	r0, [r3, #0]
 80011e0:	460c      	mov	r4, r1
 80011e2:	b118      	cbz	r0, 80011ec <__swsetup_r+0x14>
 80011e4:	6a03      	ldr	r3, [r0, #32]
 80011e6:	b90b      	cbnz	r3, 80011ec <__swsetup_r+0x14>
 80011e8:	f7ff fe56 	bl	8000e98 <__sinit>
 80011ec:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 80011f0:	0719      	lsls	r1, r3, #28
 80011f2:	d422      	bmi.n	800123a <__swsetup_r+0x62>
 80011f4:	06da      	lsls	r2, r3, #27
 80011f6:	d407      	bmi.n	8001208 <__swsetup_r+0x30>
 80011f8:	2209      	movs	r2, #9
 80011fa:	602a      	str	r2, [r5, #0]
 80011fc:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8001200:	81a3      	strh	r3, [r4, #12]
 8001202:	f04f 30ff 	mov.w	r0, #4294967295
 8001206:	e033      	b.n	8001270 <__swsetup_r+0x98>
 8001208:	0758      	lsls	r0, r3, #29
 800120a:	d512      	bpl.n	8001232 <__swsetup_r+0x5a>
 800120c:	6b61      	ldr	r1, [r4, #52]	; 0x34
 800120e:	b141      	cbz	r1, 8001222 <__swsetup_r+0x4a>
 8001210:	f104 0344 	add.w	r3, r4, #68	; 0x44
 8001214:	4299      	cmp	r1, r3
 8001216:	d002      	beq.n	800121e <__swsetup_r+0x46>
 8001218:	4628      	mov	r0, r5
 800121a:	f000 f907 	bl	800142c <_free_r>
 800121e:	2300      	movs	r3, #0
 8001220:	6363      	str	r3, [r4, #52]	; 0x34
 8001222:	89a3      	ldrh	r3, [r4, #12]
 8001224:	f023 0324 	bic.w	r3, r3, #36	; 0x24
 8001228:	81a3      	strh	r3, [r4, #12]
 800122a:	2300      	movs	r3, #0
 800122c:	6063      	str	r3, [r4, #4]
 800122e:	6923      	ldr	r3, [r4, #16]
 8001230:	6023      	str	r3, [r4, #0]
 8001232:	89a3      	ldrh	r3, [r4, #12]
 8001234:	f043 0308 	orr.w	r3, r3, #8
 8001238:	81a3      	strh	r3, [r4, #12]
 800123a:	6923      	ldr	r3, [r4, #16]
 800123c:	b94b      	cbnz	r3, 8001252 <__swsetup_r+0x7a>
 800123e:	89a3      	ldrh	r3, [r4, #12]
 8001240:	f403 7320 	and.w	r3, r3, #640	; 0x280
 8001244:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
 8001248:	d003      	beq.n	8001252 <__swsetup_r+0x7a>
 800124a:	4621      	mov	r1, r4
 800124c:	4628      	mov	r0, r5
 800124e:	f000 fe27 	bl	8001ea0 <__smakebuf_r>
 8001252:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001256:	f013 0201 	ands.w	r2, r3, #1
 800125a:	d00a      	beq.n	8001272 <__swsetup_r+0x9a>
 800125c:	2200      	movs	r2, #0
 800125e:	60a2      	str	r2, [r4, #8]
 8001260:	6962      	ldr	r2, [r4, #20]
 8001262:	4252      	negs	r2, r2
 8001264:	61a2      	str	r2, [r4, #24]
 8001266:	6922      	ldr	r2, [r4, #16]
 8001268:	b942      	cbnz	r2, 800127c <__swsetup_r+0xa4>
 800126a:	f013 0080 	ands.w	r0, r3, #128	; 0x80
 800126e:	d1c5      	bne.n	80011fc <__swsetup_r+0x24>
 8001270:	bd38      	pop	{r3, r4, r5, pc}
 8001272:	0799      	lsls	r1, r3, #30
 8001274:	bf58      	it	pl
 8001276:	6962      	ldrpl	r2, [r4, #20]
 8001278:	60a2      	str	r2, [r4, #8]
 800127a:	e7f4      	b.n	8001266 <__swsetup_r+0x8e>
 800127c:	2000      	movs	r0, #0
 800127e:	e7f7      	b.n	8001270 <__swsetup_r+0x98>
 8001280:	2000002c 	.word	0x2000002c

08001284 <memset>:
 8001284:	4402      	add	r2, r0
 8001286:	4603      	mov	r3, r0
 8001288:	4293      	cmp	r3, r2
 800128a:	d100      	bne.n	800128e <memset+0xa>
 800128c:	4770      	bx	lr
 800128e:	f803 1b01 	strb.w	r1, [r3], #1
 8001292:	e7f9      	b.n	8001288 <memset+0x4>

08001294 <_close_r>:
 8001294:	b538      	push	{r3, r4, r5, lr}
 8001296:	4d06      	ldr	r5, [pc, #24]	; (80012b0 <_close_r+0x1c>)
 8001298:	2300      	movs	r3, #0
 800129a:	4604      	mov	r4, r0
 800129c:	4608      	mov	r0, r1
 800129e:	602b      	str	r3, [r5, #0]
 80012a0:	f7ff fadc 	bl	800085c <_close>
 80012a4:	1c43      	adds	r3, r0, #1
 80012a6:	d102      	bne.n	80012ae <_close_r+0x1a>
 80012a8:	682b      	ldr	r3, [r5, #0]
 80012aa:	b103      	cbz	r3, 80012ae <_close_r+0x1a>
 80012ac:	6023      	str	r3, [r4, #0]
 80012ae:	bd38      	pop	{r3, r4, r5, pc}
 80012b0:	200001e4 	.word	0x200001e4

080012b4 <_reclaim_reent>:
 80012b4:	4b29      	ldr	r3, [pc, #164]	; (800135c <_reclaim_reent+0xa8>)
 80012b6:	681b      	ldr	r3, [r3, #0]
 80012b8:	4283      	cmp	r3, r0
 80012ba:	b570      	push	{r4, r5, r6, lr}
 80012bc:	4604      	mov	r4, r0
 80012be:	d04b      	beq.n	8001358 <_reclaim_reent+0xa4>
 80012c0:	69c3      	ldr	r3, [r0, #28]
 80012c2:	b1ab      	cbz	r3, 80012f0 <_reclaim_reent+0x3c>
 80012c4:	68db      	ldr	r3, [r3, #12]
 80012c6:	b16b      	cbz	r3, 80012e4 <_reclaim_reent+0x30>
 80012c8:	2500      	movs	r5, #0
 80012ca:	69e3      	ldr	r3, [r4, #28]
 80012cc:	68db      	ldr	r3, [r3, #12]
 80012ce:	5959      	ldr	r1, [r3, r5]
 80012d0:	2900      	cmp	r1, #0
 80012d2:	d13b      	bne.n	800134c <_reclaim_reent+0x98>
 80012d4:	3504      	adds	r5, #4
 80012d6:	2d80      	cmp	r5, #128	; 0x80
 80012d8:	d1f7      	bne.n	80012ca <_reclaim_reent+0x16>
 80012da:	69e3      	ldr	r3, [r4, #28]
 80012dc:	4620      	mov	r0, r4
 80012de:	68d9      	ldr	r1, [r3, #12]
 80012e0:	f000 f8a4 	bl	800142c <_free_r>
 80012e4:	69e3      	ldr	r3, [r4, #28]
 80012e6:	6819      	ldr	r1, [r3, #0]
 80012e8:	b111      	cbz	r1, 80012f0 <_reclaim_reent+0x3c>
 80012ea:	4620      	mov	r0, r4
 80012ec:	f000 f89e 	bl	800142c <_free_r>
 80012f0:	6961      	ldr	r1, [r4, #20]
 80012f2:	b111      	cbz	r1, 80012fa <_reclaim_reent+0x46>
 80012f4:	4620      	mov	r0, r4
 80012f6:	f000 f899 	bl	800142c <_free_r>
 80012fa:	69e1      	ldr	r1, [r4, #28]
 80012fc:	b111      	cbz	r1, 8001304 <_reclaim_reent+0x50>
 80012fe:	4620      	mov	r0, r4
 8001300:	f000 f894 	bl	800142c <_free_r>
 8001304:	6b21      	ldr	r1, [r4, #48]	; 0x30
 8001306:	b111      	cbz	r1, 800130e <_reclaim_reent+0x5a>
 8001308:	4620      	mov	r0, r4
 800130a:	f000 f88f 	bl	800142c <_free_r>
 800130e:	6b61      	ldr	r1, [r4, #52]	; 0x34
 8001310:	b111      	cbz	r1, 8001318 <_reclaim_reent+0x64>
 8001312:	4620      	mov	r0, r4
 8001314:	f000 f88a 	bl	800142c <_free_r>
 8001318:	6ba1      	ldr	r1, [r4, #56]	; 0x38
 800131a:	b111      	cbz	r1, 8001322 <_reclaim_reent+0x6e>
 800131c:	4620      	mov	r0, r4
 800131e:	f000 f885 	bl	800142c <_free_r>
 8001322:	6ca1      	ldr	r1, [r4, #72]	; 0x48
 8001324:	b111      	cbz	r1, 800132c <_reclaim_reent+0x78>
 8001326:	4620      	mov	r0, r4
 8001328:	f000 f880 	bl	800142c <_free_r>
 800132c:	6c61      	ldr	r1, [r4, #68]	; 0x44
 800132e:	b111      	cbz	r1, 8001336 <_reclaim_reent+0x82>
 8001330:	4620      	mov	r0, r4
 8001332:	f000 f87b 	bl	800142c <_free_r>
 8001336:	6ae1      	ldr	r1, [r4, #44]	; 0x2c
 8001338:	b111      	cbz	r1, 8001340 <_reclaim_reent+0x8c>
 800133a:	4620      	mov	r0, r4
 800133c:	f000 f876 	bl	800142c <_free_r>
 8001340:	6a23      	ldr	r3, [r4, #32]
 8001342:	b14b      	cbz	r3, 8001358 <_reclaim_reent+0xa4>
 8001344:	4620      	mov	r0, r4
 8001346:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800134a:	4718      	bx	r3
 800134c:	680e      	ldr	r6, [r1, #0]
 800134e:	4620      	mov	r0, r4
 8001350:	f000 f86c 	bl	800142c <_free_r>
 8001354:	4631      	mov	r1, r6
 8001356:	e7bb      	b.n	80012d0 <_reclaim_reent+0x1c>
 8001358:	bd70      	pop	{r4, r5, r6, pc}
 800135a:	bf00      	nop
 800135c:	2000002c 	.word	0x2000002c

08001360 <_lseek_r>:
 8001360:	b538      	push	{r3, r4, r5, lr}
 8001362:	4d07      	ldr	r5, [pc, #28]	; (8001380 <_lseek_r+0x20>)
 8001364:	4604      	mov	r4, r0
 8001366:	4608      	mov	r0, r1
 8001368:	4611      	mov	r1, r2
 800136a:	2200      	movs	r2, #0
 800136c:	602a      	str	r2, [r5, #0]
 800136e:	461a      	mov	r2, r3
 8001370:	f7ff fa7f 	bl	8000872 <_lseek>
 8001374:	1c43      	adds	r3, r0, #1
 8001376:	d102      	bne.n	800137e <_lseek_r+0x1e>
 8001378:	682b      	ldr	r3, [r5, #0]
 800137a:	b103      	cbz	r3, 800137e <_lseek_r+0x1e>
 800137c:	6023      	str	r3, [r4, #0]
 800137e:	bd38      	pop	{r3, r4, r5, pc}
 8001380:	200001e4 	.word	0x200001e4

08001384 <_read_r>:
 8001384:	b538      	push	{r3, r4, r5, lr}
 8001386:	4d07      	ldr	r5, [pc, #28]	; (80013a4 <_read_r+0x20>)
 8001388:	4604      	mov	r4, r0
 800138a:	4608      	mov	r0, r1
 800138c:	4611      	mov	r1, r2
 800138e:	2200      	movs	r2, #0
 8001390:	602a      	str	r2, [r5, #0]
 8001392:	461a      	mov	r2, r3
 8001394:	f7ff fa7f 	bl	8000896 <_read>
 8001398:	1c43      	adds	r3, r0, #1
 800139a:	d102      	bne.n	80013a2 <_read_r+0x1e>
 800139c:	682b      	ldr	r3, [r5, #0]
 800139e:	b103      	cbz	r3, 80013a2 <_read_r+0x1e>
 80013a0:	6023      	str	r3, [r4, #0]
 80013a2:	bd38      	pop	{r3, r4, r5, pc}
 80013a4:	200001e4 	.word	0x200001e4

080013a8 <_write_r>:
 80013a8:	b538      	push	{r3, r4, r5, lr}
 80013aa:	4d07      	ldr	r5, [pc, #28]	; (80013c8 <_write_r+0x20>)
 80013ac:	4604      	mov	r4, r0
 80013ae:	4608      	mov	r0, r1
 80013b0:	4611      	mov	r1, r2
 80013b2:	2200      	movs	r2, #0
 80013b4:	602a      	str	r2, [r5, #0]
 80013b6:	461a      	mov	r2, r3
 80013b8:	f7ff fa79 	bl	80008ae <_write>
 80013bc:	1c43      	adds	r3, r0, #1
 80013be:	d102      	bne.n	80013c6 <_write_r+0x1e>
 80013c0:	682b      	ldr	r3, [r5, #0]
 80013c2:	b103      	cbz	r3, 80013c6 <_write_r+0x1e>
 80013c4:	6023      	str	r3, [r4, #0]
 80013c6:	bd38      	pop	{r3, r4, r5, pc}
 80013c8:	200001e4 	.word	0x200001e4

080013cc <__libc_init_array>:
 80013cc:	b570      	push	{r4, r5, r6, lr}
 80013ce:	4d0d      	ldr	r5, [pc, #52]	; (8001404 <__libc_init_array+0x38>)
 80013d0:	4c0d      	ldr	r4, [pc, #52]	; (8001408 <__libc_init_array+0x3c>)
 80013d2:	1b64      	subs	r4, r4, r5
 80013d4:	10a4      	asrs	r4, r4, #2
 80013d6:	2600      	movs	r6, #0
 80013d8:	42a6      	cmp	r6, r4
 80013da:	d109      	bne.n	80013f0 <__libc_init_array+0x24>
 80013dc:	4d0b      	ldr	r5, [pc, #44]	; (800140c <__libc_init_array+0x40>)
 80013de:	4c0c      	ldr	r4, [pc, #48]	; (8001410 <__libc_init_array+0x44>)
 80013e0:	f000 ff3a 	bl	8002258 <_init>
 80013e4:	1b64      	subs	r4, r4, r5
 80013e6:	10a4      	asrs	r4, r4, #2
 80013e8:	2600      	movs	r6, #0
 80013ea:	42a6      	cmp	r6, r4
 80013ec:	d105      	bne.n	80013fa <__libc_init_array+0x2e>
 80013ee:	bd70      	pop	{r4, r5, r6, pc}
 80013f0:	f855 3b04 	ldr.w	r3, [r5], #4
 80013f4:	4798      	blx	r3
 80013f6:	3601      	adds	r6, #1
 80013f8:	e7ee      	b.n	80013d8 <__libc_init_array+0xc>
 80013fa:	f855 3b04 	ldr.w	r3, [r5], #4
 80013fe:	4798      	blx	r3
 8001400:	3601      	adds	r6, #1
 8001402:	e7f2      	b.n	80013ea <__libc_init_array+0x1e>
	...

08001414 <__retarget_lock_init>:
 8001414:	4770      	bx	lr

08001416 <__retarget_lock_init_recursive>:
 8001416:	4770      	bx	lr

08001418 <__retarget_lock_close>:
 8001418:	4770      	bx	lr

0800141a <__retarget_lock_close_recursive>:
 800141a:	4770      	bx	lr

0800141c <__retarget_lock_acquire>:
 800141c:	4770      	bx	lr

0800141e <__retarget_lock_acquire_recursive>:
 800141e:	4770      	bx	lr

08001420 <__retarget_lock_try_acquire>:
 8001420:	2001      	movs	r0, #1
 8001422:	4770      	bx	lr

08001424 <__retarget_lock_try_acquire_recursive>:
 8001424:	2001      	movs	r0, #1
 8001426:	4770      	bx	lr

08001428 <__retarget_lock_release>:
 8001428:	4770      	bx	lr

0800142a <__retarget_lock_release_recursive>:
 800142a:	4770      	bx	lr

0800142c <_free_r>:
 800142c:	b538      	push	{r3, r4, r5, lr}
 800142e:	4605      	mov	r5, r0
 8001430:	2900      	cmp	r1, #0
 8001432:	d041      	beq.n	80014b8 <_free_r+0x8c>
 8001434:	f851 3c04 	ldr.w	r3, [r1, #-4]
 8001438:	1f0c      	subs	r4, r1, #4
 800143a:	2b00      	cmp	r3, #0
 800143c:	bfb8      	it	lt
 800143e:	18e4      	addlt	r4, r4, r3
 8001440:	f000 f8d0 	bl	80015e4 <__malloc_lock>
 8001444:	4a1d      	ldr	r2, [pc, #116]	; (80014bc <_free_r+0x90>)
 8001446:	6813      	ldr	r3, [r2, #0]
 8001448:	b933      	cbnz	r3, 8001458 <_free_r+0x2c>
 800144a:	6063      	str	r3, [r4, #4]
 800144c:	6014      	str	r4, [r2, #0]
 800144e:	4628      	mov	r0, r5
 8001450:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8001454:	f000 b8cc 	b.w	80015f0 <__malloc_unlock>
 8001458:	42a3      	cmp	r3, r4
 800145a:	d908      	bls.n	800146e <_free_r+0x42>
 800145c:	6820      	ldr	r0, [r4, #0]
 800145e:	1821      	adds	r1, r4, r0
 8001460:	428b      	cmp	r3, r1
 8001462:	bf01      	itttt	eq
 8001464:	6819      	ldreq	r1, [r3, #0]
 8001466:	685b      	ldreq	r3, [r3, #4]
 8001468:	1809      	addeq	r1, r1, r0
 800146a:	6021      	streq	r1, [r4, #0]
 800146c:	e7ed      	b.n	800144a <_free_r+0x1e>
 800146e:	461a      	mov	r2, r3
 8001470:	685b      	ldr	r3, [r3, #4]
 8001472:	b10b      	cbz	r3, 8001478 <_free_r+0x4c>
 8001474:	42a3      	cmp	r3, r4
 8001476:	d9fa      	bls.n	800146e <_free_r+0x42>
 8001478:	6811      	ldr	r1, [r2, #0]
 800147a:	1850      	adds	r0, r2, r1
 800147c:	42a0      	cmp	r0, r4
 800147e:	d10b      	bne.n	8001498 <_free_r+0x6c>
 8001480:	6820      	ldr	r0, [r4, #0]
 8001482:	4401      	add	r1, r0
 8001484:	1850      	adds	r0, r2, r1
 8001486:	4283      	cmp	r3, r0
 8001488:	6011      	str	r1, [r2, #0]
 800148a:	d1e0      	bne.n	800144e <_free_r+0x22>
 800148c:	6818      	ldr	r0, [r3, #0]
 800148e:	685b      	ldr	r3, [r3, #4]
 8001490:	6053      	str	r3, [r2, #4]
 8001492:	4408      	add	r0, r1
 8001494:	6010      	str	r0, [r2, #0]
 8001496:	e7da      	b.n	800144e <_free_r+0x22>
 8001498:	d902      	bls.n	80014a0 <_free_r+0x74>
 800149a:	230c      	movs	r3, #12
 800149c:	602b      	str	r3, [r5, #0]
 800149e:	e7d6      	b.n	800144e <_free_r+0x22>
 80014a0:	6820      	ldr	r0, [r4, #0]
 80014a2:	1821      	adds	r1, r4, r0
 80014a4:	428b      	cmp	r3, r1
 80014a6:	bf04      	itt	eq
 80014a8:	6819      	ldreq	r1, [r3, #0]
 80014aa:	685b      	ldreq	r3, [r3, #4]
 80014ac:	6063      	str	r3, [r4, #4]
 80014ae:	bf04      	itt	eq
 80014b0:	1809      	addeq	r1, r1, r0
 80014b2:	6021      	streq	r1, [r4, #0]
 80014b4:	6054      	str	r4, [r2, #4]
 80014b6:	e7ca      	b.n	800144e <_free_r+0x22>
 80014b8:	bd38      	pop	{r3, r4, r5, pc}
 80014ba:	bf00      	nop
 80014bc:	200001f4 	.word	0x200001f4

080014c0 <sbrk_aligned>:
 80014c0:	b570      	push	{r4, r5, r6, lr}
 80014c2:	4e0f      	ldr	r6, [pc, #60]	; (8001500 <sbrk_aligned+0x40>)
 80014c4:	460c      	mov	r4, r1
 80014c6:	6831      	ldr	r1, [r6, #0]
 80014c8:	4605      	mov	r5, r0
 80014ca:	b911      	cbnz	r1, 80014d2 <sbrk_aligned+0x12>
 80014cc:	f000 fd60 	bl	8001f90 <_sbrk_r>
 80014d0:	6030      	str	r0, [r6, #0]
 80014d2:	4621      	mov	r1, r4
 80014d4:	4628      	mov	r0, r5
 80014d6:	f000 fd5b 	bl	8001f90 <_sbrk_r>
 80014da:	1c43      	adds	r3, r0, #1
 80014dc:	d103      	bne.n	80014e6 <sbrk_aligned+0x26>
 80014de:	f04f 34ff 	mov.w	r4, #4294967295
 80014e2:	4620      	mov	r0, r4
 80014e4:	bd70      	pop	{r4, r5, r6, pc}
 80014e6:	1cc4      	adds	r4, r0, #3
 80014e8:	f024 0403 	bic.w	r4, r4, #3
 80014ec:	42a0      	cmp	r0, r4
 80014ee:	d0f8      	beq.n	80014e2 <sbrk_aligned+0x22>
 80014f0:	1a21      	subs	r1, r4, r0
 80014f2:	4628      	mov	r0, r5
 80014f4:	f000 fd4c 	bl	8001f90 <_sbrk_r>
 80014f8:	3001      	adds	r0, #1
 80014fa:	d1f2      	bne.n	80014e2 <sbrk_aligned+0x22>
 80014fc:	e7ef      	b.n	80014de <sbrk_aligned+0x1e>
 80014fe:	bf00      	nop
 8001500:	200001f0 	.word	0x200001f0

08001504 <_malloc_r>:
 8001504:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001506:	1ccd      	adds	r5, r1, #3
 8001508:	f025 0503 	bic.w	r5, r5, #3
 800150c:	3508      	adds	r5, #8
 800150e:	2d0c      	cmp	r5, #12
 8001510:	bf38      	it	cc
 8001512:	250c      	movcc	r5, #12
 8001514:	2d00      	cmp	r5, #0
 8001516:	4606      	mov	r6, r0
 8001518:	db01      	blt.n	800151e <_malloc_r+0x1a>
 800151a:	42a9      	cmp	r1, r5
 800151c:	d903      	bls.n	8001526 <_malloc_r+0x22>
 800151e:	230c      	movs	r3, #12
 8001520:	6033      	str	r3, [r6, #0]
 8001522:	2000      	movs	r0, #0
 8001524:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001526:	4f2e      	ldr	r7, [pc, #184]	; (80015e0 <_malloc_r+0xdc>)
 8001528:	f000 f85c 	bl	80015e4 <__malloc_lock>
 800152c:	683b      	ldr	r3, [r7, #0]
 800152e:	461c      	mov	r4, r3
 8001530:	bb34      	cbnz	r4, 8001580 <_malloc_r+0x7c>
 8001532:	4629      	mov	r1, r5
 8001534:	4630      	mov	r0, r6
 8001536:	f7ff ffc3 	bl	80014c0 <sbrk_aligned>
 800153a:	1c43      	adds	r3, r0, #1
 800153c:	4604      	mov	r4, r0
 800153e:	d14d      	bne.n	80015dc <_malloc_r+0xd8>
 8001540:	683c      	ldr	r4, [r7, #0]
 8001542:	4621      	mov	r1, r4
 8001544:	2900      	cmp	r1, #0
 8001546:	d140      	bne.n	80015ca <_malloc_r+0xc6>
 8001548:	2c00      	cmp	r4, #0
 800154a:	d041      	beq.n	80015d0 <_malloc_r+0xcc>
 800154c:	6823      	ldr	r3, [r4, #0]
 800154e:	4630      	mov	r0, r6
 8001550:	18e7      	adds	r7, r4, r3
 8001552:	f000 fd1d 	bl	8001f90 <_sbrk_r>
 8001556:	4287      	cmp	r7, r0
 8001558:	d13a      	bne.n	80015d0 <_malloc_r+0xcc>
 800155a:	6823      	ldr	r3, [r4, #0]
 800155c:	3503      	adds	r5, #3
 800155e:	1aed      	subs	r5, r5, r3
 8001560:	f025 0503 	bic.w	r5, r5, #3
 8001564:	3508      	adds	r5, #8
 8001566:	2d0c      	cmp	r5, #12
 8001568:	bf38      	it	cc
 800156a:	250c      	movcc	r5, #12
 800156c:	4629      	mov	r1, r5
 800156e:	4630      	mov	r0, r6
 8001570:	f7ff ffa6 	bl	80014c0 <sbrk_aligned>
 8001574:	3001      	adds	r0, #1
 8001576:	d02b      	beq.n	80015d0 <_malloc_r+0xcc>
 8001578:	6823      	ldr	r3, [r4, #0]
 800157a:	442b      	add	r3, r5
 800157c:	6023      	str	r3, [r4, #0]
 800157e:	e00e      	b.n	800159e <_malloc_r+0x9a>
 8001580:	6822      	ldr	r2, [r4, #0]
 8001582:	1b52      	subs	r2, r2, r5
 8001584:	d41e      	bmi.n	80015c4 <_malloc_r+0xc0>
 8001586:	2a0b      	cmp	r2, #11
 8001588:	d916      	bls.n	80015b8 <_malloc_r+0xb4>
 800158a:	1961      	adds	r1, r4, r5
 800158c:	42a3      	cmp	r3, r4
 800158e:	6025      	str	r5, [r4, #0]
 8001590:	bf18      	it	ne
 8001592:	6059      	strne	r1, [r3, #4]
 8001594:	6863      	ldr	r3, [r4, #4]
 8001596:	bf08      	it	eq
 8001598:	6039      	streq	r1, [r7, #0]
 800159a:	5162      	str	r2, [r4, r5]
 800159c:	604b      	str	r3, [r1, #4]
 800159e:	4630      	mov	r0, r6
 80015a0:	f000 f826 	bl	80015f0 <__malloc_unlock>
 80015a4:	f104 000b 	add.w	r0, r4, #11
 80015a8:	1d23      	adds	r3, r4, #4
 80015aa:	f020 0007 	bic.w	r0, r0, #7
 80015ae:	1ac2      	subs	r2, r0, r3
 80015b0:	bf1c      	itt	ne
 80015b2:	1a1b      	subne	r3, r3, r0
 80015b4:	50a3      	strne	r3, [r4, r2]
 80015b6:	e7b5      	b.n	8001524 <_malloc_r+0x20>
 80015b8:	6862      	ldr	r2, [r4, #4]
 80015ba:	42a3      	cmp	r3, r4
 80015bc:	bf0c      	ite	eq
 80015be:	603a      	streq	r2, [r7, #0]
 80015c0:	605a      	strne	r2, [r3, #4]
 80015c2:	e7ec      	b.n	800159e <_malloc_r+0x9a>
 80015c4:	4623      	mov	r3, r4
 80015c6:	6864      	ldr	r4, [r4, #4]
 80015c8:	e7b2      	b.n	8001530 <_malloc_r+0x2c>
 80015ca:	460c      	mov	r4, r1
 80015cc:	6849      	ldr	r1, [r1, #4]
 80015ce:	e7b9      	b.n	8001544 <_malloc_r+0x40>
 80015d0:	230c      	movs	r3, #12
 80015d2:	6033      	str	r3, [r6, #0]
 80015d4:	4630      	mov	r0, r6
 80015d6:	f000 f80b 	bl	80015f0 <__malloc_unlock>
 80015da:	e7a2      	b.n	8001522 <_malloc_r+0x1e>
 80015dc:	6005      	str	r5, [r0, #0]
 80015de:	e7de      	b.n	800159e <_malloc_r+0x9a>
 80015e0:	200001f4 	.word	0x200001f4

080015e4 <__malloc_lock>:
 80015e4:	4801      	ldr	r0, [pc, #4]	; (80015ec <__malloc_lock+0x8>)
 80015e6:	f7ff bf1a 	b.w	800141e <__retarget_lock_acquire_recursive>
 80015ea:	bf00      	nop
 80015ec:	200001ec 	.word	0x200001ec

080015f0 <__malloc_unlock>:
 80015f0:	4801      	ldr	r0, [pc, #4]	; (80015f8 <__malloc_unlock+0x8>)
 80015f2:	f7ff bf1a 	b.w	800142a <__retarget_lock_release_recursive>
 80015f6:	bf00      	nop
 80015f8:	200001ec 	.word	0x200001ec

080015fc <__ssputs_r>:
 80015fc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8001600:	688e      	ldr	r6, [r1, #8]
 8001602:	461f      	mov	r7, r3
 8001604:	42be      	cmp	r6, r7
 8001606:	680b      	ldr	r3, [r1, #0]
 8001608:	4682      	mov	sl, r0
 800160a:	460c      	mov	r4, r1
 800160c:	4690      	mov	r8, r2
 800160e:	d82d      	bhi.n	800166c <__ssputs_r+0x70>
 8001610:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
 8001614:	f412 6f90 	tst.w	r2, #1152	; 0x480
 8001618:	d026      	beq.n	8001668 <__ssputs_r+0x6c>
 800161a:	6965      	ldr	r5, [r4, #20]
 800161c:	6909      	ldr	r1, [r1, #16]
 800161e:	eb05 0545 	add.w	r5, r5, r5, lsl #1
 8001622:	eba3 0901 	sub.w	r9, r3, r1
 8001626:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
 800162a:	1c7b      	adds	r3, r7, #1
 800162c:	444b      	add	r3, r9
 800162e:	106d      	asrs	r5, r5, #1
 8001630:	429d      	cmp	r5, r3
 8001632:	bf38      	it	cc
 8001634:	461d      	movcc	r5, r3
 8001636:	0553      	lsls	r3, r2, #21
 8001638:	d527      	bpl.n	800168a <__ssputs_r+0x8e>
 800163a:	4629      	mov	r1, r5
 800163c:	f7ff ff62 	bl	8001504 <_malloc_r>
 8001640:	4606      	mov	r6, r0
 8001642:	b360      	cbz	r0, 800169e <__ssputs_r+0xa2>
 8001644:	6921      	ldr	r1, [r4, #16]
 8001646:	464a      	mov	r2, r9
 8001648:	f000 fcb2 	bl	8001fb0 <memcpy>
 800164c:	89a3      	ldrh	r3, [r4, #12]
 800164e:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
 8001652:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8001656:	81a3      	strh	r3, [r4, #12]
 8001658:	6126      	str	r6, [r4, #16]
 800165a:	6165      	str	r5, [r4, #20]
 800165c:	444e      	add	r6, r9
 800165e:	eba5 0509 	sub.w	r5, r5, r9
 8001662:	6026      	str	r6, [r4, #0]
 8001664:	60a5      	str	r5, [r4, #8]
 8001666:	463e      	mov	r6, r7
 8001668:	42be      	cmp	r6, r7
 800166a:	d900      	bls.n	800166e <__ssputs_r+0x72>
 800166c:	463e      	mov	r6, r7
 800166e:	6820      	ldr	r0, [r4, #0]
 8001670:	4632      	mov	r2, r6
 8001672:	4641      	mov	r1, r8
 8001674:	f000 fc50 	bl	8001f18 <memmove>
 8001678:	68a3      	ldr	r3, [r4, #8]
 800167a:	1b9b      	subs	r3, r3, r6
 800167c:	60a3      	str	r3, [r4, #8]
 800167e:	6823      	ldr	r3, [r4, #0]
 8001680:	4433      	add	r3, r6
 8001682:	6023      	str	r3, [r4, #0]
 8001684:	2000      	movs	r0, #0
 8001686:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800168a:	462a      	mov	r2, r5
 800168c:	f000 fc9e 	bl	8001fcc <_realloc_r>
 8001690:	4606      	mov	r6, r0
 8001692:	2800      	cmp	r0, #0
 8001694:	d1e0      	bne.n	8001658 <__ssputs_r+0x5c>
 8001696:	6921      	ldr	r1, [r4, #16]
 8001698:	4650      	mov	r0, sl
 800169a:	f7ff fec7 	bl	800142c <_free_r>
 800169e:	230c      	movs	r3, #12
 80016a0:	f8ca 3000 	str.w	r3, [sl]
 80016a4:	89a3      	ldrh	r3, [r4, #12]
 80016a6:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 80016aa:	81a3      	strh	r3, [r4, #12]
 80016ac:	f04f 30ff 	mov.w	r0, #4294967295
 80016b0:	e7e9      	b.n	8001686 <__ssputs_r+0x8a>

080016b2 <__ssprint_r>:
 80016b2:	6893      	ldr	r3, [r2, #8]
 80016b4:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80016b8:	f8d2 a000 	ldr.w	sl, [r2]
 80016bc:	4680      	mov	r8, r0
 80016be:	460c      	mov	r4, r1
 80016c0:	4617      	mov	r7, r2
 80016c2:	2b00      	cmp	r3, #0
 80016c4:	d157      	bne.n	8001776 <__ssprint_r+0xc4>
 80016c6:	2000      	movs	r0, #0
 80016c8:	2300      	movs	r3, #0
 80016ca:	607b      	str	r3, [r7, #4]
 80016cc:	b003      	add	sp, #12
 80016ce:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80016d2:	f8da 3000 	ldr.w	r3, [sl]
 80016d6:	f8da b004 	ldr.w	fp, [sl, #4]
 80016da:	9301      	str	r3, [sp, #4]
 80016dc:	f10a 0a08 	add.w	sl, sl, #8
 80016e0:	68a6      	ldr	r6, [r4, #8]
 80016e2:	6820      	ldr	r0, [r4, #0]
 80016e4:	f1bb 0f00 	cmp.w	fp, #0
 80016e8:	d0f3      	beq.n	80016d2 <__ssprint_r+0x20>
 80016ea:	45b3      	cmp	fp, r6
 80016ec:	d32e      	bcc.n	800174c <__ssprint_r+0x9a>
 80016ee:	f9b4 200c 	ldrsh.w	r2, [r4, #12]
 80016f2:	f412 6f90 	tst.w	r2, #1152	; 0x480
 80016f6:	d029      	beq.n	800174c <__ssprint_r+0x9a>
 80016f8:	6921      	ldr	r1, [r4, #16]
 80016fa:	6965      	ldr	r5, [r4, #20]
 80016fc:	eba0 0901 	sub.w	r9, r0, r1
 8001700:	eb05 0545 	add.w	r5, r5, r5, lsl #1
 8001704:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
 8001708:	f109 0001 	add.w	r0, r9, #1
 800170c:	106d      	asrs	r5, r5, #1
 800170e:	4458      	add	r0, fp
 8001710:	4285      	cmp	r5, r0
 8001712:	bf38      	it	cc
 8001714:	4605      	movcc	r5, r0
 8001716:	0553      	lsls	r3, r2, #21
 8001718:	d531      	bpl.n	800177e <__ssprint_r+0xcc>
 800171a:	4629      	mov	r1, r5
 800171c:	4640      	mov	r0, r8
 800171e:	f7ff fef1 	bl	8001504 <_malloc_r>
 8001722:	4606      	mov	r6, r0
 8001724:	2800      	cmp	r0, #0
 8001726:	d035      	beq.n	8001794 <__ssprint_r+0xe2>
 8001728:	464a      	mov	r2, r9
 800172a:	6921      	ldr	r1, [r4, #16]
 800172c:	f000 fc40 	bl	8001fb0 <memcpy>
 8001730:	89a2      	ldrh	r2, [r4, #12]
 8001732:	f422 6290 	bic.w	r2, r2, #1152	; 0x480
 8001736:	f042 0280 	orr.w	r2, r2, #128	; 0x80
 800173a:	81a2      	strh	r2, [r4, #12]
 800173c:	6126      	str	r6, [r4, #16]
 800173e:	6165      	str	r5, [r4, #20]
 8001740:	444e      	add	r6, r9
 8001742:	eba5 0509 	sub.w	r5, r5, r9
 8001746:	6026      	str	r6, [r4, #0]
 8001748:	60a5      	str	r5, [r4, #8]
 800174a:	465e      	mov	r6, fp
 800174c:	455e      	cmp	r6, fp
 800174e:	bf28      	it	cs
 8001750:	465e      	movcs	r6, fp
 8001752:	4632      	mov	r2, r6
 8001754:	9901      	ldr	r1, [sp, #4]
 8001756:	6820      	ldr	r0, [r4, #0]
 8001758:	f000 fbde 	bl	8001f18 <memmove>
 800175c:	68a2      	ldr	r2, [r4, #8]
 800175e:	1b92      	subs	r2, r2, r6
 8001760:	60a2      	str	r2, [r4, #8]
 8001762:	6822      	ldr	r2, [r4, #0]
 8001764:	4432      	add	r2, r6
 8001766:	6022      	str	r2, [r4, #0]
 8001768:	68ba      	ldr	r2, [r7, #8]
 800176a:	eba2 030b 	sub.w	r3, r2, fp
 800176e:	60bb      	str	r3, [r7, #8]
 8001770:	2b00      	cmp	r3, #0
 8001772:	d1ae      	bne.n	80016d2 <__ssprint_r+0x20>
 8001774:	e7a7      	b.n	80016c6 <__ssprint_r+0x14>
 8001776:	2300      	movs	r3, #0
 8001778:	9301      	str	r3, [sp, #4]
 800177a:	469b      	mov	fp, r3
 800177c:	e7b0      	b.n	80016e0 <__ssprint_r+0x2e>
 800177e:	462a      	mov	r2, r5
 8001780:	4640      	mov	r0, r8
 8001782:	f000 fc23 	bl	8001fcc <_realloc_r>
 8001786:	4606      	mov	r6, r0
 8001788:	2800      	cmp	r0, #0
 800178a:	d1d7      	bne.n	800173c <__ssprint_r+0x8a>
 800178c:	6921      	ldr	r1, [r4, #16]
 800178e:	4640      	mov	r0, r8
 8001790:	f7ff fe4c 	bl	800142c <_free_r>
 8001794:	230c      	movs	r3, #12
 8001796:	f8c8 3000 	str.w	r3, [r8]
 800179a:	89a3      	ldrh	r3, [r4, #12]
 800179c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 80017a0:	81a3      	strh	r3, [r4, #12]
 80017a2:	2300      	movs	r3, #0
 80017a4:	60bb      	str	r3, [r7, #8]
 80017a6:	f04f 30ff 	mov.w	r0, #4294967295
 80017aa:	e78d      	b.n	80016c8 <__ssprint_r+0x16>

080017ac <_svfiprintf_r>:
 80017ac:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80017b0:	4698      	mov	r8, r3
 80017b2:	898b      	ldrh	r3, [r1, #12]
 80017b4:	061b      	lsls	r3, r3, #24
 80017b6:	b09d      	sub	sp, #116	; 0x74
 80017b8:	4607      	mov	r7, r0
 80017ba:	460d      	mov	r5, r1
 80017bc:	4614      	mov	r4, r2
 80017be:	d510      	bpl.n	80017e2 <_svfiprintf_r+0x36>
 80017c0:	690b      	ldr	r3, [r1, #16]
 80017c2:	b973      	cbnz	r3, 80017e2 <_svfiprintf_r+0x36>
 80017c4:	2140      	movs	r1, #64	; 0x40
 80017c6:	f7ff fe9d 	bl	8001504 <_malloc_r>
 80017ca:	6028      	str	r0, [r5, #0]
 80017cc:	6128      	str	r0, [r5, #16]
 80017ce:	b930      	cbnz	r0, 80017de <_svfiprintf_r+0x32>
 80017d0:	230c      	movs	r3, #12
 80017d2:	603b      	str	r3, [r7, #0]
 80017d4:	f04f 30ff 	mov.w	r0, #4294967295
 80017d8:	b01d      	add	sp, #116	; 0x74
 80017da:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80017de:	2340      	movs	r3, #64	; 0x40
 80017e0:	616b      	str	r3, [r5, #20]
 80017e2:	2300      	movs	r3, #0
 80017e4:	9309      	str	r3, [sp, #36]	; 0x24
 80017e6:	2320      	movs	r3, #32
 80017e8:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
 80017ec:	f8cd 800c 	str.w	r8, [sp, #12]
 80017f0:	2330      	movs	r3, #48	; 0x30
 80017f2:	f8df 819c 	ldr.w	r8, [pc, #412]	; 8001990 <_svfiprintf_r+0x1e4>
 80017f6:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
 80017fa:	f04f 0901 	mov.w	r9, #1
 80017fe:	4623      	mov	r3, r4
 8001800:	469a      	mov	sl, r3
 8001802:	f813 2b01 	ldrb.w	r2, [r3], #1
 8001806:	b10a      	cbz	r2, 800180c <_svfiprintf_r+0x60>
 8001808:	2a25      	cmp	r2, #37	; 0x25
 800180a:	d1f9      	bne.n	8001800 <_svfiprintf_r+0x54>
 800180c:	ebba 0b04 	subs.w	fp, sl, r4
 8001810:	d00b      	beq.n	800182a <_svfiprintf_r+0x7e>
 8001812:	465b      	mov	r3, fp
 8001814:	4622      	mov	r2, r4
 8001816:	4629      	mov	r1, r5
 8001818:	4638      	mov	r0, r7
 800181a:	f7ff feef 	bl	80015fc <__ssputs_r>
 800181e:	3001      	adds	r0, #1
 8001820:	f000 80a7 	beq.w	8001972 <_svfiprintf_r+0x1c6>
 8001824:	9a09      	ldr	r2, [sp, #36]	; 0x24
 8001826:	445a      	add	r2, fp
 8001828:	9209      	str	r2, [sp, #36]	; 0x24
 800182a:	f89a 3000 	ldrb.w	r3, [sl]
 800182e:	2b00      	cmp	r3, #0
 8001830:	f000 809f 	beq.w	8001972 <_svfiprintf_r+0x1c6>
 8001834:	2300      	movs	r3, #0
 8001836:	f04f 32ff 	mov.w	r2, #4294967295
 800183a:	e9cd 2305 	strd	r2, r3, [sp, #20]
 800183e:	f10a 0a01 	add.w	sl, sl, #1
 8001842:	9304      	str	r3, [sp, #16]
 8001844:	9307      	str	r3, [sp, #28]
 8001846:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
 800184a:	931a      	str	r3, [sp, #104]	; 0x68
 800184c:	4654      	mov	r4, sl
 800184e:	2205      	movs	r2, #5
 8001850:	f814 1b01 	ldrb.w	r1, [r4], #1
 8001854:	484e      	ldr	r0, [pc, #312]	; (8001990 <_svfiprintf_r+0x1e4>)
 8001856:	f7ff f993 	bl	8000b80 <memchr>
 800185a:	9a04      	ldr	r2, [sp, #16]
 800185c:	b9d8      	cbnz	r0, 8001896 <_svfiprintf_r+0xea>
 800185e:	06d0      	lsls	r0, r2, #27
 8001860:	bf44      	itt	mi
 8001862:	2320      	movmi	r3, #32
 8001864:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8001868:	0711      	lsls	r1, r2, #28
 800186a:	bf44      	itt	mi
 800186c:	232b      	movmi	r3, #43	; 0x2b
 800186e:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8001872:	f89a 3000 	ldrb.w	r3, [sl]
 8001876:	2b2a      	cmp	r3, #42	; 0x2a
 8001878:	d015      	beq.n	80018a6 <_svfiprintf_r+0xfa>
 800187a:	9a07      	ldr	r2, [sp, #28]
 800187c:	4654      	mov	r4, sl
 800187e:	2000      	movs	r0, #0
 8001880:	f04f 0c0a 	mov.w	ip, #10
 8001884:	4621      	mov	r1, r4
 8001886:	f811 3b01 	ldrb.w	r3, [r1], #1
 800188a:	3b30      	subs	r3, #48	; 0x30
 800188c:	2b09      	cmp	r3, #9
 800188e:	d94b      	bls.n	8001928 <_svfiprintf_r+0x17c>
 8001890:	b1b0      	cbz	r0, 80018c0 <_svfiprintf_r+0x114>
 8001892:	9207      	str	r2, [sp, #28]
 8001894:	e014      	b.n	80018c0 <_svfiprintf_r+0x114>
 8001896:	eba0 0308 	sub.w	r3, r0, r8
 800189a:	fa09 f303 	lsl.w	r3, r9, r3
 800189e:	4313      	orrs	r3, r2
 80018a0:	9304      	str	r3, [sp, #16]
 80018a2:	46a2      	mov	sl, r4
 80018a4:	e7d2      	b.n	800184c <_svfiprintf_r+0xa0>
 80018a6:	9b03      	ldr	r3, [sp, #12]
 80018a8:	1d19      	adds	r1, r3, #4
 80018aa:	681b      	ldr	r3, [r3, #0]
 80018ac:	9103      	str	r1, [sp, #12]
 80018ae:	2b00      	cmp	r3, #0
 80018b0:	bfbb      	ittet	lt
 80018b2:	425b      	neglt	r3, r3
 80018b4:	f042 0202 	orrlt.w	r2, r2, #2
 80018b8:	9307      	strge	r3, [sp, #28]
 80018ba:	9307      	strlt	r3, [sp, #28]
 80018bc:	bfb8      	it	lt
 80018be:	9204      	strlt	r2, [sp, #16]
 80018c0:	7823      	ldrb	r3, [r4, #0]
 80018c2:	2b2e      	cmp	r3, #46	; 0x2e
 80018c4:	d10a      	bne.n	80018dc <_svfiprintf_r+0x130>
 80018c6:	7863      	ldrb	r3, [r4, #1]
 80018c8:	2b2a      	cmp	r3, #42	; 0x2a
 80018ca:	d132      	bne.n	8001932 <_svfiprintf_r+0x186>
 80018cc:	9b03      	ldr	r3, [sp, #12]
 80018ce:	1d1a      	adds	r2, r3, #4
 80018d0:	681b      	ldr	r3, [r3, #0]
 80018d2:	9203      	str	r2, [sp, #12]
 80018d4:	ea43 73e3 	orr.w	r3, r3, r3, asr #31
 80018d8:	3402      	adds	r4, #2
 80018da:	9305      	str	r3, [sp, #20]
 80018dc:	f8df a0b4 	ldr.w	sl, [pc, #180]	; 8001994 <_svfiprintf_r+0x1e8>
 80018e0:	7821      	ldrb	r1, [r4, #0]
 80018e2:	2203      	movs	r2, #3
 80018e4:	4650      	mov	r0, sl
 80018e6:	f7ff f94b 	bl	8000b80 <memchr>
 80018ea:	b138      	cbz	r0, 80018fc <_svfiprintf_r+0x150>
 80018ec:	9b04      	ldr	r3, [sp, #16]
 80018ee:	eba0 000a 	sub.w	r0, r0, sl
 80018f2:	2240      	movs	r2, #64	; 0x40
 80018f4:	4082      	lsls	r2, r0
 80018f6:	4313      	orrs	r3, r2
 80018f8:	3401      	adds	r4, #1
 80018fa:	9304      	str	r3, [sp, #16]
 80018fc:	f814 1b01 	ldrb.w	r1, [r4], #1
 8001900:	4825      	ldr	r0, [pc, #148]	; (8001998 <_svfiprintf_r+0x1ec>)
 8001902:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
 8001906:	2206      	movs	r2, #6
 8001908:	f7ff f93a 	bl	8000b80 <memchr>
 800190c:	2800      	cmp	r0, #0
 800190e:	d036      	beq.n	800197e <_svfiprintf_r+0x1d2>
 8001910:	4b22      	ldr	r3, [pc, #136]	; (800199c <_svfiprintf_r+0x1f0>)
 8001912:	bb1b      	cbnz	r3, 800195c <_svfiprintf_r+0x1b0>
 8001914:	9b03      	ldr	r3, [sp, #12]
 8001916:	3307      	adds	r3, #7
 8001918:	f023 0307 	bic.w	r3, r3, #7
 800191c:	3308      	adds	r3, #8
 800191e:	9303      	str	r3, [sp, #12]
 8001920:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8001922:	4433      	add	r3, r6
 8001924:	9309      	str	r3, [sp, #36]	; 0x24
 8001926:	e76a      	b.n	80017fe <_svfiprintf_r+0x52>
 8001928:	fb0c 3202 	mla	r2, ip, r2, r3
 800192c:	460c      	mov	r4, r1
 800192e:	2001      	movs	r0, #1
 8001930:	e7a8      	b.n	8001884 <_svfiprintf_r+0xd8>
 8001932:	2300      	movs	r3, #0
 8001934:	3401      	adds	r4, #1
 8001936:	9305      	str	r3, [sp, #20]
 8001938:	4619      	mov	r1, r3
 800193a:	f04f 0c0a 	mov.w	ip, #10
 800193e:	4620      	mov	r0, r4
 8001940:	f810 2b01 	ldrb.w	r2, [r0], #1
 8001944:	3a30      	subs	r2, #48	; 0x30
 8001946:	2a09      	cmp	r2, #9
 8001948:	d903      	bls.n	8001952 <_svfiprintf_r+0x1a6>
 800194a:	2b00      	cmp	r3, #0
 800194c:	d0c6      	beq.n	80018dc <_svfiprintf_r+0x130>
 800194e:	9105      	str	r1, [sp, #20]
 8001950:	e7c4      	b.n	80018dc <_svfiprintf_r+0x130>
 8001952:	fb0c 2101 	mla	r1, ip, r1, r2
 8001956:	4604      	mov	r4, r0
 8001958:	2301      	movs	r3, #1
 800195a:	e7f0      	b.n	800193e <_svfiprintf_r+0x192>
 800195c:	ab03      	add	r3, sp, #12
 800195e:	9300      	str	r3, [sp, #0]
 8001960:	462a      	mov	r2, r5
 8001962:	4b0f      	ldr	r3, [pc, #60]	; (80019a0 <_svfiprintf_r+0x1f4>)
 8001964:	a904      	add	r1, sp, #16
 8001966:	4638      	mov	r0, r7
 8001968:	f3af 8000 	nop.w
 800196c:	1c42      	adds	r2, r0, #1
 800196e:	4606      	mov	r6, r0
 8001970:	d1d6      	bne.n	8001920 <_svfiprintf_r+0x174>
 8001972:	89ab      	ldrh	r3, [r5, #12]
 8001974:	065b      	lsls	r3, r3, #25
 8001976:	f53f af2d 	bmi.w	80017d4 <_svfiprintf_r+0x28>
 800197a:	9809      	ldr	r0, [sp, #36]	; 0x24
 800197c:	e72c      	b.n	80017d8 <_svfiprintf_r+0x2c>
 800197e:	ab03      	add	r3, sp, #12
 8001980:	9300      	str	r3, [sp, #0]
 8001982:	462a      	mov	r2, r5
 8001984:	4b06      	ldr	r3, [pc, #24]	; (80019a0 <_svfiprintf_r+0x1f4>)
 8001986:	a904      	add	r1, sp, #16
 8001988:	4638      	mov	r0, r7
 800198a:	f000 f879 	bl	8001a80 <_printf_i>
 800198e:	e7ed      	b.n	800196c <_svfiprintf_r+0x1c0>
 8001990:	08002201 	.word	0x08002201
 8001994:	08002207 	.word	0x08002207
 8001998:	0800220b 	.word	0x0800220b
 800199c:	00000000 	.word	0x00000000
 80019a0:	080015fd 	.word	0x080015fd

080019a4 <_printf_common>:
 80019a4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 80019a8:	4616      	mov	r6, r2
 80019aa:	4698      	mov	r8, r3
 80019ac:	688a      	ldr	r2, [r1, #8]
 80019ae:	690b      	ldr	r3, [r1, #16]
 80019b0:	f8dd 9020 	ldr.w	r9, [sp, #32]
 80019b4:	4293      	cmp	r3, r2
 80019b6:	bfb8      	it	lt
 80019b8:	4613      	movlt	r3, r2
 80019ba:	6033      	str	r3, [r6, #0]
 80019bc:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
 80019c0:	4607      	mov	r7, r0
 80019c2:	460c      	mov	r4, r1
 80019c4:	b10a      	cbz	r2, 80019ca <_printf_common+0x26>
 80019c6:	3301      	adds	r3, #1
 80019c8:	6033      	str	r3, [r6, #0]
 80019ca:	6823      	ldr	r3, [r4, #0]
 80019cc:	0699      	lsls	r1, r3, #26
 80019ce:	bf42      	ittt	mi
 80019d0:	6833      	ldrmi	r3, [r6, #0]
 80019d2:	3302      	addmi	r3, #2
 80019d4:	6033      	strmi	r3, [r6, #0]
 80019d6:	6825      	ldr	r5, [r4, #0]
 80019d8:	f015 0506 	ands.w	r5, r5, #6
 80019dc:	d106      	bne.n	80019ec <_printf_common+0x48>
 80019de:	f104 0a19 	add.w	sl, r4, #25
 80019e2:	68e3      	ldr	r3, [r4, #12]
 80019e4:	6832      	ldr	r2, [r6, #0]
 80019e6:	1a9b      	subs	r3, r3, r2
 80019e8:	42ab      	cmp	r3, r5
 80019ea:	dc26      	bgt.n	8001a3a <_printf_common+0x96>
 80019ec:	f894 3043 	ldrb.w	r3, [r4, #67]	; 0x43
 80019f0:	6822      	ldr	r2, [r4, #0]
 80019f2:	3b00      	subs	r3, #0
 80019f4:	bf18      	it	ne
 80019f6:	2301      	movne	r3, #1
 80019f8:	0692      	lsls	r2, r2, #26
 80019fa:	d42b      	bmi.n	8001a54 <_printf_common+0xb0>
 80019fc:	f104 0243 	add.w	r2, r4, #67	; 0x43
 8001a00:	4641      	mov	r1, r8
 8001a02:	4638      	mov	r0, r7
 8001a04:	47c8      	blx	r9
 8001a06:	3001      	adds	r0, #1
 8001a08:	d01e      	beq.n	8001a48 <_printf_common+0xa4>
 8001a0a:	6823      	ldr	r3, [r4, #0]
 8001a0c:	6922      	ldr	r2, [r4, #16]
 8001a0e:	f003 0306 	and.w	r3, r3, #6
 8001a12:	2b04      	cmp	r3, #4
 8001a14:	bf02      	ittt	eq
 8001a16:	68e5      	ldreq	r5, [r4, #12]
 8001a18:	6833      	ldreq	r3, [r6, #0]
 8001a1a:	1aed      	subeq	r5, r5, r3
 8001a1c:	68a3      	ldr	r3, [r4, #8]
 8001a1e:	bf0c      	ite	eq
 8001a20:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
 8001a24:	2500      	movne	r5, #0
 8001a26:	4293      	cmp	r3, r2
 8001a28:	bfc4      	itt	gt
 8001a2a:	1a9b      	subgt	r3, r3, r2
 8001a2c:	18ed      	addgt	r5, r5, r3
 8001a2e:	2600      	movs	r6, #0
 8001a30:	341a      	adds	r4, #26
 8001a32:	42b5      	cmp	r5, r6
 8001a34:	d11a      	bne.n	8001a6c <_printf_common+0xc8>
 8001a36:	2000      	movs	r0, #0
 8001a38:	e008      	b.n	8001a4c <_printf_common+0xa8>
 8001a3a:	2301      	movs	r3, #1
 8001a3c:	4652      	mov	r2, sl
 8001a3e:	4641      	mov	r1, r8
 8001a40:	4638      	mov	r0, r7
 8001a42:	47c8      	blx	r9
 8001a44:	3001      	adds	r0, #1
 8001a46:	d103      	bne.n	8001a50 <_printf_common+0xac>
 8001a48:	f04f 30ff 	mov.w	r0, #4294967295
 8001a4c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8001a50:	3501      	adds	r5, #1
 8001a52:	e7c6      	b.n	80019e2 <_printf_common+0x3e>
 8001a54:	18e1      	adds	r1, r4, r3
 8001a56:	1c5a      	adds	r2, r3, #1
 8001a58:	2030      	movs	r0, #48	; 0x30
 8001a5a:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
 8001a5e:	4422      	add	r2, r4
 8001a60:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
 8001a64:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
 8001a68:	3302      	adds	r3, #2
 8001a6a:	e7c7      	b.n	80019fc <_printf_common+0x58>
 8001a6c:	2301      	movs	r3, #1
 8001a6e:	4622      	mov	r2, r4
 8001a70:	4641      	mov	r1, r8
 8001a72:	4638      	mov	r0, r7
 8001a74:	47c8      	blx	r9
 8001a76:	3001      	adds	r0, #1
 8001a78:	d0e6      	beq.n	8001a48 <_printf_common+0xa4>
 8001a7a:	3601      	adds	r6, #1
 8001a7c:	e7d9      	b.n	8001a32 <_printf_common+0x8e>
	...

08001a80 <_printf_i>:
 8001a80:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
 8001a84:	7e0f      	ldrb	r7, [r1, #24]
 8001a86:	9d0c      	ldr	r5, [sp, #48]	; 0x30
 8001a88:	2f78      	cmp	r7, #120	; 0x78
 8001a8a:	4691      	mov	r9, r2
 8001a8c:	4680      	mov	r8, r0
 8001a8e:	460c      	mov	r4, r1
 8001a90:	469a      	mov	sl, r3
 8001a92:	f101 0243 	add.w	r2, r1, #67	; 0x43
 8001a96:	d807      	bhi.n	8001aa8 <_printf_i+0x28>
 8001a98:	2f62      	cmp	r7, #98	; 0x62
 8001a9a:	d80a      	bhi.n	8001ab2 <_printf_i+0x32>
 8001a9c:	2f00      	cmp	r7, #0
 8001a9e:	f000 80e0 	beq.w	8001c62 <_printf_i+0x1e2>
 8001aa2:	2f58      	cmp	r7, #88	; 0x58
 8001aa4:	f000 80bb 	beq.w	8001c1e <_printf_i+0x19e>
 8001aa8:	f104 0642 	add.w	r6, r4, #66	; 0x42
 8001aac:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
 8001ab0:	e03a      	b.n	8001b28 <_printf_i+0xa8>
 8001ab2:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
 8001ab6:	2b15      	cmp	r3, #21
 8001ab8:	d8f6      	bhi.n	8001aa8 <_printf_i+0x28>
 8001aba:	a101      	add	r1, pc, #4	; (adr r1, 8001ac0 <_printf_i+0x40>)
 8001abc:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
 8001ac0:	08001b19 	.word	0x08001b19
 8001ac4:	08001b2d 	.word	0x08001b2d
 8001ac8:	08001aa9 	.word	0x08001aa9
 8001acc:	08001aa9 	.word	0x08001aa9
 8001ad0:	08001aa9 	.word	0x08001aa9
 8001ad4:	08001aa9 	.word	0x08001aa9
 8001ad8:	08001b2d 	.word	0x08001b2d
 8001adc:	08001aa9 	.word	0x08001aa9
 8001ae0:	08001aa9 	.word	0x08001aa9
 8001ae4:	08001aa9 	.word	0x08001aa9
 8001ae8:	08001aa9 	.word	0x08001aa9
 8001aec:	08001c49 	.word	0x08001c49
 8001af0:	08001bbd 	.word	0x08001bbd
 8001af4:	08001bff 	.word	0x08001bff
 8001af8:	08001aa9 	.word	0x08001aa9
 8001afc:	08001aa9 	.word	0x08001aa9
 8001b00:	08001c6b 	.word	0x08001c6b
 8001b04:	08001aa9 	.word	0x08001aa9
 8001b08:	08001bbd 	.word	0x08001bbd
 8001b0c:	08001aa9 	.word	0x08001aa9
 8001b10:	08001aa9 	.word	0x08001aa9
 8001b14:	08001c07 	.word	0x08001c07
 8001b18:	682b      	ldr	r3, [r5, #0]
 8001b1a:	1d1a      	adds	r2, r3, #4
 8001b1c:	681b      	ldr	r3, [r3, #0]
 8001b1e:	602a      	str	r2, [r5, #0]
 8001b20:	f104 0642 	add.w	r6, r4, #66	; 0x42
 8001b24:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
 8001b28:	2301      	movs	r3, #1
 8001b2a:	e0ab      	b.n	8001c84 <_printf_i+0x204>
 8001b2c:	6823      	ldr	r3, [r4, #0]
 8001b2e:	6829      	ldr	r1, [r5, #0]
 8001b30:	061f      	lsls	r7, r3, #24
 8001b32:	f101 0004 	add.w	r0, r1, #4
 8001b36:	6028      	str	r0, [r5, #0]
 8001b38:	d501      	bpl.n	8001b3e <_printf_i+0xbe>
 8001b3a:	680d      	ldr	r5, [r1, #0]
 8001b3c:	e003      	b.n	8001b46 <_printf_i+0xc6>
 8001b3e:	065e      	lsls	r6, r3, #25
 8001b40:	d5fb      	bpl.n	8001b3a <_printf_i+0xba>
 8001b42:	f9b1 5000 	ldrsh.w	r5, [r1]
 8001b46:	6861      	ldr	r1, [r4, #4]
 8001b48:	2d00      	cmp	r5, #0
 8001b4a:	da7a      	bge.n	8001c42 <_printf_i+0x1c2>
 8001b4c:	202d      	movs	r0, #45	; 0x2d
 8001b4e:	2900      	cmp	r1, #0
 8001b50:	f884 0043 	strb.w	r0, [r4, #67]	; 0x43
 8001b54:	60a1      	str	r1, [r4, #8]
 8001b56:	da2d      	bge.n	8001bb4 <_printf_i+0x134>
 8001b58:	485e      	ldr	r0, [pc, #376]	; (8001cd4 <_printf_i+0x254>)
 8001b5a:	426d      	negs	r5, r5
 8001b5c:	230a      	movs	r3, #10
 8001b5e:	4616      	mov	r6, r2
 8001b60:	fbb5 f1f3 	udiv	r1, r5, r3
 8001b64:	fb03 5711 	mls	r7, r3, r1, r5
 8001b68:	5dc7      	ldrb	r7, [r0, r7]
 8001b6a:	f806 7d01 	strb.w	r7, [r6, #-1]!
 8001b6e:	462f      	mov	r7, r5
 8001b70:	42bb      	cmp	r3, r7
 8001b72:	460d      	mov	r5, r1
 8001b74:	d9f4      	bls.n	8001b60 <_printf_i+0xe0>
 8001b76:	2b08      	cmp	r3, #8
 8001b78:	d10b      	bne.n	8001b92 <_printf_i+0x112>
 8001b7a:	6823      	ldr	r3, [r4, #0]
 8001b7c:	07df      	lsls	r7, r3, #31
 8001b7e:	d508      	bpl.n	8001b92 <_printf_i+0x112>
 8001b80:	6923      	ldr	r3, [r4, #16]
 8001b82:	6861      	ldr	r1, [r4, #4]
 8001b84:	4299      	cmp	r1, r3
 8001b86:	bfde      	ittt	le
 8001b88:	2330      	movle	r3, #48	; 0x30
 8001b8a:	f806 3c01 	strble.w	r3, [r6, #-1]
 8001b8e:	f106 36ff 	addle.w	r6, r6, #4294967295
 8001b92:	1b92      	subs	r2, r2, r6
 8001b94:	6122      	str	r2, [r4, #16]
 8001b96:	f8cd a000 	str.w	sl, [sp]
 8001b9a:	464b      	mov	r3, r9
 8001b9c:	aa03      	add	r2, sp, #12
 8001b9e:	4621      	mov	r1, r4
 8001ba0:	4640      	mov	r0, r8
 8001ba2:	f7ff feff 	bl	80019a4 <_printf_common>
 8001ba6:	3001      	adds	r0, #1
 8001ba8:	d171      	bne.n	8001c8e <_printf_i+0x20e>
 8001baa:	f04f 30ff 	mov.w	r0, #4294967295
 8001bae:	b004      	add	sp, #16
 8001bb0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8001bb4:	f023 0304 	bic.w	r3, r3, #4
 8001bb8:	6023      	str	r3, [r4, #0]
 8001bba:	e7cd      	b.n	8001b58 <_printf_i+0xd8>
 8001bbc:	682b      	ldr	r3, [r5, #0]
 8001bbe:	6820      	ldr	r0, [r4, #0]
 8001bc0:	1d19      	adds	r1, r3, #4
 8001bc2:	6029      	str	r1, [r5, #0]
 8001bc4:	0605      	lsls	r5, r0, #24
 8001bc6:	d501      	bpl.n	8001bcc <_printf_i+0x14c>
 8001bc8:	681d      	ldr	r5, [r3, #0]
 8001bca:	e002      	b.n	8001bd2 <_printf_i+0x152>
 8001bcc:	0641      	lsls	r1, r0, #25
 8001bce:	d5fb      	bpl.n	8001bc8 <_printf_i+0x148>
 8001bd0:	881d      	ldrh	r5, [r3, #0]
 8001bd2:	4840      	ldr	r0, [pc, #256]	; (8001cd4 <_printf_i+0x254>)
 8001bd4:	2f6f      	cmp	r7, #111	; 0x6f
 8001bd6:	bf14      	ite	ne
 8001bd8:	230a      	movne	r3, #10
 8001bda:	2308      	moveq	r3, #8
 8001bdc:	2100      	movs	r1, #0
 8001bde:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
 8001be2:	6866      	ldr	r6, [r4, #4]
 8001be4:	60a6      	str	r6, [r4, #8]
 8001be6:	2e00      	cmp	r6, #0
 8001be8:	dbb9      	blt.n	8001b5e <_printf_i+0xde>
 8001bea:	6821      	ldr	r1, [r4, #0]
 8001bec:	f021 0104 	bic.w	r1, r1, #4
 8001bf0:	6021      	str	r1, [r4, #0]
 8001bf2:	2d00      	cmp	r5, #0
 8001bf4:	d1b3      	bne.n	8001b5e <_printf_i+0xde>
 8001bf6:	2e00      	cmp	r6, #0
 8001bf8:	d1b1      	bne.n	8001b5e <_printf_i+0xde>
 8001bfa:	4616      	mov	r6, r2
 8001bfc:	e7bb      	b.n	8001b76 <_printf_i+0xf6>
 8001bfe:	6823      	ldr	r3, [r4, #0]
 8001c00:	f043 0320 	orr.w	r3, r3, #32
 8001c04:	6023      	str	r3, [r4, #0]
 8001c06:	4834      	ldr	r0, [pc, #208]	; (8001cd8 <_printf_i+0x258>)
 8001c08:	2778      	movs	r7, #120	; 0x78
 8001c0a:	f884 7045 	strb.w	r7, [r4, #69]	; 0x45
 8001c0e:	6829      	ldr	r1, [r5, #0]
 8001c10:	6823      	ldr	r3, [r4, #0]
 8001c12:	1d0e      	adds	r6, r1, #4
 8001c14:	602e      	str	r6, [r5, #0]
 8001c16:	061e      	lsls	r6, r3, #24
 8001c18:	d503      	bpl.n	8001c22 <_printf_i+0x1a2>
 8001c1a:	680d      	ldr	r5, [r1, #0]
 8001c1c:	e004      	b.n	8001c28 <_printf_i+0x1a8>
 8001c1e:	482d      	ldr	r0, [pc, #180]	; (8001cd4 <_printf_i+0x254>)
 8001c20:	e7f3      	b.n	8001c0a <_printf_i+0x18a>
 8001c22:	065d      	lsls	r5, r3, #25
 8001c24:	d5f9      	bpl.n	8001c1a <_printf_i+0x19a>
 8001c26:	880d      	ldrh	r5, [r1, #0]
 8001c28:	07d9      	lsls	r1, r3, #31
 8001c2a:	bf44      	itt	mi
 8001c2c:	f043 0320 	orrmi.w	r3, r3, #32
 8001c30:	6023      	strmi	r3, [r4, #0]
 8001c32:	b10d      	cbz	r5, 8001c38 <_printf_i+0x1b8>
 8001c34:	2310      	movs	r3, #16
 8001c36:	e7d1      	b.n	8001bdc <_printf_i+0x15c>
 8001c38:	6823      	ldr	r3, [r4, #0]
 8001c3a:	f023 0320 	bic.w	r3, r3, #32
 8001c3e:	6023      	str	r3, [r4, #0]
 8001c40:	e7f8      	b.n	8001c34 <_printf_i+0x1b4>
 8001c42:	4824      	ldr	r0, [pc, #144]	; (8001cd4 <_printf_i+0x254>)
 8001c44:	230a      	movs	r3, #10
 8001c46:	e7cc      	b.n	8001be2 <_printf_i+0x162>
 8001c48:	682b      	ldr	r3, [r5, #0]
 8001c4a:	6826      	ldr	r6, [r4, #0]
 8001c4c:	6961      	ldr	r1, [r4, #20]
 8001c4e:	1d18      	adds	r0, r3, #4
 8001c50:	6028      	str	r0, [r5, #0]
 8001c52:	0635      	lsls	r5, r6, #24
 8001c54:	681b      	ldr	r3, [r3, #0]
 8001c56:	d501      	bpl.n	8001c5c <_printf_i+0x1dc>
 8001c58:	6019      	str	r1, [r3, #0]
 8001c5a:	e002      	b.n	8001c62 <_printf_i+0x1e2>
 8001c5c:	0670      	lsls	r0, r6, #25
 8001c5e:	d5fb      	bpl.n	8001c58 <_printf_i+0x1d8>
 8001c60:	8019      	strh	r1, [r3, #0]
 8001c62:	2300      	movs	r3, #0
 8001c64:	6123      	str	r3, [r4, #16]
 8001c66:	4616      	mov	r6, r2
 8001c68:	e795      	b.n	8001b96 <_printf_i+0x116>
 8001c6a:	682b      	ldr	r3, [r5, #0]
 8001c6c:	1d1a      	adds	r2, r3, #4
 8001c6e:	602a      	str	r2, [r5, #0]
 8001c70:	681e      	ldr	r6, [r3, #0]
 8001c72:	6862      	ldr	r2, [r4, #4]
 8001c74:	2100      	movs	r1, #0
 8001c76:	4630      	mov	r0, r6
 8001c78:	f7fe ff82 	bl	8000b80 <memchr>
 8001c7c:	b108      	cbz	r0, 8001c82 <_printf_i+0x202>
 8001c7e:	1b80      	subs	r0, r0, r6
 8001c80:	6060      	str	r0, [r4, #4]
 8001c82:	6863      	ldr	r3, [r4, #4]
 8001c84:	6123      	str	r3, [r4, #16]
 8001c86:	2300      	movs	r3, #0
 8001c88:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 8001c8c:	e783      	b.n	8001b96 <_printf_i+0x116>
 8001c8e:	6923      	ldr	r3, [r4, #16]
 8001c90:	4632      	mov	r2, r6
 8001c92:	4649      	mov	r1, r9
 8001c94:	4640      	mov	r0, r8
 8001c96:	47d0      	blx	sl
 8001c98:	3001      	adds	r0, #1
 8001c9a:	d086      	beq.n	8001baa <_printf_i+0x12a>
 8001c9c:	6823      	ldr	r3, [r4, #0]
 8001c9e:	079b      	lsls	r3, r3, #30
 8001ca0:	d414      	bmi.n	8001ccc <_printf_i+0x24c>
 8001ca2:	68e0      	ldr	r0, [r4, #12]
 8001ca4:	9b03      	ldr	r3, [sp, #12]
 8001ca6:	4298      	cmp	r0, r3
 8001ca8:	bfb8      	it	lt
 8001caa:	4618      	movlt	r0, r3
 8001cac:	e77f      	b.n	8001bae <_printf_i+0x12e>
 8001cae:	2301      	movs	r3, #1
 8001cb0:	4632      	mov	r2, r6
 8001cb2:	4649      	mov	r1, r9
 8001cb4:	4640      	mov	r0, r8
 8001cb6:	47d0      	blx	sl
 8001cb8:	3001      	adds	r0, #1
 8001cba:	f43f af76 	beq.w	8001baa <_printf_i+0x12a>
 8001cbe:	3501      	adds	r5, #1
 8001cc0:	68e3      	ldr	r3, [r4, #12]
 8001cc2:	9903      	ldr	r1, [sp, #12]
 8001cc4:	1a5b      	subs	r3, r3, r1
 8001cc6:	42ab      	cmp	r3, r5
 8001cc8:	dcf1      	bgt.n	8001cae <_printf_i+0x22e>
 8001cca:	e7ea      	b.n	8001ca2 <_printf_i+0x222>
 8001ccc:	2500      	movs	r5, #0
 8001cce:	f104 0619 	add.w	r6, r4, #25
 8001cd2:	e7f5      	b.n	8001cc0 <_printf_i+0x240>
 8001cd4:	08002212 	.word	0x08002212
 8001cd8:	08002223 	.word	0x08002223

08001cdc <__sflush_r>:
 8001cdc:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
 8001ce0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001ce2:	0717      	lsls	r7, r2, #28
 8001ce4:	4605      	mov	r5, r0
 8001ce6:	460c      	mov	r4, r1
 8001ce8:	d456      	bmi.n	8001d98 <__sflush_r+0xbc>
 8001cea:	684b      	ldr	r3, [r1, #4]
 8001cec:	2b00      	cmp	r3, #0
 8001cee:	dc02      	bgt.n	8001cf6 <__sflush_r+0x1a>
 8001cf0:	6c0b      	ldr	r3, [r1, #64]	; 0x40
 8001cf2:	2b00      	cmp	r3, #0
 8001cf4:	dd3d      	ble.n	8001d72 <__sflush_r+0x96>
 8001cf6:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 8001cf8:	2e00      	cmp	r6, #0
 8001cfa:	d03a      	beq.n	8001d72 <__sflush_r+0x96>
 8001cfc:	2300      	movs	r3, #0
 8001cfe:	f412 5280 	ands.w	r2, r2, #4096	; 0x1000
 8001d02:	682f      	ldr	r7, [r5, #0]
 8001d04:	6a21      	ldr	r1, [r4, #32]
 8001d06:	602b      	str	r3, [r5, #0]
 8001d08:	d025      	beq.n	8001d56 <__sflush_r+0x7a>
 8001d0a:	6d62      	ldr	r2, [r4, #84]	; 0x54
 8001d0c:	89a3      	ldrh	r3, [r4, #12]
 8001d0e:	0758      	lsls	r0, r3, #29
 8001d10:	d505      	bpl.n	8001d1e <__sflush_r+0x42>
 8001d12:	6863      	ldr	r3, [r4, #4]
 8001d14:	1ad2      	subs	r2, r2, r3
 8001d16:	6b63      	ldr	r3, [r4, #52]	; 0x34
 8001d18:	b10b      	cbz	r3, 8001d1e <__sflush_r+0x42>
 8001d1a:	6c23      	ldr	r3, [r4, #64]	; 0x40
 8001d1c:	1ad2      	subs	r2, r2, r3
 8001d1e:	6a21      	ldr	r1, [r4, #32]
 8001d20:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 8001d22:	2300      	movs	r3, #0
 8001d24:	4628      	mov	r0, r5
 8001d26:	47b0      	blx	r6
 8001d28:	1c41      	adds	r1, r0, #1
 8001d2a:	d024      	beq.n	8001d76 <__sflush_r+0x9a>
 8001d2c:	2300      	movs	r3, #0
 8001d2e:	6063      	str	r3, [r4, #4]
 8001d30:	6923      	ldr	r3, [r4, #16]
 8001d32:	6023      	str	r3, [r4, #0]
 8001d34:	89a3      	ldrh	r3, [r4, #12]
 8001d36:	04da      	lsls	r2, r3, #19
 8001d38:	d500      	bpl.n	8001d3c <__sflush_r+0x60>
 8001d3a:	6560      	str	r0, [r4, #84]	; 0x54
 8001d3c:	6b61      	ldr	r1, [r4, #52]	; 0x34
 8001d3e:	602f      	str	r7, [r5, #0]
 8001d40:	b1b9      	cbz	r1, 8001d72 <__sflush_r+0x96>
 8001d42:	f104 0344 	add.w	r3, r4, #68	; 0x44
 8001d46:	4299      	cmp	r1, r3
 8001d48:	d002      	beq.n	8001d50 <__sflush_r+0x74>
 8001d4a:	4628      	mov	r0, r5
 8001d4c:	f7ff fb6e 	bl	800142c <_free_r>
 8001d50:	2300      	movs	r3, #0
 8001d52:	6363      	str	r3, [r4, #52]	; 0x34
 8001d54:	e00d      	b.n	8001d72 <__sflush_r+0x96>
 8001d56:	2301      	movs	r3, #1
 8001d58:	4628      	mov	r0, r5
 8001d5a:	47b0      	blx	r6
 8001d5c:	1c46      	adds	r6, r0, #1
 8001d5e:	4602      	mov	r2, r0
 8001d60:	d1d4      	bne.n	8001d0c <__sflush_r+0x30>
 8001d62:	682b      	ldr	r3, [r5, #0]
 8001d64:	2b00      	cmp	r3, #0
 8001d66:	d0d1      	beq.n	8001d0c <__sflush_r+0x30>
 8001d68:	2b1d      	cmp	r3, #29
 8001d6a:	d001      	beq.n	8001d70 <__sflush_r+0x94>
 8001d6c:	2b16      	cmp	r3, #22
 8001d6e:	d12a      	bne.n	8001dc6 <__sflush_r+0xea>
 8001d70:	602f      	str	r7, [r5, #0]
 8001d72:	2000      	movs	r0, #0
 8001d74:	e02e      	b.n	8001dd4 <__sflush_r+0xf8>
 8001d76:	682a      	ldr	r2, [r5, #0]
 8001d78:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001d7c:	b142      	cbz	r2, 8001d90 <__sflush_r+0xb4>
 8001d7e:	2a1d      	cmp	r2, #29
 8001d80:	d001      	beq.n	8001d86 <__sflush_r+0xaa>
 8001d82:	2a16      	cmp	r2, #22
 8001d84:	d121      	bne.n	8001dca <__sflush_r+0xee>
 8001d86:	2300      	movs	r3, #0
 8001d88:	6063      	str	r3, [r4, #4]
 8001d8a:	6923      	ldr	r3, [r4, #16]
 8001d8c:	6023      	str	r3, [r4, #0]
 8001d8e:	e7d5      	b.n	8001d3c <__sflush_r+0x60>
 8001d90:	6062      	str	r2, [r4, #4]
 8001d92:	6922      	ldr	r2, [r4, #16]
 8001d94:	6022      	str	r2, [r4, #0]
 8001d96:	e7ce      	b.n	8001d36 <__sflush_r+0x5a>
 8001d98:	690f      	ldr	r7, [r1, #16]
 8001d9a:	2f00      	cmp	r7, #0
 8001d9c:	d0e9      	beq.n	8001d72 <__sflush_r+0x96>
 8001d9e:	0793      	lsls	r3, r2, #30
 8001da0:	680e      	ldr	r6, [r1, #0]
 8001da2:	bf08      	it	eq
 8001da4:	694b      	ldreq	r3, [r1, #20]
 8001da6:	600f      	str	r7, [r1, #0]
 8001da8:	bf18      	it	ne
 8001daa:	2300      	movne	r3, #0
 8001dac:	1bf6      	subs	r6, r6, r7
 8001dae:	608b      	str	r3, [r1, #8]
 8001db0:	2e00      	cmp	r6, #0
 8001db2:	ddde      	ble.n	8001d72 <__sflush_r+0x96>
 8001db4:	6a21      	ldr	r1, [r4, #32]
 8001db6:	f8d4 c028 	ldr.w	ip, [r4, #40]	; 0x28
 8001dba:	4633      	mov	r3, r6
 8001dbc:	463a      	mov	r2, r7
 8001dbe:	4628      	mov	r0, r5
 8001dc0:	47e0      	blx	ip
 8001dc2:	2800      	cmp	r0, #0
 8001dc4:	dc07      	bgt.n	8001dd6 <__sflush_r+0xfa>
 8001dc6:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001dca:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8001dce:	81a3      	strh	r3, [r4, #12]
 8001dd0:	f04f 30ff 	mov.w	r0, #4294967295
 8001dd4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001dd6:	4407      	add	r7, r0
 8001dd8:	1a36      	subs	r6, r6, r0
 8001dda:	e7e9      	b.n	8001db0 <__sflush_r+0xd4>

08001ddc <_fflush_r>:
 8001ddc:	b538      	push	{r3, r4, r5, lr}
 8001dde:	690b      	ldr	r3, [r1, #16]
 8001de0:	4605      	mov	r5, r0
 8001de2:	460c      	mov	r4, r1
 8001de4:	b913      	cbnz	r3, 8001dec <_fflush_r+0x10>
 8001de6:	2500      	movs	r5, #0
 8001de8:	4628      	mov	r0, r5
 8001dea:	bd38      	pop	{r3, r4, r5, pc}
 8001dec:	b118      	cbz	r0, 8001df6 <_fflush_r+0x1a>
 8001dee:	6a03      	ldr	r3, [r0, #32]
 8001df0:	b90b      	cbnz	r3, 8001df6 <_fflush_r+0x1a>
 8001df2:	f7ff f851 	bl	8000e98 <__sinit>
 8001df6:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001dfa:	2b00      	cmp	r3, #0
 8001dfc:	d0f3      	beq.n	8001de6 <_fflush_r+0xa>
 8001dfe:	6e62      	ldr	r2, [r4, #100]	; 0x64
 8001e00:	07d0      	lsls	r0, r2, #31
 8001e02:	d404      	bmi.n	8001e0e <_fflush_r+0x32>
 8001e04:	0599      	lsls	r1, r3, #22
 8001e06:	d402      	bmi.n	8001e0e <_fflush_r+0x32>
 8001e08:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8001e0a:	f7ff fb08 	bl	800141e <__retarget_lock_acquire_recursive>
 8001e0e:	4628      	mov	r0, r5
 8001e10:	4621      	mov	r1, r4
 8001e12:	f7ff ff63 	bl	8001cdc <__sflush_r>
 8001e16:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8001e18:	07da      	lsls	r2, r3, #31
 8001e1a:	4605      	mov	r5, r0
 8001e1c:	d4e4      	bmi.n	8001de8 <_fflush_r+0xc>
 8001e1e:	89a3      	ldrh	r3, [r4, #12]
 8001e20:	059b      	lsls	r3, r3, #22
 8001e22:	d4e1      	bmi.n	8001de8 <_fflush_r+0xc>
 8001e24:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8001e26:	f7ff fb00 	bl	800142a <__retarget_lock_release_recursive>
 8001e2a:	e7dd      	b.n	8001de8 <_fflush_r+0xc>

08001e2c <fflush>:
 8001e2c:	4601      	mov	r1, r0
 8001e2e:	b920      	cbnz	r0, 8001e3a <fflush+0xe>
 8001e30:	4a04      	ldr	r2, [pc, #16]	; (8001e44 <fflush+0x18>)
 8001e32:	4905      	ldr	r1, [pc, #20]	; (8001e48 <fflush+0x1c>)
 8001e34:	4805      	ldr	r0, [pc, #20]	; (8001e4c <fflush+0x20>)
 8001e36:	f7ff b863 	b.w	8000f00 <_fwalk_sglue>
 8001e3a:	4b05      	ldr	r3, [pc, #20]	; (8001e50 <fflush+0x24>)
 8001e3c:	6818      	ldr	r0, [r3, #0]
 8001e3e:	f7ff bfcd 	b.w	8001ddc <_fflush_r>
 8001e42:	bf00      	nop
 8001e44:	20000020 	.word	0x20000020
 8001e48:	08001ddd 	.word	0x08001ddd
 8001e4c:	20000030 	.word	0x20000030
 8001e50:	2000002c 	.word	0x2000002c

08001e54 <__swhatbuf_r>:
 8001e54:	b570      	push	{r4, r5, r6, lr}
 8001e56:	460c      	mov	r4, r1
 8001e58:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001e5c:	2900      	cmp	r1, #0
 8001e5e:	b096      	sub	sp, #88	; 0x58
 8001e60:	4615      	mov	r5, r2
 8001e62:	461e      	mov	r6, r3
 8001e64:	da0d      	bge.n	8001e82 <__swhatbuf_r+0x2e>
 8001e66:	89a3      	ldrh	r3, [r4, #12]
 8001e68:	f013 0f80 	tst.w	r3, #128	; 0x80
 8001e6c:	f04f 0100 	mov.w	r1, #0
 8001e70:	bf14      	ite	ne
 8001e72:	2340      	movne	r3, #64	; 0x40
 8001e74:	f44f 6380 	moveq.w	r3, #1024	; 0x400
 8001e78:	2000      	movs	r0, #0
 8001e7a:	6031      	str	r1, [r6, #0]
 8001e7c:	602b      	str	r3, [r5, #0]
 8001e7e:	b016      	add	sp, #88	; 0x58
 8001e80:	bd70      	pop	{r4, r5, r6, pc}
 8001e82:	466a      	mov	r2, sp
 8001e84:	f000 f862 	bl	8001f4c <_fstat_r>
 8001e88:	2800      	cmp	r0, #0
 8001e8a:	dbec      	blt.n	8001e66 <__swhatbuf_r+0x12>
 8001e8c:	9901      	ldr	r1, [sp, #4]
 8001e8e:	f401 4170 	and.w	r1, r1, #61440	; 0xf000
 8001e92:	f5a1 5300 	sub.w	r3, r1, #8192	; 0x2000
 8001e96:	4259      	negs	r1, r3
 8001e98:	4159      	adcs	r1, r3
 8001e9a:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8001e9e:	e7eb      	b.n	8001e78 <__swhatbuf_r+0x24>

08001ea0 <__smakebuf_r>:
 8001ea0:	898b      	ldrh	r3, [r1, #12]
 8001ea2:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001ea4:	079d      	lsls	r5, r3, #30
 8001ea6:	4606      	mov	r6, r0
 8001ea8:	460c      	mov	r4, r1
 8001eaa:	d507      	bpl.n	8001ebc <__smakebuf_r+0x1c>
 8001eac:	f104 0347 	add.w	r3, r4, #71	; 0x47
 8001eb0:	6023      	str	r3, [r4, #0]
 8001eb2:	6123      	str	r3, [r4, #16]
 8001eb4:	2301      	movs	r3, #1
 8001eb6:	6163      	str	r3, [r4, #20]
 8001eb8:	b003      	add	sp, #12
 8001eba:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001ebc:	ab01      	add	r3, sp, #4
 8001ebe:	466a      	mov	r2, sp
 8001ec0:	f7ff ffc8 	bl	8001e54 <__swhatbuf_r>
 8001ec4:	9f00      	ldr	r7, [sp, #0]
 8001ec6:	4605      	mov	r5, r0
 8001ec8:	4639      	mov	r1, r7
 8001eca:	4630      	mov	r0, r6
 8001ecc:	f7ff fb1a 	bl	8001504 <_malloc_r>
 8001ed0:	b948      	cbnz	r0, 8001ee6 <__smakebuf_r+0x46>
 8001ed2:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001ed6:	059a      	lsls	r2, r3, #22
 8001ed8:	d4ee      	bmi.n	8001eb8 <__smakebuf_r+0x18>
 8001eda:	f023 0303 	bic.w	r3, r3, #3
 8001ede:	f043 0302 	orr.w	r3, r3, #2
 8001ee2:	81a3      	strh	r3, [r4, #12]
 8001ee4:	e7e2      	b.n	8001eac <__smakebuf_r+0xc>
 8001ee6:	89a3      	ldrh	r3, [r4, #12]
 8001ee8:	6020      	str	r0, [r4, #0]
 8001eea:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8001eee:	81a3      	strh	r3, [r4, #12]
 8001ef0:	9b01      	ldr	r3, [sp, #4]
 8001ef2:	e9c4 0704 	strd	r0, r7, [r4, #16]
 8001ef6:	b15b      	cbz	r3, 8001f10 <__smakebuf_r+0x70>
 8001ef8:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
 8001efc:	4630      	mov	r0, r6
 8001efe:	f000 f837 	bl	8001f70 <_isatty_r>
 8001f02:	b128      	cbz	r0, 8001f10 <__smakebuf_r+0x70>
 8001f04:	89a3      	ldrh	r3, [r4, #12]
 8001f06:	f023 0303 	bic.w	r3, r3, #3
 8001f0a:	f043 0301 	orr.w	r3, r3, #1
 8001f0e:	81a3      	strh	r3, [r4, #12]
 8001f10:	89a3      	ldrh	r3, [r4, #12]
 8001f12:	431d      	orrs	r5, r3
 8001f14:	81a5      	strh	r5, [r4, #12]
 8001f16:	e7cf      	b.n	8001eb8 <__smakebuf_r+0x18>

08001f18 <memmove>:
 8001f18:	4288      	cmp	r0, r1
 8001f1a:	b510      	push	{r4, lr}
 8001f1c:	eb01 0402 	add.w	r4, r1, r2
 8001f20:	d902      	bls.n	8001f28 <memmove+0x10>
 8001f22:	4284      	cmp	r4, r0
 8001f24:	4623      	mov	r3, r4
 8001f26:	d807      	bhi.n	8001f38 <memmove+0x20>
 8001f28:	1e43      	subs	r3, r0, #1
 8001f2a:	42a1      	cmp	r1, r4
 8001f2c:	d008      	beq.n	8001f40 <memmove+0x28>
 8001f2e:	f811 2b01 	ldrb.w	r2, [r1], #1
 8001f32:	f803 2f01 	strb.w	r2, [r3, #1]!
 8001f36:	e7f8      	b.n	8001f2a <memmove+0x12>
 8001f38:	4402      	add	r2, r0
 8001f3a:	4601      	mov	r1, r0
 8001f3c:	428a      	cmp	r2, r1
 8001f3e:	d100      	bne.n	8001f42 <memmove+0x2a>
 8001f40:	bd10      	pop	{r4, pc}
 8001f42:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
 8001f46:	f802 4d01 	strb.w	r4, [r2, #-1]!
 8001f4a:	e7f7      	b.n	8001f3c <memmove+0x24>

08001f4c <_fstat_r>:
 8001f4c:	b538      	push	{r3, r4, r5, lr}
 8001f4e:	4d07      	ldr	r5, [pc, #28]	; (8001f6c <_fstat_r+0x20>)
 8001f50:	2300      	movs	r3, #0
 8001f52:	4604      	mov	r4, r0
 8001f54:	4608      	mov	r0, r1
 8001f56:	4611      	mov	r1, r2
 8001f58:	602b      	str	r3, [r5, #0]
 8001f5a:	f7fe fc69 	bl	8000830 <_fstat>
 8001f5e:	1c43      	adds	r3, r0, #1
 8001f60:	d102      	bne.n	8001f68 <_fstat_r+0x1c>
 8001f62:	682b      	ldr	r3, [r5, #0]
 8001f64:	b103      	cbz	r3, 8001f68 <_fstat_r+0x1c>
 8001f66:	6023      	str	r3, [r4, #0]
 8001f68:	bd38      	pop	{r3, r4, r5, pc}
 8001f6a:	bf00      	nop
 8001f6c:	200001e4 	.word	0x200001e4

08001f70 <_isatty_r>:
 8001f70:	b538      	push	{r3, r4, r5, lr}
 8001f72:	4d06      	ldr	r5, [pc, #24]	; (8001f8c <_isatty_r+0x1c>)
 8001f74:	2300      	movs	r3, #0
 8001f76:	4604      	mov	r4, r0
 8001f78:	4608      	mov	r0, r1
 8001f7a:	602b      	str	r3, [r5, #0]
 8001f7c:	f7fe fc64 	bl	8000848 <_isatty>
 8001f80:	1c43      	adds	r3, r0, #1
 8001f82:	d102      	bne.n	8001f8a <_isatty_r+0x1a>
 8001f84:	682b      	ldr	r3, [r5, #0]
 8001f86:	b103      	cbz	r3, 8001f8a <_isatty_r+0x1a>
 8001f88:	6023      	str	r3, [r4, #0]
 8001f8a:	bd38      	pop	{r3, r4, r5, pc}
 8001f8c:	200001e4 	.word	0x200001e4

08001f90 <_sbrk_r>:
 8001f90:	b538      	push	{r3, r4, r5, lr}
 8001f92:	4d06      	ldr	r5, [pc, #24]	; (8001fac <_sbrk_r+0x1c>)
 8001f94:	2300      	movs	r3, #0
 8001f96:	4604      	mov	r4, r0
 8001f98:	4608      	mov	r0, r1
 8001f9a:	602b      	str	r3, [r5, #0]
 8001f9c:	f7fe fc9e 	bl	80008dc <_sbrk>
 8001fa0:	1c43      	adds	r3, r0, #1
 8001fa2:	d102      	bne.n	8001faa <_sbrk_r+0x1a>
 8001fa4:	682b      	ldr	r3, [r5, #0]
 8001fa6:	b103      	cbz	r3, 8001faa <_sbrk_r+0x1a>
 8001fa8:	6023      	str	r3, [r4, #0]
 8001faa:	bd38      	pop	{r3, r4, r5, pc}
 8001fac:	200001e4 	.word	0x200001e4

08001fb0 <memcpy>:
 8001fb0:	440a      	add	r2, r1
 8001fb2:	4291      	cmp	r1, r2
 8001fb4:	f100 33ff 	add.w	r3, r0, #4294967295
 8001fb8:	d100      	bne.n	8001fbc <memcpy+0xc>
 8001fba:	4770      	bx	lr
 8001fbc:	b510      	push	{r4, lr}
 8001fbe:	f811 4b01 	ldrb.w	r4, [r1], #1
 8001fc2:	f803 4f01 	strb.w	r4, [r3, #1]!
 8001fc6:	4291      	cmp	r1, r2
 8001fc8:	d1f9      	bne.n	8001fbe <memcpy+0xe>
 8001fca:	bd10      	pop	{r4, pc}

08001fcc <_realloc_r>:
 8001fcc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001fd0:	4680      	mov	r8, r0
 8001fd2:	4615      	mov	r5, r2
 8001fd4:	460c      	mov	r4, r1
 8001fd6:	b921      	cbnz	r1, 8001fe2 <_realloc_r+0x16>
 8001fd8:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 8001fdc:	4611      	mov	r1, r2
 8001fde:	f7ff ba91 	b.w	8001504 <_malloc_r>
 8001fe2:	b92a      	cbnz	r2, 8001ff0 <_realloc_r+0x24>
 8001fe4:	f7ff fa22 	bl	800142c <_free_r>
 8001fe8:	2400      	movs	r4, #0
 8001fea:	4620      	mov	r0, r4
 8001fec:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001ff0:	f000 f81a 	bl	8002028 <_malloc_usable_size_r>
 8001ff4:	4285      	cmp	r5, r0
 8001ff6:	4606      	mov	r6, r0
 8001ff8:	d802      	bhi.n	8002000 <_realloc_r+0x34>
 8001ffa:	ebb5 0f50 	cmp.w	r5, r0, lsr #1
 8001ffe:	d8f4      	bhi.n	8001fea <_realloc_r+0x1e>
 8002000:	4629      	mov	r1, r5
 8002002:	4640      	mov	r0, r8
 8002004:	f7ff fa7e 	bl	8001504 <_malloc_r>
 8002008:	4607      	mov	r7, r0
 800200a:	2800      	cmp	r0, #0
 800200c:	d0ec      	beq.n	8001fe8 <_realloc_r+0x1c>
 800200e:	42b5      	cmp	r5, r6
 8002010:	462a      	mov	r2, r5
 8002012:	4621      	mov	r1, r4
 8002014:	bf28      	it	cs
 8002016:	4632      	movcs	r2, r6
 8002018:	f7ff ffca 	bl	8001fb0 <memcpy>
 800201c:	4621      	mov	r1, r4
 800201e:	4640      	mov	r0, r8
 8002020:	f7ff fa04 	bl	800142c <_free_r>
 8002024:	463c      	mov	r4, r7
 8002026:	e7e0      	b.n	8001fea <_realloc_r+0x1e>

08002028 <_malloc_usable_size_r>:
 8002028:	f851 3c04 	ldr.w	r3, [r1, #-4]
 800202c:	1f18      	subs	r0, r3, #4
 800202e:	2b00      	cmp	r3, #0
 8002030:	bfbc      	itt	lt
 8002032:	580b      	ldrlt	r3, [r1, r0]
 8002034:	18c0      	addlt	r0, r0, r3
 8002036:	4770      	bx	lr
 8002038:	6c6c6568 	.word	0x6c6c6568
 800203c:	6f77206f 	.word	0x6f77206f
 8002040:	00646c72 	.word	0x00646c72
 8002044:	5f696d6e 	.word	0x5f696d6e
 8002048:	646e6168 	.word	0x646e6168
 800204c:	0072656c 	.word	0x0072656c
 8002050:	5f717269 	.word	0x5f717269
 8002054:	7473696c 	.word	0x7473696c
 8002058:	00000000 	.word	0x00000000
 800205c:	64726168 	.word	0x64726168
 8002060:	6c756166 	.word	0x6c756166
 8002064:	61685f74 	.word	0x61685f74
 8002068:	656c646e 	.word	0x656c646e
 800206c:	00000072 	.word	0x00000072
 8002070:	73616c66 	.word	0x73616c66
 8002074:	3e2d2068 	.word	0x3e2d2068
 8002078:	61727320 	.word	0x61727320
 800207c:	30203a6d 	.word	0x30203a6d
 8002080:	586c2578 	.word	0x586c2578
 8002084:	203e2d20 	.word	0x203e2d20
 8002088:	6c257830 	.word	0x6c257830
 800208c:	00000058 	.word	0x00000058
 8002090:	72646461 	.word	0x72646461
 8002094:	7025203a 	.word	0x7025203a
 8002098:	63656409 	.word	0x63656409
 800209c:	25203a6d 	.word	0x25203a6d
 80020a0:	68630964 	.word	0x68630964
 80020a4:	203a7261 	.word	0x203a7261
 80020a8:	00006325 	.word	0x00006325
 80020ac:	504d5544 	.word	0x504d5544
 80020b0:	00000000 	.word	0x00000000
 80020b4:	0000000a 	.word	0x0000000a
 80020b8:	52415355 	.word	0x52415355
 80020bc:	00003154 	.word	0x00003154
 80020c0:	52415355 	.word	0x52415355
 80020c4:	00003254 	.word	0x00003254
 80020c8:	4e4b4e55 	.word	0x4e4b4e55
 80020cc:	204e574f 	.word	0x204e574f
 80020d0:	4e414843 	.word	0x4e414843
 80020d4:	004c454e 	.word	0x004c454e
 80020d8:	0000203a 	.word	0x0000203a

080020dc <all_implied_fbits>:
 80020dc:	410c413e 41274111 41034136 41154106     >A.A.A'A6A.A.A.A
 80020ec:	410e410f 41134126 41024129 410a4119     .A.A&A.A)A.A.A.A
 80020fc:	0000410b                                .A..

08002100 <_ctype_>:
 8002100:	20202000 20202020 28282020 20282828     .         ((((( 
 8002110:	20202020 20202020 20202020 20202020                     
 8002120:	10108820 10101010 10101010 10101010      ...............
 8002130:	04040410 04040404 10040404 10101010     ................
 8002140:	41411010 41414141 01010101 01010101     ..AAAAAA........
 8002150:	01010101 01010101 01010101 10101010     ................
 8002160:	42421010 42424242 02020202 02020202     ..BBBBBB........
 8002170:	02020202 02020202 02020202 10101010     ................
 8002180:	00000020 00000000 00000000 00000000      ...............
	...
 8002200:	302d2300 6800202b 65004c6c 46456766     .#-0+ .hlL.efgEF
 8002210:	31300047 35343332 39383736 44434241     G.0123456789ABCD
 8002220:	30004645 34333231 38373635 63626139     EF.0123456789abc
 8002230:	00666564                                def.

08002234 <all_implied_fbits>:
 8002234:	410c413e 41274111 41034136 41154106     >A.A.A'A6A.A.A.A
 8002244:	410e410f 41134126 41024129 410a4119     .A.A&A.A)A.A.A.A
 8002254:	0000410b                                .A..

08002258 <_init>:
 8002258:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800225a:	bf00      	nop
 800225c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800225e:	bc08      	pop	{r3}
 8002260:	469e      	mov	lr, r3
 8002262:	4770      	bx	lr

08002264 <_fini>:
 8002264:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002266:	bf00      	nop
 8002268:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800226a:	bc08      	pop	{r3}
 800226c:	469e      	mov	lr, r3
 800226e:	4770      	bx	lr

08002270 <__EH_FRAME_BEGIN__>:
 8002270:	0010 0000 0000 0000 7a01 0052 7c02 010e     .........zR..|..
 8002280:	0c1b 000d 0010 0000 0018 0000 e8e0 ffff     ................
 8002290:	0010 0000 4700 000e 0010 0000 0000 0000     .....G..........
 80022a0:	7a01 0052 7c02 010e 0c1b 000d 002c 0000     .zR..|......,...
 80022b0:	0018 0000 e8cc ffff 009e 0000 5100 100e     .............Q..
 80022c0:	0484 0385 0286 0187 c75b c5c6 0ec4 4d00     ........[......M
 80022d0:	000e 0e42 5300 c6c7 c4c5 000e               ..B..S......

080022dc <__FRAME_END__>:
 80022dc:	0000 0000 de00 7fff 0001 0000               ............
