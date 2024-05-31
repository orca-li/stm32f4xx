#!/bin/bash
source $shdir/config.sh
set -e
echo source: $(basename -a ${source[@]})

new_object() {
    local i=$1
    action="$cc ${cf[@]} $erf $include -c ${source[i]}.c -o $objdir/$(basename -a ${source[i]}).o"
    todo
}

for ((i = 0; i < ${#source[@]}; i++)); do # конструкция ${#...} - получение длины строки или массива
    new_object "$i"
done