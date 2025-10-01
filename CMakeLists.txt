# https://github.com/raysan5/raylib/wiki/Working-with-CMake
# place it above the src directory
# cmake -B build && cmake --build build && ./build/game

cmake_minimum_required(VERSION 3.15)
# the name of the executable will be game
project(game)
# Requires at least version 3.0
find_package(raylib 5.5 REQUIRED) 
# Requires C11 standard
set(CMAKE_C_STANDARD 11) 
# src/main.c is the source file
add_executable(${PROJECT_NAME} src/main.c)

target_link_libraries(${PROJECT_NAME} raylib)

# Checks if OSX and links appropriate frameworks (only required on MacOS)
if (APPLE)
    target_link_libraries(${PROJECT_NAME} "-framework IOKit")
    target_link_libraries(${PROJECT_NAME} "-framework Cocoa")
    target_link_libraries(${PROJECT_NAME} "-framework OpenGL")
endif()

