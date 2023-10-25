cmake_minimum_required(VERSION 3.21)
set(CMAKE_SYSTEM_NAME Generic)
project(8031-board)

# Used Library File List
file(GLOB LIB_FILES
    ../library/common.c
    ../library/LCD_1602.c
)

# Working with libraries linking
add_library(8031-libs  ${LIB_FILES})
add_executable(${PROJECT_NAME} main.c )
target_link_libraries(${PROJECT_NAME} 8031-libs)

# Instead using Libraries, we can just add directly to executable
# add_executable(${PROJECT_NAME} main.c ${LIB_FILES})

ihx_to_hex(${PROJECT_NAME})