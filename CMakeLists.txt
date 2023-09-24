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

add_compile_options(-V)                 # Verbose
add_compile_options(--std c99)          # Standard C99
add_compile_options(--fverbose-asm)     # Include code generator comments in the asm output

add_compile_options(-mmcs51)            # Generate code for the Intel MCS51 family of processors. This is the default processor target.
add_compile_options(-p8031)             # Select port specific processor e.g. -mpic14 -p16f84
add_compile_options(--model-small)      # internal data space is used (default)
add_compile_options(--out-fmt-ihx)      # Output in Intel hex format

add_compile_options(--xram-size 0x2000) # External Ram size: 8Kb
add_compile_options(--code-loc 0x0000)  # Code Segment Location
add_compile_options(--code-size 8192)   # Code Segment Location: EEPROM: 8K

add_compile_options(--stack-auto)       # Stack automatic variables

#add_compile_options(--int-long-reent)   # Use reentrant calls on the int and long support functions
#add_compile_options(--float-reent)      # Use reentrant calls on the float support functions

#Special options for the mcs51 port:
#--model-small         internal data space is used (default)
#--model-medium        external paged data space is used
#--model-large         external data space is used
#--model-huge          functions are banked, data in external space
#--stack-size          Tells the linker to allocate this space for stack
#--parms-in-bank1      use Bank1 for parameter passing
#--acall-ajmp          Use acall/ajmp instead of lcall/ljmp
#--no-ret-without-call  Do not use ret independent of acall/lcall

#Linker options:
#  -l                        Include the given library in the link
#  -L                        Add the next field to the library search path
#      --lib-path            <path> use this path to search for libraries
#      --out-fmt-ihx         Output in Intel hex format
#      --out-fmt-s19         Output in S19 hex format
#      --xram-loc            <nnnn> External Ram start location
#      --xram-size           <nnnn> External Ram size
#      --iram-size           <nnnn> Internal Ram size
#      --xstack-loc          <nnnn> External Stack start location
#      --code-loc            <nnnn> Code Segment Location
#      --code-size           <nnnn> Code Segment size
#      --stack-loc           <nnnn> Stack pointer initial value
#      --data-loc            <nnnn> Direct data start location
#      --idata-loc
#      --no-optsdcc-in-asm   Do not emit .optsdcc in asm

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
