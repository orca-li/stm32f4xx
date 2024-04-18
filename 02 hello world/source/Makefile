CC = arm-none-eabi-gcc
CFLAGS = -c -Wall -Werror -Wextra
LDFLAGS = -T
STMFLAGS = -mcpu=cortex-m4 -mthumb -nostdlib
SOURCES = main.c core/start.c
OBJECTS = $(SOURCES:.c=.o)
LINKER = core/script.ld
OUTNAME = morse
OUTELF = $(OUTNAME).elf

OC = arm-none-eabi-objcopy
OFLAGS = -O binary
OUTBIN = $(OUTNAME).bin

OUTDIR = .build

all: elf $(OUTBIN)

$(OUTBIN):
	$(OC) $(OFLAGS) $(OUTDIR)/$(OUTELF) $(OUTDIR)/$@

elf: $(SOURCE) $(OUTELF)

$(OUTELF): $(OBJECTS)
	mkdir $(OUTDIR) || true
	$(CC) $(OBJECTS) $(LDFLAGS) $(LINKER) -o $(OUTDIR)/$@ $(STMFLAGS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

# опции
RMOBJ = *.o core/*.o
FULLCLEAN = $(RMOBJ) $(OUTDIR)/$(OUTELF) $(OUTDIR)

fullclean:
	rm -r $(FULLCLEAN)

clean:
	rm -r $(RMOBJ)

os:
	echo $(OSGET)