# Define the project names and files
PROJECTS := main
SRCS := $(addsuffix .c, $(PROJECTS))
OBJS := $(addprefix build/, $(SRCS:.c=.o))
ASMS := $(addprefix build/, $(SRCS:.c=.s))
DISASMS := $(addprefix build-assembly/, $(SRCS:.s=.asm))
ASSEMBLED_OBJS := $(addprefix build-assembly/, $(SRCS:.s=.o))
TARGETS := $(addprefix build/, $(addsuffix .hex, $(PROJECTS)))

# Define the microcontroller and programmer settings
MCU := atmega328p
F_CPU := 16000000UL
PROGRAMMER := arduino
PORT := /dev/ttyUSB0
BAUD := 115200

# Compiler and flags
CC := avr-gcc
AS := avr-as
CFLAGS := -g -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU) -Wall -Wextra -Wpedantic -Werror -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Wunreachable-code -Wdouble-promotion -ffunction-sections -fdata-sections -fverbose-asm
ASFLAGS := -DF_CPU=$(F_CPU) -x assembler-with-cpp
ASMFLAGS := -g -mmcu=$(MCU)
LDFLAGS := -Wl,-Map,build/$(PROJECTS).map,--cref -Wl,--gc-sections
OBJCPY := avr-objcopy
AVRDUDE := avrdude
OBJDUMP := avr-objdump

# Create build directories if they don't exist
$(shell mkdir -p build)
$(shell mkdir -p build-assembly)

# Default target: build all projects
.PHONY: all
all: $(TARGETS) $(ASSEMBLED_OBJS) $(DISASMS)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo " make all           - Build all projects"
	@echo " make clean         - Remove all built files"
	@$(foreach proj, $(PROJECTS), echo " make $(proj)        - Build $(proj) project";)
	@$(foreach proj, $(PROJECTS), echo " make upload_$(proj) - Upload $(proj) project to the board";)
	@$(foreach proj, $(PROJECTS), echo " make debug_$(proj)  - Debug $(proj) project";)

# Build individual projects
build/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

build/%.s: %.c
	$(CC) $(ASFLAGS) -S $< -o $@

build-assembly/%.o: build/%.s
	$(AS) -mmcu=$(MCU) -o $@ $<

build-assembly/%.asm: build-assembly/%.o
	$(OBJDUMP) -d $< > $@

build/%.hex: build/%.o
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o build/$(*F)
	$(OBJCPY) -O ihex -R .eeprom build/$(*F) $@

# Specific build targets
.PHONY: main
main: build/main.hex

# Upload target
.PHONY: upload_main
upload_main: build/main.hex
	$(AVRDUDE) -F -V -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$<

# Debug targets
.PHONY: debug_main
debug_main: build/main.elf
	$(GDB) -ex "target remote $(PORT)" -ex "monitor reset" -ex "monitor halt" build/main.elf

# Create ELF files for GDB
build/main.elf: build/main.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@

# Clean target
.PHONY: clean
clean:
	rm -rf build build-assembly

# New target to capture build output and create a snippet
.PHONY: full_build
full_build:
	$(MAKE) all 2>&1 | tee build.log
	@if [ $$(wc -c <build.log) -gt 10240 ]; then head -c 10240 build.log > snip.txt; else cp build.log snip.txt; fi

