#set cmake version
cmake_minimum_required(VERSION 3.20)

#set project title
project(fndpckg)

#add executable
add_executable(${PROJECT_NAME} app.cpp)

set(wxWidgets_LIBRARIES "/home/edualvm1/Desktop/wxWidgets/lib/")
set(wxWidgets_INCLUDE_DIRS "/home/edualvm1/Desktop/wxWidgets/include/")

#searching for wxWidgets
find_package(wxWidgets REQUIRED gl base core)
message(STATUS "wxWidgets status: ${wxWidgets_FOUND}")

include(${wxWidgets_USE_FILE})

target_include_directories(${PROJECT_NAME} PUBLIC ${wxWidgets_INCLUDE_DIRS})

target_linK_libraries(${PROJECT_NAME} PUBLIC ${wxWidgets_LIBRARIES})

#adding executble
#add_executable(${PROJECT_NAME} app.cpp)
