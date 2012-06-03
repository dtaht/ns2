#######################################################################################
### nlanr-tr-stat

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${TCL_INCLUDE_PATH}
)
set(nlanr_SRC
    tr-stat.cc 
    logparse.cc
)
add_executable(nlanr-tr-stat ${nlanr_SRC})
target_link_libraries(nlanr-tr-stat ${TCL_LIBRARY} ${TCL_STUB_LIBRARY})
install(TARGETS nlanr-tr-stat RUNTIME DESTINATION ${BIN_INSTALL_DIR})

