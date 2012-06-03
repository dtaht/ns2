#######################################################################################
### setdest
add_definitions(-Dstand_alone)
add_definitions(-DSTL_NAMESPACE=std)
add_definitions(-DCPP_NAMESPACE=std)

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${INCLUDE_SUB_DIR}
)
set(setdest_SRC
    setdest.cc
    ../../../tools/rng.cc
)
add_executable(setdest ${setdest_SRC})
target_link_libraries(setdest -lm)
install(TARGETS setdest RUNTIME DESTINATION ${BIN_INSTALL_DIR})

###############################################################################
### calcdest
include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${INCLUDE_SUB_DIR}
)
set(calcdest_SRC
    calcdest.cc
    ../../../tools/rng.cc
)
add_executable(calcdest ${calcdest_SRC})
target_link_libraries(calcdest -lm)
install(TARGETS calcdest RUNTIME DESTINATION ${BIN_INSTALL_DIR})
