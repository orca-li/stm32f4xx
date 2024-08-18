# --- PROJECT CONFIGURATION CODE BEGIN ----------------------
PROJECTNAME := refactoring

BUILD_DIR := .build
OBJDIR := ${BUILD_DIR}/objects
DBGDIR := ${BUILD_DIR}/debug
BINDIR := ${BUILD_DIR}/binary
# --- PROJECT CONFIGURATION CODE END ------------------------

# --- TOOLCHAIN VARIABLES CODE BEGIN ------------------------
## compiler tools
PREFIXCC := arm-none-eabi-
CC := $(PREFIXCC)gcc
OCOPY := $(PREFIXCC)objcopy
ODUMP := $(PREFIXCC)objdump
CSIZE := $(PREFIXCC)size

## flags
### flags for CC
# CFLAGS = -O0
# CFLAGS = -ggdb
CFLAGS += -Wall
CFLAGS += -Werror
CFLAGS += -Wextra
CFLAGS += -mcpu=cortex-m4
# CFLAGS += -std=gnu11 			# C11
# CFLAGS += -mfpu=fpv4-sp-d16 	# support fpu

### linker flags
LDFLAGS += --specs=nano.specs
LDFLAGS += --specs=nosys.specs
LDFLAGS += -Wl,--gc-sections

## flash tools
FLASH := stm32flash
port :=
# --- TOOLCHAIN VARIABLES CODE END --------------------------

# --- PATHS AND SYMBOLS CODE BEGIN --------------------------

include driver/liteMCU/liteMCU.mk

LDSCRIPT := core/stm32f401ccu6.ld

INCLUDES += -I"driver/liteMCU"
INCLUDES += -I"driver/CMSIS/Device/ST/STM32F4/include"
INCLUDES += -I"driver/CMSIS/CMSIS/Core/include"

SOURCES += ${wildcard core/startup/*.c}
SOURCES += ${wildcard core/*.c}
SOURCES += ${wildcard CMSIS/Device/ST/STM32F4/Source/Templates/system_stm32f4xx.c}

# MACROS += -D"STM32F401xC"

# --- PATHS AND SYMBOLS CODE END ----------------------------

BIN_PATH := $(BINDIR)/$(PROJECTNAME).elf
SHORTBIN_PATH := $(BIN_PATH) $(basename $(BIN_PATH))
SHORTDBG_PATH := $(DBGDIR)/$(notdir $(basename $(BIN_PATH)))

all: mkdir getobj getbin getsymb
	$(CSIZE) $(BIN_PATH)

getobj:
	$(foreach source, $(SOURCES), \
		$(CC) $(MACROS) $(INCLUDES) $(CFLAGS) -c -MD $(source) -o $(OBJDIR)/$(subst .c,.o,$(notdir $(source))); \
	)

getbin:
	$(CC) $(CFLAGS) $(MACROS) $(OBJDIR)/*.o $(LDFLAGS) -T $(LDSCRIPT) -o $(BIN_PATH); 
	$(OCOPY) -O binary $(SHORTBIN_PATH).bin
	$(OCOPY) -O ihex $(SHORTBIN_PATH).hex

getsymb:
	$(ODUMP) -h -S $(BIN_PATH) > $(SHORTDBG_PATH).list

mkdir:
	@mkdir -p ${OBJDIR}
	@mkdir -p ${BINDIR}
	@mkdir -p ${DBGDIR}

flash:
	$(FLASH) -w $(basename $(BIN_PATH)).bin -v -g 0x0 $(port)

clean:
	@rm -rf ${BUILD_DIR}