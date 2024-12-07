# My Bare Metal Arduino Uno Project

**Date of Creation**: 20241204 Copilot & fekerr

This is quick and dirty and is quite trivial. The problem is already solved. I just used Copilot to provide most of the source files with prompting.

## Overview
This project demonstrates how to perform bare metal programming on an Arduino Uno clone. By directly manipulating the microcontroller's registers, we can control hardware without using the Arduino IDE or its libraries.

## Requirements
To get started, you'll need the following tools:
- AVR-GCC: The compiler for AVR microcontrollers.
- AVRDUDE: The software to upload your program to the microcontroller.
- AVR Libc: The C library for AVR microcontrollers.

## Steps

### 1. Set Up Your Tools
Ensure you have AVR-GCC, AVRDUDE, and AVR Libc installed on your system.

### 2. Write Your Code
Create a file named `blink.c` with the following content to blink an LED on pin 13:

```c
#define F_CPU 16000000UL // Define the clock frequency as 16 MHz
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // Set pin 13 as an output
    DDRB |= (1 << PB5);

    while (1) {
        // Toggle pin 13
        PORTB ^= (1 << PB5);
        _delay_ms(500);
    }
}

