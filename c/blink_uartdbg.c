#define F_CPU 16000000UL
#define BAUD 9600
#include <avr/io.h>
#include <util/setbaud.h>

void uart_init(void) {
    // Set baud rate
    UBRR0H = UBRRH_VALUE;
    UBRR0L = UBRRL_VALUE;
    
    // Enable transmitter
    UCSR0B |= (1 << TXEN0);
    
    // Set frame format: 8 data bits, 1 stop bit
    UCSR0C |= (1 << UCSZ01) | (1 << UCSZ00);
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
    uart_init(); // Initialize UART
    uart_print("UART initialized\n"); // Print debug message
    
    while (1) {
        uart_print("Loop running\n");
        _delay_ms(1000); // Delay to avoid spamming
    }
    
    return 0;
}

