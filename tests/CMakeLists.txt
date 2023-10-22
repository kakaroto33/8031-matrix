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
#add_compile_options(--model-small)      # internal data space is used (default)
add_compile_options(--model-medium)      # internal data space is used (default)
#add_compile_options(--out-fmt-ihx)      # Output in Intel hex format
#
#add_compile_options(--xram-size 0x2000) # External Ram size: 8Kb
#add_compile_options(--code-loc 0x0000)  # Code Segment Location
#add_compile_options(--code-size 8192)   # Code Segment Location: EEPROM: 8K

#add_compile_options(--stack-auto)       # Stack automatic variables
#add_compile_options(--stack-size 1024)

#add_compile_options(--no-peep)          # Disable peep-hole optimization with built-in rules.
#add_compile_options(--no-peep-return)   # Do not let the peep hole optimizer do return optimizations. This is the default with —debug.
                                        # Some circumstances, the functions has missing 'ret' at end of assembly, so, the code will
                                        # will be randon behavior.


#add_compile_options(--int-long-reent)   # Use reentrant calls on the int and long support functions
#add_compile_options(--float-reent)      # Use reentrant calls on the float support functions
#add_compile_options(--acall-ajmp)       # Use acall/ajmp instead of lcall/ljmp
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

# add_library(uartlib STATIC uart.c)

set(OUTPUT_BUILD "etep-8031-sdcc")
add_executable(${OUTPUT_BUILD} main.c)
# target_link_libraries(${OUTPUT_BUILD} uartlib)

#add_custom_command(
#        TARGET ${OUTPUT_BUILD} POST_BUILD
#        COMMAND packihx "$<TARGET_FILE:${OUTPUT_BUILD}>" > "${OUTPUT_BUILD}.hex"
#        VERBATIM)

#add_custom_command(
#    OUTPUT ${OUTPUT_BUILD}.hex
#    COMMAND packihx -i ${CMAKE_CURRENT_SOURCE_DIR}/${OUTPUT_BUILD}.ihx > ${OUTPUT_BUILD}.hex
#    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${OUTPUT_BUILD}.ihx
#    VERBATIM)
#
#3.3.3 Optimization Options
#[—nogcse] Will not do global common subexpression elimination, this option may be used when the compiler creates undesirably large stack/data spaces to store compiler temporaries (spill locations, sloc). A warning message will be generated when this happens and the compiler will indicate the number of extra bytes it allocated. It is recommended that this option NOT be used, #pragma nogcse can be used to turn off global subexpression elimination for a given function only.
#[—noinvariant] Will not do loop invariant optimizations, this may be turned off for reasons explained for the previous option. For more details of loop optimizations performed see Loop Invariants in section 8.1.4. It is recommended that this option NOT be used, #pragma noinvariant can be used to turn off invariant optimizations for a given function only.
#[—noinduction] Will not do loop induction optimizations, see section strength reduction for more details. It is recommended that this option is NOT used, #pragma noinduction can be used to turn off induction optimizations for a given function only.
#[—noloopreverse] Will not do loop reversal optimization.
#[—nolabelopt] Will not optimize labels (makes the dumpfiles more readable).
#[—no-xinit-opt] Will not memcpy initialized data from code space into xdata space. This saves a few bytes in code space if you don't have initialized data.
#[—nooverlay] The compiler will not overlay parameters and local variables of any function, see section Parameters and local variables for more details.
#[—no-peep] Disable peep-hole optimization with built-in rules.
#[—peep-file <filename>] This option can be used to use additional rules to be used by the peep hole optimizer. See section 8.1.16 Peep Hole optimizations for details on how to write these rules.
#[—peep-asm] Pass the inline assembler code through the peep hole optimizer. This can cause unexpected changes to inline assembler code, please go through the peephole optimizer rules defined in the source file tree '<target>/peeph.def' before using this option.
#[—peep-return] Let the peep hole optimizer do return optimizations. This is the default without —debug.
#[—no-peep-return] Do not let the peep hole optimizer do return optimizations. This is the default with —debug.
#[—opt-code-speed] The compiler will optimize code generation towards fast code, possibly at the expense of code size.
#[—opt-code-size] The compiler will optimize code generation towards compact code, possibly at the expense of code speed.
#[—fomit-frame-pointer] Frame pointer will be omitted when the function uses no local variables. On the z80-related ports this option will result in the frame pointer always being omitted.
#[—max-allocs-per-node] Setting this to a high value will result in increased compilation time (and increased memory use during compilation) and more optimized code being generated. Setting it to lower values speeds up compilation, but does not optimize as much. The default value is 3000. This option currently does not affect the mcs51, ds390, pic14 and pic16 ports.
#[—nolospre] Disable lospre. lospre is an advanced redundancy elimination technique, essentially an improved variant of global subexpression elimination.
#[—allow-unsafe-read] Allow optimizations to generate unsafe reads. This will enable additional optimizations, but can result in spurious reads from undefined memory addresses, which can be harmful if the target system uses certain ways of doing memory-mapped I/O.
#[—nostdlibcall] Disable the optimization of calls to the standard library.