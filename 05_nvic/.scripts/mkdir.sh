#!/bin/bash
source $shdir/config.sh

# Функция для создания директорий с эхо сообщениями
newdir() {
    dir=$1
    mkdir -p "$dir"
    if test -d dir; then
        echo "Creating directory: $dir"
    fi
}

# Создаем директории с эхо сообщениями
for dir in "${dirs[@]}"; do
    newdir "$dir"
done