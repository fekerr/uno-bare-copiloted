# Define the microcontroller and programmer options
MCU = atmega328p
F_CPU = 16000000UL
CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -O2 -Wall -Wextra -g -save-temps=obj
LDFLAGS = -mmcu=$(MCU) -Wl,-Map=$(DEBUG_DIR)/$*.map

# Source files
BLINK_SRC = blink.c
UARTDBG_SRC = uartdbg.c

# Build directory
DEBUG_DIR = debug

# Object files
BLINK_OBJ = $(DEBUG_DIR)/blink.o
UARTDBG_OBJ = $(DEBUG_DIR)/uartdbg.o

# Output files
BLINK_ELF = $(DEBUG_DIR)/blink.elf
UARTDBG_ELF = $(DEBUG_DIR)/uartdbg.elf
BLINK_HEX = $(DEBUG_DIR)/blink.hex
UARTDBG_HEX = $(DEBUG_DIR)/uartdbg.hex

# Ensure build directory exists
$(DEBUG_DIR):
	mkdir -p $(DEBUG_DIR)

# Pattern rule to compile source files to object files
$(DEBUG_DIR)/%.o: %.c | $(DEBUG_DIR)
	avr-gcc $(CFLAGS) -c $< -o $@

# Rule to link object files to create ELF executables
$(DEBUG_DIR)/%.elf: $(DEBUG_DIR)/%.o
	avr-gcc $(LDFLAGS) -o $@ $<

# Rule to create hex files from ELF executables
$(DEBUG_DIR)/%.hex: $(DEBUG_DIR)/%.elf
	avr-objcopy -O ihex -R .eeprom $< $@

# Default target to build all and display help
default: all help

# Target to build all programs
all: blink uartdbg objdump

# Targets to build the blink program
blink: $(DEBUG_DIR)/blink.hex
$(DEBUG_DIR)/blink.hex: $(DEBUG_DIR)/blink.elf
$(DEBUG_DIR)/blink.elf: $(DEBUG_DIR)/blink.o
	avr-gcc $(LDFLAGS) -o $@ $<
	avr-objcopy -O ihex -R .eeprom $@ $(DEBUG_DIR)/blink.hex

# Targets to build the uartdbg program
uartdbg: $(DEBUG_DIR)/uartdbg.hex
$(DEBUG_DIR)/uartdbg.hex: $(DEBUG_DIR)/uartdbg.elf
$(DEBUG_DIR)/uartdbg.elf: $(DEBUG_DIR)/uartdbg.o
	avr-gcc $(LDFLAGS) -o $@ $<
	avr-objcopy -O ihex -R .eeprom $@ $(DEBUG_DIR)/uartdbg.hex

# Upload the hex file to Arduino
upload_blink: $(DEBUG_DIR)/blink.hex
	@if [ -z "$(AVRDUDE_PORT)" ]; then \
	echo "Error: AVRDUDE_PORT is not set. Please set the AVRDUDE_PORT environment variable to the correct serial port."; \
	exit 1; \
	fi
	avrdude -c arduino -p m328p -P $(AVRDUDE_PORT) -b 115200 -U flash:w:$(DEBUG_DIR)/blink.hex

upload_uartdbg: $(DEBUG_DIR)/uartdbg.hex
	@if [ -z "$(AVRDUDE_PORT)" ]; then \
	echo "Error: AVRDUDE_PORT is not set. Please set the AVRDUDE_PORT environment variable to the correct serial port."; \
	exit 1; \
	fi
	avrdude -c arduino -p m328p -P $(AVRDUDE_PORT) -b 115200 -U flash:w:$(DEBUG_DIR)/uartdbg.hex

# Debug the uartdbg program using GDB
debug_uartdbg: $(UARTDBG_ELF)
	@echo "Starting remote GDB session for uartdbg program..."
	avr-gdb $< -ex "target remote :1234"

# Help target to list all available targets
help:
	@echo "Available targets:"
	@echo "  default        - Build all programs and display help"
	@echo "  all            - Build all programs"
	@echo "  blink          - Build the blink program"
	@echo "  uartdbg        - Build the uartdbg program"
	@echo "  upload_blink   - Upload the blink program to Arduino"
	@echo "  upload_uartdbg - Upload the uartdbg program to Arduino"
	@echo "  debug_uartdbg  - Debug the uartdbg program using GDB"
	@echo "  clean          - Clean build files"
	@echo "  objdump        - Disassemble object files to assembly language"

# Target to disassemble object files to assembly language
objdump: $(DEBUG_DIR)/blink.o $(DEBUG_DIR)/uartdbg.o
	avr-objdump -d $(DEBUG_DIR)/blink.o > $(DEBUG_DIR)/blink.asm
	avr-objdump -d $(DEBUG_DIR)/uartdbg.o > $(DEBUG_DIR)/uartdbg.asm

# Clean build files
clean:
	rm -rf $(DEBUG_DIR)

.PHONY: clean default all blink uartdbg upload_blink upload_uartdbg debug_uartdbg help objdump

