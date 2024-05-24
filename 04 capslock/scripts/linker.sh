#!/bin/bash
# include
source scripts/config.sh
set -e
echo objects: $(basename -a $objdir/*o)

# main
# gcc
action="$cc $cf $objdir/*.o $ldf $lnkscr -o $bindir/$pname.elf"
todo

# objcopy
path="$bindir/$pname.elf $bindir/$pname"

action="$ocopy -O binary $path.bin" # преобразование объектного файла в бинарный
todo

action="$ocopy -O ihex $path.hex" # преобразование объектного файла в Intel HEX формат
todo