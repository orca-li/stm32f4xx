# Toolchain

Мой набор инструментов для разработки на windows. На linux действия аналогичны.
<hr>

<details>
    <summary>1. <b>MSYS64</b> - легковесная Unix-подобная среда внутри ОС Windows</summary>

- https://www.msys2.org/
</details>

<details>
    <summary>2. Переменные и среды</summary>


1. Запускаем консоль и вводим команду
```bash
pacman -v
```
если команда неизвестно, то делаем слудющие шаги:
2. Запускаем консоль от имини администратора

3. Пишем команду
```bash
echo %Path% # результат сохраняем в блокнот для того, чтобы потом можно было восстановить в случае краха
setx /M Path "[то что в блокноте]; C:\msys64\usr\bin" # нас интересует путь к бинарным файлам в msys64, поэтому нужно прописать абсолютный путь.
```

4. Перезапускаем консоль

5. Проверяем команду
```bash
pacman -v
```
Теперь должно вывести сообщение, если команда не найдена, то рекомендую поизучать переменные и среды windows.
</details>

<details>
    <summary>3. Утилиты</summary>
В msys64 устанавливаем пакеты:

```bash
pacman -S git
pacman -S make
pacman -S gcc
cd C:\msys64\home ; mkdir utils; cd utils
git clone https://sourceforge.net/p/stm32flash/code/ci/master/tree/
cd stm32flash-code
make
cp stm32flash.exe C:\msys64\usr\bin
```
Для того, чтобы удалить stm32flash-code нужно будет просто удалить папку и бинарник из `C:\msys64\usr\bin`s
</details>

<details>
    <summary>4. <b>Visual Studio Code</b> - бесплатный и очень популярный редактор кода от Microsoft</summary>

- https://code.visualstudio.com/
</details>

<details>
    <summary>5. Компилятор ARM</summary>

- https://developer.arm.com/downloads/-/gnu-rm

    1. Нужно включить <b>VPN</b>
    2. Скачать архив
    3. Создать папку `path-arm-gcc`
    4. Перенести все папки из архива в эту папку: `bin`, `arm-none-eabi`, `lib`, `share`
```bash
mkdir C:\msys64\usr\bin\path-arm-gcc
echo %Path% # результат сохраняем в блокнот для того, чтобы потом можно было восстановить в случае краха
setx /M Path "[то что в блокноте]; C:\msys64\usr\bin\path-arm-gcc\bin"
```
Для того чтобы избавиться от этой утилиты, достаточно будет удалить папку
</details>

<details>
    <summary>6. Проверяем установленный софт</summary>

```bash
pacman --version
git --version
make --version
gcc --version
arm-none-eabi-gcc --version
arm-none-eabi-objcopy --version
stm32flash --versiob
code --version # необязательно, но если ставили vs code, то там могла стоять галочка создать переменную path. Если вы ее оставили, то утилита сработает
```
Если всё установлено правильно, каждая команда покажет свою версию
</details>