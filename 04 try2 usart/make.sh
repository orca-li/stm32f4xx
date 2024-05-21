#!/bin/bash
source scripts/config.sh

# options
option=$1
comport=$2

# scripts
export shdir="scripts"
# all
mkdir="${shdir}/mkdir.sh"   # создание каталогов
getobj="${shdir}/getobj.sh" # создание объектов
linker="${shdir}/linker.sh" # линковка объектов
debug="${shdir}/debug.sh"   # снятие дампов
# other
clean="${shdir}/clean.sh"   # удаление каталога сборки
flash="${shdir}/flash.sh"   # прошивка через usart

case $option in
    "") # all
        bash $0 dirs
        bash $0 getobj
        bash $0 linker
        bash $0 debug
        ;;

    "getobj")
        bash $getobj
        ;;   

    "linker")
        bash $linker
        ;;

    "debug")
        bash $debug
        ;;

    "dirs")
        bash $mkdir
        ;;

    "flash")
        bash $flash $comport
        ;;

    "clean")
        bash $clean
        ;;

    "*")
        echo "${option}: unknown option"
        ;;

esac