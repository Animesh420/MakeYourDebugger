# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_SOURCE_DIR = /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build

# Include any dependencies generated for this target.
include tools/CMakeFiles/sdb.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tools/CMakeFiles/sdb.dir/compiler_depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/sdb.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/sdb.dir/flags.make

tools/CMakeFiles/sdb.dir/sdb.cpp.o: tools/CMakeFiles/sdb.dir/flags.make
tools/CMakeFiles/sdb.dir/sdb.cpp.o: /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/tools/sdb.cpp
tools/CMakeFiles/sdb.dir/sdb.cpp.o: tools/CMakeFiles/sdb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/sdb.dir/sdb.cpp.o"
	cd /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tools/CMakeFiles/sdb.dir/sdb.cpp.o -MF CMakeFiles/sdb.dir/sdb.cpp.o.d -o CMakeFiles/sdb.dir/sdb.cpp.o -c /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/tools/sdb.cpp

tools/CMakeFiles/sdb.dir/sdb.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/sdb.dir/sdb.cpp.i"
	cd /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/tools/sdb.cpp > CMakeFiles/sdb.dir/sdb.cpp.i

tools/CMakeFiles/sdb.dir/sdb.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/sdb.dir/sdb.cpp.s"
	cd /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/tools/sdb.cpp -o CMakeFiles/sdb.dir/sdb.cpp.s

# Object files for target sdb
sdb_OBJECTS = \
"CMakeFiles/sdb.dir/sdb.cpp.o"

# External object files for target sdb
sdb_EXTERNAL_OBJECTS =

tools/sdb: tools/CMakeFiles/sdb.dir/sdb.cpp.o
tools/sdb: tools/CMakeFiles/sdb.dir/build.make
tools/sdb: src/libsdb.a
tools/sdb: vcpkg_installed/x64-linux/debug/lib/libedit.a
tools/sdb: /usr/lib/x86_64-linux-gnu/libncurses.so
tools/sdb: tools/CMakeFiles/sdb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sdb"
	cd /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sdb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/sdb.dir/build: tools/sdb
.PHONY : tools/CMakeFiles/sdb.dir/build

tools/CMakeFiles/sdb.dir/clean:
	cd /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/tools && $(CMAKE_COMMAND) -P CMakeFiles/sdb.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/sdb.dir/clean

tools/CMakeFiles/sdb.dir/depend:
	cd /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/tools /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/tools /home/animesh-mukherjee/resume_work/MakeYourDebugger/sdb/build/tools/CMakeFiles/sdb.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tools/CMakeFiles/sdb.dir/depend

