
debug/blink.o:     file format elf32-avr


Disassembly of section .text.startup:

00000000 <main>:
   0:	25 9a       	sbi	0x04, 5	; 4
   2:	80 e2       	ldi	r24, 0x20	; 32
   4:	2f ef       	ldi	r18, 0xFF	; 255
   6:	3d e3       	ldi	r19, 0x3D	; 61
   8:	99 e4       	ldi	r25, 0x49	; 73
   a:	21 50       	subi	r18, 0x01	; 1
   c:	30 40       	sbci	r19, 0x00	; 0
   e:	90 40       	sbci	r25, 0x00	; 0
  10:	01 f4       	brne	.+0      	; 0x12 <main+0x12>
  12:	00 c0       	rjmp	.+0      	; 0x14 <main+0x14>
  14:	00 00       	nop
  16:	95 b1       	in	r25, 0x05	; 5
  18:	98 27       	eor	r25, r24
  1a:	95 b9       	out	0x05, r25	; 5
  1c:	2f ef       	ldi	r18, 0xFF	; 255
  1e:	39 e6       	ldi	r19, 0x69	; 105
  20:	98 e1       	ldi	r25, 0x18	; 24
  22:	21 50       	subi	r18, 0x01	; 1
  24:	30 40       	sbci	r19, 0x00	; 0
  26:	90 40       	sbci	r25, 0x00	; 0
  28:	01 f4       	brne	.+0      	; 0x2a <main+0x2a>
  2a:	00 c0       	rjmp	.+0      	; 0x2c <main+0x2c>
  2c:	00 00       	nop
  2e:	95 b1       	in	r25, 0x05	; 5
  30:	98 27       	eor	r25, r24
  32:	95 b9       	out	0x05, r25	; 5
  34:	2f ef       	ldi	r18, 0xFF	; 255
  36:	31 ee       	ldi	r19, 0xE1	; 225
  38:	94 e0       	ldi	r25, 0x04	; 4
  3a:	21 50       	subi	r18, 0x01	; 1
  3c:	30 40       	sbci	r19, 0x00	; 0
  3e:	90 40       	sbci	r25, 0x00	; 0
  40:	01 f4       	brne	.+0      	; 0x42 <main+0x42>
  42:	00 c0       	rjmp	.+0      	; 0x44 <main+0x44>
  44:	00 00       	nop
  46:	95 b1       	in	r25, 0x05	; 5
  48:	98 27       	eor	r25, r24
  4a:	95 b9       	out	0x05, r25	; 5
  4c:	2f ef       	ldi	r18, 0xFF	; 255
  4e:	31 ee       	ldi	r19, 0xE1	; 225
  50:	94 e0       	ldi	r25, 0x04	; 4
  52:	21 50       	subi	r18, 0x01	; 1
  54:	30 40       	sbci	r19, 0x00	; 0
  56:	90 40       	sbci	r25, 0x00	; 0
  58:	01 f4       	brne	.+0      	; 0x5a <main+0x5a>
  5a:	00 c0       	rjmp	.+0      	; 0x5c <main+0x5c>
  5c:	00 00       	nop
  5e:	95 b1       	in	r25, 0x05	; 5
  60:	98 27       	eor	r25, r24
  62:	95 b9       	out	0x05, r25	; 5
  64:	2f ef       	ldi	r18, 0xFF	; 255
  66:	30 e7       	ldi	r19, 0x70	; 112
  68:	92 e0       	ldi	r25, 0x02	; 2
  6a:	21 50       	subi	r18, 0x01	; 1
  6c:	30 40       	sbci	r19, 0x00	; 0
  6e:	90 40       	sbci	r25, 0x00	; 0
  70:	01 f4       	brne	.+0      	; 0x72 <main+0x72>
  72:	00 c0       	rjmp	.+0      	; 0x74 <main+0x74>
  74:	00 00       	nop
  76:	95 b1       	in	r25, 0x05	; 5
  78:	98 27       	eor	r25, r24
  7a:	95 b9       	out	0x05, r25	; 5
  7c:	00 c0       	rjmp	.+0      	; 0x7e <__SREG__+0x3f>
