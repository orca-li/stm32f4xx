# Идея
Наверно лучше было бы, если я прописал идею каждого файла по отдельности. Так у нас три основных файла. `start.c` и `script.c` активно обмениваются переменными и массивами, после чего запускается функция `main.c`. В принципе это всё можно сделать одним объектом, но это максимально долго и сложно.
1. Создать `.isr_vector`
2. Перенести `.data` из FLASH в SRAM. 
3. Обнулить `.bss`
4. Запустить `main`
5. Установить нужные флаги регистров
6. Менять флаг регистра отвечающий за пин 13 в цикле с задержкой 1 секунда

# Шаги
1. Определить область памяти
2. Объединяем секции объектов, и кладем в соответствующие области
3. Берем адреса секций из `script.ld` в `start.c`
4. Копируем `.data` из FLASH в SRAM
5. Добавляем адреса из `script.ld` для `.bss`
6. Обнуляем секцию `.bss`
7. Вызываем фунцию `main()`
8. Инициализирует начало стэка в SRAM
9. Создаем массив `.isr_vector` и кладем в него прерывания и начало стэка
10. Добавляем `.isr_vector` в раздел секций
11. Ставим точку входа программы в `reset_handler`
12. Прописываем адреса периферии
13. Инициализируем регистры как указатели на регистры
14. Устанавливаем нужные биты состояния регистров
15. Делаем blink светодиодом
16. Компиляция и прошивка

# Разбор шагов
> Нюансы второго пункта не смог разобрать
1. `script.ld`:Определяем области памяти, согласно документации
```c
MEMORY
{
	FLASH (rx): ORIGIN = 0x08000000, LENGTH = 256K
	SRAM (rwx): ORIGIN = 0x20000000, LENGTH = 64K
}
```

2. Объединяем секции будущих объектов, и кладем в соответствующие области
```c
SECTION
{
  .text :
  {
    . = ALIGN(4);
		
    *(.text)
    *(.text.*)
    *(.rodata)
    *(.rodata.*)
    KEEP(*(.init))
    KEEP(*(.fini))
    *(.eh_frame)
    *(.ARM.exidx)
		
    . = ALIGN(4);
    _etext = .;
  } >FLASH

  _sidata = LOADADDR(.data);

  .data :
  {
    . = ALIGN(4);
    _sdata = .;
		
    *(.data)
    *(.data.*)
    KEEP(*(.init_array))
    KEEP(*(.fini_array))

    . = ALIGN(4);
    _edata = .;
  } >SRAM AT> FLASH

  .bss :
  {
    . = ALIGN(4);
    _sbss = .;
    __bss_start__ = _sbss;
		
    *(.bss)
    *(.bss.*)
		
    . = ALIGN(4);
    _ebss = .;
    __bss_end__ = _ebss;
  } >SRAM
}
```
В кратце прокомментирую некоторые директивы линкера. `ALIGN()` - выравнивает секции по 4 байта в данном скрипте. `KEEP` - это говорим компоновщику не удалять секции, если они не нужны или даже если он их не нашел. `>SRAM AT >FLASH` - кладем секцию в область памяти. `.` - специальный символ доступный только в `SECTION`, текущий счетчик команд или текущий адрес. `*(.section.*)` - вместо первой снежинки идут объектные файлы, а вместо второй снежинки все подсекции. Вместо снежинок можно написать `main.o(.section)`. 

3. `start.c`: Создаем функцию `reset_handler()` и в ней делаем следующие действия. Переносим переменные хранящие адреса секций `.data` для FLASH и SRAM из `script.ld`
```c
#include <stdio.h>
#include <stdint.h>

extern uint32_t _etext, _edata, _sdata;
```

4. Копируем `.data` из FLASH в SRAM
```c
uint32_t size_data = (uint32_t)&_edata - (uint32_t)&_sdata;
uint8_t *flash_data = (uint8_t*)&_etext;
uint8_t *sram_data = (uint8_t*)&_sdata;

for(uint32_t i = 0; i < size_data; i++)
        sram_data[i] = flash_data[i];
```

5. Добавляем адреса из `script.ld` для `.bss`
```c
extern uint32_t _ebss, _sbss;
```

6. Обнуляем секцию `.bss`, если я правильно понимаю, этот пункт необязателен. Он нужен для того, чтобы в дебаге мы смогли отличить неадекватные значения переменных от инициализированных и неинициализированных.
```c
uint32_t size_bss = (uint32_t)&_ebss - (uint32_t)&_sbss;
uint8_t *bss = (uint8_t*)&_sbss;

for(uint32_t i = 0; i < size_bss; i++)
    bss[i] = 0;
```

7. Вызываем нашу функцию `main()`
```
main();
```

8. В принципе с функцией `reset_handler` покончено. Теперь надо ее вызвать. Для этого нам надо создать область векторов прерываний `.isr_vector`. Первый байт это начало стека, остальные байты это адреса других функций. Чтобы посчитать где находится начало стека(а он растет сверху вниз), нужно открыть документацию st.com и посмотреть где заканчивается SRAM. И нужно добавить прототипы наших функций.
```c
#define SRAM_START                      (0x20000000U)
#define SRAM_SIZE_KB                    (64U)
#define SRAM_SIZE_BYTE                  (SRAM_SIZE_KB * 1024U)
#define SRAM_END                        (SRAM_START + SRAM_SIZE_BYTE)
#define STACK_POINTER_INIT_ADDRESS      (SRAM_END)

#define ISR_VECTOR_SIZE                 (2)

void main(void);
void reset_handler(void);
```

9. Теперь создадим наш массив `.isr_vector`, который передадим компоновщику и добавим его в скрипт. В массиве у нас пока что одно прерывание, который вызывает `reset_handler`.
```c
uint32_t isr_vector[ISR_VECTOR_SIZE] __attribute__((section(".isr_vector"))) = {
    STACK_POINTER_INIT_ADDRESS,
    (uint32_t)&reset_handler,
};
```
Компилятор или VS Code могут начать ругаться, и требовать от вас, чтобы там стоял тип `uint64_t`, но в stm32f4 выравнивание по 4 байта, поэтому мы должны оставить красную подсветку. Не трудно догадаться, что делает `__attribute__((section(".isr_vector")))`. 

10. Добавляем `.isr_vector` в раздел секций
```c
.isr_vector :
  {
    KEEP(*(.isr_vector))
  } >FLASH
```

11. Осталось сделать так, чтобы процессор смог запустить нашу подпрограмму reset_handler.
```c
ENTRY(reset_handler)
```
Теперь наш микроконтроллер делает следующие вещи:
1. Копируем данные из FLASH в SRAM
2. Обнуляем секцию неинициализированных данных
3. Запускаем функцию main

12. `main.c`: Теперь нужно установить правильные биты регистрам: `RCC_AHB1ENR`, `GPIOC_MODER`, чтобы нам стало можно переключать регистр, который будет отвечать за состояние пина LED13 `GPIOC_ODR`. В Memory mapping бы должны посмотреть базы периферии:
```c
#include <stdint.h>

#define BASE_PERIPHERAL         (0x40000000U)
#define BASE_AHB1               (BASE_PERIPHERAL + 0x20000U)
#define BASE_RCC                (BASE_PERIPHERAL + 0x23800U)
#define BASE_GPIOC              (BASE_PERIPHERAL + 0x20800U)
```

13. Далее проинициализировать регистры, и записать значения нужных нам битов этих регистров
```c
#define RCC_AHB1ENR_OFFSET      (0x30U)
#define RCC_AHB1ENR_GPIOC       (0x02U)
#define RCC_AHB1ENR             ((volatile uint32_t*) (BASE_RCC + RCC_AHB1ENR_OFFSET))

#define GPIOx_MODER_OFFSET      (0x00U)
#define GPIOC_GPOM_13           (26U)
#define GPIOC_MODER             ((volatile uint32_t*) (BASE_GPIOC + GPIOx_MODER_OFFSET))

#define GPIOx_ODR_OFFSET        (0x14U)
#define GPIOC_ODR               ((volatile uint32_t*) (BASE_GPIOC + GPIOx_ODR_OFFSET))

#define GPIOC_PIN13             (13)
```
всё это делается в Memory mapping. Хочу оставить комментарий для начинающих барметальщиков о конструкции
```c
#define NAME ((volatile typedef*) (ADDRESS))
```
Это конструкция в данном контексте почти аналогична простой записи:
```c
typedef *name = &other;
```
Грубо говоря, мы создали переменную. И еще важный момент это ключевое слово `volatile` для компилятора. Оно означает для компилятора, чтобы тот его не трогал, т.к. переменная может изменяться извне. Т.е. если компилятор решит, что она не нужна, то чтобы всё равно ее оставил и не трогал.

14. Теперь осталось самое простое. Нам нужно установить соответствующие флаги в регистры и поморгать светодиодом. Создадим функцию main в нашем файле main.c
```
*RCC_AHB1ENR |= (1 << RCC_AHB1ENR_GPIOC);
*GPIOC_MODER |= (1 << GPIOC_GPOM_13);
```
Хочу сделать акцент на названии `GPIOC_GPOM_13` и что здесь вообще происходит для неподготовленного глаза. GPOM означает `General purpose output mode` для 13-го пина. 
```
#define GPIOC_GPOM_13           (26U)
(1 << GPIOC_GPOM_13)
```
Мы делаем битовый сдвиг единички на 26 бит, т.е.
```
00000000 00000000 00000000 00000001
00000100 00000000 00000000 00000000
```
и делаем битовое сложение с регистром GPIOC_MODER.

15. Теперь мы можем моргать светодиодом.
```c
while(1){
    *GPIOC_ODR ^= (1 << GPIOC_PIN13);
    for (uint32_t i = 0; i < 1000000; i++);
}
```
Здесь происходит всё тоже самое как и в предыдущем примере, но теперь идет битовое отрицание. И задержка на 1 секунду, т.к. за одну секунду микроконтроллер исполняет примерно один миллион команд. 

16. Осталсь скомпилировать и прошить.
```bash
 arm-none-eabi-gcc main.c start.c -T script.ld -o blink.elf -mcpu=cortex-m4 -mthumb -nostdlib
 arm-none-eabi-objcopy -O binary blink.elf blink.bin
 stm32flash [PORT]
 stm32flash -w blink.bin -v -g 0x0 [PORT]
```