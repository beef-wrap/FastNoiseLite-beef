cmake_minimum_required(VERSION 3.27)

project(fastnoiselite)

# remove "lib" prefix on unix systems
set(CMAKE_STATIC_LIBRARY_PREFIX "")

if (WIN32)
    set(OUTPUT_DIR "windows" CACHE STRING "")
elseif(APPLE)
    set(OUTPUT_DIR "macos" CACHE STRING "")
elseif(UNIX)
    set(OUTPUT_DIR "linux" CACHE STRING "")
endif ()

# header only library, copy to .c file
configure_file(FastNoiseLite/C/FastNoiseLite.h ../C/FastNoiseLite.c COPYONLY)

# header only library, add implementation define
add_compile_definitions(FNL_IMPL)

add_library(fastnoiselite STATIC FastNoiseLite/C/FastNoiseLite.c)

set_target_properties(fastnoiselite PROPERTIES OUTPUT_NAME_DEBUG "fastnoiselited")
set_target_properties(fastnoiselite PROPERTIES OUTPUT_NAME_RELEASE "fastnoiselite")
set_target_properties(fastnoiselite PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../libs/${OUTPUT_DIR}>) 