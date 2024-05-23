#!/bin/bash
# project name
pname=usart

# linker
lnkscr="core/linker_script.ld"

# utils
typecc="arm-none-eabi-"
cc="${typecc}gcc"
ocopy="${typecc}objcopy"
odump="${typecc}objdump"
ccmap="${typecc}nm"
ar="${typecc}ar"
ccstr="${typecc}strings"
relf="${typecc}readelf"

# flags
cf="-mcpu=cortex-m4 -mthumb -nostdlib"
erf="-Wall -Werror -Wextra"
ldf="-T"

# dirs
outdir=build
bindir="${outdir}/binary"
objdir="${outdir}/objects"
dbgdir="${outdir}/debug"
dirs=("$outdir" "$bindir" "$objdir" "$dbgdir")

# source
source=()
source+=(core/*.c)
source=(${source[@]%.*}) # % - оператор удаления суффикса

# include
include=()
include+=(-Istm32f4xx)

# functions
todo() {
    echo $action
    eval $action
}