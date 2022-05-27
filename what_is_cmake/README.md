# Что есть Cmake

CMake — это кроссплатформенная система автоматизации сборки программного обеспечения из исходного кода.

Основные особенности CMake: 

1. Кроссплатформенность
2. Работает с современными комплияторами и тулчейнами
3. Много проектов собраны с CMake, которые можно легко добавить в ваш проект

На первый вгзляд, CMake собирает проект и выдает бинарный исполняемый файл. Но на деле, CMake просто полагается на другие инструменты -- сам он исполняет определенные
шаги.

Основные стадии процесса сборки проекта:
1. Конфигурация (Configuration)
2. Генерация (Generation)
3. Сборка (Building)

## Стадии

### Конфигурация

На данной стадии, CMake считывает детали в директории называемое **source tree**, готовит новую директорию **build tree**.

CMake, создав **build tree** собирает информацию о ОС, архитектуры, компиляторе, линкере. Далее, считывает **CMakeLists.txt** файл, который является обязательным
минимум для CMake. Данный файл говорит о структуре проекта, его зависимостях, целях  (прим. пер. **targets**) и т.д.
Вся считанная информация отправляется в **build tree**, которая потребуется для следующей стадии. Также это сохраняет время при следующей сборке.

### Генерация

В данной стадии, CMake генерирует **buildsystem** для определенного среды, в которой работает.

### Сборка

Для создания финального бинарника (артефакта), запускаем соответсвующий **buildtool**. **Buildtools** исполнят
шаги, чтобы создать цели (**targets**) с помощью компилятора, линкера, статических и динамических библиотек и т.д









