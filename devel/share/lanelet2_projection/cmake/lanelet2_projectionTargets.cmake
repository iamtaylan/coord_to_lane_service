# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6...3.19)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

if(CMAKE_VERSION VERSION_LESS 3.0.0)
  message(FATAL_ERROR "This file relies on consumers using CMake 3.0.0 or greater.")
endif()

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget lanelet2_projection::lanelet2_projection lanelet2_projection::lanelet2_projection_compiler_flags)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Create imported target lanelet2_projection::lanelet2_projection
add_library(lanelet2_projection::lanelet2_projection SHARED IMPORTED)

set_target_properties(lanelet2_projection::lanelet2_projection PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "/home/taylan/coord_to_lane_ws/src/lanelet2/lanelet2_projection/include;/home/taylan/coord_to_lane_ws/devel/include"
  INTERFACE_LINK_LIBRARIES "lanelet2_projection::auto_deps_export;lanelet2_projection::lanelet2_projection_compiler_flags"
)

# Create imported target lanelet2_projection::lanelet2_projection_compiler_flags
add_library(lanelet2_projection::lanelet2_projection_compiler_flags INTERFACE IMPORTED)

set_target_properties(lanelet2_projection::lanelet2_projection_compiler_flags PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_std_14"
  INTERFACE_LINK_LIBRARIES "\$<\$<AND:\$<CXX_COMPILER_ID:GNU>,\$<VERSION_LESS:\$<CXX_COMPILER_VERSION>,9.0>>:stdc++fs>;OpenMP::OpenMP_CXX"
)

# Import target "lanelet2_projection::lanelet2_projection" for configuration ""
set_property(TARGET lanelet2_projection::lanelet2_projection APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(lanelet2_projection::lanelet2_projection PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "/home/taylan/coord_to_lane_ws/devel/lib/liblanelet2_projection.so.1.2.2"
  IMPORTED_SONAME_NOCONFIG "liblanelet2_projection.so.1"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
