CC = arm-none-eabi-gcc
CFLAGS = -c -Wall -Werror -Wextra
LDFLAGS = -T
STMFLAGS = -mcpu=cortex-m4 -mthumb -nostdlib
SOURCES = main.c core/start.c source/blink.c source/morse.c source/time.c source/ctype.c
OBJECTS = $(SOURCES:.c=.o)
LINKER = core/script.ld
OUTNAME = morse
OUTELF = $(OUTNAME).elf

OC = arm-none-eabi-objcopy
OFLAGS = -O binary
OUTBIN = $(OUTNAME).bin

OUTDIR = .build

# компиляция
all: elf $(OUTBIN)

$(OUTBIN):
	$(OC) $(OFLAGS) $(OUTDIR)/$(OUTELF) $(OUTDIR)/$@

elf: $(SOURCE) $(OUTELF)

$(OUTELF): $(OBJECTS)
	mkdir $(OUTDIR) || true
	$(CC) $(OBJECTS) $(LDFLAGS) $(LINKER) -o $(OUTDIR)/$@ $(STMFLAGS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

# cчистка
RMOBJ = *.o core/*.o source/*.o
FULLCLEAN = $(RMOBJ) $(OUTDIR)/$(OUTELF) $(OUTDIR)

fullclean:
	rm -r $(FULLCLEAN)

clean:
	rm -r $(RMOBJ)

# прошивка
PORT =
STMF = stm32flash
PATHBIN = $(OUTDIR)/$(OUTBIN)
SFFLAGS = -w
PFFLAGS = -v -g 0x0

flash:
	$(STMF) $(PORT)
	$(STMF) $(SFFLAGS) $(OUTDIR)/$(OUTBIN) $(PFFLAGS) $(PORT)