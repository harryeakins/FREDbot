# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kipman725/ros_workspace/speech_synth

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kipman725/ros_workspace/speech_synth/build

# Include any dependencies generated for this target.
include CMakeFiles/speech_synth.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/speech_synth.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/speech_synth.dir/flags.make

CMakeFiles/speech_synth.dir/src/speech_synth.o: CMakeFiles/speech_synth.dir/flags.make
CMakeFiles/speech_synth.dir/src/speech_synth.o: ../src/speech_synth.cpp
CMakeFiles/speech_synth.dir/src/speech_synth.o: ../manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/ros/tools/rospack/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/ros/core/roslib/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/ros/core/rosbuild/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/ros/core/roslang/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/utilities/cpp_common/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/clients/cpp/roscpp_traits/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/utilities/rostime/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/clients/cpp/roscpp_serialization/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/utilities/xmlrpcpp/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/tools/rosconsole/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/clients/cpp/roscpp/manifest.xml
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/msg_gen/generated
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/msg_gen/generated
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/clients/cpp/roscpp/msg_gen/generated
CMakeFiles/speech_synth.dir/src/speech_synth.o: /opt/ros/electric/stacks/ros_comm/clients/cpp/roscpp/srv_gen/generated
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kipman725/ros_workspace/speech_synth/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/speech_synth.dir/src/speech_synth.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -o CMakeFiles/speech_synth.dir/src/speech_synth.o -c /home/kipman725/ros_workspace/speech_synth/src/speech_synth.cpp

CMakeFiles/speech_synth.dir/src/speech_synth.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/speech_synth.dir/src/speech_synth.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -E /home/kipman725/ros_workspace/speech_synth/src/speech_synth.cpp > CMakeFiles/speech_synth.dir/src/speech_synth.i

CMakeFiles/speech_synth.dir/src/speech_synth.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/speech_synth.dir/src/speech_synth.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -S /home/kipman725/ros_workspace/speech_synth/src/speech_synth.cpp -o CMakeFiles/speech_synth.dir/src/speech_synth.s

CMakeFiles/speech_synth.dir/src/speech_synth.o.requires:
.PHONY : CMakeFiles/speech_synth.dir/src/speech_synth.o.requires

CMakeFiles/speech_synth.dir/src/speech_synth.o.provides: CMakeFiles/speech_synth.dir/src/speech_synth.o.requires
	$(MAKE) -f CMakeFiles/speech_synth.dir/build.make CMakeFiles/speech_synth.dir/src/speech_synth.o.provides.build
.PHONY : CMakeFiles/speech_synth.dir/src/speech_synth.o.provides

CMakeFiles/speech_synth.dir/src/speech_synth.o.provides.build: CMakeFiles/speech_synth.dir/src/speech_synth.o

# Object files for target speech_synth
speech_synth_OBJECTS = \
"CMakeFiles/speech_synth.dir/src/speech_synth.o"

# External object files for target speech_synth
speech_synth_EXTERNAL_OBJECTS =

../bin/speech_synth: CMakeFiles/speech_synth.dir/src/speech_synth.o
../bin/speech_synth: CMakeFiles/speech_synth.dir/build.make
../bin/speech_synth: CMakeFiles/speech_synth.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/speech_synth"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/speech_synth.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/speech_synth.dir/build: ../bin/speech_synth
.PHONY : CMakeFiles/speech_synth.dir/build

CMakeFiles/speech_synth.dir/requires: CMakeFiles/speech_synth.dir/src/speech_synth.o.requires
.PHONY : CMakeFiles/speech_synth.dir/requires

CMakeFiles/speech_synth.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/speech_synth.dir/cmake_clean.cmake
.PHONY : CMakeFiles/speech_synth.dir/clean

CMakeFiles/speech_synth.dir/depend:
	cd /home/kipman725/ros_workspace/speech_synth/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kipman725/ros_workspace/speech_synth /home/kipman725/ros_workspace/speech_synth /home/kipman725/ros_workspace/speech_synth/build /home/kipman725/ros_workspace/speech_synth/build /home/kipman725/ros_workspace/speech_synth/build/CMakeFiles/speech_synth.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/speech_synth.dir/depend

