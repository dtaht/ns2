#######################################################################################
### dec-tr-stat

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${TCL_INCLUDE_PATH}
)
set(dec_SRC
    proxytrace.cc
    formsquid.cc
    formtxt.cc
    my-endian.cc
    proxytrace2any.cc
    tr-stat.cc
)
add_executable(dec-tr-stat ${dec_SRC})
target_link_libraries(dec-tr-stat ${TCL_LIBRARY} ${TCL_STUB_LIBRARY} -lm)
install(TARGETS dec-tr-stat RUNTIME DESTINATION ${BIN_INSTALL_DIR})

