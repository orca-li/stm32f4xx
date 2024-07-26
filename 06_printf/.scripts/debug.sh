#!/bin/bash
source $shdir/config.sh
set -e

path="$bindir/$pname.elf > $dbgdir/$pname"

#objdump
action="$odump -d $path.text" # ассемблерный код для всех секций
todo
# action="$odump -h $path.ods" # вывод информации о всех секциях
# todo
# action="$odump -t $path.odc" # вывод таблицы символов
# todo

#nm
action="$ccmap $path.list" # вывод всех символов из файла объекта
todo


#ar
# статические библиотеки

#strings
action="$ccstr $path.str" # извлечение всех ASCII-строк из исполняемого файла
todo

#readelf
# action="$relf -h $path.hd" # вывод заголовка ELF файла
# todo
# action="$relf -S $path.rfs" # вывод информации о всех секциях
# todo
action="$relf -s $path.symtab" # вывод информации о символах
todo