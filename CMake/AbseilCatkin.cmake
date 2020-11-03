# Preset cmake variables to comply with ROS/catkin conventions and
# install package.xml

## Temporarily change the project name to 'abseil_cpp', the catkin package name
cmake_minimum_required(VERSION 3.5)
project(abseil_cpp)

find_package(catkin REQUIRED)

## Create positision-independent code and set default visibility to hidden.
# This is important to avoid ODR violations if static abseil libraries are
# linked into shared libraries or executables.
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)

## Do not install in lib/<arch>.
# TODO: not required? Libraries are not installed in lib/x86_64-linux-gnu although
# AbseilInstallDirs.cmake uses GNUInstallDirs.
#unset(CMAKE_LIBRARY_ARCHITECTURE)

## catkin package configuration
catkin_package(
  CFG_EXTRAS ${PROJECT_SOURCE_DIR}/CMake/abseil_cpp-catkin-extras.cmake
  INCLUDE_DIRS .
)

## Restore original project 'absl'
project(absl CXX)
