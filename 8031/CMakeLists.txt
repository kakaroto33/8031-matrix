# CMake script based on:
# - https://github.com/JetBrains/clion-custom-defined-compiler-examples/blob/master/CMake-SDCC/CMakeLists.txt
# - https://github.com/eduardoaugustojulio/8051/blob/master/CMakeLists.txt
# - https://github.com/Kitware/CMake/blob/master/Modules/Platform/Generic-SDCC-C.cmake
cmake_minimum_required(VERSION 3.21)
# SDCC : 4.3.0 #14184 (MINGW64)

## Setup SDCC ##################################################################
set(CMAKE_SYSTEM_NAME Generic)
set(LOCAL_SDCC "C:/Program Files/SDCC/bin")

# Find SDCC compiler in global path
find_program(SDCC_COMPILER sdcc)
find_program(SDAR_COMPILER sdar)
# In Windows use LOCAL_SDCC to help locate SDCC bin dir
if (${CMAKE_HOST_WIN32})
    if (NOT EXISTS "${SDCC_COMPILER}")
        list(APPEND CMAKE_PROGRAM_PATH "${LOCAL_SDCC}")
        find_program(SDCC_COMPILER sdcc)
        find_program(SDAR_COMPILER sdar)
    endif ()
endif ()
if (EXISTS "${SDCC_COMPILER}")
    set(CMAKE_C_COMPILER "${SDCC_COMPILER}")
else ()
    message(FATAL_ERROR "SDCC compiler is not found at your computer.")
endif ()

if (EXISTS "${SDAR_COMPILER}")
    set(CMAKE_AR "${SDAR_COMPILER}")
else ()
    message(FATAL_ERROR "SDAR linker is not found at your computer.")
endif ()

# SDAR Linker
set(CMAKE_AR "${SDAR_COMPILER}" CACHE FILEPATH "The sdcc librarian" FORCE)
# sdar -rc <library name>.lib <list of .rel files>
set(CMAKE_AR_OPTIONS "-rc")

## compile a C file into an object file
#set(CMAKE_C_COMPILE_OBJECT  "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -o <OBJECT> -c <SOURCE>")
#
## link object files to an executable
#set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <FLAGS> <OBJECTS> -o <TARGET> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <LINK_LIBRARIES>")
#
## needs sdcc + sdar/sdcclib
#set(CMAKE_C_CREATE_STATIC_LIBRARY
#        "\"${CMAKE_COMMAND}\" -E remove <TARGET>"
#        "<CMAKE_AR> ${CMAKE_AR_OPTIONS} <TARGET> <LINK_FLAGS> <OBJECTS> ")

# Convert ihx to Intel Hex
function(ihx_to_hex bin)
    add_custom_command(TARGET ${bin} POST_BUILD COMMAND  packihx ${bin}.ihx > ${bin}.hex)
endfunction(ihx_to_hex)

set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_STANDARD 99)
set(CMAKE_VERBOSE_MAKEFILE on )

set(CMAKE_STATIC_LIBRARY_PREFIX "")
set(CMAKE_STATIC_LIBRARY_SUFFIX ".lib")
set(CMAKE_SHARED_LIBRARY_PREFIX "")          # lib
set(CMAKE_SHARED_LIBRARY_SUFFIX ".lib")          # .so
set(CMAKE_IMPORT_LIBRARY_PREFIX )
set(CMAKE_IMPORT_LIBRARY_SUFFIX )
set(CMAKE_EXECUTABLE_SUFFIX ".ihx")          # intel hex file
set(CMAKE_LINK_LIBRARY_SUFFIX ".lib")
set(CMAKE_DL_LIBS "")

set(CMAKE_C_OUTPUT_EXTENSION ".rel")
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# not supported by sdcc
set(CMAKE_C_CREATE_SHARED_LIBRARY "")
set(CMAKE_C_CREATE_MODULE_LIBRARY "")

# SDCC Compile Options
#include_directories("${LOCAL_SDCC}/../include")

## Setup Microcontroller Processor #############################################


#set(CMAKE_C_FLAGS " -mmcs51 --model-medium -DSDCC_CYGNAL --less-pedantic  --stack-auto --no-peep --int-long-reent --float-reent")
set(CMAKE_SYSTEM_PROCESSOR 8051)
# Use CMAKE_C_FLAGS, instead option function, because need repeat args on linker too.
set(CMAKE_C_FLAGS "-V --std c99 -mmcs51 -p8031 --model-medium --fverbose-asm --int-long-reent --float-reent --no-peep")
#add_compile_options(-V)                 # Verbose
#add_compile_options(--std c99)          # Standard C99
#add_compile_options(--fverbose-asm)     # Include code generator comments in the asm output
#add_compile_options(-mmcs51)            # Generate code for the Intel MCS51 family of processors. This is the default processor target.
#add_compile_options(-p8031)             # Select model of 8051 family
#add_compile_options(--model-medium)     # Generate code for Medium model programs, see section Memory Models.

## Repeat on linker
#add_link_options(-V)
#add_link_options(--std c99)
#add_link_options(--fverbose-asm)
#add_link_options(-mmcs51)
#add_link_options(-p8031)
#add_link_options(--model-medium)
#add_link_options(-Wl-bCSEG=0x100)

## Project Selection ###########################################################
project(8031-matrix)
include_directories("library")

# Define witch project compile
add_subdirectory("board")



####################################################################################################
# SDCC 4.3 Documentation to help select compiler oprtions
# https://sdcc.sourceforge.net/snap.php#Docs
####################################################################################################

# 3.3.3 Optimization Options
#    [—nogcse] Will not do global common subexpression elimination, this option may be used
#        when the compiler creates undesirably large stack/data spaces to store compiler
#        temporaries (spill locations, sloc). A warning message will be generated when this
#        happens and the compiler will indicate the number of extra bytes it allocated. It is
#        recommended that this option NOT be used, #pragma nogcse can be used to turn off global
#        subexpression elimination for a given function only.
#    [—noinvariant] Will not do loop invariant optimizations, this may be turned off for reasons
#        explained for the previous option. For more details of loop optimizations performed see
#        Loop Invariants in section 8.1.4. It is recommended that this option NOT be used,
#        #pragma noinvariant can be used to turn off invariant optimizations for a given function only.
#    [—noinduction] Will not do loop induction optimizations, see section strength reduction
#        for more details. It is recommended that this option is NOT used, #pragma noinduction
#        can be used to turn off induction optimizations for a given function only.
#    [—noloopreverse] Will not do loop reversal optimization.
#    [—nolabelopt] Will not optimize labels (makes the dumpfiles more readable).
#    [—no-xinit-opt] Will not memcpy initialized data from code space into xdata space. This
#        saves a few bytes in code space if you don't have initialized data.
#    [—nooverlay] The compiler will not overlay parameters and local variables of any function,
#        see section Parameters and local variables for more details.
#    [—no-peep] Disable peep-hole optimization with built-in rules.
#    [—peep-file <filename>] This option can be used to use additional rules to be used by the
#        peep hole optimizer. See section 8.1.16 Peep Hole optimizations for details on how to
#        write these rules.
#    [—peep-asm] Pass the inline assembler code through the peep hole optimizer. This can cause
#        unexpected changes to inline assembler code, please go through the peephole optimizer
#        rules defined in the source file tree '<target>/peeph.def' before using this option.
#    [—peep-return] Let the peep hole optimizer do return optimizations. This is the default
#        without —debug.
#    [—no-peep-return] Do not let the peep hole optimizer do return optimizations. This is the
#        default with —debug.
#    [—opt-code-speed] The compiler will optimize code generation towards fast code, possibly
#        at the expense of code size.
#    [—opt-code-size] The compiler will optimize code generation towards compact code, possibly
#        at the expense of code speed.
#    [—fomit-frame-pointer] Frame pointer will be omitted when the function uses no local variables.
#        On the z80-related ports this option will result in the frame pointer always being omitted.
#    [—max-allocs-per-node] Setting this to a high value will result in increased compilation time
#        (and increased memory use during compilation) and more optimized code being generated.
#        Setting it to lower values speeds up compilation, but does not optimize as much. The
#        default value is 3000. This option currently does not affect the mcs51, ds390, pic14 and pic16 ports.
#    [—nolospre] Disable lospre. lospre is an advanced redundancy elimination technique,
#        essentially an improved variant of global subexpression elimination.
#    [—allow-unsafe-read] Allow optimizations to generate unsafe reads. This will enable additional
#        optimizations, but can result in spurious reads from undefined memory addresses, which
#        can be harmful if the target system uses certain ways of doing memory-mapped I/O.
#    [—nostdlibcall] Disable the optimization of calls to the standard library.

# 3.3.5 Linker Options
#    [--lib-path <absolute] path to additional libraries> This option is passed to the
#        linkage editor's additional libraries search path. The path name must be absolute.
#        Additional library files may be specified in the command line. See section Compiling
#        programs for more details.
#    [-L  <absolute] path to additional libraries> Same as above.
#    [—xram-loc <Value>] The start location of the external ram, default value is 0. The
#        value entered can be in Hexadecimal or Decimal format, e.g.: —xram-loc 0x8000 or —xram-loc 32768.
#    [—code-loc <Value>] The start location of the code segment, default value 0. Note when
#        this option is used the interrupt vector table is also relocated to the given address.
#        The value entered can be in Hexadecimal or Decimal format, e.g.: —code-loc 0x8000
#        or —code-loc 32768.
#    [—stack-loc <Value>] The value entered can be in Hexadecimal or Decimal format,
#        e.g. —stack-loc 0x20 or —stack-loc 32.
#
#    For stm8, by default the stack is placed at the device-specific reset value. By
#    using this option, the stack can be placed anywhere in the lower 16-bits of the
#    stm8 memory space. This is particularly useful for working around the stack roll-over
#    antifeature present in some stm8 devices.
#
#    [—xstack-loc <Value>] By default the external stack is placed after the __pdata segment.
#        Using this option the xstack can be placed anywhere in the external memory space of the
#        8051. The value entered can be in Hexadecimal or Decimal format,
#        e.g. —xstack-loc 0x8000 or —xstack-loc 32768. The provided value should not overlap
#        any other memory areas such as the pdata or xdata segment and with enough space for
#        the current application.
#    [—data-loc <Value>] The start location of the internal ram data segment. The value
#        entered can be in Hexadecimal or Decimal format, eg. —data-loc 0x20 or —data-loc 32.
#        (By default, the start location of the internal ram data segment is set as low as possible
#        in memory, taking into account the used register banks and the bit segment at address 0x20.
#        For example if register banks 0 and 1 are used without bit variables, the data segment
#            will be set, if —data-loc is not used, to location 0x10.)
#    [—idata-loc <Value>] The start location of the indirectly addressable internal ram of
#        the 8051, default value is 0x80. The value entered can be in Hexadecimal or Decimal
#        format, eg. —idata-loc 0x88 or —idata-loc 136.
#    [—bit-loc <Value>] The start location of the bit addressable internal ram of the 8051.
#        This is not implemented yet. Instead an option can be passed directly to the
#        linker: -Wl -bBSEG=<Value>.
#    [—out-fmt-ihx] The linker output (final object code) is in Intel Hex format. This is the
#        default option. The format itself is documented in the documentation of srecord.
#    [—out-fmt-s19] The linker output (final object code) is in Motorola S19 format. The format
#        itself is documented in the documentation of srecord.
#    [—out-fmt-elf] The linker output (final object code) is in ELF format. (Currently only
#        supported for the HC08, S08 and STM8 processors). When used with –debug, the debug
#        info is in DWARF format instead of CDB.
#    [-Wl linkOption[,linkOption]...] Pass the linkOption to the linker. If a bootloader is
#        used an option like ”-Wl -bCSEG=0x1000” would be typical to set the start of the
#        code segment. Either use the double quotes around this option or use no space
#        (e.g. -Wl-bCSEG=0x1000). See also #pragma constseg and #pragma codeseg in section3.16.
#        File sdcc/sdas/doc/asmlnk.txt has more on linker options.

# 3.3.6 MCS51 Options
#    [—model-small] Generate code for Small model programs, see section Memory Models
#        for more details. This is the default model.
#    [—model-medium] Generate code for Medium model programs, see section Memory Models
#        for more details. If this option is used all source files in the project have to
#        be compiled with this option. It must also be used when invoking the linker.
#    [—model-large] Generate code for Large model programs, see section Memory Models for
#        more details. If this option is used all source files in the project have to be
#        compiled with this option. It must also be used when invoking the linker.
#    [—model-huge] Generate code for Huge model programs, see section Memory Models for
#        more details. If this option is used all source files in the project have to be
#        compiled with this option. It must also be used when invoking the linker.
#    [—xstack] Uses a pseudo stack in the __pdata area (usually the first 256 bytes in the
#        external ram) for allocating variables and passing parameters. See section
#        3.15.1.2  External Stack for more details.
#    [—iram-size <Value>] Causes the linker to check if the internal ram usage is within
#        limits of the given value.
#    [—xram-size <Value>] Causes the linker to check if the external ram usage is within
#        limits of the given value.
#    [—code-size <Value>] Causes the linker to check if the code memory usage is within
#        limits of the given value.
#    [—stack-size <Value>] Causes the linker to check if there is at minimum <Value> bytes
#        for stack.
#    [—acall-ajmp ] Replaces the three byte instructions lcall/ljmp with the two byte
#        instructions acall/ajmp. Only use this option if your code is in the same 2k block of
#        memory. You may need to use this option for some 8051 derivatives which lack the
#        lcall/ljmp instructions.
#    [—no-ret-without-call ] Causes the code generator to insert an extra lcall or acall
#        instruction whenever it needs to use a ret instruction in a context other than a
#        function returning. This option is needed when using the Infineon XC800 series
#        microcontrollers to keep its Memory Extension Stack balanced.

