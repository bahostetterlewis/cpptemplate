cmake_minimum_required(VERSION 3.6)
project(project_name)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}, "${CMAKE_CURRENT_SOURCE_DIR}/cmake-scripts")

OPTION(USE_CCACHE "Use ccache" ON)

find_program(CCACHE_FOUND ccache)
IF(CCACHE_FOUND)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
  message(STATUS "Found ccache so using it")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -Wextra")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -flto -fno-omit-frame-pointer")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO -flto -fno-omit-frame-pointer")

if (CMAKE_COMPILER_IS_GNUCC)
  set(CMAKE_AR "gcc-ar")
  set(CMAKE_CXX_ARCHIVE_CREATE "<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>")
  set(CMAKE_CXX_ARCHIVE_FINISH true)
endif()
