cmake_minimum_required(VERSION 3.21)
set(CMAKE_SYSTEM_NAME Generic)
project(8031-board)

file(GLOB LIB_FILES
    ../library/common.c
    ../library/LCD_1602.c
)

add_executable(${PROJECT_NAME} main.c ${LIB_FILES})

ihx_to_hex(${PROJECT_NAME})