
debug/uartdbg.o:     file format elf32-avr


Disassembly of section .text:

00000000 <uart_init>:
   0:	10 92 c5 00 	sts	0x00C5, r1	; 0x8000c5 <__SREG__+0x800086>
   4:	87 e6       	ldi	r24, 0x67	; 103
   6:	80 93 c4 00 	sts	0x00C4, r24	; 0x8000c4 <__SREG__+0x800085>
   a:	e1 ec       	ldi	r30, 0xC1	; 193
   c:	f0 e0       	ldi	r31, 0x00	; 0
   e:	80 81       	ld	r24, Z
  10:	88 60       	ori	r24, 0x08	; 8
  12:	80 83       	st	Z, r24
  14:	e2 ec       	ldi	r30, 0xC2	; 194
  16:	f0 e0       	ldi	r31, 0x00	; 0
  18:	80 81       	ld	r24, Z
  1a:	86 60       	ori	r24, 0x06	; 6
  1c:	80 83       	st	Z, r24
  1e:	08 95       	ret

00000020 <uart_transmit>:
  20:	90 91 c0 00 	lds	r25, 0x00C0	; 0x8000c0 <__SREG__+0x800081>
  24:	95 ff       	sbrs	r25, 5
  26:	00 c0       	rjmp	.+0      	; 0x28 <uart_transmit+0x8>
  28:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__SREG__+0x800087>
  2c:	08 95       	ret

0000002e <uart_print>:
  2e:	fc 01       	movw	r30, r24
  30:	20 81       	ld	r18, Z
  32:	22 23       	and	r18, r18
  34:	01 f0       	breq	.+0      	; 0x36 <uart_print+0x8>
  36:	31 96       	adiw	r30, 0x01	; 1
  38:	90 91 c0 00 	lds	r25, 0x00C0	; 0x8000c0 <__SREG__+0x800081>
  3c:	95 ff       	sbrs	r25, 5
  3e:	00 c0       	rjmp	.+0      	; 0x40 <uart_print+0x12>
  40:	20 93 c6 00 	sts	0x00C6, r18	; 0x8000c6 <__SREG__+0x800087>
  44:	21 91       	ld	r18, Z+
  46:	21 11       	cpse	r18, r1
  48:	00 c0       	rjmp	.+0      	; 0x4a <uart_print+0x1c>
  4a:	08 95       	ret

Disassembly of section .text.startup:

00000000 <main>:
   0:	10 92 c5 00 	sts	0x00C5, r1	; 0x8000c5 <__SREG__+0x800086>
   4:	87 e6       	ldi	r24, 0x67	; 103
   6:	80 93 c4 00 	sts	0x00C4, r24	; 0x8000c4 <__SREG__+0x800085>
   a:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__SREG__+0x800082>
   e:	88 60       	ori	r24, 0x08	; 8
  10:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__SREG__+0x800082>
  14:	80 91 c2 00 	lds	r24, 0x00C2	; 0x8000c2 <__SREG__+0x800083>
  18:	86 60       	ori	r24, 0x06	; 6
  1a:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__SREG__+0x800083>
  1e:	e0 e0       	ldi	r30, 0x00	; 0
  20:	f0 e0       	ldi	r31, 0x00	; 0
  22:	85 e5       	ldi	r24, 0x55	; 85
  24:	90 91 c0 00 	lds	r25, 0x00C0	; 0x8000c0 <__SREG__+0x800081>
  28:	95 ff       	sbrs	r25, 5
  2a:	00 c0       	rjmp	.+0      	; 0x2c <main+0x2c>
  2c:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__SREG__+0x800087>
  30:	81 91       	ld	r24, Z+
  32:	81 11       	cpse	r24, r1
  34:	00 c0       	rjmp	.+0      	; 0x36 <main+0x36>
  36:	e0 e0       	ldi	r30, 0x00	; 0
  38:	f0 e0       	ldi	r31, 0x00	; 0
  3a:	9c e4       	ldi	r25, 0x4C	; 76
  3c:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__SREG__+0x800081>
  40:	85 ff       	sbrs	r24, 5
  42:	00 c0       	rjmp	.+0      	; 0x44 <main+0x44>
  44:	90 93 c6 00 	sts	0x00C6, r25	; 0x8000c6 <__SREG__+0x800087>
  48:	91 91       	ld	r25, Z+
  4a:	91 11       	cpse	r25, r1
  4c:	00 c0       	rjmp	.+0      	; 0x4e <main+0x4e>
  4e:	2f ef       	ldi	r18, 0xFF	; 255
  50:	83 ed       	ldi	r24, 0xD3	; 211
  52:	90 e3       	ldi	r25, 0x30	; 48
  54:	21 50       	subi	r18, 0x01	; 1
  56:	80 40       	sbci	r24, 0x00	; 0
  58:	90 40       	sbci	r25, 0x00	; 0
  5a:	01 f4       	brne	.+0      	; 0x5c <main+0x5c>
  5c:	00 c0       	rjmp	.+0      	; 0x5e <main+0x5e>
  5e:	00 00       	nop
  60:	00 c0       	rjmp	.+0      	; 0x62 <__SREG__+0x23>
