#!/bin/bash
# project name
repository="04 capslock"
pname=capslock

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
# cf="-mcpu=cortex-m4 -mthumb -nostdlib"
# cf="-mcpu=cortex-m4 -mthumb --specs=nosys.specs"
cf="-mcpu=cortex-m4 -std=gnu11 -g3"
erf="-Wall -Werror -Wextra"
ldf="-T"

# dirs
outdir=build
bindir="${outdir}/binary"
objdir="${outdir}/objects"
dbgdir="${outdir}/debug"

dirs=()
dirs+=("$outdir")
dirs+=("$bindir")
dirs+=("$objdir")
dirs+=("$dbgdir")

# source
source=()
source+=(core/*.c)
source+=(driver/*.c)
source+=(fusecore/*.c)
source+=(software/*.c)
source=(${source[@]%.*}) # % - оператор удаления суффикса

# include
include=()
include+=("-I\"../$repository\"")

# functions
todo() {
    echo $action
    eval $action
}