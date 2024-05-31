#!/bin/bash
# project name
repository=$(basename "$PWD")
pname=nvic

# linker
lnkscr="core/*.ld"

# utils
typecc="arm-none-eabi-"
cc="${typecc}gcc"
ocopy="${typecc}objcopy"
odump="${typecc}objdump"
ccmap="${typecc}nm"
ar="${typecc}ar"
ccstr="${typecc}strings"
relf="${typecc}readelf"

# compilation flags
cf=()
cf+=("-mcpu=cortex-m4")             # целевой процессор
cf+=("-std=gnu11")                  # добавляем C11
# cf+=("-O0")                       # отключение оптимизации
# cf+=("-v")                        # отладка путей компилятора
# cf+=("-mfpu=fpv4-sp-d16")         # поддержка fpu
# cf+=("-mfloat-abi=hard")          # abi для работы с плавающей точкой

# warnings flags
erf="-Wall -Werror -Wextra"

# linker flags
ldf=()
ldf+=("--specs=nano.specs")                         # спецификация nano.specs
ldf+=("-T")                                         # файл линкера
# ldf+=("-Wl,--gc-sections")                        # удаление не используемых секций
# cf+=("--specs=nosys.specs")                       # спецификация nosys.specs
# ldf+=("-Wl,--start-group -lc -lm -Wl,--end-group")# линковка с libc и libm

# dirs
outdir=.build
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
source+=(*/*.c)
source+=(*/*/*.c)
source=(${source[@]%.*}) # % - оператор удаления суффикса

# include
include=()
include+=("-I\"../$repository\"")

# functions
todo() {
    echo $action
    eval $action
}