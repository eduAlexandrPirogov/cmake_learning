# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build

# Include any dependencies generated for this target.
include CMakeFiles/math_log.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/math_log.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/math_log.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/math_log.dir/flags.make

CMakeFiles/math_log.dir/main.cpp.o: CMakeFiles/math_log.dir/flags.make
CMakeFiles/math_log.dir/main.cpp.o: ../../main.cpp
CMakeFiles/math_log.dir/main.cpp.o: CMakeFiles/math_log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/math_log.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/math_log.dir/main.cpp.o -MF CMakeFiles/math_log.dir/main.cpp.o.d -o CMakeFiles/math_log.dir/main.cpp.o -c /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/main.cpp

CMakeFiles/math_log.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/math_log.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/main.cpp > CMakeFiles/math_log.dir/main.cpp.i

CMakeFiles/math_log.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/math_log.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/main.cpp -o CMakeFiles/math_log.dir/main.cpp.s

# Object files for target math_log
math_log_OBJECTS = \
"CMakeFiles/math_log.dir/main.cpp.o"

# External object files for target math_log
math_log_EXTERNAL_OBJECTS =

math_log: CMakeFiles/math_log.dir/main.cpp.o
math_log: CMakeFiles/math_log.dir/build.make
math_log: math_lib/libmath_lib.a
math_log: log_lib/liblog_lib.a
math_log: CMakeFiles/math_log.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable math_log"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/math_log.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/math_log.dir/build: math_log
.PHONY : CMakeFiles/math_log.dir/build

CMakeFiles/math_log.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/math_log.dir/cmake_clean.cmake
.PHONY : CMakeFiles/math_log.dir/clean

CMakeFiles/math_log.dir/depend:
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/CMakeFiles/math_log.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/math_log.dir/depend
