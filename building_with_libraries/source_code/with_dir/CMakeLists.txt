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
