# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
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

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/arif/citysim_ws/src/citysim_tc/citysim

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arif/citysim_ws/src/citysim_tc/citysim/build

# Utility rule file for TrafficLightsGUIPlugin_automoc.

# Include the progress variables for this target.
include plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/progress.make

plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/arif/citysim_ws/src/citysim_tc/citysim/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic moc for target TrafficLightsGUIPlugin"
	cd /home/arif/citysim_ws/src/citysim_tc/citysim/build/plugins && /usr/bin/cmake -E cmake_autogen /home/arif/citysim_ws/src/citysim_tc/citysim/build/plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/ Release

TrafficLightsGUIPlugin_automoc: plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc
TrafficLightsGUIPlugin_automoc: plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/build.make

.PHONY : TrafficLightsGUIPlugin_automoc

# Rule to build all files generated by this target.
plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/build: TrafficLightsGUIPlugin_automoc

.PHONY : plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/build

plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/clean:
	cd /home/arif/citysim_ws/src/citysim_tc/citysim/build/plugins && $(CMAKE_COMMAND) -P CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/cmake_clean.cmake
.PHONY : plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/clean

plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/depend:
	cd /home/arif/citysim_ws/src/citysim_tc/citysim/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arif/citysim_ws/src/citysim_tc/citysim /home/arif/citysim_ws/src/citysim_tc/citysim/plugins /home/arif/citysim_ws/src/citysim_tc/citysim/build /home/arif/citysim_ws/src/citysim_tc/citysim/build/plugins /home/arif/citysim_ws/src/citysim_tc/citysim/build/plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : plugins/CMakeFiles/TrafficLightsGUIPlugin_automoc.dir/depend

