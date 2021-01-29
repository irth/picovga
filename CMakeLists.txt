cmake_minimum_required(VERSION 3.12)

# initialize pico_sdk from submodule
# note: this must happen before project()
include(pico-sdk/pico_sdk_init.cmake)

project(smol)

# initialize the Pico SDK
pico_sdk_init()



add_executable(smol
	src/entry.c
)

pico_generate_pio_header(smol ${CMAKE_CURRENT_LIST_DIR}/src/hello.pio)

target_link_libraries(smol PRIVATE pico_stdlib hardware_pio)

pico_enable_stdio_usb(smol 1)
pico_enable_stdio_uart(smol 0)

pico_add_extra_outputs(smol)


