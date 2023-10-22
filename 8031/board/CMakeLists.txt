cmake_minimum_required(VERSION 3.21)
set(CMAKE_SYSTEM_NAME Generic)


project(8031-board)
add_executable(${PROJECT_NAME} main.c)
ihx_to_hex(${PROJECT_NAME})