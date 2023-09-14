cmake_minimum_required(VERSION 3.21)
set(CMAKE_SYSTEM_NAME Generic)
set(LOCAL_SDCC "C:/Program Files/SDCC/bin")

#Find the compiler
find_program(SDCC_COMPILER sdcc)
if (${CMAKE_HOST_WIN32})
    if (NOT EXISTS "${SDCC_COMPILER}")
        list(APPEND CMAKE_PROGRAM_PATH "${LOCAL_SDCC}")
        find_program(SDCC_COMPILER sdcc)
    endif ()
    if (NOT EXISTS "${SDCC_COMPILER}")
        list(APPEND CMAKE_PROGRAM_PATH "${LOCAL_SDCC}")
        find_program(SDCC_COMPILER sdcc)
    endif ()
endif ()
if (EXISTS "${SDCC_COMPILER}")
    set(CMAKE_C_COMPILER "${SDCC_COMPILER}")
else ()
    message(FATAL_ERROR "SDCC compiler is not found at your computer.")
endif ()

project(ETEP-sdcc C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_STANDARD 99)

#add_compile_options(--std-c99)
add_compile_options(-mmcs51)
add_link_options(-mmcs51)
#add_compile_options(-mstm8)
#add_link_options(-mstm8)
#3.3.6 MCS51 Options
#[—model-small] Generate code for Small model programs, see section Memory Models for more details. This is the default model.
#[—model-medium] Generate code for Medium model programs, see section Memory Models for more details. If this option is used all source files in the project have to be compiled with this option. It must also be used when invoking the linker.
#[—model-large] Generate code for Large model programs, see section Memory Models for more details. If this option is used all source files in the project have to be compiled with this option. It must also be used when invoking the linker.
#[—model-huge] Generate code for Huge model programs, see section Memory Models for more details. If this option is used all source files in the project have to be compiled with this option. It must also be used when invoking the linker.
#[—xstack] Uses a pseudo stack in the __pdata area (usually the first 256 bytes in the external ram) for allocating variables and passing parameters. See section 3.15.1.2  External Stack for more details.
#[—iram-size <Value>] Causes the linker to check if the internal ram usage is within limits of the given value.
#[—xram-size <Value>] Causes the linker to check if the external ram usage is within limits of the given value.
#[—code-size <Value>] Causes the linker to check if the code memory usage is within limits of the given value.
#[—stack-size <Value>] Causes the linker to check if there is at minimum <Value> bytes for stack.
#[—acall-ajmp ] Replaces the three byte instructions lcall/ljmp with the two byte instructions acall/ajmp. Only use this option if your code is in the same 2k block of memory. You may need to use this option for some 8051 derivatives which lack the lcall/ljmp instructions.
#[—no-ret-without-call ] Causes the code generator to insert an extra lcall or acall instruction whenever it needs to use a ret instruction in a context other than a function returning. This option is needed when using the Infineon XC800 series microcontrollers to keep its Memory Extension Stack balanced.

#add_executable(custom-compiler-test cmain.c)
set(OUTPUT_BUILD "etep-8031-sdcc")
add_executable(${OUTPUT_BUILD} main.c)

add_custom_command(
        TARGET ${OUTPUT_BUILD} POST_BUILD
        COMMAND packihx "$<TARGET_FILE:${OUTPUT_BUILD}>" > "${OUTPUT_BUILD}.hex"
        VERBATIM)
#add_custom_command(
#    OUTPUT ${OUTPUT_BUILD}.hex
#    COMMAND packihx -i ${CMAKE_CURRENT_SOURCE_DIR}/${OUTPUT_BUILD}.ihx > ${OUTPUT_BUILD}.hex
#    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${OUTPUT_BUILD}.ihx
#    VERBATIM)
