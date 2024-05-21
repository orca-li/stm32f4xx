#!/bin/bash
source scripts/config.sh

# options
option=$1

# scripts
export shdir="scripts"
getobj="${shdir}/getobj.sh"
linker="${shdir}/linker.sh"
debug="${shdir}/debug.sh"
mkdir="${shdir}/mkdir.sh"
clean="${shdir}/clean.sh"

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

    "clean")
        bash $clean
        ;;

    "*")
        echo "${option}: unknown option"
        ;;

esac