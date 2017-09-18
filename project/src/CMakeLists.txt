cmake_minimum_required(VERSION 3.6)

set(CMAKE_CXX_STANDARD 14)

if (CMAKE_COMPILER_IS_GNUCC)
    if (CMAKE_CXX_COMPILER_VERSION VERION_GREATER 6.0)
    	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsuggest-override")
    else()
    	MESSAGE(FATAL_ERROR "Must have a gcc compiler version 6 or greater, found: \"${CMAKE_CXX_COMPILER_VERSION\"")
    endif()
endif()

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Woverloaded-virtual")
endif()

include_directories(.)
include_directories("${CMAKE_BINARY_DIR}/src")
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# add subdirectories here
add_subdirectory(hello_world)

set(EXECUTABLE project_name)
set(SOURCE_FILES main.cpp)
add_executable(${EXECUTABLE} ${SOURCE_FILES})
target_link_libraries(${EXECUTABLE} hello_world)