# Makefile for bare metal Arduino Uno project
# This Makefile uses GNU Make

# Print the make tool being used
MAKE_VERSION := $(shell $(MAKE) --version | head -n 1)
$(info Using $(MAKE) tool: $(MAKE_VERSION))

# Define the microcontroller and programmer options
MCU = atmega328p
F_CPU = 16000000UL
CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -O2 -Wall -Wextra
LDFLAGS = -mmcu=$(MCU)

# Define directories and files
BUILD_DIR = build
SRC = blink.c
OBJ = $(BUILD_DIR)/$(SRC:.c=.o)
ELF = $(BUILD_DIR)/blink.elf
HEX = $(BUILD_DIR)/blink.hex
MAP = $(BUILD_DIR)/blink.map

# Ensure build directory exists
$(BUILD_DIR):
	@echo "creating build directory if necessary"
	mkdir -p $(BUILD_DIR)

# Default target
.PHONY: default help all clean run upload debug

# Variable to enable or disable timing
TIMING ?= no

# Helper for timing command
ifneq ($(TIMING),no)
	TIME_CMD = time
else
	TIME_CMD =
endif

# Default behavior
default: all help

all: $(HEX)

# Ensure build directory is created before compiling and linking
$(ELF): $(BUILD_DIR) $(OBJ)
	$(TIME_CMD) avr-gcc $(LDFLAGS) -o $@ $(OBJ) -Wl,-Map,$(MAP)

$(HEX): $(BUILD_DIR) $(ELF)
	$(TIME_CMD) avr-objcopy -O ihex -R .eeprom $(ELF) $(HEX)

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	$(TIME_CMD) avr-gcc $(CFLAGS) -c $< -o $@


# Run the program (simulate if needed)
run: $(HEX)
	@echo "Running the program... (placeholder - upload runs on target)"
	# Add commands to run your program here, if needed

# Upload the hex file to Arduino
upload: $(HEX)
	@if [ -z "$(AVRDUDE_PORT)" ]; then \
		echo "Error: AVRDUDE_PORT is not set. Please set the AVRDUDE_PORT environment variable to the correct serial port."; \
		exit 1; \
	fi
	@echo "Uploading $(HEX) to Arduino on port $(AVRDUDE_PORT)..."
	avrdude -c arduino -p m328p -P $(AVRDUDE_PORT) -b 115200 -U flash:w:$(HEX)


# Debug the program using GDB
debug: $(ELF)
	@echo "Starting remote GDB session..."
	# Example command for remote debugging (customize as needed)
	avr-gdb $(ELF) -ex "target remote :1234"

# Clean up build files
clean:
	rm -rf $(BUILD_DIR)

# this help is dumb, thanks copilot :p
help:
ifeq ($(TIMING),yes)
	@echo "Usage: make [target] [TIMING=yes|no]"
	@echo "Targets:"
	@echo "  all      Build all targets"
	@echo "  clean    Clean build files"
	@echo "  help     Show this help message"
	@echo "  run      Run the compiled program"
	@echo "  upload   Upload the hex file to Arduino"
	@echo "  debug    Debug the program using GDB"
	@echo ""
	@echo "Options:"
	@echo "  TIMING=yes  Timing is currently enabled for commands (default is no)"
	@echo "  TIMING=no   Disable timing for commands"
	@echo ""
	@echo "Note:  export AVRDUDE_PORT=/dev/ttyUSB0"
else
	@echo "Usage: make [target] [TIMING=yes|no]"
	@echo "Targets:"
	@echo "  all      Build all targets"
	@echo "  clean    Clean build files"
	@echo "  help     Show this help message"
	@echo "  run      Run the compiled program"
	@echo "  upload   Upload the hex file to Arduino"
	@echo "  debug    Debug the program using GDB"
	@echo ""
	@echo "Options:"
	@echo "  TIMING=yes  Enable timing for commands"
	@echo "  TIMING=no"
	@echo ""
	@echo "Note:  export AVRDUDE_PORT=/dev/ttyUSB0"
endif

