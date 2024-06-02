### 01.06.24 | retarget printf, heap, systicks
- Сделан вывод printf на USART1
- Изменены флаги для компиляции(если их убрать, то происходит hardfault)
- Исправлен баг с инициализацией кучи из-за которой не работал printf
- Добавлен таймер

### 24.05.24 | linker and syscalls
- Изменен linker script
- Добавлен syscalls