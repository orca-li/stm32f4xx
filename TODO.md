### General
- [ ] рефакторинг каждого репозитория
- [ ] удалить bmsis
- [ ] сделать datasheet и tutorials
- [ ] сделать общую компиляцию для каждого репозитория:
    - вынести общие каталоги и файлы на верх, но при этом учесть второй пункт, чтобы возвращать эти файлы на свои места.
    - каждый каталог это отдельный репозиторий, который не должен взаимодействовать с другими, особенно с каталогами которые находятся по адресу ../\*: это создает проблему зависимости от репозитория "хранящего репозитории". Эта зависимость должна разрешаться при помощи скрипта сборщика
- [ ] прописать гайд как управлять микроконтроллером через утилиты ОС, чтобы не скачивать сторонние приложения

#### driver

- Добавить нормальные таймеры
- Сделать макросы для gpio alternate functions, чтобы можно было всё настраивать через битовое сложение |

### Projects
#### 02 morse
- Проверить все символы в алфавите `02 morse`
- Добавить кириллицу для `UTF-8` и `Windows Cyrillic 1251`
- Улучшить логику морзе преобразования символов `"**- **"` на протокол BMP(Binary Morse Protocol), где 
    - первый байт количество точек и тире `"0b00000101"`/`"5"`
    - второй байт точки и тире `"--**-"`/`0b~~~11001`
        
    - ~ - `не имеет значения`
    - 0 - `точка`
    - 1 - `тире`
<hr>