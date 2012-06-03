#######################################################################################
### epa-tr-stat

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${TCL_INCLUDE_PATH}
)
set(epa_SRC
    tr-stat.cc
)
add_executable(epa-tr-stat ${epa_SRC})
target_link_libraries(epa-tr-stat ${TCL_LIBRARY} ${TCL_STUB_LIBRARY})
install(TARGETS epa-tr-stat RUNTIME DESTINATION ${BIN_INSTALL_DIR})

