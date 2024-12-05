
build/blink.o:     file format elf32-avr


Disassembly of section .text.startup:

00000000 <main>:
   0:	25 9a       	sbi	0x04, 5	; 4
   2:	2d 9a       	sbi	0x05, 5	; 5
   4:	2f ef       	ldi	r18, 0xFF	; 255
   6:	83 ed       	ldi	r24, 0xD3	; 211
   8:	90 e3       	ldi	r25, 0x30	; 48
   a:	21 50       	subi	r18, 0x01	; 1
   c:	80 40       	sbci	r24, 0x00	; 0
   e:	90 40       	sbci	r25, 0x00	; 0
  10:	01 f4       	brne	.+0      	; 0x12 <main+0x12>
  12:	00 c0       	rjmp	.+0      	; 0x14 <main+0x14>
  14:	00 00       	nop
  16:	2d 98       	cbi	0x05, 5	; 5
  18:	2f ef       	ldi	r18, 0xFF	; 255
  1a:	83 ed       	ldi	r24, 0xD3	; 211
  1c:	90 e3       	ldi	r25, 0x30	; 48
  1e:	21 50       	subi	r18, 0x01	; 1
  20:	80 40       	sbci	r24, 0x00	; 0
  22:	90 40       	sbci	r25, 0x00	; 0
  24:	01 f4       	brne	.+0      	; 0x26 <main+0x26>
  26:	00 c0       	rjmp	.+0      	; 0x28 <main+0x28>
  28:	00 00       	nop
  2a:	00 c0       	rjmp	.+0      	; 0x2c <__zero_reg__+0x2b>
