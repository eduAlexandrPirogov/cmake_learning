#adding library
add_library(math_lib math.cpp)

#setting math_lib install target
install(TARGETS math_lib DESTINATION lib)

#setting include targets
install(FILES math.h DESTINATION include)
