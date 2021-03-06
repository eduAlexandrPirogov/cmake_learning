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

В данной стадии, CMake генерирует **buildsystem** для определенной среды (**environment**), в которой работает.

### Сборка

Для создания финального бинарника (артефакта), запускаем соответсвующий **buildtool**. **Buildtools** исполнят
шаги, чтобы создать цели (**targets**) с помощью компилятора, линкера, статических и динамических библиотек и т.д

----

## За дело!

Создадим простую программку:

`source_coude/first_building/hello.cpp`

```cpp
#include <iostream>

int main()
{
   std::cout << "Hello, world!\n";
   return 0;
};
```

Как было сказано, главное для CMake -- создать файл **CMakeLists.txt**. Создадим простой файл (в директории, где лежим исходный код), который будет выглядеть следующим образом. Все команды будут описаны подробнее в следующих README:

```
# Устанавливаем версию Cmake
cmake_minimum_required(VERSION 3.20)

#Даем имя проекту
project(hello)

#Добавляем исполняемую цель (executable target)
add_executable(hello hello.cpp)
```
Наша директория (**source tree**) выглядит следующим образом:

`hello.cpp`   `CMakeLists.txt`

Для создания **build tree** запустим в терминале следующую команду (учитывая, что cmake уже установлен у вас :):

`cmake -S . -B buildtree`

Terminal:
```
-- The C compiler identification is GNU 11.2.0
-- The CXX compiler identification is GNU 11.2.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: //first_building/buildtree
```

CMake создаст директорию **buildtree/**, т.е. пройдет стадию конфигурации и генерации. В директории **buildtree/** будут лежать данные о проекте, нашей среде и т.д.

Для сборки проекта, запустим следующую команду:

`cmake --build buildtree/`


Terminal:
```
[ 50%] Building CXX object CMakeFiles/hello.dir/hello.cpp.o
[100%] Linking CXX executable hello
[100%] Built target hello
```

В директории **buildtree** (если процесс сборки успешно завершен) появится бинарный файл **hello**, который мы можем запустить.

По итогу мы создали **buildsystem** которая лежит в **buildtree/** директории, а далее запустили стадию сборки и получили итоговый бинарный файл.

## Немного о buildtree

Создавать **buildtree** можно через команду `cmake .`, но лучше явно указать **source tree** через флаг **-S <dir\>** и **build tree** через флаг **-B <dir\>** . 
   
Также лучше разделять **source tree** и **buildtree**.

**buildtree** стоит добавить в .gitignore

Бинарный файл создается в **buildtree**




