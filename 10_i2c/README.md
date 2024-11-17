## 1. Repository init
Перед первой компиляцией запустите скрипт
```bash
bash Submod.sh
```

## 2. Build
а после можно компилировать сколько раз угодно
```bash
make
```

## 3. Flash
```bash
# На stm32 удерживать кнопку Boot
# Нажать NRST
make flash port=/dev/ttyUSB0 # Linux
make flash port=COMx # на Windows, где x - номер порта
```
На линуксе процесс прошивки может быть более зловредным, поэтому убедитесь что внутри Makefile написано `sudo` перед исполнением команды flash или предоставьте права к файлу `/dev/ttyUSB0` обычным пользователям

## 4. Test
```bash
sudo screen /dev/ttyUSB0 9600
```
Вы можете посмотреть логи uart через утилиту screen(на линукс) или приложение tera term(на windows)

## 5. Edit
Для того, чтобы visual studio code делал подсказки нужно установить C/C++ Extension Pack. Также нужно создать файл
```bash
mkdir .vscode
touch .vscode/c_cpp_properties.json
```
и внутрь того файла поместить следующий скрипт
```json
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [
                "${workspaceFolder}/**"
            ],
            "defines": [
                "STM32F401xC"
            ],
            "compilerPath": "/usr/bin/arm-none-eabi-gcc",
            "intelliSenseMode": "linux-gcc-x64",
            "cStandard": "c17",
            "cppStandard": "gnu++17"
        }
    ],
    "version": 4
}
```