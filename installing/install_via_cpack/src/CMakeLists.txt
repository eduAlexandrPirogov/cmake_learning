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
