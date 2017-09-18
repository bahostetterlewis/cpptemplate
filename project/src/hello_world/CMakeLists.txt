cmake_minimum_required(VERSION 3.6)

SET(LIB_NAME hello_world)
set(SOURCES hello_world.h hello_world.cpp)
add_library(${LIB_NAME} ${SOURCES})
