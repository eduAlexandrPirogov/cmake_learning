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
#adding executble
#add_executable(${PROJECT_NAME} app.cpp)
