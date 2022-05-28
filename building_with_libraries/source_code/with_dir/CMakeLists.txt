#set cmake's polices version
cmake_minimum_required(VERSION 3.20)

#set project's name
project(project_with_libs)

#set executable
add_executable(${PROJECT_NAME} main.cpp)

#adding math_lib and log_lib subdirectories
add_subdirectory(math_lib)
add_subdirectory(log_lib)

#including libraries
target_include_directories(${PROJECT_NAME} PUBLIC math_lib log_lib)

#linking libraries
target_link_libraries(${PROJECT_NAME} math_lib log_lib) 
