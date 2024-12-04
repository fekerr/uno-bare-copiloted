// 20241204 Copilot & fekerr

#define F_CPU 16000000UL // Define the clock frequency as 16 MHz
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // Set pin 13 as an output
    DDRB |= (1 << PB5);

    while (1) {
        _delay_ms(1500);
        // Toggle pin 13 a few times with different delays, to make a unique pattern.
        PORTB ^= (1 << PB5);
        _delay_ms(500);
        PORTB ^= (1 << PB5);
        _delay_ms(100);
        PORTB ^= (1 << PB5);
        _delay_ms(100);
        PORTB ^= (1 << PB5);
        _delay_ms(50);
        PORTB ^= (1 << PB5);
    }
}

