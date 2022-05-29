# Установка приложения через CMake

Поговорим о возможности установить приложение. Это можно сделать через:
1. Стандартный make
2. CPack

## Установка через make

Оба способа тривиальны и требует минимума внесения изменений.

В директории `cmake_learning/installing/install_via_cpack/src/` имеется `main.cpp` файл и просто мат. библиотека.

Код `math.h`, `math.cpp`, `main.cpp` выглядит следующим образом:

`math.h`
```cpp
#pragma once

int plus(int a, int b);
```

`math.cpp`
```cpp
#include "math.h"

int plus(int a, int b)
{
   return a + b;
};
```

`main.cpp`
```cpp
#include <iostream>
#include "math.h"

int main()
{
   std::cout << plus(10,20) << '\n';
   return 0;
};
```

**CMakeLists.txt**, который лежим в директории math_lib должен выглядеть следующим образом:
```
#adding library
add_library(math_lib math.cpp)

#setting math_lib install target
install(TARGETS math_lib DESTINATION lib)

#setting include targets
install(FILES math.h DESTINATION include)
```

Рассмотрим каждую из команд:
1. install(TARGETS math_lib DESTINATION lib) -- указыванем название библиотеки и пункт назначение. В UNIX OS библиотека будет лежать в `/usr/local/lib/`.
2. install(FILES math.h DESTINATION include) -- указываем какие файлы включить в директорию ``/usr/local/include/`. Обычно включаем файлы-заголовки.

Теперь открыват **top-level CMakeLists.txt** и указываем одну строку `install(TARGETS ${PROJECT_NAME} DESTINATION bin)`:

```
#set cmake version
cmake_minimum_required(VERSION 3.20)

#setting project name
project(simple_math)

#adding executable
add_executable(${PROJECT_NAME} main.cpp)

#adding library
add_subdirectory(math_lib)

#adding lib's directory
target_include_directories(${PROJECT_NAME} PUBLIC math_lib)

#linkink math lib's directory
target_link_directories(${PROJECT_NAME} PRIVATE math_lib)

#linkink math lib
target_link_libraries(${PROJECT_NAME} math_lib)

#set targets bin destionation
install(TARGETS ${PROJECT_NAME} DESTINATION bin)
```

Данная команда добавляет в UNIX OS исполняемую команду, кои лежат в директории `/bin/` (поскольку все команды есть просто бинарные файлы в UNIX).

Теперь, настало время установить приложение! Заходим в `out/build` и прописываем `make install`:

```
```

Мы можем вызывать команду из терминала!

## Установка через CPack

Данный способ подразумевает создание юзер-френдли установщика, который нацелен на обычных смертных пользователей :)

В данном случае, изменяем **top-level CMakeLists.txt** (но с библиотеками делаем тоже самое, что и в первое случае).

```
#set cmake version
cmake_minimum_required(VERSION 3.20)

#setting project name
project(simple_math)

#adding executable
add_executable(${PROJECT_NAME} main.cpp)

#adding library
add_subdirectory(math_lib)

#adding lib's directory
target_include_directories(${PROJECT_NAME} PUBLIC math_lib)

#linkink math lib's directory
target_link_directories(${PROJECT_NAME} PRIVATE math_lib)

#linkink math lib
target_link_libraries(${PROJECT_NAME} math_lib)

#set targets bin destionation
install(TARGETS ${PROJECT_NAME} DESTINATION bin)

include(InstallRequiredSystemLibraries)
include(CPack)
```

Теперь, заходим в `/out/build`, собираем проект командой ` cmake -S ../../ -B .` и начинаем создание установщиков с помощь **CPack**, командой `cpack`.

В итоге у нам в директории появятся тарники, которые можно установить :)
