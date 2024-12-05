# Define the project names and files
PROJECTS := blink uartdbg blinkanduart
SRCS := $(addsuffix .cpp, $(PROJECTS))
OBJS := $(addprefix build/, $(SRCS:.cpp=.o))
TARGETS := $(addprefix build/, $(addsuffix .hex, $(PROJECTS)))
ASMS := $(addprefix build/, $(SRCS:.cpp=.asm))

# Define the microcontroller and programmer settings
MCU := atmega328p
F_CPU := 16000000UL
PROGRAMMER := arduino
PORT := /dev/ttyUSB0
BAUD := 115200

# Compiler and flags
CC := avr-gcc
CFLAGS := -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCPY := avr-objcopy
AVRDUDE := avrdude
OBJDUMP := avr-objdump

# Create build directory if it doesn't exist
$(shell mkdir -p build)

# Default target: build all projects
.PHONY: all
all: $(TARGETS) $(ASMS)

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
$(OBJS): build/%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGETS): build/%.hex : build/%.o
	$(CC) $(CFLAGS) $< -o build/$(*F)
	$(OBJCPY) -O ihex -R .eeprom build/$(*F) $@

$(ASMS): build/%.asm : build/%.o
	$(OBJDUMP) -d $< > $@

# Specific build targets
.PHONY: blink uartdbg blinkanduart
blink: build/blink.hex
uartdbg: build/uartdbg.hex
blinkanduart: build/blinkanduart.hex

# Upload targets
.PHONY: upload_blink upload_uartdbg upload_blinkanduart
upload_blink: build/blink.hex
	$(AVRDUDE) -F -V -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$<

upload_uartdbg: build/uartdbg.hex
	$(AVRDUDE) -F -V -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$<

upload_blinkanduart: build/blinkanduart.hex
	$(AVRDUDE) -F -V -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$<

# Debug targets (modify as per your debugger settings)
.PHONY: debug_blink debug_uartdbg debug_blinkanduart
debug_blink:
	@echo "Debugging blink project..."

debug_uartdbg:
	@echo "Debugging uartdbg project..."

debug_blinkanduart:
	@echo "Debugging blinkanduart project..."

# Clean target
.PHONY: clean
clean:
	rm -rf build

