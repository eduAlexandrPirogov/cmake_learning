# Find library


Некоторые библиотеки, зависимости и т.д. через `sudo apt-get install <your_lib>`. Если в проекте потребуется подключить такую либу, то прописывать весь путь будет странно :)

`find_library` -- команда, которая ищет указанную библиотеку. 

Рассмотрим на примере.

Допустим, мы пишем программу, которая будет обращаться к СУБД **PostgreSQL**. Используемая библиотека -- **libpqxx**.

Для начала, не будем устанавливать никакую либу, и попробуем собрать и запустить следующий пример.

Создадим `app.cpp`:

```cpp
#include <iostream>
#include <string>
#include <pqxx/pqxx>

int main()
{
   try {

      pqxx::connection C("dbname = postgres user = postgres password=postgres \ 
		      hostaddr = 127.0.0.1  port = 5432");
      if(C.is_open())
      {
         std::cout<< "Opened db successfully: " << C.dbname() << std::endl;
	 std::string query = std::string{"insert into test values(default);"};

	 pqxx::work W(C);
	 
	 W.exec(query);
	 W.commit();
      } else {
	 std::cout<< "Can't open db" << std::endl;
         return 1;
      };
   } catch (const std::exception &e) {
      std::cerr << e.what() << std::endl;
   };
   return 0;
};
```

И теперь, создаем **CMakeLists.txt** :

```
#set cmake version
cmake_minimum_required(VERSION 3.20)

#set project title
project(fndpckg)

#add executable
add_executable(${PROJECT_NAME} app.cpp)

#searching for wxWidgets
find_library(PQXX_LIB libpqxx-dev NAMES pqxx pq)
find_library(PQ_LIB pq)

message(STATUS "pqxx found status: ${PQXX_LIB}")
message(STATUS "pq found status: ${PQ_LIB}")

target_link_libraries(fndpckg ${PQXX_LIB} ${PQ_LIB})
```

Попробуем собрать данное приложение в директории `out/build`: `cmake -S ../../ -B .` и получим следующий вывод:

```
— The C compiler identification is GNU 11.2.0
— The CXX compiler identification is GNU 11.2.0
— Detecting C compiler ABI info
— Detecting C compiler ABI info - done
— Check for working C compiler: /usr/bin/cc - skipped
— Detecting C compile features
— Detecting C compile features - done
— Detecting CXX compiler ABI info
— Detecting CXX compiler ABI info - done
— Check for working CXX compiler: /usr/bin/c++ - skipped
— Detecting CXX compile features
— Detecting CXX compile features - done
— pqxx found status: PQXX_LIB-NOTFOUND   <----------------------------
— pq found status: PQ_LIB-NOTFOUND       <----------------------------
— Configuring done
```

Как видно, библиотеку cmake не находит.

Установим библиотеку: `sudo apt-get install libpqxx`.

И теперь попробуем ещё раз...:

```
— The C compiler identification is GNU 11.2.0
— The CXX compiler identification is GNU 11.2.0
— Detecting C compiler ABI info
— Detecting C compiler ABI info - done
— Check for working C compiler: /usr/bin/cc - skipped
— Detecting C compile features
— Detecting C compile features - done
— Detecting CXX compiler ABI info
— Detecting CXX compiler ABI info - done
— Check for working CXX compiler: /usr/bin/c++ - skipped
— Detecting CXX compile features
— Detecting CXX compile features - done
— pqxx found status: /usr/lib/x86_64-linux-gnu/libpqxx.so  <---------------------------
— pq found status: /usr/lib/x86_64-linux-gnu/libpq.so      <---------------------------
— Configuring done
— Generating done
```
Теперь cmake находим указанную либу, без каких либо путей.

Иммем новые команды:
1. find_library(PQXX_LIB libpqxx-dev NAMES pqxx pq)
2. message(STATUS "pqxx found status: ${PQXX_LIB}")

Как уже было сказано, find_library ищет указанную вами библиотеку. Опция **NAMES** указывает, какое имя может быть у библиотеки.

Также команда `message(STATUS "pqxx found status: ${PQXX_LIB}")` выводит сообщение о том, была ли указана данная библиотека.

## P.S.

Откуда взялись переменные `${PQXX_LIB}` и `${PQ_LIB}`? Об этом не тут :)
Многие решения уже были придуманы за нас. Для того, чтобы узнать, правильно ли настроен **CMakeLists.txt**, обычно гуглится "cmake find_library <your_lib>".

