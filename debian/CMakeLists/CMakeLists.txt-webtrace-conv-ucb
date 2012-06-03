#######################################################################################
### nlanr-tr-stat
add_definitions(-DCPP_NAMESPACE=std)
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${TCL_INCLUDE_PATH}
)
set(ucb_SRC
    tr-stat.cc 
    logparse.cc 
    utils.cc
)
add_executable(ucb-tr-stat ${ucb_SRC})
target_link_libraries(ucb-tr-stat ${TCL_LIBRARY} ${TCL_STUB_LIBRARY})
install(TARGETS ucb-tr-stat RUNTIME DESTINATION ${BIN_INSTALL_DIR})

