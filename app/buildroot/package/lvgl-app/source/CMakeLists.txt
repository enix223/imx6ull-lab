cmake_minimum_required(VERSION 3.14)

# Set project name
project(lvgl-app LANGUAGES C)

# Set C standard
set(CMAKE_C_STANDARD 99)

# FetchContent to download LVGL from GitHub
include(FetchContent)

# Download LVGL from GitHub
FetchContent_Declare(
    lvgl
    GIT_REPOSITORY https://github.com/lvgl/lvgl.git
    GIT_TAG v9.2.2
)

FetchContent_MakeAvailable(lvgl)

# config lvgl
target_include_directories(lvgl PRIVATE ${CMAKE_SOURCE_DIR}/inc)
target_include_directories(lvgl_demos PRIVATE ${CMAKE_SOURCE_DIR}/inc)
target_include_directories(lvgl_examples PRIVATE ${CMAKE_SOURCE_DIR}/inc)
target_compile_definitions(lvgl PRIVATE LV_CONF_INCLUDE_SIMPLE)

# Include directories for LVGL
include_directories(${lvgl_SOURCE_DIR}/include)

# Add include directories
include_directories(${CMAKE_SOURCE_DIR}/inc)

# Add source files
set(SOURCE_FILES
    ${CMAKE_SOURCE_DIR}/src/main.c
)

# Create executable
add_executable(lvgl-app ${SOURCE_FILES})

target_include_directories(lvgl-app PRIVATE ${CMAKE_SOURCE_DIR}/inc)
target_compile_definitions(lvgl-app PRIVATE LV_CONF_INCLUDE_SIMPLE)

# Link LVGL libraries
target_link_libraries(lvgl-app PRIVATE lvgl)

install(TARGETS lvgl-app DESTINATION bin)
