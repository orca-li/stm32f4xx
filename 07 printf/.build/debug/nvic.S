
.build/binary/nvic.elf:     file format elf32-littlearm


Disassembly of section .text:

080000e0 <__do_global_dtors_aux>:
 80000e0:	b510      	push	{r4, lr}
 80000e2:	4c05      	ldr	r4, [pc, #20]	; (80000f8 <__do_global_dtors_aux+0x18>)
 80000e4:	7823      	ldrb	r3, [r4, #0]
 80000e6:	b933      	cbnz	r3, 80000f6 <__do_global_dtors_aux+0x16>
 80000e8:	4b04      	ldr	r3, [pc, #16]	; (80000fc <__do_global_dtors_aux+0x1c>)
 80000ea:	b113      	cbz	r3, 80000f2 <__do_global_dtors_aux+0x12>
 80000ec:	4804      	ldr	r0, [pc, #16]	; (8000100 <__do_global_dtors_aux+0x20>)
 80000ee:	f3af 8000 	nop.w
 80000f2:	2301      	movs	r3, #1
 80000f4:	7023      	strb	r3, [r4, #0]
 80000f6:	bd10      	pop	{r4, pc}
 80000f8:	20000084 	.word	0x20000084
 80000fc:	00000000 	.word	0x00000000
 8000100:	08001f1c 	.word	0x08001f1c

08000104 <frame_dummy>:
 8000104:	b508      	push	{r3, lr}
 8000106:	4b03      	ldr	r3, [pc, #12]	; (8000114 <frame_dummy+0x10>)
 8000108:	b11b      	cbz	r3, 8000112 <frame_dummy+0xe>
 800010a:	4903      	ldr	r1, [pc, #12]	; (8000118 <frame_dummy+0x14>)
 800010c:	4803      	ldr	r0, [pc, #12]	; (800011c <frame_dummy+0x18>)
 800010e:	f3af 8000 	nop.w
 8000112:	bd08      	pop	{r3, pc}
 8000114:	00000000 	.word	0x00000000
 8000118:	20000088 	.word	0x20000088
 800011c:	08001f1c 	.word	0x08001f1c

08000120 <capslock>:
 8000120:	b580      	push	{r7, lr}
 8000122:	b084      	sub	sp, #16
 8000124:	af00      	add	r7, sp, #0
 8000126:	6078      	str	r0, [r7, #4]
 8000128:	f107 030f 	add.w	r3, r7, #15
 800012c:	461a      	mov	r2, r3
 800012e:	2101      	movs	r1, #1
 8000130:	6878      	ldr	r0, [r7, #4]
 8000132:	f000 fc98 	bl	8000a66 <usart_receive>
 8000136:	7bfb      	ldrb	r3, [r7, #15]
 8000138:	4618      	mov	r0, r3
 800013a:	f000 f80d 	bl	8000158 <capsbit>
 800013e:	4603      	mov	r3, r0
 8000140:	73fb      	strb	r3, [r7, #15]
 8000142:	f107 030f 	add.w	r3, r7, #15
 8000146:	461a      	mov	r2, r3
 8000148:	2101      	movs	r1, #1
 800014a:	6878      	ldr	r0, [r7, #4]
 800014c:	f000 fc54 	bl	80009f8 <usart_transmit>
 8000150:	bf00      	nop
 8000152:	3710      	adds	r7, #16
 8000154:	46bd      	mov	sp, r7
 8000156:	bd80      	pop	{r7, pc}

08000158 <capsbit>:
 8000158:	b480      	push	{r7}
 800015a:	b083      	sub	sp, #12
 800015c:	af00      	add	r7, sp, #0
 800015e:	4603      	mov	r3, r0
 8000160:	71fb      	strb	r3, [r7, #7]
 8000162:	79fb      	ldrb	r3, [r7, #7]
 8000164:	3301      	adds	r3, #1
 8000166:	4a09      	ldr	r2, [pc, #36]	; (800018c <capsbit+0x34>)
 8000168:	4413      	add	r3, r2
 800016a:	781b      	ldrb	r3, [r3, #0]
 800016c:	f003 0303 	and.w	r3, r3, #3
 8000170:	2b00      	cmp	r3, #0
 8000172:	d004      	beq.n	800017e <capsbit+0x26>
 8000174:	79fb      	ldrb	r3, [r7, #7]
 8000176:	f083 0320 	eor.w	r3, r3, #32
 800017a:	b2db      	uxtb	r3, r3
 800017c:	e000      	b.n	8000180 <capsbit+0x28>
 800017e:	79fb      	ldrb	r3, [r7, #7]
 8000180:	4618      	mov	r0, r3
 8000182:	370c      	adds	r7, #12
 8000184:	46bd      	mov	sp, r7
 8000186:	bc80      	pop	{r7}
 8000188:	4770      	bx	lr
 800018a:	bf00      	nop
 800018c:	08001d6b 	.word	0x08001d6b

08000190 <main>:
 8000190:	b580      	push	{r7, lr}
 8000192:	af00      	add	r7, sp, #0
 8000194:	f000 f80a 	bl	80001ac <fusecore>
 8000198:	4803      	ldr	r0, [pc, #12]	; (80001a8 <main+0x18>)
 800019a:	f000 fd87 	bl	8000cac <puts>
 800019e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80001a2:	f000 fbc3 	bl	800092c <delay_ms>
 80001a6:	e7f7      	b.n	8000198 <main+0x8>
 80001a8:	08001cc8 	.word	0x08001cc8

080001ac <fusecore>:
 80001ac:	b580      	push	{r7, lr}
 80001ae:	af00      	add	r7, sp, #0
 80001b0:	f000 f84e 	bl	8000250 <gpio_init>
 80001b4:	f000 f868 	bl	8000288 <usart1_init>
 80001b8:	f000 f812 	bl	80001e0 <usart2_init>
 80001bc:	f000 f858 	bl	8000270 <nvic_init>
 80001c0:	4b05      	ldr	r3, [pc, #20]	; (80001d8 <fusecore+0x2c>)
 80001c2:	681b      	ldr	r3, [r3, #0]
 80001c4:	4a05      	ldr	r2, [pc, #20]	; (80001dc <fusecore+0x30>)
 80001c6:	fba2 2303 	umull	r2, r3, r2, r3
 80001ca:	099b      	lsrs	r3, r3, #6
 80001cc:	4618      	mov	r0, r3
 80001ce:	f000 fb7b 	bl	80008c8 <systick_init>
 80001d2:	bf00      	nop
 80001d4:	bd80      	pop	{r7, pc}
 80001d6:	bf00      	nop
 80001d8:	20000014 	.word	0x20000014
 80001dc:	10624dd3 	.word	0x10624dd3

080001e0 <usart2_init>:
 80001e0:	b580      	push	{r7, lr}
 80001e2:	af00      	add	r7, sp, #0
 80001e4:	2101      	movs	r1, #1
 80001e6:	2000      	movs	r0, #0
 80001e8:	f000 fa66 	bl	80006b8 <rcc_periph_clock_enable>
 80001ec:	2202      	movs	r2, #2
 80001ee:	2102      	movs	r1, #2
 80001f0:	4815      	ldr	r0, [pc, #84]	; (8000248 <usart2_init+0x68>)
 80001f2:	f000 f87f 	bl	80002f4 <gpio_mode_setup>
 80001f6:	2202      	movs	r2, #2
 80001f8:	2103      	movs	r1, #3
 80001fa:	4813      	ldr	r0, [pc, #76]	; (8000248 <usart2_init+0x68>)
 80001fc:	f000 f87a 	bl	80002f4 <gpio_mode_setup>
 8000200:	2207      	movs	r2, #7
 8000202:	2102      	movs	r1, #2
 8000204:	4810      	ldr	r0, [pc, #64]	; (8000248 <usart2_init+0x68>)
 8000206:	f000 f898 	bl	800033a <gpio_af_setup>
 800020a:	2207      	movs	r2, #7
 800020c:	2103      	movs	r1, #3
 800020e:	480e      	ldr	r0, [pc, #56]	; (8000248 <usart2_init+0x68>)
 8000210:	f000 f893 	bl	800033a <gpio_af_setup>
 8000214:	f44f 3100 	mov.w	r1, #131072	; 0x20000
 8000218:	2001      	movs	r0, #1
 800021a:	f000 fa4d 	bl	80006b8 <rcc_periph_clock_enable>
 800021e:	f44f 5116 	mov.w	r1, #9600	; 0x2580
 8000222:	480a      	ldr	r0, [pc, #40]	; (800024c <usart2_init+0x6c>)
 8000224:	f000 fbca 	bl	80009bc <usart_set_baudrate>
 8000228:	210c      	movs	r1, #12
 800022a:	4808      	ldr	r0, [pc, #32]	; (800024c <usart2_init+0x6c>)
 800022c:	f000 fbb3 	bl	8000996 <usart_set_mode>
 8000230:	4806      	ldr	r0, [pc, #24]	; (800024c <usart2_init+0x6c>)
 8000232:	f000 fc4b 	bl	8000acc <usart_irq_enable>
 8000236:	4805      	ldr	r0, [pc, #20]	; (800024c <usart2_init+0x6c>)
 8000238:	f000 fb9c 	bl	8000974 <usart_enable>
 800023c:	4803      	ldr	r0, [pc, #12]	; (800024c <usart2_init+0x6c>)
 800023e:	f000 fc56 	bl	8000aee <usart_init_send>
 8000242:	bf00      	nop
 8000244:	bd80      	pop	{r7, pc}
 8000246:	bf00      	nop
 8000248:	40020000 	.word	0x40020000
 800024c:	40004400 	.word	0x40004400

08000250 <gpio_init>:
 8000250:	b580      	push	{r7, lr}
 8000252:	af00      	add	r7, sp, #0
 8000254:	2104      	movs	r1, #4
 8000256:	2000      	movs	r0, #0
 8000258:	f000 fa2e 	bl	80006b8 <rcc_periph_clock_enable>
 800025c:	2201      	movs	r2, #1
 800025e:	210d      	movs	r1, #13
 8000260:	4802      	ldr	r0, [pc, #8]	; (800026c <gpio_init+0x1c>)
 8000262:	f000 f847 	bl	80002f4 <gpio_mode_setup>
 8000266:	bf00      	nop
 8000268:	bd80      	pop	{r7, pc}
 800026a:	bf00      	nop
 800026c:	40020800 	.word	0x40020800

08000270 <nvic_init>:
 8000270:	b580      	push	{r7, lr}
 8000272:	af00      	add	r7, sp, #0
 8000274:	f000 fa1a 	bl	80006ac <nvic_global_enable>
 8000278:	2026      	movs	r0, #38	; 0x26
 800027a:	f000 f9f3 	bl	8000664 <nvic_irq_setup>
 800027e:	2025      	movs	r0, #37	; 0x25
 8000280:	f000 f9f0 	bl	8000664 <nvic_irq_setup>
 8000284:	bf00      	nop
 8000286:	bd80      	pop	{r7, pc}

08000288 <usart1_init>:
 8000288:	b580      	push	{r7, lr}
 800028a:	af00      	add	r7, sp, #0
 800028c:	2101      	movs	r1, #1
 800028e:	2000      	movs	r0, #0
 8000290:	f000 fa12 	bl	80006b8 <rcc_periph_clock_enable>
 8000294:	2202      	movs	r2, #2
 8000296:	2109      	movs	r1, #9
 8000298:	4814      	ldr	r0, [pc, #80]	; (80002ec <usart1_init+0x64>)
 800029a:	f000 f82b 	bl	80002f4 <gpio_mode_setup>
 800029e:	2202      	movs	r2, #2
 80002a0:	210a      	movs	r1, #10
 80002a2:	4812      	ldr	r0, [pc, #72]	; (80002ec <usart1_init+0x64>)
 80002a4:	f000 f826 	bl	80002f4 <gpio_mode_setup>
 80002a8:	2207      	movs	r2, #7
 80002aa:	2109      	movs	r1, #9
 80002ac:	480f      	ldr	r0, [pc, #60]	; (80002ec <usart1_init+0x64>)
 80002ae:	f000 f844 	bl	800033a <gpio_af_setup>
 80002b2:	2207      	movs	r2, #7
 80002b4:	210a      	movs	r1, #10
 80002b6:	480d      	ldr	r0, [pc, #52]	; (80002ec <usart1_init+0x64>)
 80002b8:	f000 f83f 	bl	800033a <gpio_af_setup>
 80002bc:	2110      	movs	r1, #16
 80002be:	2002      	movs	r0, #2
 80002c0:	f000 f9fa 	bl	80006b8 <rcc_periph_clock_enable>
 80002c4:	f44f 5116 	mov.w	r1, #9600	; 0x2580
 80002c8:	4809      	ldr	r0, [pc, #36]	; (80002f0 <usart1_init+0x68>)
 80002ca:	f000 fb77 	bl	80009bc <usart_set_baudrate>
 80002ce:	210c      	movs	r1, #12
 80002d0:	4807      	ldr	r0, [pc, #28]	; (80002f0 <usart1_init+0x68>)
 80002d2:	f000 fb60 	bl	8000996 <usart_set_mode>
 80002d6:	4806      	ldr	r0, [pc, #24]	; (80002f0 <usart1_init+0x68>)
 80002d8:	f000 fbf8 	bl	8000acc <usart_irq_enable>
 80002dc:	4804      	ldr	r0, [pc, #16]	; (80002f0 <usart1_init+0x68>)
 80002de:	f000 fb49 	bl	8000974 <usart_enable>
 80002e2:	4803      	ldr	r0, [pc, #12]	; (80002f0 <usart1_init+0x68>)
 80002e4:	f000 fc03 	bl	8000aee <usart_init_send>
 80002e8:	bf00      	nop
 80002ea:	bd80      	pop	{r7, pc}
 80002ec:	40020000 	.word	0x40020000
 80002f0:	40011000 	.word	0x40011000

080002f4 <gpio_mode_setup>:
 80002f4:	b480      	push	{r7}
 80002f6:	b087      	sub	sp, #28
 80002f8:	af00      	add	r7, sp, #0
 80002fa:	60f8      	str	r0, [r7, #12]
 80002fc:	60b9      	str	r1, [r7, #8]
 80002fe:	607a      	str	r2, [r7, #4]
 8000300:	68fb      	ldr	r3, [r7, #12]
 8000302:	681b      	ldr	r3, [r3, #0]
 8000304:	617b      	str	r3, [r7, #20]
 8000306:	68bb      	ldr	r3, [r7, #8]
 8000308:	005b      	lsls	r3, r3, #1
 800030a:	2203      	movs	r2, #3
 800030c:	fa02 f303 	lsl.w	r3, r2, r3
 8000310:	43db      	mvns	r3, r3
 8000312:	461a      	mov	r2, r3
 8000314:	697b      	ldr	r3, [r7, #20]
 8000316:	4013      	ands	r3, r2
 8000318:	617b      	str	r3, [r7, #20]
 800031a:	68bb      	ldr	r3, [r7, #8]
 800031c:	005b      	lsls	r3, r3, #1
 800031e:	687a      	ldr	r2, [r7, #4]
 8000320:	fa02 f303 	lsl.w	r3, r2, r3
 8000324:	697a      	ldr	r2, [r7, #20]
 8000326:	4313      	orrs	r3, r2
 8000328:	617b      	str	r3, [r7, #20]
 800032a:	68fb      	ldr	r3, [r7, #12]
 800032c:	697a      	ldr	r2, [r7, #20]
 800032e:	601a      	str	r2, [r3, #0]
 8000330:	bf00      	nop
 8000332:	371c      	adds	r7, #28
 8000334:	46bd      	mov	sp, r7
 8000336:	bc80      	pop	{r7}
 8000338:	4770      	bx	lr

0800033a <gpio_af_setup>:
 800033a:	b480      	push	{r7}
 800033c:	b089      	sub	sp, #36	; 0x24
 800033e:	af00      	add	r7, sp, #0
 8000340:	60f8      	str	r0, [r7, #12]
 8000342:	60b9      	str	r1, [r7, #8]
 8000344:	607a      	str	r2, [r7, #4]
 8000346:	2308      	movs	r3, #8
 8000348:	77fb      	strb	r3, [r7, #31]
 800034a:	2304      	movs	r3, #4
 800034c:	77bb      	strb	r3, [r7, #30]
 800034e:	7ffb      	ldrb	r3, [r7, #31]
 8000350:	68ba      	ldr	r2, [r7, #8]
 8000352:	429a      	cmp	r2, r3
 8000354:	d907      	bls.n	8000366 <gpio_af_setup+0x2c>
 8000356:	7ffa      	ldrb	r2, [r7, #31]
 8000358:	68bb      	ldr	r3, [r7, #8]
 800035a:	fbb3 f1f2 	udiv	r1, r3, r2
 800035e:	fb01 f202 	mul.w	r2, r1, r2
 8000362:	1a9b      	subs	r3, r3, r2
 8000364:	e000      	b.n	8000368 <gpio_af_setup+0x2e>
 8000366:	68bb      	ldr	r3, [r7, #8]
 8000368:	61bb      	str	r3, [r7, #24]
 800036a:	7ffb      	ldrb	r3, [r7, #31]
 800036c:	68ba      	ldr	r2, [r7, #8]
 800036e:	429a      	cmp	r2, r3
 8000370:	d203      	bcs.n	800037a <gpio_af_setup+0x40>
 8000372:	68fb      	ldr	r3, [r7, #12]
 8000374:	3320      	adds	r3, #32
 8000376:	681b      	ldr	r3, [r3, #0]
 8000378:	e002      	b.n	8000380 <gpio_af_setup+0x46>
 800037a:	68fb      	ldr	r3, [r7, #12]
 800037c:	3324      	adds	r3, #36	; 0x24
 800037e:	681b      	ldr	r3, [r3, #0]
 8000380:	617b      	str	r3, [r7, #20]
 8000382:	7fbb      	ldrb	r3, [r7, #30]
 8000384:	69ba      	ldr	r2, [r7, #24]
 8000386:	fb02 f303 	mul.w	r3, r2, r3
 800038a:	220f      	movs	r2, #15
 800038c:	fa02 f303 	lsl.w	r3, r2, r3
 8000390:	43db      	mvns	r3, r3
 8000392:	697a      	ldr	r2, [r7, #20]
 8000394:	4013      	ands	r3, r2
 8000396:	617b      	str	r3, [r7, #20]
 8000398:	7fbb      	ldrb	r3, [r7, #30]
 800039a:	69ba      	ldr	r2, [r7, #24]
 800039c:	fb02 f303 	mul.w	r3, r2, r3
 80003a0:	687a      	ldr	r2, [r7, #4]
 80003a2:	fa02 f303 	lsl.w	r3, r2, r3
 80003a6:	697a      	ldr	r2, [r7, #20]
 80003a8:	4313      	orrs	r3, r2
 80003aa:	617b      	str	r3, [r7, #20]
 80003ac:	7ffb      	ldrb	r3, [r7, #31]
 80003ae:	68ba      	ldr	r2, [r7, #8]
 80003b0:	429a      	cmp	r2, r3
 80003b2:	d205      	bcs.n	80003c0 <gpio_af_setup+0x86>
 80003b4:	68fb      	ldr	r3, [r7, #12]
 80003b6:	3320      	adds	r3, #32
 80003b8:	461a      	mov	r2, r3
 80003ba:	697b      	ldr	r3, [r7, #20]
 80003bc:	6013      	str	r3, [r2, #0]
 80003be:	e004      	b.n	80003ca <gpio_af_setup+0x90>
 80003c0:	68fb      	ldr	r3, [r7, #12]
 80003c2:	3324      	adds	r3, #36	; 0x24
 80003c4:	461a      	mov	r2, r3
 80003c6:	697b      	ldr	r3, [r7, #20]
 80003c8:	6013      	str	r3, [r2, #0]
 80003ca:	bf00      	nop
 80003cc:	3724      	adds	r7, #36	; 0x24
 80003ce:	46bd      	mov	sp, r7
 80003d0:	bc80      	pop	{r7}
 80003d2:	4770      	bx	lr

080003d4 <gpio_toggle_pin>:
 80003d4:	b480      	push	{r7}
 80003d6:	b083      	sub	sp, #12
 80003d8:	af00      	add	r7, sp, #0
 80003da:	6078      	str	r0, [r7, #4]
 80003dc:	6039      	str	r1, [r7, #0]
 80003de:	687b      	ldr	r3, [r7, #4]
 80003e0:	3314      	adds	r3, #20
 80003e2:	681b      	ldr	r3, [r3, #0]
 80003e4:	2101      	movs	r1, #1
 80003e6:	683a      	ldr	r2, [r7, #0]
 80003e8:	fa01 f202 	lsl.w	r2, r1, r2
 80003ec:	4611      	mov	r1, r2
 80003ee:	687a      	ldr	r2, [r7, #4]
 80003f0:	3214      	adds	r2, #20
 80003f2:	404b      	eors	r3, r1
 80003f4:	6013      	str	r3, [r2, #0]
 80003f6:	bf00      	nop
 80003f8:	370c      	adds	r7, #12
 80003fa:	46bd      	mov	sp, r7
 80003fc:	bc80      	pop	{r7}
 80003fe:	4770      	bx	lr

08000400 <nmi_handler>:
 8000400:	b580      	push	{r7, lr}
 8000402:	af00      	add	r7, sp, #0
 8000404:	4a02      	ldr	r2, [pc, #8]	; (8000410 <nmi_handler+0x10>)
 8000406:	4903      	ldr	r1, [pc, #12]	; (8000414 <nmi_handler+0x14>)
 8000408:	4803      	ldr	r0, [pc, #12]	; (8000418 <nmi_handler+0x18>)
 800040a:	f000 f857 	bl	80004bc <tags_log>
 800040e:	e7fe      	b.n	800040e <nmi_handler+0xe>
 8000410:	08001cd4 	.word	0x08001cd4
 8000414:	08001ce0 	.word	0x08001ce0
 8000418:	40011000 	.word	0x40011000

0800041c <hardfault_handler>:
 800041c:	b580      	push	{r7, lr}
 800041e:	b094      	sub	sp, #80	; 0x50
 8000420:	af02      	add	r7, sp, #8
 8000422:	4a11      	ldr	r2, [pc, #68]	; (8000468 <hardfault_handler+0x4c>)
 8000424:	4911      	ldr	r1, [pc, #68]	; (800046c <hardfault_handler+0x50>)
 8000426:	4812      	ldr	r0, [pc, #72]	; (8000470 <hardfault_handler+0x54>)
 8000428:	f000 f848 	bl	80004bc <tags_log>
 800042c:	2300      	movs	r3, #0
 800042e:	647b      	str	r3, [r7, #68]	; 0x44
 8000430:	e015      	b.n	800045e <hardfault_handler+0x42>
 8000432:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8000434:	009a      	lsls	r2, r3, #2
 8000436:	490f      	ldr	r1, [pc, #60]	; (8000474 <hardfault_handler+0x58>)
 8000438:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800043a:	f851 3023 	ldr.w	r3, [r1, r3, lsl #2]
 800043e:	1d38      	adds	r0, r7, #4
 8000440:	9300      	str	r3, [sp, #0]
 8000442:	4613      	mov	r3, r2
 8000444:	4a0c      	ldr	r2, [pc, #48]	; (8000478 <hardfault_handler+0x5c>)
 8000446:	2140      	movs	r1, #64	; 0x40
 8000448:	f000 fc38 	bl	8000cbc <sniprintf>
 800044c:	1d3b      	adds	r3, r7, #4
 800044e:	461a      	mov	r2, r3
 8000450:	4906      	ldr	r1, [pc, #24]	; (800046c <hardfault_handler+0x50>)
 8000452:	4807      	ldr	r0, [pc, #28]	; (8000470 <hardfault_handler+0x54>)
 8000454:	f000 f832 	bl	80004bc <tags_log>
 8000458:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800045a:	3301      	adds	r3, #1
 800045c:	647b      	str	r3, [r7, #68]	; 0x44
 800045e:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8000460:	2b35      	cmp	r3, #53	; 0x35
 8000462:	d9e6      	bls.n	8000432 <hardfault_handler+0x16>
 8000464:	e7fe      	b.n	8000464 <hardfault_handler+0x48>
 8000466:	bf00      	nop
 8000468:	08001cec 	.word	0x08001cec
 800046c:	08001ce0 	.word	0x08001ce0
 8000470:	40011000 	.word	0x40011000
 8000474:	08000000 	.word	0x08000000
 8000478:	08001d00 	.word	0x08001d00

0800047c <usart1_IRQhandler>:
 800047c:	b580      	push	{r7, lr}
 800047e:	af00      	add	r7, sp, #0
 8000480:	4b05      	ldr	r3, [pc, #20]	; (8000498 <usart1_IRQhandler+0x1c>)
 8000482:	681b      	ldr	r3, [r3, #0]
 8000484:	f003 0320 	and.w	r3, r3, #32
 8000488:	2b00      	cmp	r3, #0
 800048a:	d002      	beq.n	8000492 <usart1_IRQhandler+0x16>
 800048c:	4802      	ldr	r0, [pc, #8]	; (8000498 <usart1_IRQhandler+0x1c>)
 800048e:	f7ff fe47 	bl	8000120 <capslock>
 8000492:	bf00      	nop
 8000494:	bd80      	pop	{r7, pc}
 8000496:	bf00      	nop
 8000498:	40011000 	.word	0x40011000

0800049c <usart2_IRQhandler>:
 800049c:	b580      	push	{r7, lr}
 800049e:	af00      	add	r7, sp, #0
 80004a0:	4b05      	ldr	r3, [pc, #20]	; (80004b8 <usart2_IRQhandler+0x1c>)
 80004a2:	681b      	ldr	r3, [r3, #0]
 80004a4:	f003 0320 	and.w	r3, r3, #32
 80004a8:	2b00      	cmp	r3, #0
 80004aa:	d002      	beq.n	80004b2 <usart2_IRQhandler+0x16>
 80004ac:	4802      	ldr	r0, [pc, #8]	; (80004b8 <usart2_IRQhandler+0x1c>)
 80004ae:	f7ff fe37 	bl	8000120 <capslock>
 80004b2:	bf00      	nop
 80004b4:	bd80      	pop	{r7, pc}
 80004b6:	bf00      	nop
 80004b8:	40004400 	.word	0x40004400

080004bc <tags_log>:
 80004bc:	b580      	push	{r7, lr}
 80004be:	b084      	sub	sp, #16
 80004c0:	af00      	add	r7, sp, #0
 80004c2:	60f8      	str	r0, [r7, #12]
 80004c4:	60b9      	str	r1, [r7, #8]
 80004c6:	607a      	str	r2, [r7, #4]
 80004c8:	68fb      	ldr	r3, [r7, #12]
 80004ca:	4a08      	ldr	r2, [pc, #32]	; (80004ec <tags_log+0x30>)
 80004cc:	4293      	cmp	r3, r2
 80004ce:	d003      	beq.n	80004d8 <tags_log+0x1c>
 80004d0:	68fb      	ldr	r3, [r7, #12]
 80004d2:	4a07      	ldr	r2, [pc, #28]	; (80004f0 <tags_log+0x34>)
 80004d4:	4293      	cmp	r3, r2
 80004d6:	d104      	bne.n	80004e2 <tags_log+0x26>
 80004d8:	687a      	ldr	r2, [r7, #4]
 80004da:	68b9      	ldr	r1, [r7, #8]
 80004dc:	68f8      	ldr	r0, [r7, #12]
 80004de:	f000 f845 	bl	800056c <tag_send>
 80004e2:	bf00      	nop
 80004e4:	3710      	adds	r7, #16
 80004e6:	46bd      	mov	sp, r7
 80004e8:	bd80      	pop	{r7, pc}
 80004ea:	bf00      	nop
 80004ec:	40011000 	.word	0x40011000
 80004f0:	40004400 	.word	0x40004400

080004f4 <dump_sram>:
 80004f4:	b580      	push	{r7, lr}
 80004f6:	b096      	sub	sp, #88	; 0x58
 80004f8:	af02      	add	r7, sp, #8
 80004fa:	6078      	str	r0, [r7, #4]
 80004fc:	687b      	ldr	r3, [r7, #4]
 80004fe:	64bb      	str	r3, [r7, #72]	; 0x48
 8000500:	4b17      	ldr	r3, [pc, #92]	; (8000560 <dump_sram+0x6c>)
 8000502:	689b      	ldr	r3, [r3, #8]
 8000504:	425b      	negs	r3, r3
 8000506:	6cba      	ldr	r2, [r7, #72]	; 0x48
 8000508:	4413      	add	r3, r2
 800050a:	64bb      	str	r3, [r7, #72]	; 0x48
 800050c:	2300      	movs	r3, #0
 800050e:	64fb      	str	r3, [r7, #76]	; 0x4c
 8000510:	e01b      	b.n	800054a <dump_sram+0x56>
 8000512:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8000514:	781b      	ldrb	r3, [r3, #0]
 8000516:	461a      	mov	r2, r3
 8000518:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 800051a:	781b      	ldrb	r3, [r3, #0]
 800051c:	f107 0008 	add.w	r0, r7, #8
 8000520:	9301      	str	r3, [sp, #4]
 8000522:	9200      	str	r2, [sp, #0]
 8000524:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8000526:	4a0f      	ldr	r2, [pc, #60]	; (8000564 <dump_sram+0x70>)
 8000528:	2140      	movs	r1, #64	; 0x40
 800052a:	f000 fbc7 	bl	8000cbc <sniprintf>
 800052e:	4b0c      	ldr	r3, [pc, #48]	; (8000560 <dump_sram+0x6c>)
 8000530:	685b      	ldr	r3, [r3, #4]
 8000532:	f107 0208 	add.w	r2, r7, #8
 8000536:	490c      	ldr	r1, [pc, #48]	; (8000568 <dump_sram+0x74>)
 8000538:	4618      	mov	r0, r3
 800053a:	f7ff ffbf 	bl	80004bc <tags_log>
 800053e:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8000540:	3301      	adds	r3, #1
 8000542:	64bb      	str	r3, [r7, #72]	; 0x48
 8000544:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8000546:	3301      	adds	r3, #1
 8000548:	64fb      	str	r3, [r7, #76]	; 0x4c
 800054a:	4b05      	ldr	r3, [pc, #20]	; (8000560 <dump_sram+0x6c>)
 800054c:	68db      	ldr	r3, [r3, #12]
 800054e:	6cfa      	ldr	r2, [r7, #76]	; 0x4c
 8000550:	429a      	cmp	r2, r3
 8000552:	d3de      	bcc.n	8000512 <dump_sram+0x1e>
 8000554:	bf00      	nop
 8000556:	bf00      	nop
 8000558:	3750      	adds	r7, #80	; 0x50
 800055a:	46bd      	mov	sp, r7
 800055c:	bd80      	pop	{r7, pc}
 800055e:	bf00      	nop
 8000560:	20000000 	.word	0x20000000
 8000564:	08001d20 	.word	0x08001d20
 8000568:	08001d3c 	.word	0x08001d3c

0800056c <tag_send>:
 800056c:	b580      	push	{r7, lr}
 800056e:	b084      	sub	sp, #16
 8000570:	af00      	add	r7, sp, #0
 8000572:	60f8      	str	r0, [r7, #12]
 8000574:	60b9      	str	r1, [r7, #8]
 8000576:	607a      	str	r2, [r7, #4]
 8000578:	68b8      	ldr	r0, [r7, #8]
 800057a:	f000 fac5 	bl	8000b08 <strlen>
 800057e:	4603      	mov	r3, r0
 8000580:	68ba      	ldr	r2, [r7, #8]
 8000582:	4619      	mov	r1, r3
 8000584:	68f8      	ldr	r0, [r7, #12]
 8000586:	f000 fa37 	bl	80009f8 <usart_transmit>
 800058a:	4b18      	ldr	r3, [pc, #96]	; (80005ec <tag_send+0x80>)
 800058c:	681b      	ldr	r3, [r3, #0]
 800058e:	4618      	mov	r0, r3
 8000590:	f000 faba 	bl	8000b08 <strlen>
 8000594:	4601      	mov	r1, r0
 8000596:	4b15      	ldr	r3, [pc, #84]	; (80005ec <tag_send+0x80>)
 8000598:	681b      	ldr	r3, [r3, #0]
 800059a:	461a      	mov	r2, r3
 800059c:	68f8      	ldr	r0, [r7, #12]
 800059e:	f000 fa2b 	bl	80009f8 <usart_transmit>
 80005a2:	4b13      	ldr	r3, [pc, #76]	; (80005f0 <tag_send+0x84>)
 80005a4:	781b      	ldrb	r3, [r3, #0]
 80005a6:	2b00      	cmp	r3, #0
 80005a8:	d00e      	beq.n	80005c8 <tag_send+0x5c>
 80005aa:	68f8      	ldr	r0, [r7, #12]
 80005ac:	f000 f824 	bl	80005f8 <channel_send>
 80005b0:	4b0e      	ldr	r3, [pc, #56]	; (80005ec <tag_send+0x80>)
 80005b2:	681b      	ldr	r3, [r3, #0]
 80005b4:	4618      	mov	r0, r3
 80005b6:	f000 faa7 	bl	8000b08 <strlen>
 80005ba:	4601      	mov	r1, r0
 80005bc:	4b0b      	ldr	r3, [pc, #44]	; (80005ec <tag_send+0x80>)
 80005be:	681b      	ldr	r3, [r3, #0]
 80005c0:	461a      	mov	r2, r3
 80005c2:	68f8      	ldr	r0, [r7, #12]
 80005c4:	f000 fa18 	bl	80009f8 <usart_transmit>
 80005c8:	6878      	ldr	r0, [r7, #4]
 80005ca:	f000 fa9d 	bl	8000b08 <strlen>
 80005ce:	4603      	mov	r3, r0
 80005d0:	687a      	ldr	r2, [r7, #4]
 80005d2:	4619      	mov	r1, r3
 80005d4:	68f8      	ldr	r0, [r7, #12]
 80005d6:	f000 fa0f 	bl	80009f8 <usart_transmit>
 80005da:	4a06      	ldr	r2, [pc, #24]	; (80005f4 <tag_send+0x88>)
 80005dc:	2101      	movs	r1, #1
 80005de:	68f8      	ldr	r0, [r7, #12]
 80005e0:	f000 fa0a 	bl	80009f8 <usart_transmit>
 80005e4:	bf00      	nop
 80005e6:	3710      	adds	r7, #16
 80005e8:	46bd      	mov	sp, r7
 80005ea:	bd80      	pop	{r7, pc}
 80005ec:	20000010 	.word	0x20000010
 80005f0:	20000000 	.word	0x20000000
 80005f4:	08001d44 	.word	0x08001d44

080005f8 <channel_send>:
 80005f8:	b580      	push	{r7, lr}
 80005fa:	b084      	sub	sp, #16
 80005fc:	af00      	add	r7, sp, #0
 80005fe:	6078      	str	r0, [r7, #4]
 8000600:	6878      	ldr	r0, [r7, #4]
 8000602:	f000 f80e 	bl	8000622 <get_channel_name>
 8000606:	60f8      	str	r0, [r7, #12]
 8000608:	68f8      	ldr	r0, [r7, #12]
 800060a:	f000 fa7d 	bl	8000b08 <strlen>
 800060e:	4603      	mov	r3, r0
 8000610:	68fa      	ldr	r2, [r7, #12]
 8000612:	4619      	mov	r1, r3
 8000614:	6878      	ldr	r0, [r7, #4]
 8000616:	f000 f9ef 	bl	80009f8 <usart_transmit>
 800061a:	bf00      	nop
 800061c:	3710      	adds	r7, #16
 800061e:	46bd      	mov	sp, r7
 8000620:	bd80      	pop	{r7, pc}

08000622 <get_channel_name>:
 8000622:	b480      	push	{r7}
 8000624:	b083      	sub	sp, #12
 8000626:	af00      	add	r7, sp, #0
 8000628:	6078      	str	r0, [r7, #4]
 800062a:	687b      	ldr	r3, [r7, #4]
 800062c:	4a08      	ldr	r2, [pc, #32]	; (8000650 <get_channel_name+0x2e>)
 800062e:	4293      	cmp	r3, r2
 8000630:	d005      	beq.n	800063e <get_channel_name+0x1c>
 8000632:	687b      	ldr	r3, [r7, #4]
 8000634:	4a07      	ldr	r2, [pc, #28]	; (8000654 <get_channel_name+0x32>)
 8000636:	4293      	cmp	r3, r2
 8000638:	d103      	bne.n	8000642 <get_channel_name+0x20>
 800063a:	4b07      	ldr	r3, [pc, #28]	; (8000658 <get_channel_name+0x36>)
 800063c:	e002      	b.n	8000644 <get_channel_name+0x22>
 800063e:	4b07      	ldr	r3, [pc, #28]	; (800065c <get_channel_name+0x3a>)
 8000640:	e000      	b.n	8000644 <get_channel_name+0x22>
 8000642:	4b07      	ldr	r3, [pc, #28]	; (8000660 <get_channel_name+0x3e>)
 8000644:	4618      	mov	r0, r3
 8000646:	370c      	adds	r7, #12
 8000648:	46bd      	mov	sp, r7
 800064a:	bc80      	pop	{r7}
 800064c:	4770      	bx	lr
 800064e:	bf00      	nop
 8000650:	40004400 	.word	0x40004400
 8000654:	40011000 	.word	0x40011000
 8000658:	08001d48 	.word	0x08001d48
 800065c:	08001d50 	.word	0x08001d50
 8000660:	08001d58 	.word	0x08001d58

08000664 <nvic_irq_setup>:
 8000664:	b480      	push	{r7}
 8000666:	b085      	sub	sp, #20
 8000668:	af00      	add	r7, sp, #0
 800066a:	6078      	str	r0, [r7, #4]
 800066c:	687b      	ldr	r3, [r7, #4]
 800066e:	095b      	lsrs	r3, r3, #5
 8000670:	60fb      	str	r3, [r7, #12]
 8000672:	687b      	ldr	r3, [r7, #4]
 8000674:	f003 031f 	and.w	r3, r3, #31
 8000678:	60bb      	str	r3, [r7, #8]
 800067a:	68fb      	ldr	r3, [r7, #12]
 800067c:	f103 2338 	add.w	r3, r3, #939538432	; 0x38003800
 8000680:	3340      	adds	r3, #64	; 0x40
 8000682:	009b      	lsls	r3, r3, #2
 8000684:	681a      	ldr	r2, [r3, #0]
 8000686:	2101      	movs	r1, #1
 8000688:	68bb      	ldr	r3, [r7, #8]
 800068a:	fa01 f303 	lsl.w	r3, r1, r3
 800068e:	4618      	mov	r0, r3
 8000690:	68fb      	ldr	r3, [r7, #12]
 8000692:	f103 2338 	add.w	r3, r3, #939538432	; 0x38003800
 8000696:	3340      	adds	r3, #64	; 0x40
 8000698:	009b      	lsls	r3, r3, #2
 800069a:	4619      	mov	r1, r3
 800069c:	ea42 0300 	orr.w	r3, r2, r0
 80006a0:	600b      	str	r3, [r1, #0]
 80006a2:	bf00      	nop
 80006a4:	3714      	adds	r7, #20
 80006a6:	46bd      	mov	sp, r7
 80006a8:	bc80      	pop	{r7}
 80006aa:	4770      	bx	lr

080006ac <nvic_global_enable>:
 80006ac:	b580      	push	{r7, lr}
 80006ae:	af00      	add	r7, sp, #0
 80006b0:	f000 f880 	bl	80007b4 <_enable_irq>
 80006b4:	bf00      	nop
 80006b6:	bd80      	pop	{r7, pc}

080006b8 <rcc_periph_clock_enable>:
 80006b8:	b480      	push	{r7}
 80006ba:	b083      	sub	sp, #12
 80006bc:	af00      	add	r7, sp, #0
 80006be:	6078      	str	r0, [r7, #4]
 80006c0:	6039      	str	r1, [r7, #0]
 80006c2:	687b      	ldr	r3, [r7, #4]
 80006c4:	2b00      	cmp	r3, #0
 80006c6:	d106      	bne.n	80006d6 <rcc_periph_clock_enable+0x1e>
 80006c8:	4b0f      	ldr	r3, [pc, #60]	; (8000708 <rcc_periph_clock_enable+0x50>)
 80006ca:	681a      	ldr	r2, [r3, #0]
 80006cc:	490e      	ldr	r1, [pc, #56]	; (8000708 <rcc_periph_clock_enable+0x50>)
 80006ce:	683b      	ldr	r3, [r7, #0]
 80006d0:	4313      	orrs	r3, r2
 80006d2:	600b      	str	r3, [r1, #0]
 80006d4:	e012      	b.n	80006fc <rcc_periph_clock_enable+0x44>
 80006d6:	687b      	ldr	r3, [r7, #4]
 80006d8:	2b01      	cmp	r3, #1
 80006da:	d106      	bne.n	80006ea <rcc_periph_clock_enable+0x32>
 80006dc:	4b0b      	ldr	r3, [pc, #44]	; (800070c <rcc_periph_clock_enable+0x54>)
 80006de:	681a      	ldr	r2, [r3, #0]
 80006e0:	490a      	ldr	r1, [pc, #40]	; (800070c <rcc_periph_clock_enable+0x54>)
 80006e2:	683b      	ldr	r3, [r7, #0]
 80006e4:	4313      	orrs	r3, r2
 80006e6:	600b      	str	r3, [r1, #0]
 80006e8:	e008      	b.n	80006fc <rcc_periph_clock_enable+0x44>
 80006ea:	687b      	ldr	r3, [r7, #4]
 80006ec:	2b02      	cmp	r3, #2
 80006ee:	d105      	bne.n	80006fc <rcc_periph_clock_enable+0x44>
 80006f0:	4b07      	ldr	r3, [pc, #28]	; (8000710 <rcc_periph_clock_enable+0x58>)
 80006f2:	681a      	ldr	r2, [r3, #0]
 80006f4:	4906      	ldr	r1, [pc, #24]	; (8000710 <rcc_periph_clock_enable+0x58>)
 80006f6:	683b      	ldr	r3, [r7, #0]
 80006f8:	4313      	orrs	r3, r2
 80006fa:	600b      	str	r3, [r1, #0]
 80006fc:	bf00      	nop
 80006fe:	370c      	adds	r7, #12
 8000700:	46bd      	mov	sp, r7
 8000702:	bc80      	pop	{r7}
 8000704:	4770      	bx	lr
 8000706:	bf00      	nop
 8000708:	40023830 	.word	0x40023830
 800070c:	40023840 	.word	0x40023840
 8000710:	40023844 	.word	0x40023844

08000714 <systick_handler>:
 8000714:	b480      	push	{r7}
 8000716:	af00      	add	r7, sp, #0
 8000718:	4b04      	ldr	r3, [pc, #16]	; (800072c <systick_handler+0x18>)
 800071a:	681b      	ldr	r3, [r3, #0]
 800071c:	3301      	adds	r3, #1
 800071e:	4a03      	ldr	r2, [pc, #12]	; (800072c <systick_handler+0x18>)
 8000720:	6013      	str	r3, [r2, #0]
 8000722:	bf00      	nop
 8000724:	46bd      	mov	sp, r7
 8000726:	bc80      	pop	{r7}
 8000728:	4770      	bx	lr
 800072a:	bf00      	nop
 800072c:	200000a0 	.word	0x200000a0

08000730 <reset_handler>:
 8000730:	b580      	push	{r7, lr}
 8000732:	b088      	sub	sp, #32
 8000734:	af00      	add	r7, sp, #0
 8000736:	4a1a      	ldr	r2, [pc, #104]	; (80007a0 <reset_handler+0x70>)
 8000738:	4b1a      	ldr	r3, [pc, #104]	; (80007a4 <reset_handler+0x74>)
 800073a:	1ad3      	subs	r3, r2, r3
 800073c:	617b      	str	r3, [r7, #20]
 800073e:	4b1a      	ldr	r3, [pc, #104]	; (80007a8 <reset_handler+0x78>)
 8000740:	613b      	str	r3, [r7, #16]
 8000742:	4b18      	ldr	r3, [pc, #96]	; (80007a4 <reset_handler+0x74>)
 8000744:	60fb      	str	r3, [r7, #12]
 8000746:	2300      	movs	r3, #0
 8000748:	61fb      	str	r3, [r7, #28]
 800074a:	e00a      	b.n	8000762 <reset_handler+0x32>
 800074c:	693a      	ldr	r2, [r7, #16]
 800074e:	69fb      	ldr	r3, [r7, #28]
 8000750:	441a      	add	r2, r3
 8000752:	68f9      	ldr	r1, [r7, #12]
 8000754:	69fb      	ldr	r3, [r7, #28]
 8000756:	440b      	add	r3, r1
 8000758:	7812      	ldrb	r2, [r2, #0]
 800075a:	701a      	strb	r2, [r3, #0]
 800075c:	69fb      	ldr	r3, [r7, #28]
 800075e:	3301      	adds	r3, #1
 8000760:	61fb      	str	r3, [r7, #28]
 8000762:	69fa      	ldr	r2, [r7, #28]
 8000764:	697b      	ldr	r3, [r7, #20]
 8000766:	429a      	cmp	r2, r3
 8000768:	d3f0      	bcc.n	800074c <reset_handler+0x1c>
 800076a:	4a10      	ldr	r2, [pc, #64]	; (80007ac <reset_handler+0x7c>)
 800076c:	4b10      	ldr	r3, [pc, #64]	; (80007b0 <reset_handler+0x80>)
 800076e:	1ad3      	subs	r3, r2, r3
 8000770:	60bb      	str	r3, [r7, #8]
 8000772:	4b0f      	ldr	r3, [pc, #60]	; (80007b0 <reset_handler+0x80>)
 8000774:	607b      	str	r3, [r7, #4]
 8000776:	2300      	movs	r3, #0
 8000778:	61bb      	str	r3, [r7, #24]
 800077a:	e007      	b.n	800078c <reset_handler+0x5c>
 800077c:	687a      	ldr	r2, [r7, #4]
 800077e:	69bb      	ldr	r3, [r7, #24]
 8000780:	4413      	add	r3, r2
 8000782:	2200      	movs	r2, #0
 8000784:	701a      	strb	r2, [r3, #0]
 8000786:	69bb      	ldr	r3, [r7, #24]
 8000788:	3301      	adds	r3, #1
 800078a:	61bb      	str	r3, [r7, #24]
 800078c:	69ba      	ldr	r2, [r7, #24]
 800078e:	68bb      	ldr	r3, [r7, #8]
 8000790:	429a      	cmp	r2, r3
 8000792:	d3f3      	bcc.n	800077c <reset_handler+0x4c>
 8000794:	f7ff fcfc 	bl	8000190 <main>
 8000798:	bf00      	nop
 800079a:	3720      	adds	r7, #32
 800079c:	46bd      	mov	sp, r7
 800079e:	bd80      	pop	{r7, pc}
 80007a0:	20000084 	.word	0x20000084
 80007a4:	20000000 	.word	0x20000000
 80007a8:	08001f1c 	.word	0x08001f1c
 80007ac:	200000b8 	.word	0x200000b8
 80007b0:	20000084 	.word	0x20000084

080007b4 <_enable_irq>:
 80007b4:	b580      	push	{r7, lr}
 80007b6:	af00      	add	r7, sp, #0
 80007b8:	f000 f802 	bl	80007c0 <__enable_irq>
 80007bc:	bf00      	nop
 80007be:	bd80      	pop	{r7, pc}

080007c0 <__enable_irq>:
 80007c0:	b480      	push	{r7}
 80007c2:	af00      	add	r7, sp, #0
 80007c4:	b662      	cpsie	i
 80007c6:	bf00      	nop
 80007c8:	46bd      	mov	sp, r7
 80007ca:	bc80      	pop	{r7}
 80007cc:	4770      	bx	lr
	...

080007d0 <_fstat>:
 80007d0:	b480      	push	{r7}
 80007d2:	b083      	sub	sp, #12
 80007d4:	af00      	add	r7, sp, #0
 80007d6:	6078      	str	r0, [r7, #4]
 80007d8:	6039      	str	r1, [r7, #0]
 80007da:	f04f 33ff 	mov.w	r3, #4294967295
 80007de:	4618      	mov	r0, r3
 80007e0:	370c      	adds	r7, #12
 80007e2:	46bd      	mov	sp, r7
 80007e4:	bc80      	pop	{r7}
 80007e6:	4770      	bx	lr

080007e8 <_isatty>:
 80007e8:	b480      	push	{r7}
 80007ea:	b083      	sub	sp, #12
 80007ec:	af00      	add	r7, sp, #0
 80007ee:	6078      	str	r0, [r7, #4]
 80007f0:	2301      	movs	r3, #1
 80007f2:	4618      	mov	r0, r3
 80007f4:	370c      	adds	r7, #12
 80007f6:	46bd      	mov	sp, r7
 80007f8:	bc80      	pop	{r7}
 80007fa:	4770      	bx	lr

080007fc <_close>:
 80007fc:	b480      	push	{r7}
 80007fe:	b083      	sub	sp, #12
 8000800:	af00      	add	r7, sp, #0
 8000802:	6078      	str	r0, [r7, #4]
 8000804:	f04f 33ff 	mov.w	r3, #4294967295
 8000808:	4618      	mov	r0, r3
 800080a:	370c      	adds	r7, #12
 800080c:	46bd      	mov	sp, r7
 800080e:	bc80      	pop	{r7}
 8000810:	4770      	bx	lr

08000812 <_lseek>:
 8000812:	b480      	push	{r7}
 8000814:	b085      	sub	sp, #20
 8000816:	af00      	add	r7, sp, #0
 8000818:	60f8      	str	r0, [r7, #12]
 800081a:	60b9      	str	r1, [r7, #8]
 800081c:	607a      	str	r2, [r7, #4]
 800081e:	2300      	movs	r3, #0
 8000820:	4618      	mov	r0, r3
 8000822:	3714      	adds	r7, #20
 8000824:	46bd      	mov	sp, r7
 8000826:	bc80      	pop	{r7}
 8000828:	4770      	bx	lr

0800082a <_exit>:
 800082a:	b480      	push	{r7}
 800082c:	b083      	sub	sp, #12
 800082e:	af00      	add	r7, sp, #0
 8000830:	6078      	str	r0, [r7, #4]
 8000832:	e7fe      	b.n	8000832 <_exit+0x8>

08000834 <_read>:
 8000834:	b480      	push	{r7}
 8000836:	b085      	sub	sp, #20
 8000838:	af00      	add	r7, sp, #0
 800083a:	60f8      	str	r0, [r7, #12]
 800083c:	60b9      	str	r1, [r7, #8]
 800083e:	607a      	str	r2, [r7, #4]
 8000840:	687b      	ldr	r3, [r7, #4]
 8000842:	4618      	mov	r0, r3
 8000844:	3714      	adds	r7, #20
 8000846:	46bd      	mov	sp, r7
 8000848:	bc80      	pop	{r7}
 800084a:	4770      	bx	lr

0800084c <_write>:
 800084c:	b580      	push	{r7, lr}
 800084e:	b084      	sub	sp, #16
 8000850:	af00      	add	r7, sp, #0
 8000852:	60f8      	str	r0, [r7, #12]
 8000854:	60b9      	str	r1, [r7, #8]
 8000856:	607a      	str	r2, [r7, #4]
 8000858:	68fb      	ldr	r3, [r7, #12]
 800085a:	2b01      	cmp	r3, #1
 800085c:	d105      	bne.n	800086a <_write+0x1e>
 800085e:	687b      	ldr	r3, [r7, #4]
 8000860:	68ba      	ldr	r2, [r7, #8]
 8000862:	4619      	mov	r1, r3
 8000864:	4804      	ldr	r0, [pc, #16]	; (8000878 <_write+0x2c>)
 8000866:	f000 f8c7 	bl	80009f8 <usart_transmit>
 800086a:	f04f 33ff 	mov.w	r3, #4294967295
 800086e:	4618      	mov	r0, r3
 8000870:	3710      	adds	r7, #16
 8000872:	46bd      	mov	sp, r7
 8000874:	bd80      	pop	{r7, pc}
 8000876:	bf00      	nop
 8000878:	40011000 	.word	0x40011000

0800087c <_sbrk>:
 800087c:	b480      	push	{r7}
 800087e:	b085      	sub	sp, #20
 8000880:	af00      	add	r7, sp, #0
 8000882:	6078      	str	r0, [r7, #4]
 8000884:	4b0e      	ldr	r3, [pc, #56]	; (80008c0 <_sbrk+0x44>)
 8000886:	681b      	ldr	r3, [r3, #0]
 8000888:	2b00      	cmp	r3, #0
 800088a:	d102      	bne.n	8000892 <_sbrk+0x16>
 800088c:	4b0c      	ldr	r3, [pc, #48]	; (80008c0 <_sbrk+0x44>)
 800088e:	4a0d      	ldr	r2, [pc, #52]	; (80008c4 <_sbrk+0x48>)
 8000890:	601a      	str	r2, [r3, #0]
 8000892:	4b0b      	ldr	r3, [pc, #44]	; (80008c0 <_sbrk+0x44>)
 8000894:	681b      	ldr	r3, [r3, #0]
 8000896:	60fb      	str	r3, [r7, #12]
 8000898:	4b09      	ldr	r3, [pc, #36]	; (80008c0 <_sbrk+0x44>)
 800089a:	681a      	ldr	r2, [r3, #0]
 800089c:	687b      	ldr	r3, [r7, #4]
 800089e:	4413      	add	r3, r2
 80008a0:	466a      	mov	r2, sp
 80008a2:	4293      	cmp	r3, r2
 80008a4:	d900      	bls.n	80008a8 <_sbrk+0x2c>
 80008a6:	e7fe      	b.n	80008a6 <_sbrk+0x2a>
 80008a8:	4b05      	ldr	r3, [pc, #20]	; (80008c0 <_sbrk+0x44>)
 80008aa:	681a      	ldr	r2, [r3, #0]
 80008ac:	687b      	ldr	r3, [r7, #4]
 80008ae:	4413      	add	r3, r2
 80008b0:	4a03      	ldr	r2, [pc, #12]	; (80008c0 <_sbrk+0x44>)
 80008b2:	6013      	str	r3, [r2, #0]
 80008b4:	68fb      	ldr	r3, [r7, #12]
 80008b6:	4618      	mov	r0, r3
 80008b8:	3714      	adds	r7, #20
 80008ba:	46bd      	mov	sp, r7
 80008bc:	bc80      	pop	{r7}
 80008be:	4770      	bx	lr
 80008c0:	200000a4 	.word	0x200000a4
 80008c4:	200000b8 	.word	0x200000b8

080008c8 <systick_init>:
 80008c8:	b580      	push	{r7, lr}
 80008ca:	b082      	sub	sp, #8
 80008cc:	af00      	add	r7, sp, #0
 80008ce:	6078      	str	r0, [r7, #4]
 80008d0:	6878      	ldr	r0, [r7, #4]
 80008d2:	f000 f804 	bl	80008de <SysTick_Config>
 80008d6:	bf00      	nop
 80008d8:	3708      	adds	r7, #8
 80008da:	46bd      	mov	sp, r7
 80008dc:	bd80      	pop	{r7, pc}

080008de <SysTick_Config>:
 80008de:	b480      	push	{r7}
 80008e0:	b083      	sub	sp, #12
 80008e2:	af00      	add	r7, sp, #0
 80008e4:	6078      	str	r0, [r7, #4]
 80008e6:	687b      	ldr	r3, [r7, #4]
 80008e8:	3b01      	subs	r3, #1
 80008ea:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
 80008ee:	d210      	bcs.n	8000912 <SysTick_Config+0x34>
 80008f0:	4a0a      	ldr	r2, [pc, #40]	; (800091c <SysTick_Config+0x3e>)
 80008f2:	687b      	ldr	r3, [r7, #4]
 80008f4:	3b01      	subs	r3, #1
 80008f6:	6013      	str	r3, [r2, #0]
 80008f8:	4b09      	ldr	r3, [pc, #36]	; (8000920 <SysTick_Config+0x42>)
 80008fa:	2200      	movs	r2, #0
 80008fc:	601a      	str	r2, [r3, #0]
 80008fe:	4b09      	ldr	r3, [pc, #36]	; (8000924 <SysTick_Config+0x46>)
 8000900:	2207      	movs	r2, #7
 8000902:	601a      	str	r2, [r3, #0]
 8000904:	4b08      	ldr	r3, [pc, #32]	; (8000928 <SysTick_Config+0x4a>)
 8000906:	681b      	ldr	r3, [r3, #0]
 8000908:	4a07      	ldr	r2, [pc, #28]	; (8000928 <SysTick_Config+0x4a>)
 800090a:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
 800090e:	6013      	str	r3, [r2, #0]
 8000910:	e000      	b.n	8000914 <SysTick_Config+0x36>
 8000912:	bf00      	nop
 8000914:	370c      	adds	r7, #12
 8000916:	46bd      	mov	sp, r7
 8000918:	bc80      	pop	{r7}
 800091a:	4770      	bx	lr
 800091c:	e000e014 	.word	0xe000e014
 8000920:	e000e018 	.word	0xe000e018
 8000924:	e000e010 	.word	0xe000e010
 8000928:	40023844 	.word	0x40023844

0800092c <delay_ms>:
 800092c:	b480      	push	{r7}
 800092e:	b085      	sub	sp, #20
 8000930:	af00      	add	r7, sp, #0
 8000932:	6078      	str	r0, [r7, #4]
 8000934:	4b0e      	ldr	r3, [pc, #56]	; (8000970 <delay_ms+0x44>)
 8000936:	681b      	ldr	r3, [r3, #0]
 8000938:	60fb      	str	r3, [r7, #12]
 800093a:	68fa      	ldr	r2, [r7, #12]
 800093c:	687b      	ldr	r3, [r7, #4]
 800093e:	4413      	add	r3, r2
 8000940:	60bb      	str	r3, [r7, #8]
 8000942:	68ba      	ldr	r2, [r7, #8]
 8000944:	68fb      	ldr	r3, [r7, #12]
 8000946:	429a      	cmp	r2, r3
 8000948:	d205      	bcs.n	8000956 <delay_ms+0x2a>
 800094a:	bf00      	nop
 800094c:	4b08      	ldr	r3, [pc, #32]	; (8000970 <delay_ms+0x44>)
 800094e:	681b      	ldr	r3, [r3, #0]
 8000950:	68fa      	ldr	r2, [r7, #12]
 8000952:	429a      	cmp	r2, r3
 8000954:	d3fa      	bcc.n	800094c <delay_ms+0x20>
 8000956:	bf00      	nop
 8000958:	4b05      	ldr	r3, [pc, #20]	; (8000970 <delay_ms+0x44>)
 800095a:	681b      	ldr	r3, [r3, #0]
 800095c:	68ba      	ldr	r2, [r7, #8]
 800095e:	429a      	cmp	r2, r3
 8000960:	d8fa      	bhi.n	8000958 <delay_ms+0x2c>
 8000962:	bf00      	nop
 8000964:	bf00      	nop
 8000966:	3714      	adds	r7, #20
 8000968:	46bd      	mov	sp, r7
 800096a:	bc80      	pop	{r7}
 800096c:	4770      	bx	lr
 800096e:	bf00      	nop
 8000970:	200000a0 	.word	0x200000a0

08000974 <usart_enable>:
 8000974:	b480      	push	{r7}
 8000976:	b083      	sub	sp, #12
 8000978:	af00      	add	r7, sp, #0
 800097a:	6078      	str	r0, [r7, #4]
 800097c:	687b      	ldr	r3, [r7, #4]
 800097e:	330c      	adds	r3, #12
 8000980:	681b      	ldr	r3, [r3, #0]
 8000982:	687a      	ldr	r2, [r7, #4]
 8000984:	320c      	adds	r2, #12
 8000986:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 800098a:	6013      	str	r3, [r2, #0]
 800098c:	bf00      	nop
 800098e:	370c      	adds	r7, #12
 8000990:	46bd      	mov	sp, r7
 8000992:	bc80      	pop	{r7}
 8000994:	4770      	bx	lr

08000996 <usart_set_mode>:
 8000996:	b480      	push	{r7}
 8000998:	b083      	sub	sp, #12
 800099a:	af00      	add	r7, sp, #0
 800099c:	6078      	str	r0, [r7, #4]
 800099e:	6039      	str	r1, [r7, #0]
 80009a0:	687b      	ldr	r3, [r7, #4]
 80009a2:	330c      	adds	r3, #12
 80009a4:	681a      	ldr	r2, [r3, #0]
 80009a6:	687b      	ldr	r3, [r7, #4]
 80009a8:	330c      	adds	r3, #12
 80009aa:	4619      	mov	r1, r3
 80009ac:	683b      	ldr	r3, [r7, #0]
 80009ae:	4313      	orrs	r3, r2
 80009b0:	600b      	str	r3, [r1, #0]
 80009b2:	bf00      	nop
 80009b4:	370c      	adds	r7, #12
 80009b6:	46bd      	mov	sp, r7
 80009b8:	bc80      	pop	{r7}
 80009ba:	4770      	bx	lr

080009bc <usart_set_baudrate>:
 80009bc:	b480      	push	{r7}
 80009be:	b085      	sub	sp, #20
 80009c0:	af00      	add	r7, sp, #0
 80009c2:	6078      	str	r0, [r7, #4]
 80009c4:	6039      	str	r1, [r7, #0]
 80009c6:	687b      	ldr	r3, [r7, #4]
 80009c8:	3308      	adds	r3, #8
 80009ca:	681b      	ldr	r3, [r3, #0]
 80009cc:	60fb      	str	r3, [r7, #12]
 80009ce:	4b09      	ldr	r3, [pc, #36]	; (80009f4 <usart_set_baudrate+0x38>)
 80009d0:	681a      	ldr	r2, [r3, #0]
 80009d2:	683b      	ldr	r3, [r7, #0]
 80009d4:	011b      	lsls	r3, r3, #4
 80009d6:	fbb2 f3f3 	udiv	r3, r2, r3
 80009da:	011b      	lsls	r3, r3, #4
 80009dc:	60fb      	str	r3, [r7, #12]
 80009de:	687b      	ldr	r3, [r7, #4]
 80009e0:	3308      	adds	r3, #8
 80009e2:	461a      	mov	r2, r3
 80009e4:	68fb      	ldr	r3, [r7, #12]
 80009e6:	6013      	str	r3, [r2, #0]
 80009e8:	bf00      	nop
 80009ea:	3714      	adds	r7, #20
 80009ec:	46bd      	mov	sp, r7
 80009ee:	bc80      	pop	{r7}
 80009f0:	4770      	bx	lr
 80009f2:	bf00      	nop
 80009f4:	20000014 	.word	0x20000014

080009f8 <usart_transmit>:
 80009f8:	b580      	push	{r7, lr}
 80009fa:	b086      	sub	sp, #24
 80009fc:	af00      	add	r7, sp, #0
 80009fe:	60f8      	str	r0, [r7, #12]
 8000a00:	60b9      	str	r1, [r7, #8]
 8000a02:	607a      	str	r2, [r7, #4]
 8000a04:	687b      	ldr	r3, [r7, #4]
 8000a06:	613b      	str	r3, [r7, #16]
 8000a08:	2300      	movs	r3, #0
 8000a0a:	617b      	str	r3, [r7, #20]
 8000a0c:	e00a      	b.n	8000a24 <usart_transmit+0x2c>
 8000a0e:	693b      	ldr	r3, [r7, #16]
 8000a10:	1c5a      	adds	r2, r3, #1
 8000a12:	613a      	str	r2, [r7, #16]
 8000a14:	781b      	ldrb	r3, [r3, #0]
 8000a16:	4619      	mov	r1, r3
 8000a18:	68f8      	ldr	r0, [r7, #12]
 8000a1a:	f000 f80c 	bl	8000a36 <usart_send_byte>
 8000a1e:	697b      	ldr	r3, [r7, #20]
 8000a20:	3301      	adds	r3, #1
 8000a22:	617b      	str	r3, [r7, #20]
 8000a24:	697a      	ldr	r2, [r7, #20]
 8000a26:	68bb      	ldr	r3, [r7, #8]
 8000a28:	429a      	cmp	r2, r3
 8000a2a:	d3f0      	bcc.n	8000a0e <usart_transmit+0x16>
 8000a2c:	bf00      	nop
 8000a2e:	bf00      	nop
 8000a30:	3718      	adds	r7, #24
 8000a32:	46bd      	mov	sp, r7
 8000a34:	bd80      	pop	{r7, pc}

08000a36 <usart_send_byte>:
 8000a36:	b480      	push	{r7}
 8000a38:	b083      	sub	sp, #12
 8000a3a:	af00      	add	r7, sp, #0
 8000a3c:	6078      	str	r0, [r7, #4]
 8000a3e:	460b      	mov	r3, r1
 8000a40:	70fb      	strb	r3, [r7, #3]
 8000a42:	687b      	ldr	r3, [r7, #4]
 8000a44:	3304      	adds	r3, #4
 8000a46:	461a      	mov	r2, r3
 8000a48:	78fb      	ldrb	r3, [r7, #3]
 8000a4a:	6013      	str	r3, [r2, #0]
 8000a4c:	bf00      	nop
 8000a4e:	687b      	ldr	r3, [r7, #4]
 8000a50:	681b      	ldr	r3, [r3, #0]
 8000a52:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8000a56:	2b00      	cmp	r3, #0
 8000a58:	d0f9      	beq.n	8000a4e <usart_send_byte+0x18>
 8000a5a:	bf00      	nop
 8000a5c:	bf00      	nop
 8000a5e:	370c      	adds	r7, #12
 8000a60:	46bd      	mov	sp, r7
 8000a62:	bc80      	pop	{r7}
 8000a64:	4770      	bx	lr

08000a66 <usart_receive>:
 8000a66:	b590      	push	{r4, r7, lr}
 8000a68:	b087      	sub	sp, #28
 8000a6a:	af00      	add	r7, sp, #0
 8000a6c:	60f8      	str	r0, [r7, #12]
 8000a6e:	60b9      	str	r1, [r7, #8]
 8000a70:	607a      	str	r2, [r7, #4]
 8000a72:	687b      	ldr	r3, [r7, #4]
 8000a74:	613b      	str	r3, [r7, #16]
 8000a76:	2300      	movs	r3, #0
 8000a78:	617b      	str	r3, [r7, #20]
 8000a7a:	e00a      	b.n	8000a92 <usart_receive+0x2c>
 8000a7c:	693c      	ldr	r4, [r7, #16]
 8000a7e:	1c63      	adds	r3, r4, #1
 8000a80:	613b      	str	r3, [r7, #16]
 8000a82:	68f8      	ldr	r0, [r7, #12]
 8000a84:	f000 f80e 	bl	8000aa4 <usart_get_byte>
 8000a88:	4603      	mov	r3, r0
 8000a8a:	7023      	strb	r3, [r4, #0]
 8000a8c:	697b      	ldr	r3, [r7, #20]
 8000a8e:	3301      	adds	r3, #1
 8000a90:	617b      	str	r3, [r7, #20]
 8000a92:	697a      	ldr	r2, [r7, #20]
 8000a94:	68bb      	ldr	r3, [r7, #8]
 8000a96:	429a      	cmp	r2, r3
 8000a98:	d3f0      	bcc.n	8000a7c <usart_receive+0x16>
 8000a9a:	bf00      	nop
 8000a9c:	bf00      	nop
 8000a9e:	371c      	adds	r7, #28
 8000aa0:	46bd      	mov	sp, r7
 8000aa2:	bd90      	pop	{r4, r7, pc}

08000aa4 <usart_get_byte>:
 8000aa4:	b480      	push	{r7}
 8000aa6:	b083      	sub	sp, #12
 8000aa8:	af00      	add	r7, sp, #0
 8000aaa:	6078      	str	r0, [r7, #4]
 8000aac:	bf00      	nop
 8000aae:	687b      	ldr	r3, [r7, #4]
 8000ab0:	681b      	ldr	r3, [r3, #0]
 8000ab2:	f003 0320 	and.w	r3, r3, #32
 8000ab6:	2b00      	cmp	r3, #0
 8000ab8:	d0f9      	beq.n	8000aae <usart_get_byte+0xa>
 8000aba:	687b      	ldr	r3, [r7, #4]
 8000abc:	3304      	adds	r3, #4
 8000abe:	681b      	ldr	r3, [r3, #0]
 8000ac0:	b2db      	uxtb	r3, r3
 8000ac2:	4618      	mov	r0, r3
 8000ac4:	370c      	adds	r7, #12
 8000ac6:	46bd      	mov	sp, r7
 8000ac8:	bc80      	pop	{r7}
 8000aca:	4770      	bx	lr

08000acc <usart_irq_enable>:
 8000acc:	b480      	push	{r7}
 8000ace:	b083      	sub	sp, #12
 8000ad0:	af00      	add	r7, sp, #0
 8000ad2:	6078      	str	r0, [r7, #4]
 8000ad4:	687b      	ldr	r3, [r7, #4]
 8000ad6:	330c      	adds	r3, #12
 8000ad8:	681b      	ldr	r3, [r3, #0]
 8000ada:	687a      	ldr	r2, [r7, #4]
 8000adc:	320c      	adds	r2, #12
 8000ade:	f043 0320 	orr.w	r3, r3, #32
 8000ae2:	6013      	str	r3, [r2, #0]
 8000ae4:	bf00      	nop
 8000ae6:	370c      	adds	r7, #12
 8000ae8:	46bd      	mov	sp, r7
 8000aea:	bc80      	pop	{r7}
 8000aec:	4770      	bx	lr

08000aee <usart_init_send>:
 8000aee:	b580      	push	{r7, lr}
 8000af0:	b082      	sub	sp, #8
 8000af2:	af00      	add	r7, sp, #0
 8000af4:	6078      	str	r0, [r7, #4]
 8000af6:	2100      	movs	r1, #0
 8000af8:	6878      	ldr	r0, [r7, #4]
 8000afa:	f7ff ff9c 	bl	8000a36 <usart_send_byte>
 8000afe:	bf00      	nop
 8000b00:	3708      	adds	r7, #8
 8000b02:	46bd      	mov	sp, r7
 8000b04:	bd80      	pop	{r7, pc}
 8000b06:	bf00      	nop

08000b08 <strlen>:
 8000b08:	4603      	mov	r3, r0
 8000b0a:	f813 2b01 	ldrb.w	r2, [r3], #1
 8000b0e:	2a00      	cmp	r2, #0
 8000b10:	d1fb      	bne.n	8000b0a <strlen+0x2>
 8000b12:	1a18      	subs	r0, r3, r0
 8000b14:	3801      	subs	r0, #1
 8000b16:	4770      	bx	lr
	...

08000b20 <memchr>:
 8000b20:	f001 01ff 	and.w	r1, r1, #255	; 0xff
 8000b24:	2a10      	cmp	r2, #16
 8000b26:	db2b      	blt.n	8000b80 <memchr+0x60>
 8000b28:	f010 0f07 	tst.w	r0, #7
 8000b2c:	d008      	beq.n	8000b40 <memchr+0x20>
 8000b2e:	f810 3b01 	ldrb.w	r3, [r0], #1
 8000b32:	3a01      	subs	r2, #1
 8000b34:	428b      	cmp	r3, r1
 8000b36:	d02d      	beq.n	8000b94 <memchr+0x74>
 8000b38:	f010 0f07 	tst.w	r0, #7
 8000b3c:	b342      	cbz	r2, 8000b90 <memchr+0x70>
 8000b3e:	d1f6      	bne.n	8000b2e <memchr+0xe>
 8000b40:	b4f0      	push	{r4, r5, r6, r7}
 8000b42:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
 8000b46:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
 8000b4a:	f022 0407 	bic.w	r4, r2, #7
 8000b4e:	f07f 0700 	mvns.w	r7, #0
 8000b52:	2300      	movs	r3, #0
 8000b54:	e8f0 5602 	ldrd	r5, r6, [r0], #8
 8000b58:	3c08      	subs	r4, #8
 8000b5a:	ea85 0501 	eor.w	r5, r5, r1
 8000b5e:	ea86 0601 	eor.w	r6, r6, r1
 8000b62:	fa85 f547 	uadd8	r5, r5, r7
 8000b66:	faa3 f587 	sel	r5, r3, r7
 8000b6a:	fa86 f647 	uadd8	r6, r6, r7
 8000b6e:	faa5 f687 	sel	r6, r5, r7
 8000b72:	b98e      	cbnz	r6, 8000b98 <memchr+0x78>
 8000b74:	d1ee      	bne.n	8000b54 <memchr+0x34>
 8000b76:	bcf0      	pop	{r4, r5, r6, r7}
 8000b78:	f001 01ff 	and.w	r1, r1, #255	; 0xff
 8000b7c:	f002 0207 	and.w	r2, r2, #7
 8000b80:	b132      	cbz	r2, 8000b90 <memchr+0x70>
 8000b82:	f810 3b01 	ldrb.w	r3, [r0], #1
 8000b86:	3a01      	subs	r2, #1
 8000b88:	ea83 0301 	eor.w	r3, r3, r1
 8000b8c:	b113      	cbz	r3, 8000b94 <memchr+0x74>
 8000b8e:	d1f8      	bne.n	8000b82 <memchr+0x62>
 8000b90:	2000      	movs	r0, #0
 8000b92:	4770      	bx	lr
 8000b94:	3801      	subs	r0, #1
 8000b96:	4770      	bx	lr
 8000b98:	2d00      	cmp	r5, #0
 8000b9a:	bf06      	itte	eq
 8000b9c:	4635      	moveq	r5, r6
 8000b9e:	3803      	subeq	r0, #3
 8000ba0:	3807      	subne	r0, #7
 8000ba2:	f015 0f01 	tst.w	r5, #1
 8000ba6:	d107      	bne.n	8000bb8 <memchr+0x98>
 8000ba8:	3001      	adds	r0, #1
 8000baa:	f415 7f80 	tst.w	r5, #256	; 0x100
 8000bae:	bf02      	ittt	eq
 8000bb0:	3001      	addeq	r0, #1
 8000bb2:	f415 3fc0 	tsteq.w	r5, #98304	; 0x18000
 8000bb6:	3001      	addeq	r0, #1
 8000bb8:	bcf0      	pop	{r4, r5, r6, r7}
 8000bba:	3801      	subs	r0, #1
 8000bbc:	4770      	bx	lr
 8000bbe:	bf00      	nop

08000bc0 <memset>:
 8000bc0:	4402      	add	r2, r0
 8000bc2:	4603      	mov	r3, r0
 8000bc4:	4293      	cmp	r3, r2
 8000bc6:	d100      	bne.n	8000bca <memset+0xa>
 8000bc8:	4770      	bx	lr
 8000bca:	f803 1b01 	strb.w	r1, [r3], #1
 8000bce:	e7f9      	b.n	8000bc4 <memset+0x4>

08000bd0 <_puts_r>:
 8000bd0:	b570      	push	{r4, r5, r6, lr}
 8000bd2:	460e      	mov	r6, r1
 8000bd4:	4605      	mov	r5, r0
 8000bd6:	b118      	cbz	r0, 8000be0 <_puts_r+0x10>
 8000bd8:	6983      	ldr	r3, [r0, #24]
 8000bda:	b90b      	cbnz	r3, 8000be0 <_puts_r+0x10>
 8000bdc:	f000 fa78 	bl	80010d0 <__sinit>
 8000be0:	69ab      	ldr	r3, [r5, #24]
 8000be2:	68ac      	ldr	r4, [r5, #8]
 8000be4:	b913      	cbnz	r3, 8000bec <_puts_r+0x1c>
 8000be6:	4628      	mov	r0, r5
 8000be8:	f000 fa72 	bl	80010d0 <__sinit>
 8000bec:	4b2c      	ldr	r3, [pc, #176]	; (8000ca0 <_puts_r+0xd0>)
 8000bee:	429c      	cmp	r4, r3
 8000bf0:	d120      	bne.n	8000c34 <_puts_r+0x64>
 8000bf2:	686c      	ldr	r4, [r5, #4]
 8000bf4:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8000bf6:	07db      	lsls	r3, r3, #31
 8000bf8:	d405      	bmi.n	8000c06 <_puts_r+0x36>
 8000bfa:	89a3      	ldrh	r3, [r4, #12]
 8000bfc:	0598      	lsls	r0, r3, #22
 8000bfe:	d402      	bmi.n	8000c06 <_puts_r+0x36>
 8000c00:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8000c02:	f000 fb03 	bl	800120c <__retarget_lock_acquire_recursive>
 8000c06:	89a3      	ldrh	r3, [r4, #12]
 8000c08:	0719      	lsls	r1, r3, #28
 8000c0a:	d51d      	bpl.n	8000c48 <_puts_r+0x78>
 8000c0c:	6923      	ldr	r3, [r4, #16]
 8000c0e:	b1db      	cbz	r3, 8000c48 <_puts_r+0x78>
 8000c10:	3e01      	subs	r6, #1
 8000c12:	68a3      	ldr	r3, [r4, #8]
 8000c14:	f816 1f01 	ldrb.w	r1, [r6, #1]!
 8000c18:	3b01      	subs	r3, #1
 8000c1a:	60a3      	str	r3, [r4, #8]
 8000c1c:	bb39      	cbnz	r1, 8000c6e <_puts_r+0x9e>
 8000c1e:	2b00      	cmp	r3, #0
 8000c20:	da38      	bge.n	8000c94 <_puts_r+0xc4>
 8000c22:	4622      	mov	r2, r4
 8000c24:	210a      	movs	r1, #10
 8000c26:	4628      	mov	r0, r5
 8000c28:	f000 f87c 	bl	8000d24 <__swbuf_r>
 8000c2c:	3001      	adds	r0, #1
 8000c2e:	d011      	beq.n	8000c54 <_puts_r+0x84>
 8000c30:	250a      	movs	r5, #10
 8000c32:	e011      	b.n	8000c58 <_puts_r+0x88>
 8000c34:	4b1b      	ldr	r3, [pc, #108]	; (8000ca4 <_puts_r+0xd4>)
 8000c36:	429c      	cmp	r4, r3
 8000c38:	d101      	bne.n	8000c3e <_puts_r+0x6e>
 8000c3a:	68ac      	ldr	r4, [r5, #8]
 8000c3c:	e7da      	b.n	8000bf4 <_puts_r+0x24>
 8000c3e:	4b1a      	ldr	r3, [pc, #104]	; (8000ca8 <_puts_r+0xd8>)
 8000c40:	429c      	cmp	r4, r3
 8000c42:	bf08      	it	eq
 8000c44:	68ec      	ldreq	r4, [r5, #12]
 8000c46:	e7d5      	b.n	8000bf4 <_puts_r+0x24>
 8000c48:	4621      	mov	r1, r4
 8000c4a:	4628      	mov	r0, r5
 8000c4c:	f000 f8bc 	bl	8000dc8 <__swsetup_r>
 8000c50:	2800      	cmp	r0, #0
 8000c52:	d0dd      	beq.n	8000c10 <_puts_r+0x40>
 8000c54:	f04f 35ff 	mov.w	r5, #4294967295
 8000c58:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8000c5a:	07da      	lsls	r2, r3, #31
 8000c5c:	d405      	bmi.n	8000c6a <_puts_r+0x9a>
 8000c5e:	89a3      	ldrh	r3, [r4, #12]
 8000c60:	059b      	lsls	r3, r3, #22
 8000c62:	d402      	bmi.n	8000c6a <_puts_r+0x9a>
 8000c64:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8000c66:	f000 fad2 	bl	800120e <__retarget_lock_release_recursive>
 8000c6a:	4628      	mov	r0, r5
 8000c6c:	bd70      	pop	{r4, r5, r6, pc}
 8000c6e:	2b00      	cmp	r3, #0
 8000c70:	da04      	bge.n	8000c7c <_puts_r+0xac>
 8000c72:	69a2      	ldr	r2, [r4, #24]
 8000c74:	429a      	cmp	r2, r3
 8000c76:	dc06      	bgt.n	8000c86 <_puts_r+0xb6>
 8000c78:	290a      	cmp	r1, #10
 8000c7a:	d004      	beq.n	8000c86 <_puts_r+0xb6>
 8000c7c:	6823      	ldr	r3, [r4, #0]
 8000c7e:	1c5a      	adds	r2, r3, #1
 8000c80:	6022      	str	r2, [r4, #0]
 8000c82:	7019      	strb	r1, [r3, #0]
 8000c84:	e7c5      	b.n	8000c12 <_puts_r+0x42>
 8000c86:	4622      	mov	r2, r4
 8000c88:	4628      	mov	r0, r5
 8000c8a:	f000 f84b 	bl	8000d24 <__swbuf_r>
 8000c8e:	3001      	adds	r0, #1
 8000c90:	d1bf      	bne.n	8000c12 <_puts_r+0x42>
 8000c92:	e7df      	b.n	8000c54 <_puts_r+0x84>
 8000c94:	6823      	ldr	r3, [r4, #0]
 8000c96:	250a      	movs	r5, #10
 8000c98:	1c5a      	adds	r2, r3, #1
 8000c9a:	6022      	str	r2, [r4, #0]
 8000c9c:	701d      	strb	r5, [r3, #0]
 8000c9e:	e7db      	b.n	8000c58 <_puts_r+0x88>
 8000ca0:	08001e90 	.word	0x08001e90
 8000ca4:	08001eb0 	.word	0x08001eb0
 8000ca8:	08001e70 	.word	0x08001e70

08000cac <puts>:
 8000cac:	4b02      	ldr	r3, [pc, #8]	; (8000cb8 <puts+0xc>)
 8000cae:	4601      	mov	r1, r0
 8000cb0:	6818      	ldr	r0, [r3, #0]
 8000cb2:	f7ff bf8d 	b.w	8000bd0 <_puts_r>
 8000cb6:	bf00      	nop
 8000cb8:	20000018 	.word	0x20000018

08000cbc <sniprintf>:
 8000cbc:	b40c      	push	{r2, r3}
 8000cbe:	b530      	push	{r4, r5, lr}
 8000cc0:	4b17      	ldr	r3, [pc, #92]	; (8000d20 <sniprintf+0x64>)
 8000cc2:	1e0c      	subs	r4, r1, #0
 8000cc4:	681d      	ldr	r5, [r3, #0]
 8000cc6:	b09d      	sub	sp, #116	; 0x74
 8000cc8:	da08      	bge.n	8000cdc <sniprintf+0x20>
 8000cca:	238b      	movs	r3, #139	; 0x8b
 8000ccc:	602b      	str	r3, [r5, #0]
 8000cce:	f04f 30ff 	mov.w	r0, #4294967295
 8000cd2:	b01d      	add	sp, #116	; 0x74
 8000cd4:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000cd8:	b002      	add	sp, #8
 8000cda:	4770      	bx	lr
 8000cdc:	f44f 7302 	mov.w	r3, #520	; 0x208
 8000ce0:	f8ad 3014 	strh.w	r3, [sp, #20]
 8000ce4:	bf14      	ite	ne
 8000ce6:	f104 33ff 	addne.w	r3, r4, #4294967295
 8000cea:	4623      	moveq	r3, r4
 8000cec:	9304      	str	r3, [sp, #16]
 8000cee:	9307      	str	r3, [sp, #28]
 8000cf0:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000cf4:	9002      	str	r0, [sp, #8]
 8000cf6:	9006      	str	r0, [sp, #24]
 8000cf8:	f8ad 3016 	strh.w	r3, [sp, #22]
 8000cfc:	9a20      	ldr	r2, [sp, #128]	; 0x80
 8000cfe:	ab21      	add	r3, sp, #132	; 0x84
 8000d00:	a902      	add	r1, sp, #8
 8000d02:	4628      	mov	r0, r5
 8000d04:	9301      	str	r3, [sp, #4]
 8000d06:	f000 fc23 	bl	8001550 <_svfiprintf_r>
 8000d0a:	1c43      	adds	r3, r0, #1
 8000d0c:	bfbc      	itt	lt
 8000d0e:	238b      	movlt	r3, #139	; 0x8b
 8000d10:	602b      	strlt	r3, [r5, #0]
 8000d12:	2c00      	cmp	r4, #0
 8000d14:	d0dd      	beq.n	8000cd2 <sniprintf+0x16>
 8000d16:	9b02      	ldr	r3, [sp, #8]
 8000d18:	2200      	movs	r2, #0
 8000d1a:	701a      	strb	r2, [r3, #0]
 8000d1c:	e7d9      	b.n	8000cd2 <sniprintf+0x16>
 8000d1e:	bf00      	nop
 8000d20:	20000018 	.word	0x20000018

08000d24 <__swbuf_r>:
 8000d24:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000d26:	460e      	mov	r6, r1
 8000d28:	4614      	mov	r4, r2
 8000d2a:	4605      	mov	r5, r0
 8000d2c:	b118      	cbz	r0, 8000d36 <__swbuf_r+0x12>
 8000d2e:	6983      	ldr	r3, [r0, #24]
 8000d30:	b90b      	cbnz	r3, 8000d36 <__swbuf_r+0x12>
 8000d32:	f000 f9cd 	bl	80010d0 <__sinit>
 8000d36:	4b21      	ldr	r3, [pc, #132]	; (8000dbc <__swbuf_r+0x98>)
 8000d38:	429c      	cmp	r4, r3
 8000d3a:	d12b      	bne.n	8000d94 <__swbuf_r+0x70>
 8000d3c:	686c      	ldr	r4, [r5, #4]
 8000d3e:	69a3      	ldr	r3, [r4, #24]
 8000d40:	60a3      	str	r3, [r4, #8]
 8000d42:	89a3      	ldrh	r3, [r4, #12]
 8000d44:	071a      	lsls	r2, r3, #28
 8000d46:	d52f      	bpl.n	8000da8 <__swbuf_r+0x84>
 8000d48:	6923      	ldr	r3, [r4, #16]
 8000d4a:	b36b      	cbz	r3, 8000da8 <__swbuf_r+0x84>
 8000d4c:	6923      	ldr	r3, [r4, #16]
 8000d4e:	6820      	ldr	r0, [r4, #0]
 8000d50:	1ac0      	subs	r0, r0, r3
 8000d52:	6963      	ldr	r3, [r4, #20]
 8000d54:	b2f6      	uxtb	r6, r6
 8000d56:	4283      	cmp	r3, r0
 8000d58:	4637      	mov	r7, r6
 8000d5a:	dc04      	bgt.n	8000d66 <__swbuf_r+0x42>
 8000d5c:	4621      	mov	r1, r4
 8000d5e:	4628      	mov	r0, r5
 8000d60:	f000 f922 	bl	8000fa8 <_fflush_r>
 8000d64:	bb30      	cbnz	r0, 8000db4 <__swbuf_r+0x90>
 8000d66:	68a3      	ldr	r3, [r4, #8]
 8000d68:	3b01      	subs	r3, #1
 8000d6a:	60a3      	str	r3, [r4, #8]
 8000d6c:	6823      	ldr	r3, [r4, #0]
 8000d6e:	1c5a      	adds	r2, r3, #1
 8000d70:	6022      	str	r2, [r4, #0]
 8000d72:	701e      	strb	r6, [r3, #0]
 8000d74:	6963      	ldr	r3, [r4, #20]
 8000d76:	3001      	adds	r0, #1
 8000d78:	4283      	cmp	r3, r0
 8000d7a:	d004      	beq.n	8000d86 <__swbuf_r+0x62>
 8000d7c:	89a3      	ldrh	r3, [r4, #12]
 8000d7e:	07db      	lsls	r3, r3, #31
 8000d80:	d506      	bpl.n	8000d90 <__swbuf_r+0x6c>
 8000d82:	2e0a      	cmp	r6, #10
 8000d84:	d104      	bne.n	8000d90 <__swbuf_r+0x6c>
 8000d86:	4621      	mov	r1, r4
 8000d88:	4628      	mov	r0, r5
 8000d8a:	f000 f90d 	bl	8000fa8 <_fflush_r>
 8000d8e:	b988      	cbnz	r0, 8000db4 <__swbuf_r+0x90>
 8000d90:	4638      	mov	r0, r7
 8000d92:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000d94:	4b0a      	ldr	r3, [pc, #40]	; (8000dc0 <__swbuf_r+0x9c>)
 8000d96:	429c      	cmp	r4, r3
 8000d98:	d101      	bne.n	8000d9e <__swbuf_r+0x7a>
 8000d9a:	68ac      	ldr	r4, [r5, #8]
 8000d9c:	e7cf      	b.n	8000d3e <__swbuf_r+0x1a>
 8000d9e:	4b09      	ldr	r3, [pc, #36]	; (8000dc4 <__swbuf_r+0xa0>)
 8000da0:	429c      	cmp	r4, r3
 8000da2:	bf08      	it	eq
 8000da4:	68ec      	ldreq	r4, [r5, #12]
 8000da6:	e7ca      	b.n	8000d3e <__swbuf_r+0x1a>
 8000da8:	4621      	mov	r1, r4
 8000daa:	4628      	mov	r0, r5
 8000dac:	f000 f80c 	bl	8000dc8 <__swsetup_r>
 8000db0:	2800      	cmp	r0, #0
 8000db2:	d0cb      	beq.n	8000d4c <__swbuf_r+0x28>
 8000db4:	f04f 37ff 	mov.w	r7, #4294967295
 8000db8:	e7ea      	b.n	8000d90 <__swbuf_r+0x6c>
 8000dba:	bf00      	nop
 8000dbc:	08001e90 	.word	0x08001e90
 8000dc0:	08001eb0 	.word	0x08001eb0
 8000dc4:	08001e70 	.word	0x08001e70

08000dc8 <__swsetup_r>:
 8000dc8:	4b32      	ldr	r3, [pc, #200]	; (8000e94 <__swsetup_r+0xcc>)
 8000dca:	b570      	push	{r4, r5, r6, lr}
 8000dcc:	681d      	ldr	r5, [r3, #0]
 8000dce:	4606      	mov	r6, r0
 8000dd0:	460c      	mov	r4, r1
 8000dd2:	b125      	cbz	r5, 8000dde <__swsetup_r+0x16>
 8000dd4:	69ab      	ldr	r3, [r5, #24]
 8000dd6:	b913      	cbnz	r3, 8000dde <__swsetup_r+0x16>
 8000dd8:	4628      	mov	r0, r5
 8000dda:	f000 f979 	bl	80010d0 <__sinit>
 8000dde:	4b2e      	ldr	r3, [pc, #184]	; (8000e98 <__swsetup_r+0xd0>)
 8000de0:	429c      	cmp	r4, r3
 8000de2:	d10f      	bne.n	8000e04 <__swsetup_r+0x3c>
 8000de4:	686c      	ldr	r4, [r5, #4]
 8000de6:	89a3      	ldrh	r3, [r4, #12]
 8000de8:	f9b4 200c 	ldrsh.w	r2, [r4, #12]
 8000dec:	0719      	lsls	r1, r3, #28
 8000dee:	d42c      	bmi.n	8000e4a <__swsetup_r+0x82>
 8000df0:	06dd      	lsls	r5, r3, #27
 8000df2:	d411      	bmi.n	8000e18 <__swsetup_r+0x50>
 8000df4:	2309      	movs	r3, #9
 8000df6:	6033      	str	r3, [r6, #0]
 8000df8:	f042 0340 	orr.w	r3, r2, #64	; 0x40
 8000dfc:	81a3      	strh	r3, [r4, #12]
 8000dfe:	f04f 30ff 	mov.w	r0, #4294967295
 8000e02:	e03e      	b.n	8000e82 <__swsetup_r+0xba>
 8000e04:	4b25      	ldr	r3, [pc, #148]	; (8000e9c <__swsetup_r+0xd4>)
 8000e06:	429c      	cmp	r4, r3
 8000e08:	d101      	bne.n	8000e0e <__swsetup_r+0x46>
 8000e0a:	68ac      	ldr	r4, [r5, #8]
 8000e0c:	e7eb      	b.n	8000de6 <__swsetup_r+0x1e>
 8000e0e:	4b24      	ldr	r3, [pc, #144]	; (8000ea0 <__swsetup_r+0xd8>)
 8000e10:	429c      	cmp	r4, r3
 8000e12:	bf08      	it	eq
 8000e14:	68ec      	ldreq	r4, [r5, #12]
 8000e16:	e7e6      	b.n	8000de6 <__swsetup_r+0x1e>
 8000e18:	0758      	lsls	r0, r3, #29
 8000e1a:	d512      	bpl.n	8000e42 <__swsetup_r+0x7a>
 8000e1c:	6b61      	ldr	r1, [r4, #52]	; 0x34
 8000e1e:	b141      	cbz	r1, 8000e32 <__swsetup_r+0x6a>
 8000e20:	f104 0344 	add.w	r3, r4, #68	; 0x44
 8000e24:	4299      	cmp	r1, r3
 8000e26:	d002      	beq.n	8000e2e <__swsetup_r+0x66>
 8000e28:	4630      	mov	r0, r6
 8000e2a:	f000 fa57 	bl	80012dc <_free_r>
 8000e2e:	2300      	movs	r3, #0
 8000e30:	6363      	str	r3, [r4, #52]	; 0x34
 8000e32:	89a3      	ldrh	r3, [r4, #12]
 8000e34:	f023 0324 	bic.w	r3, r3, #36	; 0x24
 8000e38:	81a3      	strh	r3, [r4, #12]
 8000e3a:	2300      	movs	r3, #0
 8000e3c:	6063      	str	r3, [r4, #4]
 8000e3e:	6923      	ldr	r3, [r4, #16]
 8000e40:	6023      	str	r3, [r4, #0]
 8000e42:	89a3      	ldrh	r3, [r4, #12]
 8000e44:	f043 0308 	orr.w	r3, r3, #8
 8000e48:	81a3      	strh	r3, [r4, #12]
 8000e4a:	6923      	ldr	r3, [r4, #16]
 8000e4c:	b94b      	cbnz	r3, 8000e62 <__swsetup_r+0x9a>
 8000e4e:	89a3      	ldrh	r3, [r4, #12]
 8000e50:	f403 7320 	and.w	r3, r3, #640	; 0x280
 8000e54:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
 8000e58:	d003      	beq.n	8000e62 <__swsetup_r+0x9a>
 8000e5a:	4621      	mov	r1, r4
 8000e5c:	4630      	mov	r0, r6
 8000e5e:	f000 f9fd 	bl	800125c <__smakebuf_r>
 8000e62:	89a0      	ldrh	r0, [r4, #12]
 8000e64:	f9b4 200c 	ldrsh.w	r2, [r4, #12]
 8000e68:	f010 0301 	ands.w	r3, r0, #1
 8000e6c:	d00a      	beq.n	8000e84 <__swsetup_r+0xbc>
 8000e6e:	2300      	movs	r3, #0
 8000e70:	60a3      	str	r3, [r4, #8]
 8000e72:	6963      	ldr	r3, [r4, #20]
 8000e74:	425b      	negs	r3, r3
 8000e76:	61a3      	str	r3, [r4, #24]
 8000e78:	6923      	ldr	r3, [r4, #16]
 8000e7a:	b943      	cbnz	r3, 8000e8e <__swsetup_r+0xc6>
 8000e7c:	f010 0080 	ands.w	r0, r0, #128	; 0x80
 8000e80:	d1ba      	bne.n	8000df8 <__swsetup_r+0x30>
 8000e82:	bd70      	pop	{r4, r5, r6, pc}
 8000e84:	0781      	lsls	r1, r0, #30
 8000e86:	bf58      	it	pl
 8000e88:	6963      	ldrpl	r3, [r4, #20]
 8000e8a:	60a3      	str	r3, [r4, #8]
 8000e8c:	e7f4      	b.n	8000e78 <__swsetup_r+0xb0>
 8000e8e:	2000      	movs	r0, #0
 8000e90:	e7f7      	b.n	8000e82 <__swsetup_r+0xba>
 8000e92:	bf00      	nop
 8000e94:	20000018 	.word	0x20000018
 8000e98:	08001e90 	.word	0x08001e90
 8000e9c:	08001eb0 	.word	0x08001eb0
 8000ea0:	08001e70 	.word	0x08001e70

08000ea4 <__sflush_r>:
 8000ea4:	898a      	ldrh	r2, [r1, #12]
 8000ea6:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000ea8:	4605      	mov	r5, r0
 8000eaa:	0710      	lsls	r0, r2, #28
 8000eac:	460c      	mov	r4, r1
 8000eae:	d457      	bmi.n	8000f60 <__sflush_r+0xbc>
 8000eb0:	684b      	ldr	r3, [r1, #4]
 8000eb2:	2b00      	cmp	r3, #0
 8000eb4:	dc04      	bgt.n	8000ec0 <__sflush_r+0x1c>
 8000eb6:	6c0b      	ldr	r3, [r1, #64]	; 0x40
 8000eb8:	2b00      	cmp	r3, #0
 8000eba:	dc01      	bgt.n	8000ec0 <__sflush_r+0x1c>
 8000ebc:	2000      	movs	r0, #0
 8000ebe:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000ec0:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 8000ec2:	2e00      	cmp	r6, #0
 8000ec4:	d0fa      	beq.n	8000ebc <__sflush_r+0x18>
 8000ec6:	2300      	movs	r3, #0
 8000ec8:	f412 5280 	ands.w	r2, r2, #4096	; 0x1000
 8000ecc:	682f      	ldr	r7, [r5, #0]
 8000ece:	602b      	str	r3, [r5, #0]
 8000ed0:	d032      	beq.n	8000f38 <__sflush_r+0x94>
 8000ed2:	6d60      	ldr	r0, [r4, #84]	; 0x54
 8000ed4:	89a3      	ldrh	r3, [r4, #12]
 8000ed6:	075a      	lsls	r2, r3, #29
 8000ed8:	d505      	bpl.n	8000ee6 <__sflush_r+0x42>
 8000eda:	6863      	ldr	r3, [r4, #4]
 8000edc:	1ac0      	subs	r0, r0, r3
 8000ede:	6b63      	ldr	r3, [r4, #52]	; 0x34
 8000ee0:	b10b      	cbz	r3, 8000ee6 <__sflush_r+0x42>
 8000ee2:	6c23      	ldr	r3, [r4, #64]	; 0x40
 8000ee4:	1ac0      	subs	r0, r0, r3
 8000ee6:	2300      	movs	r3, #0
 8000ee8:	4602      	mov	r2, r0
 8000eea:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 8000eec:	6a21      	ldr	r1, [r4, #32]
 8000eee:	4628      	mov	r0, r5
 8000ef0:	47b0      	blx	r6
 8000ef2:	1c43      	adds	r3, r0, #1
 8000ef4:	89a3      	ldrh	r3, [r4, #12]
 8000ef6:	d106      	bne.n	8000f06 <__sflush_r+0x62>
 8000ef8:	6829      	ldr	r1, [r5, #0]
 8000efa:	291d      	cmp	r1, #29
 8000efc:	d82c      	bhi.n	8000f58 <__sflush_r+0xb4>
 8000efe:	4a29      	ldr	r2, [pc, #164]	; (8000fa4 <__sflush_r+0x100>)
 8000f00:	40ca      	lsrs	r2, r1
 8000f02:	07d6      	lsls	r6, r2, #31
 8000f04:	d528      	bpl.n	8000f58 <__sflush_r+0xb4>
 8000f06:	2200      	movs	r2, #0
 8000f08:	6062      	str	r2, [r4, #4]
 8000f0a:	04d9      	lsls	r1, r3, #19
 8000f0c:	6922      	ldr	r2, [r4, #16]
 8000f0e:	6022      	str	r2, [r4, #0]
 8000f10:	d504      	bpl.n	8000f1c <__sflush_r+0x78>
 8000f12:	1c42      	adds	r2, r0, #1
 8000f14:	d101      	bne.n	8000f1a <__sflush_r+0x76>
 8000f16:	682b      	ldr	r3, [r5, #0]
 8000f18:	b903      	cbnz	r3, 8000f1c <__sflush_r+0x78>
 8000f1a:	6560      	str	r0, [r4, #84]	; 0x54
 8000f1c:	6b61      	ldr	r1, [r4, #52]	; 0x34
 8000f1e:	602f      	str	r7, [r5, #0]
 8000f20:	2900      	cmp	r1, #0
 8000f22:	d0cb      	beq.n	8000ebc <__sflush_r+0x18>
 8000f24:	f104 0344 	add.w	r3, r4, #68	; 0x44
 8000f28:	4299      	cmp	r1, r3
 8000f2a:	d002      	beq.n	8000f32 <__sflush_r+0x8e>
 8000f2c:	4628      	mov	r0, r5
 8000f2e:	f000 f9d5 	bl	80012dc <_free_r>
 8000f32:	2000      	movs	r0, #0
 8000f34:	6360      	str	r0, [r4, #52]	; 0x34
 8000f36:	e7c2      	b.n	8000ebe <__sflush_r+0x1a>
 8000f38:	6a21      	ldr	r1, [r4, #32]
 8000f3a:	2301      	movs	r3, #1
 8000f3c:	4628      	mov	r0, r5
 8000f3e:	47b0      	blx	r6
 8000f40:	1c41      	adds	r1, r0, #1
 8000f42:	d1c7      	bne.n	8000ed4 <__sflush_r+0x30>
 8000f44:	682b      	ldr	r3, [r5, #0]
 8000f46:	2b00      	cmp	r3, #0
 8000f48:	d0c4      	beq.n	8000ed4 <__sflush_r+0x30>
 8000f4a:	2b1d      	cmp	r3, #29
 8000f4c:	d001      	beq.n	8000f52 <__sflush_r+0xae>
 8000f4e:	2b16      	cmp	r3, #22
 8000f50:	d101      	bne.n	8000f56 <__sflush_r+0xb2>
 8000f52:	602f      	str	r7, [r5, #0]
 8000f54:	e7b2      	b.n	8000ebc <__sflush_r+0x18>
 8000f56:	89a3      	ldrh	r3, [r4, #12]
 8000f58:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8000f5c:	81a3      	strh	r3, [r4, #12]
 8000f5e:	e7ae      	b.n	8000ebe <__sflush_r+0x1a>
 8000f60:	690f      	ldr	r7, [r1, #16]
 8000f62:	2f00      	cmp	r7, #0
 8000f64:	d0aa      	beq.n	8000ebc <__sflush_r+0x18>
 8000f66:	0793      	lsls	r3, r2, #30
 8000f68:	680e      	ldr	r6, [r1, #0]
 8000f6a:	bf08      	it	eq
 8000f6c:	694b      	ldreq	r3, [r1, #20]
 8000f6e:	600f      	str	r7, [r1, #0]
 8000f70:	bf18      	it	ne
 8000f72:	2300      	movne	r3, #0
 8000f74:	1bf6      	subs	r6, r6, r7
 8000f76:	608b      	str	r3, [r1, #8]
 8000f78:	2e00      	cmp	r6, #0
 8000f7a:	dd9f      	ble.n	8000ebc <__sflush_r+0x18>
 8000f7c:	6a21      	ldr	r1, [r4, #32]
 8000f7e:	f8d4 c028 	ldr.w	ip, [r4, #40]	; 0x28
 8000f82:	4633      	mov	r3, r6
 8000f84:	463a      	mov	r2, r7
 8000f86:	4628      	mov	r0, r5
 8000f88:	47e0      	blx	ip
 8000f8a:	2800      	cmp	r0, #0
 8000f8c:	dc06      	bgt.n	8000f9c <__sflush_r+0xf8>
 8000f8e:	89a3      	ldrh	r3, [r4, #12]
 8000f90:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8000f94:	81a3      	strh	r3, [r4, #12]
 8000f96:	f04f 30ff 	mov.w	r0, #4294967295
 8000f9a:	e790      	b.n	8000ebe <__sflush_r+0x1a>
 8000f9c:	4407      	add	r7, r0
 8000f9e:	1a36      	subs	r6, r6, r0
 8000fa0:	e7ea      	b.n	8000f78 <__sflush_r+0xd4>
 8000fa2:	bf00      	nop
 8000fa4:	20400001 	.word	0x20400001

08000fa8 <_fflush_r>:
 8000fa8:	b538      	push	{r3, r4, r5, lr}
 8000faa:	690b      	ldr	r3, [r1, #16]
 8000fac:	4605      	mov	r5, r0
 8000fae:	460c      	mov	r4, r1
 8000fb0:	b913      	cbnz	r3, 8000fb8 <_fflush_r+0x10>
 8000fb2:	2500      	movs	r5, #0
 8000fb4:	4628      	mov	r0, r5
 8000fb6:	bd38      	pop	{r3, r4, r5, pc}
 8000fb8:	b118      	cbz	r0, 8000fc2 <_fflush_r+0x1a>
 8000fba:	6983      	ldr	r3, [r0, #24]
 8000fbc:	b90b      	cbnz	r3, 8000fc2 <_fflush_r+0x1a>
 8000fbe:	f000 f887 	bl	80010d0 <__sinit>
 8000fc2:	4b14      	ldr	r3, [pc, #80]	; (8001014 <_fflush_r+0x6c>)
 8000fc4:	429c      	cmp	r4, r3
 8000fc6:	d11b      	bne.n	8001000 <_fflush_r+0x58>
 8000fc8:	686c      	ldr	r4, [r5, #4]
 8000fca:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8000fce:	2b00      	cmp	r3, #0
 8000fd0:	d0ef      	beq.n	8000fb2 <_fflush_r+0xa>
 8000fd2:	6e62      	ldr	r2, [r4, #100]	; 0x64
 8000fd4:	07d0      	lsls	r0, r2, #31
 8000fd6:	d404      	bmi.n	8000fe2 <_fflush_r+0x3a>
 8000fd8:	0599      	lsls	r1, r3, #22
 8000fda:	d402      	bmi.n	8000fe2 <_fflush_r+0x3a>
 8000fdc:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8000fde:	f000 f915 	bl	800120c <__retarget_lock_acquire_recursive>
 8000fe2:	4628      	mov	r0, r5
 8000fe4:	4621      	mov	r1, r4
 8000fe6:	f7ff ff5d 	bl	8000ea4 <__sflush_r>
 8000fea:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8000fec:	07da      	lsls	r2, r3, #31
 8000fee:	4605      	mov	r5, r0
 8000ff0:	d4e0      	bmi.n	8000fb4 <_fflush_r+0xc>
 8000ff2:	89a3      	ldrh	r3, [r4, #12]
 8000ff4:	059b      	lsls	r3, r3, #22
 8000ff6:	d4dd      	bmi.n	8000fb4 <_fflush_r+0xc>
 8000ff8:	6da0      	ldr	r0, [r4, #88]	; 0x58
 8000ffa:	f000 f908 	bl	800120e <__retarget_lock_release_recursive>
 8000ffe:	e7d9      	b.n	8000fb4 <_fflush_r+0xc>
 8001000:	4b05      	ldr	r3, [pc, #20]	; (8001018 <_fflush_r+0x70>)
 8001002:	429c      	cmp	r4, r3
 8001004:	d101      	bne.n	800100a <_fflush_r+0x62>
 8001006:	68ac      	ldr	r4, [r5, #8]
 8001008:	e7df      	b.n	8000fca <_fflush_r+0x22>
 800100a:	4b04      	ldr	r3, [pc, #16]	; (800101c <_fflush_r+0x74>)
 800100c:	429c      	cmp	r4, r3
 800100e:	bf08      	it	eq
 8001010:	68ec      	ldreq	r4, [r5, #12]
 8001012:	e7da      	b.n	8000fca <_fflush_r+0x22>
 8001014:	08001e90 	.word	0x08001e90
 8001018:	08001eb0 	.word	0x08001eb0
 800101c:	08001e70 	.word	0x08001e70

08001020 <std>:
 8001020:	2300      	movs	r3, #0
 8001022:	b510      	push	{r4, lr}
 8001024:	4604      	mov	r4, r0
 8001026:	e9c0 3300 	strd	r3, r3, [r0]
 800102a:	e9c0 3304 	strd	r3, r3, [r0, #16]
 800102e:	6083      	str	r3, [r0, #8]
 8001030:	8181      	strh	r1, [r0, #12]
 8001032:	6643      	str	r3, [r0, #100]	; 0x64
 8001034:	81c2      	strh	r2, [r0, #14]
 8001036:	6183      	str	r3, [r0, #24]
 8001038:	4619      	mov	r1, r3
 800103a:	2208      	movs	r2, #8
 800103c:	305c      	adds	r0, #92	; 0x5c
 800103e:	f7ff fdbf 	bl	8000bc0 <memset>
 8001042:	4b05      	ldr	r3, [pc, #20]	; (8001058 <std+0x38>)
 8001044:	6263      	str	r3, [r4, #36]	; 0x24
 8001046:	4b05      	ldr	r3, [pc, #20]	; (800105c <std+0x3c>)
 8001048:	62a3      	str	r3, [r4, #40]	; 0x28
 800104a:	4b05      	ldr	r3, [pc, #20]	; (8001060 <std+0x40>)
 800104c:	62e3      	str	r3, [r4, #44]	; 0x2c
 800104e:	4b05      	ldr	r3, [pc, #20]	; (8001064 <std+0x44>)
 8001050:	6224      	str	r4, [r4, #32]
 8001052:	6323      	str	r3, [r4, #48]	; 0x30
 8001054:	bd10      	pop	{r4, pc}
 8001056:	bf00      	nop
 8001058:	08001a99 	.word	0x08001a99
 800105c:	08001abb 	.word	0x08001abb
 8001060:	08001af3 	.word	0x08001af3
 8001064:	08001b17 	.word	0x08001b17

08001068 <_cleanup_r>:
 8001068:	4901      	ldr	r1, [pc, #4]	; (8001070 <_cleanup_r+0x8>)
 800106a:	f000 b8af 	b.w	80011cc <_fwalk_reent>
 800106e:	bf00      	nop
 8001070:	08000fa9 	.word	0x08000fa9

08001074 <__sfmoreglue>:
 8001074:	b570      	push	{r4, r5, r6, lr}
 8001076:	2268      	movs	r2, #104	; 0x68
 8001078:	1e4d      	subs	r5, r1, #1
 800107a:	4355      	muls	r5, r2
 800107c:	460e      	mov	r6, r1
 800107e:	f105 0174 	add.w	r1, r5, #116	; 0x74
 8001082:	f000 f995 	bl	80013b0 <_malloc_r>
 8001086:	4604      	mov	r4, r0
 8001088:	b140      	cbz	r0, 800109c <__sfmoreglue+0x28>
 800108a:	2100      	movs	r1, #0
 800108c:	e9c0 1600 	strd	r1, r6, [r0]
 8001090:	300c      	adds	r0, #12
 8001092:	60a0      	str	r0, [r4, #8]
 8001094:	f105 0268 	add.w	r2, r5, #104	; 0x68
 8001098:	f7ff fd92 	bl	8000bc0 <memset>
 800109c:	4620      	mov	r0, r4
 800109e:	bd70      	pop	{r4, r5, r6, pc}

080010a0 <__sfp_lock_acquire>:
 80010a0:	4801      	ldr	r0, [pc, #4]	; (80010a8 <__sfp_lock_acquire+0x8>)
 80010a2:	f000 b8b3 	b.w	800120c <__retarget_lock_acquire_recursive>
 80010a6:	bf00      	nop
 80010a8:	200000a9 	.word	0x200000a9

080010ac <__sfp_lock_release>:
 80010ac:	4801      	ldr	r0, [pc, #4]	; (80010b4 <__sfp_lock_release+0x8>)
 80010ae:	f000 b8ae 	b.w	800120e <__retarget_lock_release_recursive>
 80010b2:	bf00      	nop
 80010b4:	200000a9 	.word	0x200000a9

080010b8 <__sinit_lock_acquire>:
 80010b8:	4801      	ldr	r0, [pc, #4]	; (80010c0 <__sinit_lock_acquire+0x8>)
 80010ba:	f000 b8a7 	b.w	800120c <__retarget_lock_acquire_recursive>
 80010be:	bf00      	nop
 80010c0:	200000aa 	.word	0x200000aa

080010c4 <__sinit_lock_release>:
 80010c4:	4801      	ldr	r0, [pc, #4]	; (80010cc <__sinit_lock_release+0x8>)
 80010c6:	f000 b8a2 	b.w	800120e <__retarget_lock_release_recursive>
 80010ca:	bf00      	nop
 80010cc:	200000aa 	.word	0x200000aa

080010d0 <__sinit>:
 80010d0:	b510      	push	{r4, lr}
 80010d2:	4604      	mov	r4, r0
 80010d4:	f7ff fff0 	bl	80010b8 <__sinit_lock_acquire>
 80010d8:	69a3      	ldr	r3, [r4, #24]
 80010da:	b11b      	cbz	r3, 80010e4 <__sinit+0x14>
 80010dc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80010e0:	f7ff bff0 	b.w	80010c4 <__sinit_lock_release>
 80010e4:	e9c4 3312 	strd	r3, r3, [r4, #72]	; 0x48
 80010e8:	6523      	str	r3, [r4, #80]	; 0x50
 80010ea:	4b13      	ldr	r3, [pc, #76]	; (8001138 <__sinit+0x68>)
 80010ec:	4a13      	ldr	r2, [pc, #76]	; (800113c <__sinit+0x6c>)
 80010ee:	681b      	ldr	r3, [r3, #0]
 80010f0:	62a2      	str	r2, [r4, #40]	; 0x28
 80010f2:	42a3      	cmp	r3, r4
 80010f4:	bf04      	itt	eq
 80010f6:	2301      	moveq	r3, #1
 80010f8:	61a3      	streq	r3, [r4, #24]
 80010fa:	4620      	mov	r0, r4
 80010fc:	f000 f820 	bl	8001140 <__sfp>
 8001100:	6060      	str	r0, [r4, #4]
 8001102:	4620      	mov	r0, r4
 8001104:	f000 f81c 	bl	8001140 <__sfp>
 8001108:	60a0      	str	r0, [r4, #8]
 800110a:	4620      	mov	r0, r4
 800110c:	f000 f818 	bl	8001140 <__sfp>
 8001110:	2200      	movs	r2, #0
 8001112:	60e0      	str	r0, [r4, #12]
 8001114:	2104      	movs	r1, #4
 8001116:	6860      	ldr	r0, [r4, #4]
 8001118:	f7ff ff82 	bl	8001020 <std>
 800111c:	68a0      	ldr	r0, [r4, #8]
 800111e:	2201      	movs	r2, #1
 8001120:	2109      	movs	r1, #9
 8001122:	f7ff ff7d 	bl	8001020 <std>
 8001126:	68e0      	ldr	r0, [r4, #12]
 8001128:	2202      	movs	r2, #2
 800112a:	2112      	movs	r1, #18
 800112c:	f7ff ff78 	bl	8001020 <std>
 8001130:	2301      	movs	r3, #1
 8001132:	61a3      	str	r3, [r4, #24]
 8001134:	e7d2      	b.n	80010dc <__sinit+0xc>
 8001136:	bf00      	nop
 8001138:	08001e6c 	.word	0x08001e6c
 800113c:	08001069 	.word	0x08001069

08001140 <__sfp>:
 8001140:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001142:	4607      	mov	r7, r0
 8001144:	f7ff ffac 	bl	80010a0 <__sfp_lock_acquire>
 8001148:	4b1e      	ldr	r3, [pc, #120]	; (80011c4 <__sfp+0x84>)
 800114a:	681e      	ldr	r6, [r3, #0]
 800114c:	69b3      	ldr	r3, [r6, #24]
 800114e:	b913      	cbnz	r3, 8001156 <__sfp+0x16>
 8001150:	4630      	mov	r0, r6
 8001152:	f7ff ffbd 	bl	80010d0 <__sinit>
 8001156:	3648      	adds	r6, #72	; 0x48
 8001158:	e9d6 3401 	ldrd	r3, r4, [r6, #4]
 800115c:	3b01      	subs	r3, #1
 800115e:	d503      	bpl.n	8001168 <__sfp+0x28>
 8001160:	6833      	ldr	r3, [r6, #0]
 8001162:	b30b      	cbz	r3, 80011a8 <__sfp+0x68>
 8001164:	6836      	ldr	r6, [r6, #0]
 8001166:	e7f7      	b.n	8001158 <__sfp+0x18>
 8001168:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
 800116c:	b9d5      	cbnz	r5, 80011a4 <__sfp+0x64>
 800116e:	4b16      	ldr	r3, [pc, #88]	; (80011c8 <__sfp+0x88>)
 8001170:	60e3      	str	r3, [r4, #12]
 8001172:	f104 0058 	add.w	r0, r4, #88	; 0x58
 8001176:	6665      	str	r5, [r4, #100]	; 0x64
 8001178:	f000 f847 	bl	800120a <__retarget_lock_init_recursive>
 800117c:	f7ff ff96 	bl	80010ac <__sfp_lock_release>
 8001180:	e9c4 5501 	strd	r5, r5, [r4, #4]
 8001184:	e9c4 5504 	strd	r5, r5, [r4, #16]
 8001188:	6025      	str	r5, [r4, #0]
 800118a:	61a5      	str	r5, [r4, #24]
 800118c:	2208      	movs	r2, #8
 800118e:	4629      	mov	r1, r5
 8001190:	f104 005c 	add.w	r0, r4, #92	; 0x5c
 8001194:	f7ff fd14 	bl	8000bc0 <memset>
 8001198:	e9c4 550d 	strd	r5, r5, [r4, #52]	; 0x34
 800119c:	e9c4 5512 	strd	r5, r5, [r4, #72]	; 0x48
 80011a0:	4620      	mov	r0, r4
 80011a2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80011a4:	3468      	adds	r4, #104	; 0x68
 80011a6:	e7d9      	b.n	800115c <__sfp+0x1c>
 80011a8:	2104      	movs	r1, #4
 80011aa:	4638      	mov	r0, r7
 80011ac:	f7ff ff62 	bl	8001074 <__sfmoreglue>
 80011b0:	4604      	mov	r4, r0
 80011b2:	6030      	str	r0, [r6, #0]
 80011b4:	2800      	cmp	r0, #0
 80011b6:	d1d5      	bne.n	8001164 <__sfp+0x24>
 80011b8:	f7ff ff78 	bl	80010ac <__sfp_lock_release>
 80011bc:	230c      	movs	r3, #12
 80011be:	603b      	str	r3, [r7, #0]
 80011c0:	e7ee      	b.n	80011a0 <__sfp+0x60>
 80011c2:	bf00      	nop
 80011c4:	08001e6c 	.word	0x08001e6c
 80011c8:	ffff0001 	.word	0xffff0001

080011cc <_fwalk_reent>:
 80011cc:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 80011d0:	4606      	mov	r6, r0
 80011d2:	4688      	mov	r8, r1
 80011d4:	f100 0448 	add.w	r4, r0, #72	; 0x48
 80011d8:	2700      	movs	r7, #0
 80011da:	e9d4 9501 	ldrd	r9, r5, [r4, #4]
 80011de:	f1b9 0901 	subs.w	r9, r9, #1
 80011e2:	d505      	bpl.n	80011f0 <_fwalk_reent+0x24>
 80011e4:	6824      	ldr	r4, [r4, #0]
 80011e6:	2c00      	cmp	r4, #0
 80011e8:	d1f7      	bne.n	80011da <_fwalk_reent+0xe>
 80011ea:	4638      	mov	r0, r7
 80011ec:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 80011f0:	89ab      	ldrh	r3, [r5, #12]
 80011f2:	2b01      	cmp	r3, #1
 80011f4:	d907      	bls.n	8001206 <_fwalk_reent+0x3a>
 80011f6:	f9b5 300e 	ldrsh.w	r3, [r5, #14]
 80011fa:	3301      	adds	r3, #1
 80011fc:	d003      	beq.n	8001206 <_fwalk_reent+0x3a>
 80011fe:	4629      	mov	r1, r5
 8001200:	4630      	mov	r0, r6
 8001202:	47c0      	blx	r8
 8001204:	4307      	orrs	r7, r0
 8001206:	3568      	adds	r5, #104	; 0x68
 8001208:	e7e9      	b.n	80011de <_fwalk_reent+0x12>

0800120a <__retarget_lock_init_recursive>:
 800120a:	4770      	bx	lr

0800120c <__retarget_lock_acquire_recursive>:
 800120c:	4770      	bx	lr

0800120e <__retarget_lock_release_recursive>:
 800120e:	4770      	bx	lr

08001210 <__swhatbuf_r>:
 8001210:	b570      	push	{r4, r5, r6, lr}
 8001212:	460e      	mov	r6, r1
 8001214:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001218:	2900      	cmp	r1, #0
 800121a:	b096      	sub	sp, #88	; 0x58
 800121c:	4614      	mov	r4, r2
 800121e:	461d      	mov	r5, r3
 8001220:	da08      	bge.n	8001234 <__swhatbuf_r+0x24>
 8001222:	f9b6 300c 	ldrsh.w	r3, [r6, #12]
 8001226:	2200      	movs	r2, #0
 8001228:	602a      	str	r2, [r5, #0]
 800122a:	061a      	lsls	r2, r3, #24
 800122c:	d410      	bmi.n	8001250 <__swhatbuf_r+0x40>
 800122e:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8001232:	e00e      	b.n	8001252 <__swhatbuf_r+0x42>
 8001234:	466a      	mov	r2, sp
 8001236:	f000 fc95 	bl	8001b64 <_fstat_r>
 800123a:	2800      	cmp	r0, #0
 800123c:	dbf1      	blt.n	8001222 <__swhatbuf_r+0x12>
 800123e:	9a01      	ldr	r2, [sp, #4]
 8001240:	f402 4270 	and.w	r2, r2, #61440	; 0xf000
 8001244:	f5a2 5300 	sub.w	r3, r2, #8192	; 0x2000
 8001248:	425a      	negs	r2, r3
 800124a:	415a      	adcs	r2, r3
 800124c:	602a      	str	r2, [r5, #0]
 800124e:	e7ee      	b.n	800122e <__swhatbuf_r+0x1e>
 8001250:	2340      	movs	r3, #64	; 0x40
 8001252:	2000      	movs	r0, #0
 8001254:	6023      	str	r3, [r4, #0]
 8001256:	b016      	add	sp, #88	; 0x58
 8001258:	bd70      	pop	{r4, r5, r6, pc}
	...

0800125c <__smakebuf_r>:
 800125c:	898b      	ldrh	r3, [r1, #12]
 800125e:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8001260:	079d      	lsls	r5, r3, #30
 8001262:	4606      	mov	r6, r0
 8001264:	460c      	mov	r4, r1
 8001266:	d507      	bpl.n	8001278 <__smakebuf_r+0x1c>
 8001268:	f104 0347 	add.w	r3, r4, #71	; 0x47
 800126c:	6023      	str	r3, [r4, #0]
 800126e:	6123      	str	r3, [r4, #16]
 8001270:	2301      	movs	r3, #1
 8001272:	6163      	str	r3, [r4, #20]
 8001274:	b002      	add	sp, #8
 8001276:	bd70      	pop	{r4, r5, r6, pc}
 8001278:	ab01      	add	r3, sp, #4
 800127a:	466a      	mov	r2, sp
 800127c:	f7ff ffc8 	bl	8001210 <__swhatbuf_r>
 8001280:	9900      	ldr	r1, [sp, #0]
 8001282:	4605      	mov	r5, r0
 8001284:	4630      	mov	r0, r6
 8001286:	f000 f893 	bl	80013b0 <_malloc_r>
 800128a:	b948      	cbnz	r0, 80012a0 <__smakebuf_r+0x44>
 800128c:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8001290:	059a      	lsls	r2, r3, #22
 8001292:	d4ef      	bmi.n	8001274 <__smakebuf_r+0x18>
 8001294:	f023 0303 	bic.w	r3, r3, #3
 8001298:	f043 0302 	orr.w	r3, r3, #2
 800129c:	81a3      	strh	r3, [r4, #12]
 800129e:	e7e3      	b.n	8001268 <__smakebuf_r+0xc>
 80012a0:	4b0d      	ldr	r3, [pc, #52]	; (80012d8 <__smakebuf_r+0x7c>)
 80012a2:	62b3      	str	r3, [r6, #40]	; 0x28
 80012a4:	89a3      	ldrh	r3, [r4, #12]
 80012a6:	6020      	str	r0, [r4, #0]
 80012a8:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 80012ac:	81a3      	strh	r3, [r4, #12]
 80012ae:	9b00      	ldr	r3, [sp, #0]
 80012b0:	6163      	str	r3, [r4, #20]
 80012b2:	9b01      	ldr	r3, [sp, #4]
 80012b4:	6120      	str	r0, [r4, #16]
 80012b6:	b15b      	cbz	r3, 80012d0 <__smakebuf_r+0x74>
 80012b8:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
 80012bc:	4630      	mov	r0, r6
 80012be:	f000 fc63 	bl	8001b88 <_isatty_r>
 80012c2:	b128      	cbz	r0, 80012d0 <__smakebuf_r+0x74>
 80012c4:	89a3      	ldrh	r3, [r4, #12]
 80012c6:	f023 0303 	bic.w	r3, r3, #3
 80012ca:	f043 0301 	orr.w	r3, r3, #1
 80012ce:	81a3      	strh	r3, [r4, #12]
 80012d0:	89a0      	ldrh	r0, [r4, #12]
 80012d2:	4305      	orrs	r5, r0
 80012d4:	81a5      	strh	r5, [r4, #12]
 80012d6:	e7cd      	b.n	8001274 <__smakebuf_r+0x18>
 80012d8:	08001069 	.word	0x08001069

080012dc <_free_r>:
 80012dc:	b538      	push	{r3, r4, r5, lr}
 80012de:	4605      	mov	r5, r0
 80012e0:	2900      	cmp	r1, #0
 80012e2:	d041      	beq.n	8001368 <_free_r+0x8c>
 80012e4:	f851 3c04 	ldr.w	r3, [r1, #-4]
 80012e8:	1f0c      	subs	r4, r1, #4
 80012ea:	2b00      	cmp	r3, #0
 80012ec:	bfb8      	it	lt
 80012ee:	18e4      	addlt	r4, r4, r3
 80012f0:	f000 fc94 	bl	8001c1c <__malloc_lock>
 80012f4:	4a1d      	ldr	r2, [pc, #116]	; (800136c <_free_r+0x90>)
 80012f6:	6813      	ldr	r3, [r2, #0]
 80012f8:	b933      	cbnz	r3, 8001308 <_free_r+0x2c>
 80012fa:	6063      	str	r3, [r4, #4]
 80012fc:	6014      	str	r4, [r2, #0]
 80012fe:	4628      	mov	r0, r5
 8001300:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8001304:	f000 bc90 	b.w	8001c28 <__malloc_unlock>
 8001308:	42a3      	cmp	r3, r4
 800130a:	d908      	bls.n	800131e <_free_r+0x42>
 800130c:	6820      	ldr	r0, [r4, #0]
 800130e:	1821      	adds	r1, r4, r0
 8001310:	428b      	cmp	r3, r1
 8001312:	bf01      	itttt	eq
 8001314:	6819      	ldreq	r1, [r3, #0]
 8001316:	685b      	ldreq	r3, [r3, #4]
 8001318:	1809      	addeq	r1, r1, r0
 800131a:	6021      	streq	r1, [r4, #0]
 800131c:	e7ed      	b.n	80012fa <_free_r+0x1e>
 800131e:	461a      	mov	r2, r3
 8001320:	685b      	ldr	r3, [r3, #4]
 8001322:	b10b      	cbz	r3, 8001328 <_free_r+0x4c>
 8001324:	42a3      	cmp	r3, r4
 8001326:	d9fa      	bls.n	800131e <_free_r+0x42>
 8001328:	6811      	ldr	r1, [r2, #0]
 800132a:	1850      	adds	r0, r2, r1
 800132c:	42a0      	cmp	r0, r4
 800132e:	d10b      	bne.n	8001348 <_free_r+0x6c>
 8001330:	6820      	ldr	r0, [r4, #0]
 8001332:	4401      	add	r1, r0
 8001334:	1850      	adds	r0, r2, r1
 8001336:	4283      	cmp	r3, r0
 8001338:	6011      	str	r1, [r2, #0]
 800133a:	d1e0      	bne.n	80012fe <_free_r+0x22>
 800133c:	6818      	ldr	r0, [r3, #0]
 800133e:	685b      	ldr	r3, [r3, #4]
 8001340:	6053      	str	r3, [r2, #4]
 8001342:	4401      	add	r1, r0
 8001344:	6011      	str	r1, [r2, #0]
 8001346:	e7da      	b.n	80012fe <_free_r+0x22>
 8001348:	d902      	bls.n	8001350 <_free_r+0x74>
 800134a:	230c      	movs	r3, #12
 800134c:	602b      	str	r3, [r5, #0]
 800134e:	e7d6      	b.n	80012fe <_free_r+0x22>
 8001350:	6820      	ldr	r0, [r4, #0]
 8001352:	1821      	adds	r1, r4, r0
 8001354:	428b      	cmp	r3, r1
 8001356:	bf04      	itt	eq
 8001358:	6819      	ldreq	r1, [r3, #0]
 800135a:	685b      	ldreq	r3, [r3, #4]
 800135c:	6063      	str	r3, [r4, #4]
 800135e:	bf04      	itt	eq
 8001360:	1809      	addeq	r1, r1, r0
 8001362:	6021      	streq	r1, [r4, #0]
 8001364:	6054      	str	r4, [r2, #4]
 8001366:	e7ca      	b.n	80012fe <_free_r+0x22>
 8001368:	bd38      	pop	{r3, r4, r5, pc}
 800136a:	bf00      	nop
 800136c:	200000ac 	.word	0x200000ac

08001370 <sbrk_aligned>:
 8001370:	b570      	push	{r4, r5, r6, lr}
 8001372:	4e0e      	ldr	r6, [pc, #56]	; (80013ac <sbrk_aligned+0x3c>)
 8001374:	460c      	mov	r4, r1
 8001376:	6831      	ldr	r1, [r6, #0]
 8001378:	4605      	mov	r5, r0
 800137a:	b911      	cbnz	r1, 8001382 <sbrk_aligned+0x12>
 800137c:	f000 fb7c 	bl	8001a78 <_sbrk_r>
 8001380:	6030      	str	r0, [r6, #0]
 8001382:	4621      	mov	r1, r4
 8001384:	4628      	mov	r0, r5
 8001386:	f000 fb77 	bl	8001a78 <_sbrk_r>
 800138a:	1c43      	adds	r3, r0, #1
 800138c:	d00a      	beq.n	80013a4 <sbrk_aligned+0x34>
 800138e:	1cc4      	adds	r4, r0, #3
 8001390:	f024 0403 	bic.w	r4, r4, #3
 8001394:	42a0      	cmp	r0, r4
 8001396:	d007      	beq.n	80013a8 <sbrk_aligned+0x38>
 8001398:	1a21      	subs	r1, r4, r0
 800139a:	4628      	mov	r0, r5
 800139c:	f000 fb6c 	bl	8001a78 <_sbrk_r>
 80013a0:	3001      	adds	r0, #1
 80013a2:	d101      	bne.n	80013a8 <sbrk_aligned+0x38>
 80013a4:	f04f 34ff 	mov.w	r4, #4294967295
 80013a8:	4620      	mov	r0, r4
 80013aa:	bd70      	pop	{r4, r5, r6, pc}
 80013ac:	200000b0 	.word	0x200000b0

080013b0 <_malloc_r>:
 80013b0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80013b4:	1ccd      	adds	r5, r1, #3
 80013b6:	f025 0503 	bic.w	r5, r5, #3
 80013ba:	3508      	adds	r5, #8
 80013bc:	2d0c      	cmp	r5, #12
 80013be:	bf38      	it	cc
 80013c0:	250c      	movcc	r5, #12
 80013c2:	2d00      	cmp	r5, #0
 80013c4:	4607      	mov	r7, r0
 80013c6:	db01      	blt.n	80013cc <_malloc_r+0x1c>
 80013c8:	42a9      	cmp	r1, r5
 80013ca:	d905      	bls.n	80013d8 <_malloc_r+0x28>
 80013cc:	230c      	movs	r3, #12
 80013ce:	603b      	str	r3, [r7, #0]
 80013d0:	2600      	movs	r6, #0
 80013d2:	4630      	mov	r0, r6
 80013d4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80013d8:	4e2e      	ldr	r6, [pc, #184]	; (8001494 <_malloc_r+0xe4>)
 80013da:	f000 fc1f 	bl	8001c1c <__malloc_lock>
 80013de:	6833      	ldr	r3, [r6, #0]
 80013e0:	461c      	mov	r4, r3
 80013e2:	bb34      	cbnz	r4, 8001432 <_malloc_r+0x82>
 80013e4:	4629      	mov	r1, r5
 80013e6:	4638      	mov	r0, r7
 80013e8:	f7ff ffc2 	bl	8001370 <sbrk_aligned>
 80013ec:	1c43      	adds	r3, r0, #1
 80013ee:	4604      	mov	r4, r0
 80013f0:	d14d      	bne.n	800148e <_malloc_r+0xde>
 80013f2:	6834      	ldr	r4, [r6, #0]
 80013f4:	4626      	mov	r6, r4
 80013f6:	2e00      	cmp	r6, #0
 80013f8:	d140      	bne.n	800147c <_malloc_r+0xcc>
 80013fa:	6823      	ldr	r3, [r4, #0]
 80013fc:	4631      	mov	r1, r6
 80013fe:	4638      	mov	r0, r7
 8001400:	eb04 0803 	add.w	r8, r4, r3
 8001404:	f000 fb38 	bl	8001a78 <_sbrk_r>
 8001408:	4580      	cmp	r8, r0
 800140a:	d13a      	bne.n	8001482 <_malloc_r+0xd2>
 800140c:	6821      	ldr	r1, [r4, #0]
 800140e:	3503      	adds	r5, #3
 8001410:	1a6d      	subs	r5, r5, r1
 8001412:	f025 0503 	bic.w	r5, r5, #3
 8001416:	3508      	adds	r5, #8
 8001418:	2d0c      	cmp	r5, #12
 800141a:	bf38      	it	cc
 800141c:	250c      	movcc	r5, #12
 800141e:	4629      	mov	r1, r5
 8001420:	4638      	mov	r0, r7
 8001422:	f7ff ffa5 	bl	8001370 <sbrk_aligned>
 8001426:	3001      	adds	r0, #1
 8001428:	d02b      	beq.n	8001482 <_malloc_r+0xd2>
 800142a:	6823      	ldr	r3, [r4, #0]
 800142c:	442b      	add	r3, r5
 800142e:	6023      	str	r3, [r4, #0]
 8001430:	e00e      	b.n	8001450 <_malloc_r+0xa0>
 8001432:	6822      	ldr	r2, [r4, #0]
 8001434:	1b52      	subs	r2, r2, r5
 8001436:	d41e      	bmi.n	8001476 <_malloc_r+0xc6>
 8001438:	2a0b      	cmp	r2, #11
 800143a:	d916      	bls.n	800146a <_malloc_r+0xba>
 800143c:	1961      	adds	r1, r4, r5
 800143e:	42a3      	cmp	r3, r4
 8001440:	6025      	str	r5, [r4, #0]
 8001442:	bf18      	it	ne
 8001444:	6059      	strne	r1, [r3, #4]
 8001446:	6863      	ldr	r3, [r4, #4]
 8001448:	bf08      	it	eq
 800144a:	6031      	streq	r1, [r6, #0]
 800144c:	5162      	str	r2, [r4, r5]
 800144e:	604b      	str	r3, [r1, #4]
 8001450:	4638      	mov	r0, r7
 8001452:	f104 060b 	add.w	r6, r4, #11
 8001456:	f000 fbe7 	bl	8001c28 <__malloc_unlock>
 800145a:	f026 0607 	bic.w	r6, r6, #7
 800145e:	1d23      	adds	r3, r4, #4
 8001460:	1af2      	subs	r2, r6, r3
 8001462:	d0b6      	beq.n	80013d2 <_malloc_r+0x22>
 8001464:	1b9b      	subs	r3, r3, r6
 8001466:	50a3      	str	r3, [r4, r2]
 8001468:	e7b3      	b.n	80013d2 <_malloc_r+0x22>
 800146a:	6862      	ldr	r2, [r4, #4]
 800146c:	42a3      	cmp	r3, r4
 800146e:	bf0c      	ite	eq
 8001470:	6032      	streq	r2, [r6, #0]
 8001472:	605a      	strne	r2, [r3, #4]
 8001474:	e7ec      	b.n	8001450 <_malloc_r+0xa0>
 8001476:	4623      	mov	r3, r4
 8001478:	6864      	ldr	r4, [r4, #4]
 800147a:	e7b2      	b.n	80013e2 <_malloc_r+0x32>
 800147c:	4634      	mov	r4, r6
 800147e:	6876      	ldr	r6, [r6, #4]
 8001480:	e7b9      	b.n	80013f6 <_malloc_r+0x46>
 8001482:	230c      	movs	r3, #12
 8001484:	603b      	str	r3, [r7, #0]
 8001486:	4638      	mov	r0, r7
 8001488:	f000 fbce 	bl	8001c28 <__malloc_unlock>
 800148c:	e7a1      	b.n	80013d2 <_malloc_r+0x22>
 800148e:	6025      	str	r5, [r4, #0]
 8001490:	e7de      	b.n	8001450 <_malloc_r+0xa0>
 8001492:	bf00      	nop
 8001494:	200000ac 	.word	0x200000ac

08001498 <__ssputs_r>:
 8001498:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 800149c:	688e      	ldr	r6, [r1, #8]
 800149e:	429e      	cmp	r6, r3
 80014a0:	4682      	mov	sl, r0
 80014a2:	460c      	mov	r4, r1
 80014a4:	4690      	mov	r8, r2
 80014a6:	461f      	mov	r7, r3
 80014a8:	d838      	bhi.n	800151c <__ssputs_r+0x84>
 80014aa:	898a      	ldrh	r2, [r1, #12]
 80014ac:	f412 6f90 	tst.w	r2, #1152	; 0x480
 80014b0:	d032      	beq.n	8001518 <__ssputs_r+0x80>
 80014b2:	6825      	ldr	r5, [r4, #0]
 80014b4:	6909      	ldr	r1, [r1, #16]
 80014b6:	eba5 0901 	sub.w	r9, r5, r1
 80014ba:	6965      	ldr	r5, [r4, #20]
 80014bc:	eb05 0545 	add.w	r5, r5, r5, lsl #1
 80014c0:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
 80014c4:	3301      	adds	r3, #1
 80014c6:	444b      	add	r3, r9
 80014c8:	106d      	asrs	r5, r5, #1
 80014ca:	429d      	cmp	r5, r3
 80014cc:	bf38      	it	cc
 80014ce:	461d      	movcc	r5, r3
 80014d0:	0553      	lsls	r3, r2, #21
 80014d2:	d531      	bpl.n	8001538 <__ssputs_r+0xa0>
 80014d4:	4629      	mov	r1, r5
 80014d6:	f7ff ff6b 	bl	80013b0 <_malloc_r>
 80014da:	4606      	mov	r6, r0
 80014dc:	b950      	cbnz	r0, 80014f4 <__ssputs_r+0x5c>
 80014de:	230c      	movs	r3, #12
 80014e0:	f8ca 3000 	str.w	r3, [sl]
 80014e4:	89a3      	ldrh	r3, [r4, #12]
 80014e6:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 80014ea:	81a3      	strh	r3, [r4, #12]
 80014ec:	f04f 30ff 	mov.w	r0, #4294967295
 80014f0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 80014f4:	6921      	ldr	r1, [r4, #16]
 80014f6:	464a      	mov	r2, r9
 80014f8:	f000 fb68 	bl	8001bcc <memcpy>
 80014fc:	89a3      	ldrh	r3, [r4, #12]
 80014fe:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
 8001502:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8001506:	81a3      	strh	r3, [r4, #12]
 8001508:	6126      	str	r6, [r4, #16]
 800150a:	6165      	str	r5, [r4, #20]
 800150c:	444e      	add	r6, r9
 800150e:	eba5 0509 	sub.w	r5, r5, r9
 8001512:	6026      	str	r6, [r4, #0]
 8001514:	60a5      	str	r5, [r4, #8]
 8001516:	463e      	mov	r6, r7
 8001518:	42be      	cmp	r6, r7
 800151a:	d900      	bls.n	800151e <__ssputs_r+0x86>
 800151c:	463e      	mov	r6, r7
 800151e:	6820      	ldr	r0, [r4, #0]
 8001520:	4632      	mov	r2, r6
 8001522:	4641      	mov	r1, r8
 8001524:	f000 fb60 	bl	8001be8 <memmove>
 8001528:	68a3      	ldr	r3, [r4, #8]
 800152a:	1b9b      	subs	r3, r3, r6
 800152c:	60a3      	str	r3, [r4, #8]
 800152e:	6823      	ldr	r3, [r4, #0]
 8001530:	4433      	add	r3, r6
 8001532:	6023      	str	r3, [r4, #0]
 8001534:	2000      	movs	r0, #0
 8001536:	e7db      	b.n	80014f0 <__ssputs_r+0x58>
 8001538:	462a      	mov	r2, r5
 800153a:	f000 fb7b 	bl	8001c34 <_realloc_r>
 800153e:	4606      	mov	r6, r0
 8001540:	2800      	cmp	r0, #0
 8001542:	d1e1      	bne.n	8001508 <__ssputs_r+0x70>
 8001544:	6921      	ldr	r1, [r4, #16]
 8001546:	4650      	mov	r0, sl
 8001548:	f7ff fec8 	bl	80012dc <_free_r>
 800154c:	e7c7      	b.n	80014de <__ssputs_r+0x46>
	...

08001550 <_svfiprintf_r>:
 8001550:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8001554:	4698      	mov	r8, r3
 8001556:	898b      	ldrh	r3, [r1, #12]
 8001558:	061b      	lsls	r3, r3, #24
 800155a:	b09d      	sub	sp, #116	; 0x74
 800155c:	4607      	mov	r7, r0
 800155e:	460d      	mov	r5, r1
 8001560:	4614      	mov	r4, r2
 8001562:	d50e      	bpl.n	8001582 <_svfiprintf_r+0x32>
 8001564:	690b      	ldr	r3, [r1, #16]
 8001566:	b963      	cbnz	r3, 8001582 <_svfiprintf_r+0x32>
 8001568:	2140      	movs	r1, #64	; 0x40
 800156a:	f7ff ff21 	bl	80013b0 <_malloc_r>
 800156e:	6028      	str	r0, [r5, #0]
 8001570:	6128      	str	r0, [r5, #16]
 8001572:	b920      	cbnz	r0, 800157e <_svfiprintf_r+0x2e>
 8001574:	230c      	movs	r3, #12
 8001576:	603b      	str	r3, [r7, #0]
 8001578:	f04f 30ff 	mov.w	r0, #4294967295
 800157c:	e0d1      	b.n	8001722 <_svfiprintf_r+0x1d2>
 800157e:	2340      	movs	r3, #64	; 0x40
 8001580:	616b      	str	r3, [r5, #20]
 8001582:	2300      	movs	r3, #0
 8001584:	9309      	str	r3, [sp, #36]	; 0x24
 8001586:	2320      	movs	r3, #32
 8001588:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
 800158c:	f8cd 800c 	str.w	r8, [sp, #12]
 8001590:	2330      	movs	r3, #48	; 0x30
 8001592:	f8df 81a8 	ldr.w	r8, [pc, #424]	; 800173c <_svfiprintf_r+0x1ec>
 8001596:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
 800159a:	f04f 0901 	mov.w	r9, #1
 800159e:	4623      	mov	r3, r4
 80015a0:	469a      	mov	sl, r3
 80015a2:	f813 2b01 	ldrb.w	r2, [r3], #1
 80015a6:	b10a      	cbz	r2, 80015ac <_svfiprintf_r+0x5c>
 80015a8:	2a25      	cmp	r2, #37	; 0x25
 80015aa:	d1f9      	bne.n	80015a0 <_svfiprintf_r+0x50>
 80015ac:	ebba 0b04 	subs.w	fp, sl, r4
 80015b0:	d00b      	beq.n	80015ca <_svfiprintf_r+0x7a>
 80015b2:	465b      	mov	r3, fp
 80015b4:	4622      	mov	r2, r4
 80015b6:	4629      	mov	r1, r5
 80015b8:	4638      	mov	r0, r7
 80015ba:	f7ff ff6d 	bl	8001498 <__ssputs_r>
 80015be:	3001      	adds	r0, #1
 80015c0:	f000 80aa 	beq.w	8001718 <_svfiprintf_r+0x1c8>
 80015c4:	9a09      	ldr	r2, [sp, #36]	; 0x24
 80015c6:	445a      	add	r2, fp
 80015c8:	9209      	str	r2, [sp, #36]	; 0x24
 80015ca:	f89a 3000 	ldrb.w	r3, [sl]
 80015ce:	2b00      	cmp	r3, #0
 80015d0:	f000 80a2 	beq.w	8001718 <_svfiprintf_r+0x1c8>
 80015d4:	2300      	movs	r3, #0
 80015d6:	f04f 32ff 	mov.w	r2, #4294967295
 80015da:	e9cd 2305 	strd	r2, r3, [sp, #20]
 80015de:	f10a 0a01 	add.w	sl, sl, #1
 80015e2:	9304      	str	r3, [sp, #16]
 80015e4:	9307      	str	r3, [sp, #28]
 80015e6:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
 80015ea:	931a      	str	r3, [sp, #104]	; 0x68
 80015ec:	4654      	mov	r4, sl
 80015ee:	2205      	movs	r2, #5
 80015f0:	f814 1b01 	ldrb.w	r1, [r4], #1
 80015f4:	4851      	ldr	r0, [pc, #324]	; (800173c <_svfiprintf_r+0x1ec>)
 80015f6:	f7ff fa93 	bl	8000b20 <memchr>
 80015fa:	9a04      	ldr	r2, [sp, #16]
 80015fc:	b9d8      	cbnz	r0, 8001636 <_svfiprintf_r+0xe6>
 80015fe:	06d0      	lsls	r0, r2, #27
 8001600:	bf44      	itt	mi
 8001602:	2320      	movmi	r3, #32
 8001604:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8001608:	0711      	lsls	r1, r2, #28
 800160a:	bf44      	itt	mi
 800160c:	232b      	movmi	r3, #43	; 0x2b
 800160e:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8001612:	f89a 3000 	ldrb.w	r3, [sl]
 8001616:	2b2a      	cmp	r3, #42	; 0x2a
 8001618:	d015      	beq.n	8001646 <_svfiprintf_r+0xf6>
 800161a:	9a07      	ldr	r2, [sp, #28]
 800161c:	4654      	mov	r4, sl
 800161e:	2000      	movs	r0, #0
 8001620:	f04f 0c0a 	mov.w	ip, #10
 8001624:	4621      	mov	r1, r4
 8001626:	f811 3b01 	ldrb.w	r3, [r1], #1
 800162a:	3b30      	subs	r3, #48	; 0x30
 800162c:	2b09      	cmp	r3, #9
 800162e:	d94e      	bls.n	80016ce <_svfiprintf_r+0x17e>
 8001630:	b1b0      	cbz	r0, 8001660 <_svfiprintf_r+0x110>
 8001632:	9207      	str	r2, [sp, #28]
 8001634:	e014      	b.n	8001660 <_svfiprintf_r+0x110>
 8001636:	eba0 0308 	sub.w	r3, r0, r8
 800163a:	fa09 f303 	lsl.w	r3, r9, r3
 800163e:	4313      	orrs	r3, r2
 8001640:	9304      	str	r3, [sp, #16]
 8001642:	46a2      	mov	sl, r4
 8001644:	e7d2      	b.n	80015ec <_svfiprintf_r+0x9c>
 8001646:	9b03      	ldr	r3, [sp, #12]
 8001648:	1d19      	adds	r1, r3, #4
 800164a:	681b      	ldr	r3, [r3, #0]
 800164c:	9103      	str	r1, [sp, #12]
 800164e:	2b00      	cmp	r3, #0
 8001650:	bfbb      	ittet	lt
 8001652:	425b      	neglt	r3, r3
 8001654:	f042 0202 	orrlt.w	r2, r2, #2
 8001658:	9307      	strge	r3, [sp, #28]
 800165a:	9307      	strlt	r3, [sp, #28]
 800165c:	bfb8      	it	lt
 800165e:	9204      	strlt	r2, [sp, #16]
 8001660:	7823      	ldrb	r3, [r4, #0]
 8001662:	2b2e      	cmp	r3, #46	; 0x2e
 8001664:	d10c      	bne.n	8001680 <_svfiprintf_r+0x130>
 8001666:	7863      	ldrb	r3, [r4, #1]
 8001668:	2b2a      	cmp	r3, #42	; 0x2a
 800166a:	d135      	bne.n	80016d8 <_svfiprintf_r+0x188>
 800166c:	9b03      	ldr	r3, [sp, #12]
 800166e:	1d1a      	adds	r2, r3, #4
 8001670:	681b      	ldr	r3, [r3, #0]
 8001672:	9203      	str	r2, [sp, #12]
 8001674:	2b00      	cmp	r3, #0
 8001676:	bfb8      	it	lt
 8001678:	f04f 33ff 	movlt.w	r3, #4294967295
 800167c:	3402      	adds	r4, #2
 800167e:	9305      	str	r3, [sp, #20]
 8001680:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 8001740 <_svfiprintf_r+0x1f0>
 8001684:	7821      	ldrb	r1, [r4, #0]
 8001686:	2203      	movs	r2, #3
 8001688:	4650      	mov	r0, sl
 800168a:	f7ff fa49 	bl	8000b20 <memchr>
 800168e:	b140      	cbz	r0, 80016a2 <_svfiprintf_r+0x152>
 8001690:	2340      	movs	r3, #64	; 0x40
 8001692:	eba0 000a 	sub.w	r0, r0, sl
 8001696:	fa03 f000 	lsl.w	r0, r3, r0
 800169a:	9b04      	ldr	r3, [sp, #16]
 800169c:	4303      	orrs	r3, r0
 800169e:	3401      	adds	r4, #1
 80016a0:	9304      	str	r3, [sp, #16]
 80016a2:	f814 1b01 	ldrb.w	r1, [r4], #1
 80016a6:	4827      	ldr	r0, [pc, #156]	; (8001744 <_svfiprintf_r+0x1f4>)
 80016a8:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
 80016ac:	2206      	movs	r2, #6
 80016ae:	f7ff fa37 	bl	8000b20 <memchr>
 80016b2:	2800      	cmp	r0, #0
 80016b4:	d038      	beq.n	8001728 <_svfiprintf_r+0x1d8>
 80016b6:	4b24      	ldr	r3, [pc, #144]	; (8001748 <_svfiprintf_r+0x1f8>)
 80016b8:	bb1b      	cbnz	r3, 8001702 <_svfiprintf_r+0x1b2>
 80016ba:	9b03      	ldr	r3, [sp, #12]
 80016bc:	3307      	adds	r3, #7
 80016be:	f023 0307 	bic.w	r3, r3, #7
 80016c2:	3308      	adds	r3, #8
 80016c4:	9303      	str	r3, [sp, #12]
 80016c6:	9b09      	ldr	r3, [sp, #36]	; 0x24
 80016c8:	4433      	add	r3, r6
 80016ca:	9309      	str	r3, [sp, #36]	; 0x24
 80016cc:	e767      	b.n	800159e <_svfiprintf_r+0x4e>
 80016ce:	fb0c 3202 	mla	r2, ip, r2, r3
 80016d2:	460c      	mov	r4, r1
 80016d4:	2001      	movs	r0, #1
 80016d6:	e7a5      	b.n	8001624 <_svfiprintf_r+0xd4>
 80016d8:	2300      	movs	r3, #0
 80016da:	3401      	adds	r4, #1
 80016dc:	9305      	str	r3, [sp, #20]
 80016de:	4619      	mov	r1, r3
 80016e0:	f04f 0c0a 	mov.w	ip, #10
 80016e4:	4620      	mov	r0, r4
 80016e6:	f810 2b01 	ldrb.w	r2, [r0], #1
 80016ea:	3a30      	subs	r2, #48	; 0x30
 80016ec:	2a09      	cmp	r2, #9
 80016ee:	d903      	bls.n	80016f8 <_svfiprintf_r+0x1a8>
 80016f0:	2b00      	cmp	r3, #0
 80016f2:	d0c5      	beq.n	8001680 <_svfiprintf_r+0x130>
 80016f4:	9105      	str	r1, [sp, #20]
 80016f6:	e7c3      	b.n	8001680 <_svfiprintf_r+0x130>
 80016f8:	fb0c 2101 	mla	r1, ip, r1, r2
 80016fc:	4604      	mov	r4, r0
 80016fe:	2301      	movs	r3, #1
 8001700:	e7f0      	b.n	80016e4 <_svfiprintf_r+0x194>
 8001702:	ab03      	add	r3, sp, #12
 8001704:	9300      	str	r3, [sp, #0]
 8001706:	462a      	mov	r2, r5
 8001708:	4b10      	ldr	r3, [pc, #64]	; (800174c <_svfiprintf_r+0x1fc>)
 800170a:	a904      	add	r1, sp, #16
 800170c:	4638      	mov	r0, r7
 800170e:	f3af 8000 	nop.w
 8001712:	1c42      	adds	r2, r0, #1
 8001714:	4606      	mov	r6, r0
 8001716:	d1d6      	bne.n	80016c6 <_svfiprintf_r+0x176>
 8001718:	89ab      	ldrh	r3, [r5, #12]
 800171a:	065b      	lsls	r3, r3, #25
 800171c:	f53f af2c 	bmi.w	8001578 <_svfiprintf_r+0x28>
 8001720:	9809      	ldr	r0, [sp, #36]	; 0x24
 8001722:	b01d      	add	sp, #116	; 0x74
 8001724:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8001728:	ab03      	add	r3, sp, #12
 800172a:	9300      	str	r3, [sp, #0]
 800172c:	462a      	mov	r2, r5
 800172e:	4b07      	ldr	r3, [pc, #28]	; (800174c <_svfiprintf_r+0x1fc>)
 8001730:	a904      	add	r1, sp, #16
 8001732:	4638      	mov	r0, r7
 8001734:	f000 f87a 	bl	800182c <_printf_i>
 8001738:	e7eb      	b.n	8001712 <_svfiprintf_r+0x1c2>
 800173a:	bf00      	nop
 800173c:	08001ed0 	.word	0x08001ed0
 8001740:	08001ed6 	.word	0x08001ed6
 8001744:	08001eda 	.word	0x08001eda
 8001748:	00000000 	.word	0x00000000
 800174c:	08001499 	.word	0x08001499

08001750 <_printf_common>:
 8001750:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8001754:	4616      	mov	r6, r2
 8001756:	4699      	mov	r9, r3
 8001758:	688a      	ldr	r2, [r1, #8]
 800175a:	690b      	ldr	r3, [r1, #16]
 800175c:	f8dd 8020 	ldr.w	r8, [sp, #32]
 8001760:	4293      	cmp	r3, r2
 8001762:	bfb8      	it	lt
 8001764:	4613      	movlt	r3, r2
 8001766:	6033      	str	r3, [r6, #0]
 8001768:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
 800176c:	4607      	mov	r7, r0
 800176e:	460c      	mov	r4, r1
 8001770:	b10a      	cbz	r2, 8001776 <_printf_common+0x26>
 8001772:	3301      	adds	r3, #1
 8001774:	6033      	str	r3, [r6, #0]
 8001776:	6823      	ldr	r3, [r4, #0]
 8001778:	0699      	lsls	r1, r3, #26
 800177a:	bf42      	ittt	mi
 800177c:	6833      	ldrmi	r3, [r6, #0]
 800177e:	3302      	addmi	r3, #2
 8001780:	6033      	strmi	r3, [r6, #0]
 8001782:	6825      	ldr	r5, [r4, #0]
 8001784:	f015 0506 	ands.w	r5, r5, #6
 8001788:	d106      	bne.n	8001798 <_printf_common+0x48>
 800178a:	f104 0a19 	add.w	sl, r4, #25
 800178e:	68e3      	ldr	r3, [r4, #12]
 8001790:	6832      	ldr	r2, [r6, #0]
 8001792:	1a9b      	subs	r3, r3, r2
 8001794:	42ab      	cmp	r3, r5
 8001796:	dc26      	bgt.n	80017e6 <_printf_common+0x96>
 8001798:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
 800179c:	1e13      	subs	r3, r2, #0
 800179e:	6822      	ldr	r2, [r4, #0]
 80017a0:	bf18      	it	ne
 80017a2:	2301      	movne	r3, #1
 80017a4:	0692      	lsls	r2, r2, #26
 80017a6:	d42b      	bmi.n	8001800 <_printf_common+0xb0>
 80017a8:	f104 0243 	add.w	r2, r4, #67	; 0x43
 80017ac:	4649      	mov	r1, r9
 80017ae:	4638      	mov	r0, r7
 80017b0:	47c0      	blx	r8
 80017b2:	3001      	adds	r0, #1
 80017b4:	d01e      	beq.n	80017f4 <_printf_common+0xa4>
 80017b6:	6823      	ldr	r3, [r4, #0]
 80017b8:	68e5      	ldr	r5, [r4, #12]
 80017ba:	6832      	ldr	r2, [r6, #0]
 80017bc:	f003 0306 	and.w	r3, r3, #6
 80017c0:	2b04      	cmp	r3, #4
 80017c2:	bf08      	it	eq
 80017c4:	1aad      	subeq	r5, r5, r2
 80017c6:	68a3      	ldr	r3, [r4, #8]
 80017c8:	6922      	ldr	r2, [r4, #16]
 80017ca:	bf0c      	ite	eq
 80017cc:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
 80017d0:	2500      	movne	r5, #0
 80017d2:	4293      	cmp	r3, r2
 80017d4:	bfc4      	itt	gt
 80017d6:	1a9b      	subgt	r3, r3, r2
 80017d8:	18ed      	addgt	r5, r5, r3
 80017da:	2600      	movs	r6, #0
 80017dc:	341a      	adds	r4, #26
 80017de:	42b5      	cmp	r5, r6
 80017e0:	d11a      	bne.n	8001818 <_printf_common+0xc8>
 80017e2:	2000      	movs	r0, #0
 80017e4:	e008      	b.n	80017f8 <_printf_common+0xa8>
 80017e6:	2301      	movs	r3, #1
 80017e8:	4652      	mov	r2, sl
 80017ea:	4649      	mov	r1, r9
 80017ec:	4638      	mov	r0, r7
 80017ee:	47c0      	blx	r8
 80017f0:	3001      	adds	r0, #1
 80017f2:	d103      	bne.n	80017fc <_printf_common+0xac>
 80017f4:	f04f 30ff 	mov.w	r0, #4294967295
 80017f8:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 80017fc:	3501      	adds	r5, #1
 80017fe:	e7c6      	b.n	800178e <_printf_common+0x3e>
 8001800:	18e1      	adds	r1, r4, r3
 8001802:	1c5a      	adds	r2, r3, #1
 8001804:	2030      	movs	r0, #48	; 0x30
 8001806:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
 800180a:	4422      	add	r2, r4
 800180c:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
 8001810:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
 8001814:	3302      	adds	r3, #2
 8001816:	e7c7      	b.n	80017a8 <_printf_common+0x58>
 8001818:	2301      	movs	r3, #1
 800181a:	4622      	mov	r2, r4
 800181c:	4649      	mov	r1, r9
 800181e:	4638      	mov	r0, r7
 8001820:	47c0      	blx	r8
 8001822:	3001      	adds	r0, #1
 8001824:	d0e6      	beq.n	80017f4 <_printf_common+0xa4>
 8001826:	3601      	adds	r6, #1
 8001828:	e7d9      	b.n	80017de <_printf_common+0x8e>
	...

0800182c <_printf_i>:
 800182c:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
 8001830:	7e0f      	ldrb	r7, [r1, #24]
 8001832:	9d0c      	ldr	r5, [sp, #48]	; 0x30
 8001834:	2f78      	cmp	r7, #120	; 0x78
 8001836:	4691      	mov	r9, r2
 8001838:	4680      	mov	r8, r0
 800183a:	460c      	mov	r4, r1
 800183c:	469a      	mov	sl, r3
 800183e:	f101 0243 	add.w	r2, r1, #67	; 0x43
 8001842:	d807      	bhi.n	8001854 <_printf_i+0x28>
 8001844:	2f62      	cmp	r7, #98	; 0x62
 8001846:	d80a      	bhi.n	800185e <_printf_i+0x32>
 8001848:	2f00      	cmp	r7, #0
 800184a:	f000 80d8 	beq.w	80019fe <_printf_i+0x1d2>
 800184e:	2f58      	cmp	r7, #88	; 0x58
 8001850:	f000 80a3 	beq.w	800199a <_printf_i+0x16e>
 8001854:	f104 0542 	add.w	r5, r4, #66	; 0x42
 8001858:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
 800185c:	e03a      	b.n	80018d4 <_printf_i+0xa8>
 800185e:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
 8001862:	2b15      	cmp	r3, #21
 8001864:	d8f6      	bhi.n	8001854 <_printf_i+0x28>
 8001866:	a101      	add	r1, pc, #4	; (adr r1, 800186c <_printf_i+0x40>)
 8001868:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
 800186c:	080018c5 	.word	0x080018c5
 8001870:	080018d9 	.word	0x080018d9
 8001874:	08001855 	.word	0x08001855
 8001878:	08001855 	.word	0x08001855
 800187c:	08001855 	.word	0x08001855
 8001880:	08001855 	.word	0x08001855
 8001884:	080018d9 	.word	0x080018d9
 8001888:	08001855 	.word	0x08001855
 800188c:	08001855 	.word	0x08001855
 8001890:	08001855 	.word	0x08001855
 8001894:	08001855 	.word	0x08001855
 8001898:	080019e5 	.word	0x080019e5
 800189c:	08001909 	.word	0x08001909
 80018a0:	080019c7 	.word	0x080019c7
 80018a4:	08001855 	.word	0x08001855
 80018a8:	08001855 	.word	0x08001855
 80018ac:	08001a07 	.word	0x08001a07
 80018b0:	08001855 	.word	0x08001855
 80018b4:	08001909 	.word	0x08001909
 80018b8:	08001855 	.word	0x08001855
 80018bc:	08001855 	.word	0x08001855
 80018c0:	080019cf 	.word	0x080019cf
 80018c4:	682b      	ldr	r3, [r5, #0]
 80018c6:	1d1a      	adds	r2, r3, #4
 80018c8:	681b      	ldr	r3, [r3, #0]
 80018ca:	602a      	str	r2, [r5, #0]
 80018cc:	f104 0542 	add.w	r5, r4, #66	; 0x42
 80018d0:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
 80018d4:	2301      	movs	r3, #1
 80018d6:	e0a3      	b.n	8001a20 <_printf_i+0x1f4>
 80018d8:	6820      	ldr	r0, [r4, #0]
 80018da:	6829      	ldr	r1, [r5, #0]
 80018dc:	0606      	lsls	r6, r0, #24
 80018de:	f101 0304 	add.w	r3, r1, #4
 80018e2:	d50a      	bpl.n	80018fa <_printf_i+0xce>
 80018e4:	680e      	ldr	r6, [r1, #0]
 80018e6:	602b      	str	r3, [r5, #0]
 80018e8:	2e00      	cmp	r6, #0
 80018ea:	da03      	bge.n	80018f4 <_printf_i+0xc8>
 80018ec:	232d      	movs	r3, #45	; 0x2d
 80018ee:	4276      	negs	r6, r6
 80018f0:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 80018f4:	485e      	ldr	r0, [pc, #376]	; (8001a70 <_printf_i+0x244>)
 80018f6:	230a      	movs	r3, #10
 80018f8:	e019      	b.n	800192e <_printf_i+0x102>
 80018fa:	680e      	ldr	r6, [r1, #0]
 80018fc:	602b      	str	r3, [r5, #0]
 80018fe:	f010 0f40 	tst.w	r0, #64	; 0x40
 8001902:	bf18      	it	ne
 8001904:	b236      	sxthne	r6, r6
 8001906:	e7ef      	b.n	80018e8 <_printf_i+0xbc>
 8001908:	682b      	ldr	r3, [r5, #0]
 800190a:	6820      	ldr	r0, [r4, #0]
 800190c:	1d19      	adds	r1, r3, #4
 800190e:	6029      	str	r1, [r5, #0]
 8001910:	0601      	lsls	r1, r0, #24
 8001912:	d501      	bpl.n	8001918 <_printf_i+0xec>
 8001914:	681e      	ldr	r6, [r3, #0]
 8001916:	e002      	b.n	800191e <_printf_i+0xf2>
 8001918:	0646      	lsls	r6, r0, #25
 800191a:	d5fb      	bpl.n	8001914 <_printf_i+0xe8>
 800191c:	881e      	ldrh	r6, [r3, #0]
 800191e:	4854      	ldr	r0, [pc, #336]	; (8001a70 <_printf_i+0x244>)
 8001920:	2f6f      	cmp	r7, #111	; 0x6f
 8001922:	bf0c      	ite	eq
 8001924:	2308      	moveq	r3, #8
 8001926:	230a      	movne	r3, #10
 8001928:	2100      	movs	r1, #0
 800192a:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
 800192e:	6865      	ldr	r5, [r4, #4]
 8001930:	60a5      	str	r5, [r4, #8]
 8001932:	2d00      	cmp	r5, #0
 8001934:	bfa2      	ittt	ge
 8001936:	6821      	ldrge	r1, [r4, #0]
 8001938:	f021 0104 	bicge.w	r1, r1, #4
 800193c:	6021      	strge	r1, [r4, #0]
 800193e:	b90e      	cbnz	r6, 8001944 <_printf_i+0x118>
 8001940:	2d00      	cmp	r5, #0
 8001942:	d04d      	beq.n	80019e0 <_printf_i+0x1b4>
 8001944:	4615      	mov	r5, r2
 8001946:	fbb6 f1f3 	udiv	r1, r6, r3
 800194a:	fb03 6711 	mls	r7, r3, r1, r6
 800194e:	5dc7      	ldrb	r7, [r0, r7]
 8001950:	f805 7d01 	strb.w	r7, [r5, #-1]!
 8001954:	4637      	mov	r7, r6
 8001956:	42bb      	cmp	r3, r7
 8001958:	460e      	mov	r6, r1
 800195a:	d9f4      	bls.n	8001946 <_printf_i+0x11a>
 800195c:	2b08      	cmp	r3, #8
 800195e:	d10b      	bne.n	8001978 <_printf_i+0x14c>
 8001960:	6823      	ldr	r3, [r4, #0]
 8001962:	07de      	lsls	r6, r3, #31
 8001964:	d508      	bpl.n	8001978 <_printf_i+0x14c>
 8001966:	6923      	ldr	r3, [r4, #16]
 8001968:	6861      	ldr	r1, [r4, #4]
 800196a:	4299      	cmp	r1, r3
 800196c:	bfde      	ittt	le
 800196e:	2330      	movle	r3, #48	; 0x30
 8001970:	f805 3c01 	strble.w	r3, [r5, #-1]
 8001974:	f105 35ff 	addle.w	r5, r5, #4294967295
 8001978:	1b52      	subs	r2, r2, r5
 800197a:	6122      	str	r2, [r4, #16]
 800197c:	f8cd a000 	str.w	sl, [sp]
 8001980:	464b      	mov	r3, r9
 8001982:	aa03      	add	r2, sp, #12
 8001984:	4621      	mov	r1, r4
 8001986:	4640      	mov	r0, r8
 8001988:	f7ff fee2 	bl	8001750 <_printf_common>
 800198c:	3001      	adds	r0, #1
 800198e:	d14c      	bne.n	8001a2a <_printf_i+0x1fe>
 8001990:	f04f 30ff 	mov.w	r0, #4294967295
 8001994:	b004      	add	sp, #16
 8001996:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800199a:	4835      	ldr	r0, [pc, #212]	; (8001a70 <_printf_i+0x244>)
 800199c:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
 80019a0:	6829      	ldr	r1, [r5, #0]
 80019a2:	6823      	ldr	r3, [r4, #0]
 80019a4:	f851 6b04 	ldr.w	r6, [r1], #4
 80019a8:	6029      	str	r1, [r5, #0]
 80019aa:	061d      	lsls	r5, r3, #24
 80019ac:	d514      	bpl.n	80019d8 <_printf_i+0x1ac>
 80019ae:	07df      	lsls	r7, r3, #31
 80019b0:	bf44      	itt	mi
 80019b2:	f043 0320 	orrmi.w	r3, r3, #32
 80019b6:	6023      	strmi	r3, [r4, #0]
 80019b8:	b91e      	cbnz	r6, 80019c2 <_printf_i+0x196>
 80019ba:	6823      	ldr	r3, [r4, #0]
 80019bc:	f023 0320 	bic.w	r3, r3, #32
 80019c0:	6023      	str	r3, [r4, #0]
 80019c2:	2310      	movs	r3, #16
 80019c4:	e7b0      	b.n	8001928 <_printf_i+0xfc>
 80019c6:	6823      	ldr	r3, [r4, #0]
 80019c8:	f043 0320 	orr.w	r3, r3, #32
 80019cc:	6023      	str	r3, [r4, #0]
 80019ce:	2378      	movs	r3, #120	; 0x78
 80019d0:	4828      	ldr	r0, [pc, #160]	; (8001a74 <_printf_i+0x248>)
 80019d2:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
 80019d6:	e7e3      	b.n	80019a0 <_printf_i+0x174>
 80019d8:	0659      	lsls	r1, r3, #25
 80019da:	bf48      	it	mi
 80019dc:	b2b6      	uxthmi	r6, r6
 80019de:	e7e6      	b.n	80019ae <_printf_i+0x182>
 80019e0:	4615      	mov	r5, r2
 80019e2:	e7bb      	b.n	800195c <_printf_i+0x130>
 80019e4:	682b      	ldr	r3, [r5, #0]
 80019e6:	6826      	ldr	r6, [r4, #0]
 80019e8:	6961      	ldr	r1, [r4, #20]
 80019ea:	1d18      	adds	r0, r3, #4
 80019ec:	6028      	str	r0, [r5, #0]
 80019ee:	0635      	lsls	r5, r6, #24
 80019f0:	681b      	ldr	r3, [r3, #0]
 80019f2:	d501      	bpl.n	80019f8 <_printf_i+0x1cc>
 80019f4:	6019      	str	r1, [r3, #0]
 80019f6:	e002      	b.n	80019fe <_printf_i+0x1d2>
 80019f8:	0670      	lsls	r0, r6, #25
 80019fa:	d5fb      	bpl.n	80019f4 <_printf_i+0x1c8>
 80019fc:	8019      	strh	r1, [r3, #0]
 80019fe:	2300      	movs	r3, #0
 8001a00:	6123      	str	r3, [r4, #16]
 8001a02:	4615      	mov	r5, r2
 8001a04:	e7ba      	b.n	800197c <_printf_i+0x150>
 8001a06:	682b      	ldr	r3, [r5, #0]
 8001a08:	1d1a      	adds	r2, r3, #4
 8001a0a:	602a      	str	r2, [r5, #0]
 8001a0c:	681d      	ldr	r5, [r3, #0]
 8001a0e:	6862      	ldr	r2, [r4, #4]
 8001a10:	2100      	movs	r1, #0
 8001a12:	4628      	mov	r0, r5
 8001a14:	f7ff f884 	bl	8000b20 <memchr>
 8001a18:	b108      	cbz	r0, 8001a1e <_printf_i+0x1f2>
 8001a1a:	1b40      	subs	r0, r0, r5
 8001a1c:	6060      	str	r0, [r4, #4]
 8001a1e:	6863      	ldr	r3, [r4, #4]
 8001a20:	6123      	str	r3, [r4, #16]
 8001a22:	2300      	movs	r3, #0
 8001a24:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 8001a28:	e7a8      	b.n	800197c <_printf_i+0x150>
 8001a2a:	6923      	ldr	r3, [r4, #16]
 8001a2c:	462a      	mov	r2, r5
 8001a2e:	4649      	mov	r1, r9
 8001a30:	4640      	mov	r0, r8
 8001a32:	47d0      	blx	sl
 8001a34:	3001      	adds	r0, #1
 8001a36:	d0ab      	beq.n	8001990 <_printf_i+0x164>
 8001a38:	6823      	ldr	r3, [r4, #0]
 8001a3a:	079b      	lsls	r3, r3, #30
 8001a3c:	d413      	bmi.n	8001a66 <_printf_i+0x23a>
 8001a3e:	68e0      	ldr	r0, [r4, #12]
 8001a40:	9b03      	ldr	r3, [sp, #12]
 8001a42:	4298      	cmp	r0, r3
 8001a44:	bfb8      	it	lt
 8001a46:	4618      	movlt	r0, r3
 8001a48:	e7a4      	b.n	8001994 <_printf_i+0x168>
 8001a4a:	2301      	movs	r3, #1
 8001a4c:	4632      	mov	r2, r6
 8001a4e:	4649      	mov	r1, r9
 8001a50:	4640      	mov	r0, r8
 8001a52:	47d0      	blx	sl
 8001a54:	3001      	adds	r0, #1
 8001a56:	d09b      	beq.n	8001990 <_printf_i+0x164>
 8001a58:	3501      	adds	r5, #1
 8001a5a:	68e3      	ldr	r3, [r4, #12]
 8001a5c:	9903      	ldr	r1, [sp, #12]
 8001a5e:	1a5b      	subs	r3, r3, r1
 8001a60:	42ab      	cmp	r3, r5
 8001a62:	dcf2      	bgt.n	8001a4a <_printf_i+0x21e>
 8001a64:	e7eb      	b.n	8001a3e <_printf_i+0x212>
 8001a66:	2500      	movs	r5, #0
 8001a68:	f104 0619 	add.w	r6, r4, #25
 8001a6c:	e7f5      	b.n	8001a5a <_printf_i+0x22e>
 8001a6e:	bf00      	nop
 8001a70:	08001ee1 	.word	0x08001ee1
 8001a74:	08001ef2 	.word	0x08001ef2

08001a78 <_sbrk_r>:
 8001a78:	b538      	push	{r3, r4, r5, lr}
 8001a7a:	4d06      	ldr	r5, [pc, #24]	; (8001a94 <_sbrk_r+0x1c>)
 8001a7c:	2300      	movs	r3, #0
 8001a7e:	4604      	mov	r4, r0
 8001a80:	4608      	mov	r0, r1
 8001a82:	602b      	str	r3, [r5, #0]
 8001a84:	f7fe fefa 	bl	800087c <_sbrk>
 8001a88:	1c43      	adds	r3, r0, #1
 8001a8a:	d102      	bne.n	8001a92 <_sbrk_r+0x1a>
 8001a8c:	682b      	ldr	r3, [r5, #0]
 8001a8e:	b103      	cbz	r3, 8001a92 <_sbrk_r+0x1a>
 8001a90:	6023      	str	r3, [r4, #0]
 8001a92:	bd38      	pop	{r3, r4, r5, pc}
 8001a94:	200000b4 	.word	0x200000b4

08001a98 <__sread>:
 8001a98:	b510      	push	{r4, lr}
 8001a9a:	460c      	mov	r4, r1
 8001a9c:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001aa0:	f000 f8f8 	bl	8001c94 <_read_r>
 8001aa4:	2800      	cmp	r0, #0
 8001aa6:	bfab      	itete	ge
 8001aa8:	6d63      	ldrge	r3, [r4, #84]	; 0x54
 8001aaa:	89a3      	ldrhlt	r3, [r4, #12]
 8001aac:	181b      	addge	r3, r3, r0
 8001aae:	f423 5380 	biclt.w	r3, r3, #4096	; 0x1000
 8001ab2:	bfac      	ite	ge
 8001ab4:	6563      	strge	r3, [r4, #84]	; 0x54
 8001ab6:	81a3      	strhlt	r3, [r4, #12]
 8001ab8:	bd10      	pop	{r4, pc}

08001aba <__swrite>:
 8001aba:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001abe:	461f      	mov	r7, r3
 8001ac0:	898b      	ldrh	r3, [r1, #12]
 8001ac2:	05db      	lsls	r3, r3, #23
 8001ac4:	4605      	mov	r5, r0
 8001ac6:	460c      	mov	r4, r1
 8001ac8:	4616      	mov	r6, r2
 8001aca:	d505      	bpl.n	8001ad8 <__swrite+0x1e>
 8001acc:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001ad0:	2302      	movs	r3, #2
 8001ad2:	2200      	movs	r2, #0
 8001ad4:	f000 f868 	bl	8001ba8 <_lseek_r>
 8001ad8:	89a3      	ldrh	r3, [r4, #12]
 8001ada:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
 8001ade:	f423 5380 	bic.w	r3, r3, #4096	; 0x1000
 8001ae2:	81a3      	strh	r3, [r4, #12]
 8001ae4:	4632      	mov	r2, r6
 8001ae6:	463b      	mov	r3, r7
 8001ae8:	4628      	mov	r0, r5
 8001aea:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 8001aee:	f000 b817 	b.w	8001b20 <_write_r>

08001af2 <__sseek>:
 8001af2:	b510      	push	{r4, lr}
 8001af4:	460c      	mov	r4, r1
 8001af6:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001afa:	f000 f855 	bl	8001ba8 <_lseek_r>
 8001afe:	1c43      	adds	r3, r0, #1
 8001b00:	89a3      	ldrh	r3, [r4, #12]
 8001b02:	bf15      	itete	ne
 8001b04:	6560      	strne	r0, [r4, #84]	; 0x54
 8001b06:	f423 5380 	biceq.w	r3, r3, #4096	; 0x1000
 8001b0a:	f443 5380 	orrne.w	r3, r3, #4096	; 0x1000
 8001b0e:	81a3      	strheq	r3, [r4, #12]
 8001b10:	bf18      	it	ne
 8001b12:	81a3      	strhne	r3, [r4, #12]
 8001b14:	bd10      	pop	{r4, pc}

08001b16 <__sclose>:
 8001b16:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8001b1a:	f000 b813 	b.w	8001b44 <_close_r>
	...

08001b20 <_write_r>:
 8001b20:	b538      	push	{r3, r4, r5, lr}
 8001b22:	4d07      	ldr	r5, [pc, #28]	; (8001b40 <_write_r+0x20>)
 8001b24:	4604      	mov	r4, r0
 8001b26:	4608      	mov	r0, r1
 8001b28:	4611      	mov	r1, r2
 8001b2a:	2200      	movs	r2, #0
 8001b2c:	602a      	str	r2, [r5, #0]
 8001b2e:	461a      	mov	r2, r3
 8001b30:	f7fe fe8c 	bl	800084c <_write>
 8001b34:	1c43      	adds	r3, r0, #1
 8001b36:	d102      	bne.n	8001b3e <_write_r+0x1e>
 8001b38:	682b      	ldr	r3, [r5, #0]
 8001b3a:	b103      	cbz	r3, 8001b3e <_write_r+0x1e>
 8001b3c:	6023      	str	r3, [r4, #0]
 8001b3e:	bd38      	pop	{r3, r4, r5, pc}
 8001b40:	200000b4 	.word	0x200000b4

08001b44 <_close_r>:
 8001b44:	b538      	push	{r3, r4, r5, lr}
 8001b46:	4d06      	ldr	r5, [pc, #24]	; (8001b60 <_close_r+0x1c>)
 8001b48:	2300      	movs	r3, #0
 8001b4a:	4604      	mov	r4, r0
 8001b4c:	4608      	mov	r0, r1
 8001b4e:	602b      	str	r3, [r5, #0]
 8001b50:	f7fe fe54 	bl	80007fc <_close>
 8001b54:	1c43      	adds	r3, r0, #1
 8001b56:	d102      	bne.n	8001b5e <_close_r+0x1a>
 8001b58:	682b      	ldr	r3, [r5, #0]
 8001b5a:	b103      	cbz	r3, 8001b5e <_close_r+0x1a>
 8001b5c:	6023      	str	r3, [r4, #0]
 8001b5e:	bd38      	pop	{r3, r4, r5, pc}
 8001b60:	200000b4 	.word	0x200000b4

08001b64 <_fstat_r>:
 8001b64:	b538      	push	{r3, r4, r5, lr}
 8001b66:	4d07      	ldr	r5, [pc, #28]	; (8001b84 <_fstat_r+0x20>)
 8001b68:	2300      	movs	r3, #0
 8001b6a:	4604      	mov	r4, r0
 8001b6c:	4608      	mov	r0, r1
 8001b6e:	4611      	mov	r1, r2
 8001b70:	602b      	str	r3, [r5, #0]
 8001b72:	f7fe fe2d 	bl	80007d0 <_fstat>
 8001b76:	1c43      	adds	r3, r0, #1
 8001b78:	d102      	bne.n	8001b80 <_fstat_r+0x1c>
 8001b7a:	682b      	ldr	r3, [r5, #0]
 8001b7c:	b103      	cbz	r3, 8001b80 <_fstat_r+0x1c>
 8001b7e:	6023      	str	r3, [r4, #0]
 8001b80:	bd38      	pop	{r3, r4, r5, pc}
 8001b82:	bf00      	nop
 8001b84:	200000b4 	.word	0x200000b4

08001b88 <_isatty_r>:
 8001b88:	b538      	push	{r3, r4, r5, lr}
 8001b8a:	4d06      	ldr	r5, [pc, #24]	; (8001ba4 <_isatty_r+0x1c>)
 8001b8c:	2300      	movs	r3, #0
 8001b8e:	4604      	mov	r4, r0
 8001b90:	4608      	mov	r0, r1
 8001b92:	602b      	str	r3, [r5, #0]
 8001b94:	f7fe fe28 	bl	80007e8 <_isatty>
 8001b98:	1c43      	adds	r3, r0, #1
 8001b9a:	d102      	bne.n	8001ba2 <_isatty_r+0x1a>
 8001b9c:	682b      	ldr	r3, [r5, #0]
 8001b9e:	b103      	cbz	r3, 8001ba2 <_isatty_r+0x1a>
 8001ba0:	6023      	str	r3, [r4, #0]
 8001ba2:	bd38      	pop	{r3, r4, r5, pc}
 8001ba4:	200000b4 	.word	0x200000b4

08001ba8 <_lseek_r>:
 8001ba8:	b538      	push	{r3, r4, r5, lr}
 8001baa:	4d07      	ldr	r5, [pc, #28]	; (8001bc8 <_lseek_r+0x20>)
 8001bac:	4604      	mov	r4, r0
 8001bae:	4608      	mov	r0, r1
 8001bb0:	4611      	mov	r1, r2
 8001bb2:	2200      	movs	r2, #0
 8001bb4:	602a      	str	r2, [r5, #0]
 8001bb6:	461a      	mov	r2, r3
 8001bb8:	f7fe fe2b 	bl	8000812 <_lseek>
 8001bbc:	1c43      	adds	r3, r0, #1
 8001bbe:	d102      	bne.n	8001bc6 <_lseek_r+0x1e>
 8001bc0:	682b      	ldr	r3, [r5, #0]
 8001bc2:	b103      	cbz	r3, 8001bc6 <_lseek_r+0x1e>
 8001bc4:	6023      	str	r3, [r4, #0]
 8001bc6:	bd38      	pop	{r3, r4, r5, pc}
 8001bc8:	200000b4 	.word	0x200000b4

08001bcc <memcpy>:
 8001bcc:	440a      	add	r2, r1
 8001bce:	4291      	cmp	r1, r2
 8001bd0:	f100 33ff 	add.w	r3, r0, #4294967295
 8001bd4:	d100      	bne.n	8001bd8 <memcpy+0xc>
 8001bd6:	4770      	bx	lr
 8001bd8:	b510      	push	{r4, lr}
 8001bda:	f811 4b01 	ldrb.w	r4, [r1], #1
 8001bde:	f803 4f01 	strb.w	r4, [r3, #1]!
 8001be2:	4291      	cmp	r1, r2
 8001be4:	d1f9      	bne.n	8001bda <memcpy+0xe>
 8001be6:	bd10      	pop	{r4, pc}

08001be8 <memmove>:
 8001be8:	4288      	cmp	r0, r1
 8001bea:	b510      	push	{r4, lr}
 8001bec:	eb01 0402 	add.w	r4, r1, r2
 8001bf0:	d902      	bls.n	8001bf8 <memmove+0x10>
 8001bf2:	4284      	cmp	r4, r0
 8001bf4:	4623      	mov	r3, r4
 8001bf6:	d807      	bhi.n	8001c08 <memmove+0x20>
 8001bf8:	1e43      	subs	r3, r0, #1
 8001bfa:	42a1      	cmp	r1, r4
 8001bfc:	d008      	beq.n	8001c10 <memmove+0x28>
 8001bfe:	f811 2b01 	ldrb.w	r2, [r1], #1
 8001c02:	f803 2f01 	strb.w	r2, [r3, #1]!
 8001c06:	e7f8      	b.n	8001bfa <memmove+0x12>
 8001c08:	4402      	add	r2, r0
 8001c0a:	4601      	mov	r1, r0
 8001c0c:	428a      	cmp	r2, r1
 8001c0e:	d100      	bne.n	8001c12 <memmove+0x2a>
 8001c10:	bd10      	pop	{r4, pc}
 8001c12:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
 8001c16:	f802 4d01 	strb.w	r4, [r2, #-1]!
 8001c1a:	e7f7      	b.n	8001c0c <memmove+0x24>

08001c1c <__malloc_lock>:
 8001c1c:	4801      	ldr	r0, [pc, #4]	; (8001c24 <__malloc_lock+0x8>)
 8001c1e:	f7ff baf5 	b.w	800120c <__retarget_lock_acquire_recursive>
 8001c22:	bf00      	nop
 8001c24:	200000a8 	.word	0x200000a8

08001c28 <__malloc_unlock>:
 8001c28:	4801      	ldr	r0, [pc, #4]	; (8001c30 <__malloc_unlock+0x8>)
 8001c2a:	f7ff baf0 	b.w	800120e <__retarget_lock_release_recursive>
 8001c2e:	bf00      	nop
 8001c30:	200000a8 	.word	0x200000a8

08001c34 <_realloc_r>:
 8001c34:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001c38:	4680      	mov	r8, r0
 8001c3a:	4614      	mov	r4, r2
 8001c3c:	460e      	mov	r6, r1
 8001c3e:	b921      	cbnz	r1, 8001c4a <_realloc_r+0x16>
 8001c40:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 8001c44:	4611      	mov	r1, r2
 8001c46:	f7ff bbb3 	b.w	80013b0 <_malloc_r>
 8001c4a:	b92a      	cbnz	r2, 8001c58 <_realloc_r+0x24>
 8001c4c:	f7ff fb46 	bl	80012dc <_free_r>
 8001c50:	4625      	mov	r5, r4
 8001c52:	4628      	mov	r0, r5
 8001c54:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001c58:	f000 f82e 	bl	8001cb8 <_malloc_usable_size_r>
 8001c5c:	4284      	cmp	r4, r0
 8001c5e:	4607      	mov	r7, r0
 8001c60:	d802      	bhi.n	8001c68 <_realloc_r+0x34>
 8001c62:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
 8001c66:	d812      	bhi.n	8001c8e <_realloc_r+0x5a>
 8001c68:	4621      	mov	r1, r4
 8001c6a:	4640      	mov	r0, r8
 8001c6c:	f7ff fba0 	bl	80013b0 <_malloc_r>
 8001c70:	4605      	mov	r5, r0
 8001c72:	2800      	cmp	r0, #0
 8001c74:	d0ed      	beq.n	8001c52 <_realloc_r+0x1e>
 8001c76:	42bc      	cmp	r4, r7
 8001c78:	4622      	mov	r2, r4
 8001c7a:	4631      	mov	r1, r6
 8001c7c:	bf28      	it	cs
 8001c7e:	463a      	movcs	r2, r7
 8001c80:	f7ff ffa4 	bl	8001bcc <memcpy>
 8001c84:	4631      	mov	r1, r6
 8001c86:	4640      	mov	r0, r8
 8001c88:	f7ff fb28 	bl	80012dc <_free_r>
 8001c8c:	e7e1      	b.n	8001c52 <_realloc_r+0x1e>
 8001c8e:	4635      	mov	r5, r6
 8001c90:	e7df      	b.n	8001c52 <_realloc_r+0x1e>
	...

08001c94 <_read_r>:
 8001c94:	b538      	push	{r3, r4, r5, lr}
 8001c96:	4d07      	ldr	r5, [pc, #28]	; (8001cb4 <_read_r+0x20>)
 8001c98:	4604      	mov	r4, r0
 8001c9a:	4608      	mov	r0, r1
 8001c9c:	4611      	mov	r1, r2
 8001c9e:	2200      	movs	r2, #0
 8001ca0:	602a      	str	r2, [r5, #0]
 8001ca2:	461a      	mov	r2, r3
 8001ca4:	f7fe fdc6 	bl	8000834 <_read>
 8001ca8:	1c43      	adds	r3, r0, #1
 8001caa:	d102      	bne.n	8001cb2 <_read_r+0x1e>
 8001cac:	682b      	ldr	r3, [r5, #0]
 8001cae:	b103      	cbz	r3, 8001cb2 <_read_r+0x1e>
 8001cb0:	6023      	str	r3, [r4, #0]
 8001cb2:	bd38      	pop	{r3, r4, r5, pc}
 8001cb4:	200000b4 	.word	0x200000b4

08001cb8 <_malloc_usable_size_r>:
 8001cb8:	f851 3c04 	ldr.w	r3, [r1, #-4]
 8001cbc:	1f18      	subs	r0, r3, #4
 8001cbe:	2b00      	cmp	r3, #0
 8001cc0:	bfbc      	itt	lt
 8001cc2:	580b      	ldrlt	r3, [r1, r0]
 8001cc4:	18c0      	addlt	r0, r0, r3
 8001cc6:	4770      	bx	lr
 8001cc8:	6c6c6568 	.word	0x6c6c6568
 8001ccc:	6f77206f 	.word	0x6f77206f
 8001cd0:	00646c72 	.word	0x00646c72
 8001cd4:	5f696d6e 	.word	0x5f696d6e
 8001cd8:	646e6168 	.word	0x646e6168
 8001cdc:	0072656c 	.word	0x0072656c
 8001ce0:	5f717269 	.word	0x5f717269
 8001ce4:	7473696c 	.word	0x7473696c
 8001ce8:	00000000 	.word	0x00000000
 8001cec:	64726168 	.word	0x64726168
 8001cf0:	6c756166 	.word	0x6c756166
 8001cf4:	61685f74 	.word	0x61685f74
 8001cf8:	656c646e 	.word	0x656c646e
 8001cfc:	00000072 	.word	0x00000072
 8001d00:	73616c66 	.word	0x73616c66
 8001d04:	3e2d2068 	.word	0x3e2d2068
 8001d08:	61727320 	.word	0x61727320
 8001d0c:	30203a6d 	.word	0x30203a6d
 8001d10:	586c2578 	.word	0x586c2578
 8001d14:	203e2d20 	.word	0x203e2d20
 8001d18:	6c257830 	.word	0x6c257830
 8001d1c:	00000058 	.word	0x00000058
 8001d20:	72646461 	.word	0x72646461
 8001d24:	7025203a 	.word	0x7025203a
 8001d28:	63656409 	.word	0x63656409
 8001d2c:	25203a6d 	.word	0x25203a6d
 8001d30:	68630964 	.word	0x68630964
 8001d34:	203a7261 	.word	0x203a7261
 8001d38:	00006325 	.word	0x00006325
 8001d3c:	504d5544 	.word	0x504d5544
 8001d40:	00000000 	.word	0x00000000
 8001d44:	0000000a 	.word	0x0000000a
 8001d48:	52415355 	.word	0x52415355
 8001d4c:	00003154 	.word	0x00003154
 8001d50:	52415355 	.word	0x52415355
 8001d54:	00003254 	.word	0x00003254
 8001d58:	4e4b4e55 	.word	0x4e4b4e55
 8001d5c:	204e574f 	.word	0x204e574f
 8001d60:	4e414843 	.word	0x4e414843
 8001d64:	004c454e 	.word	0x004c454e
 8001d68:	203a      	.short	0x203a
	...

08001d6b <_ctype_>:
 8001d6b:	2000 2020 2020 2020 2020 2828 2828 2028     .         ((((( 
 8001d7b:	2020 2020 2020 2020 2020 2020 2020 2020                     
 8001d8b:	8820 1010 1010 1010 1010 1010 1010 1010      ...............
 8001d9b:	0410 0404 0404 0404 0404 1004 1010 1010     ................
 8001dab:	1010 4141 4141 4141 0101 0101 0101 0101     ..AAAAAA........
 8001dbb:	0101 0101 0101 0101 0101 0101 1010 1010     ................
 8001dcb:	1010 4242 4242 4242 0202 0202 0202 0202     ..BBBBBB........
 8001ddb:	0202 0202 0202 0202 0202 0202 1010 1010     ................
 8001deb:	0020 0000 0000 0000 0000 0000 0000 0000      ...............
	...

08001e6c <_global_impure_ptr>:
 8001e6c:	001c 2000                                   ... 

08001e70 <__sf_fake_stderr>:
	...

08001e90 <__sf_fake_stdin>:
	...

08001eb0 <__sf_fake_stdout>:
	...
 8001ed0:	2d23 2b30 0020 6c68 004c 6665 4567 4746     #-0+ .hlL.efgEFG
 8001ee0:	3000 3231 3433 3635 3837 4139 4342 4544     .0123456789ABCDE
 8001ef0:	0046 3130 3332 3534 3736 3938 6261 6463     F.0123456789abcd
 8001f00:	6665 0000                                   ef..

08001f04 <_init>:
 8001f04:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001f06:	bf00      	nop
 8001f08:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001f0a:	bc08      	pop	{r3}
 8001f0c:	469e      	mov	lr, r3
 8001f0e:	4770      	bx	lr

08001f10 <_fini>:
 8001f10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001f12:	bf00      	nop
 8001f14:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001f16:	bc08      	pop	{r3}
 8001f18:	469e      	mov	lr, r3
 8001f1a:	4770      	bx	lr
