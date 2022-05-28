cmake_minimum_required(VERSION 3.20)

project(submodules_wx)

add_executable(${PROJECT_NAME} App.cpp)

add_subdirectory(external/wxwidgets)

target_include_directories(${PROJECT_NAME} 
	PUBLIC external/wxwidgets/include/)

target_link_directories(${PROJECT_NAME} PUBLIC external/wxwidgets/src)

target_link_libraries(${PROJECT_NAME} wx::net wx::core wx::base)
