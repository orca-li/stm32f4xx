#!/bin/bash
# project name
repository=$(basename "$PWD")
pname=nvic

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

# compilation flags
cf=()
cf+=("-mcpu=cortex-m4")             # целевой процессор
cf+=("-std=gnu11")                  # добавляем C11
# cf+=("-O0")                       # отключение оптимизации
# cf+=("-v")                        # отладка путей компилятора
# cf+=("--specs=nosys.specs")       # спецификация nosys.specs
# cf+=("--specs=nano.specs")        # спецификация nano.specs
# cf+=("-mfpu=fpv4-sp-d16")         # поддержка fpu
# cf+=("-mfloat-abi=hard")          # abi для работы с плавающей точкой

# warnings flags
erf="-Wall -Werror -Wextra"

# linker flags
ldf=()
ldf+=("-Wl,--gc-sections")      # удаление не используемых секций
ldf+=("-Wl,--start-group -lc -lm -Wl,--end-group") # линковка с libc и libm
ldf+=("-T")

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