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
include log_lib/CMakeFiles/log_lib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include log_lib/CMakeFiles/log_lib.dir/compiler_depend.make

# Include the progress variables for this target.
include log_lib/CMakeFiles/log_lib.dir/progress.make

# Include the compile flags for this target's objects.
include log_lib/CMakeFiles/log_lib.dir/flags.make

log_lib/CMakeFiles/log_lib.dir/log.cpp.o: log_lib/CMakeFiles/log_lib.dir/flags.make
log_lib/CMakeFiles/log_lib.dir/log.cpp.o: ../../log_lib/log.cpp
log_lib/CMakeFiles/log_lib.dir/log.cpp.o: log_lib/CMakeFiles/log_lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object log_lib/CMakeFiles/log_lib.dir/log.cpp.o"
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT log_lib/CMakeFiles/log_lib.dir/log.cpp.o -MF CMakeFiles/log_lib.dir/log.cpp.o.d -o CMakeFiles/log_lib.dir/log.cpp.o -c /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/log_lib/log.cpp

log_lib/CMakeFiles/log_lib.dir/log.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log_lib.dir/log.cpp.i"
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/log_lib/log.cpp > CMakeFiles/log_lib.dir/log.cpp.i

log_lib/CMakeFiles/log_lib.dir/log.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log_lib.dir/log.cpp.s"
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/log_lib/log.cpp -o CMakeFiles/log_lib.dir/log.cpp.s

# Object files for target log_lib
log_lib_OBJECTS = \
"CMakeFiles/log_lib.dir/log.cpp.o"

# External object files for target log_lib
log_lib_EXTERNAL_OBJECTS =

log_lib/liblog_lib.a: log_lib/CMakeFiles/log_lib.dir/log.cpp.o
log_lib/liblog_lib.a: log_lib/CMakeFiles/log_lib.dir/build.make
log_lib/liblog_lib.a: log_lib/CMakeFiles/log_lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library liblog_lib.a"
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib && $(CMAKE_COMMAND) -P CMakeFiles/log_lib.dir/cmake_clean_target.cmake
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/log_lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
log_lib/CMakeFiles/log_lib.dir/build: log_lib/liblog_lib.a
.PHONY : log_lib/CMakeFiles/log_lib.dir/build

log_lib/CMakeFiles/log_lib.dir/clean:
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib && $(CMAKE_COMMAND) -P CMakeFiles/log_lib.dir/cmake_clean.cmake
.PHONY : log_lib/CMakeFiles/log_lib.dir/clean

log_lib/CMakeFiles/log_lib.dir/depend:
	cd /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/log_lib /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib /home/edual/Desktop/cmake_learning/building_with_libraries/source_code/with_dir/out/build/log_lib/CMakeFiles/log_lib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : log_lib/CMakeFiles/log_lib.dir/depend
