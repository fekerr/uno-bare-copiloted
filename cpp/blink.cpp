#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN  (1 << 5) // Pin 13 on Arduino Uno

int main(void) {
    // Set LED_PIN as output
    DDRB |= LED_PIN;

    while (1) {
        // Turn the LED on
        PORTB |= LED_PIN;
        _delay_ms(1000);

        // Turn the LED off
        PORTB &= ~LED_PIN;
        _delay_ms(1000);
    }

    return 0;
}

