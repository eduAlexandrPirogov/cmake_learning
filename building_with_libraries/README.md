# CMake. Сборка проекта со статическими библиотеками

По мере роста проекта, мы разбиваем его на файлы, директории, отдельные кластеры (библиотеки), дабы структурировать наше приложение.

**CMake** прекрасно справляется с подобной задачей, и рассмотрим следующие примеры:

----
## Сборка проекта с  несколькими файлами .cpp

Создадим в директории without_dir файл `main.cpp` и `plus.cpp` соответсвенно:

```cpp
#include <iostream>

int plus(int a, int b);

int main()
{
   std::cout << "Hello, world!\n";
   std::cout << "plus result = " << plus(10,20) << '\n';
   return 0;
};
```

```cpp
int plus(int a, int b)
{
   return a + b;
};
```

Создадим **CMakeLists.txt**:

```
#set cmake version
cmake_minimum_required(VERSION 3.20)

#set project's name
project (no_dir)

#adding executable
add_executable(${PROJECT_NAME} main.cpp plus.cpp)
```

Опишем каждую из команд:
1. cmake_minimum_required (VERSION 3.20) -- устанавливает версию CMake (разработчики добавляет новое и удаляет ненужные вещи по мере разработки CMake)
2. project (no_dir) -- устанавливаем название проекта
3. add_executable(${PROJECT_NAME} main.cpp plus.cpp) -- указываем источники

Для лучшей структуризации проекта, создадим директории out/build/, где будет храниться **buildtree**. Зайдем в нее и запустим `cmake -S ../../ -B .`.

Далее, запустим команду `make` или `cmake --build .`. Получим бинарный файл no_dir :)

## Сборка проекта с библиотекой

Теперь, положим, что у нас имеются различные директории-библиотек, которые мы хотим использовать.

Например, имеем математическую библиотеку `math_lib` которая состоит из `math.h` и `math.cpp`:

`math.h`
```cpp
#pragma once

int plus(int a, int b);
int minus(int a, int b);
```

`math.cpp`
```cpp
#include "math.h"

int plus(int a, int b)
{
   return a + b;
};

int minus(int a, int b)
{
   return a - b;
};
```

Создадим отдельную директурию `with_dir`, в которой будет лежать `main.cpp` и наша математическая библиотека `math_lib`.

`main.cpp`
```cpp
#include <iostream>
#include "math_lib/math.h"

int main()
{
   std::cout << "Hello, world!\n";
   std::cout << "plus result = " << plus(10,20) << '\n';
   std::cout << "minus result = " << minus(20,10) << '\n';
   return 0;
};
```

Создадим `CMakeLists.txt` в директории `with_dir`:

```
#set cmake's polices version
cmake_minimum_required(VERSION 3.20)

#set project's name
project(math_log)

#set executable
add_executable(${PROJECT_NAME} main.cpp)

#adding math_lib's subdirectory
add_subdirectory(math_lib)

#linking math libraries
target_link_libraries(${PROJECT_NAME} math_lib) 
```

У нас появились новые команды:
1. add_subdirectory(math_lib) -- добавляет поддиректории для сборки. Почему пишем math_lib, описываю чуть ниже
2. target_link_libraries(${PROJECT_NAME} math_lib)  -- после сборки библиотеки, линкует с нашим приложением.

Но прежде, чем собирать проект, мы должны cоздать CMakeLists.txt в директории math_lib/:

`math_lib/CMakeLists.txt`
```
add_library(math_lib math_lib.cpp)
```

Вы даем называние библиотеке и указываем файлы с кодом. Поэтому в `add_subdirectory(math_lib)` мы указываем называние библиотеки, которую указали в `CMakeLists.txt` в директории библиотеки.

Также создадим out/build/ и запустим команду `cmake -S ../../ -B .`, а затем `make` (или `cmake --build .`). 

Стоит сказать, что если мы поправим что-либо в коде, то нам не нужно заново создавать **build tree**, нужно только собрать проект командой `make`.

------

Теперь, добавим еще одну директорию `log_lib` , которая будет хранить в себе классы для логгирования.

Код `log.h` и `log.cpp` соответственно:

```cpp
#pragma once
#include <iostream>

class Logger
{
  public:
	   Logger() = default;
	   void log_success(const char* message);
	   void log_error(const char* message);
};
```

```cpp
#include "log.h"

void Logger::log_success(const char* message)
{
   std::cout << "Log success message: " << message << '\n';
};

void Logger::log_error(const char* message)
{
   std::cout << "Log error message: " << message << '\n'; 
};
```

И сразу создадим в директории `log_lib/` `CMakeLists.txt`, как в нашей библиотеке с математическими функциями:

`log_lib/CMakeLists.txt`
```
#add library source code
add_library(log_lib log.cpp)
```

Добавим логгер в  `main.cpp`:

```cpp
#include <iostream>
#include "math_lib/math.h"
#include "log.h"


int main()
{
   std::cout << "Hello, world!\n";
   std::cout << "plus result = " << plus(10,20) << '\n';
   std::cout << "minus result = " << minus(20,10) << '\n';

   Logger logger{};
   logger.log_success("everything is fine!");
   logger.log_error("sometning wrong...");
   return 0;
};
```

Небольшое отступление. Наша with_dir должны выглядеть следующим образом:

```
with_dir-|----main.cpp
         |
         |----CMakeLists.txt   # <---top-level CMakeLists.txt
         |
         |----log_lib-----|----CMakeLists.txt
         |                |                          
         |                |----log.h
         |                |
         |                |----log.cpp
         |                 
         |----math_lib----|-----CMakeLists.txt                
                          |
                          |-----math.h
                          |
                          |-----math.cpp
``` 

Основной **CMakeLists.txt** называется **top-level**, посколкьу находится на "верхушке" директории проекта.

Теперь, добавим в **top-level CMakeLists.txt** команды, для добавления библиотеки с логгером:

CMakeLists.txt
```
#set cmake's polices version
cmake_minimum_required(VERSION 3.20)

#set project's name
project(math_log)

#set executable
add_executable(${PROJECT_NAME} main.cpp)

#adding math_lib's subdirectory
add_subdirectory(math_lib)

#linking math libraries
target_link_libraries(${PROJECT_NAME} math_lib) 


#adding logger's subdirectory
add_subdirectory(log_lib)

#including directories -- don't need to include in main.cpp relative path
target_include_directories(${PROJECT_NAME} PRIVATE log_lib)

#linking logger's libraries
target_link_libraries(${PROJECT_NAME} log_lib)
```

Тут есть некоторые особенность:
`target_include_directories(${PROJECT_NAME} PRIVATE log_lib)` -- команда, которая позволяет в `main.cpp` не указывает относительный путь к библиотеке, а просто писать #include "log.h"
 
