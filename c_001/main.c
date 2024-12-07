#include <avr/io.h>
#include <util/delay.h>

#define BAUD 9600
#include <util/setbaud.h>

#define LED_PIN  (1 << 5) // Pin 13 on Arduino Uno

void uart_init(void) {
    UBRR0H = UBRRH_VALUE;
    UBRR0L = UBRRL_VALUE;
#if USE_2X
    UCSR0A |= (1 << U2X0);
#else
    UCSR0A &= ~(1 << U2X0);
#endif
    UCSR0B = (1 << TXEN0);
    UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);
}

void uart_transmit(char data) {
    while (!(UCSR0A & (1 << UDRE0)));
    UDR0 = data;
}

void uart_print(const char* str) {
    while (*str) {
        uart_transmit(*str++);
    }
}

int main(void) {
    DDRB |= LED_PIN; // Set LED_PIN as output
    uart_init();     // Initialize UART
    uart_print("UART initialized!\n");

    while (1) {
        PORTB ^= LED_PIN; // Toggle LED
        uart_print("LED toggled!\n");
        _delay_ms(1000);
    }

    return 0;
}

