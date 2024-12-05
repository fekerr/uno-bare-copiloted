
build/uartdbg.o:     file format elf32-avr


Disassembly of section .text:

00000000 <_Z9uart_initv>:
   0:	10 92 c5 00 	sts	0x00C5, r1	; 0x8000c5 <__SREG__+0x800086>
   4:	87 e6       	ldi	r24, 0x67	; 103
   6:	80 93 c4 00 	sts	0x00C4, r24	; 0x8000c4 <__SREG__+0x800085>
   a:	e0 ec       	ldi	r30, 0xC0	; 192
   c:	f0 e0       	ldi	r31, 0x00	; 0
   e:	80 81       	ld	r24, Z
  10:	8d 7f       	andi	r24, 0xFD	; 253
  12:	80 83       	st	Z, r24
  14:	88 e0       	ldi	r24, 0x08	; 8
  16:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__SREG__+0x800082>
  1a:	86 e0       	ldi	r24, 0x06	; 6
  1c:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__SREG__+0x800083>
  20:	08 95       	ret

00000022 <_Z13uart_transmitc>:
  22:	90 91 c0 00 	lds	r25, 0x00C0	; 0x8000c0 <__SREG__+0x800081>
  26:	95 ff       	sbrs	r25, 5
  28:	00 c0       	rjmp	.+0      	; 0x2a <_Z13uart_transmitc+0x8>
  2a:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__SREG__+0x800087>
  2e:	08 95       	ret

00000030 <_Z10uart_printPKc>:
  30:	cf 93       	push	r28
  32:	df 93       	push	r29
  34:	ec 01       	movw	r28, r24
  36:	89 91       	ld	r24, Y+
  38:	88 23       	and	r24, r24
  3a:	01 f0       	breq	.+0      	; 0x3c <_Z10uart_printPKc+0xc>
  3c:	0e 94 00 00 	call	0	; 0x0 <_Z9uart_initv>
  40:	00 c0       	rjmp	.+0      	; 0x42 <_Z10uart_printPKc+0x12>
  42:	df 91       	pop	r29
  44:	cf 91       	pop	r28
  46:	08 95       	ret

Disassembly of section .text.startup:

00000000 <main>:
   0:	0e 94 00 00 	call	0	; 0x0 <main>
   4:	80 e0       	ldi	r24, 0x00	; 0
   6:	90 e0       	ldi	r25, 0x00	; 0
   8:	0e 94 00 00 	call	0	; 0x0 <main>
   c:	90 e2       	ldi	r25, 0x20	; 32
   e:	85 b1       	in	r24, 0x05	; 5
  10:	89 27       	eor	r24, r25
  12:	85 b9       	out	0x05, r24	; 5
  14:	2f ef       	ldi	r18, 0xFF	; 255
  16:	33 ed       	ldi	r19, 0xD3	; 211
  18:	80 e3       	ldi	r24, 0x30	; 48
  1a:	21 50       	subi	r18, 0x01	; 1
  1c:	30 40       	sbci	r19, 0x00	; 0
  1e:	80 40       	sbci	r24, 0x00	; 0
  20:	01 f4       	brne	.+0      	; 0x22 <main+0x22>
  22:	00 c0       	rjmp	.+0      	; 0x24 <main+0x24>
  24:	00 00       	nop
  26:	00 c0       	rjmp	.+0      	; 0x28 <_Z13uart_transmitc+0x6>
