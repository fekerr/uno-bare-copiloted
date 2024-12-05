#include <avr/io.h>
#include <util/delay.h>

// BAUD needs to be defined before setbaud.h :(
#define BAUD 9600
#include <util/setbaud.h>

#define LED_PIN (1 << 5) // Pin 13 on Arduino Uno

void uart_init(void) {
    // Set baud rate
    UBRR0H = UBRRH_VALUE;
    UBRR0L = UBRRL_VALUE;
#if USE_2X
    UCSR0A |= (1 << U2X0);
#else
    UCSR0A &= ~(1 << U2X0);
#endif

    // Enable transmitter
    UCSR0B = (1 << TXEN0);
    // Set frame format: 8 data bits, 1 stop bit
    UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);
}

void uart_transmit(char data) {
    // Wait for empty transmit buffer
    while (!(UCSR0A & (1 << UDRE0)));
    // Put data into buffer, sends the data
    UDR0 = data;
}

void uart_print(const char* str) {
    while (*str) {
        uart_transmit(*str++);
    }
}

int main(void) {
    // Initialize UART
    uart_init();

    // Send a debug message
    uart_print("UART initialized!\n");

    while (1) {
        // Blink the LED
        PORTB ^= LED_PIN;
        _delay_ms(1000);
    }

    return 0;
}

