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
	mkdir -p $(BUILD_DIR)

# Default target
.PHONY: help all clean run upload debug

# Variable to enable or disable timing
TIMING ?= no

# Helper for timing command
ifneq ($(TIMING),no)
	TIME_CMD = time
else
	TIME_CMD =
endif

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
endif

all: $(HEX)

run: $(HEX)
	@echo "Add commands to run your program here"

upload: $(HEX)
	avrdude -c arduino -p m328p -P COM3 -b 115200 -U flash:w:$(HEX)

debug: $(ELF)
    avr-gdb $(ELF)

clean:
	rm -rf $(BUILD_DIR)

