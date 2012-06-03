project(ns)
cmake_minimum_required(VERSION 2.6)
set(TARNAME ns)
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

# program name, version etc

set(PACKAGE_VERSION "2.35")
set(PACKAGE_NAME "ns")
set(PACKAGE_TARNAME "${TARNAME}")
set(PACKAGE_STRING "${PACKAGE_NAME} ${PACKAGE_VERSION}")
set(PACKAGE_BUGREPORT "http://sourceforge.net/projects/nsnam")

find_package(PkgConfig REQUIRED)

##########################################################################
if(NOT DEFINED BIN_INSTALL_DIR)
    set(BIN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/bin")
endif(NOT DEFINED BIN_INSTALL_DIR)
if(NOT DEFINED DATA_INSTALL_DIR)
    set(DATA_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share")
endif(NOT DEFINED DATA_INSTALL_DIR)
if(NOT DEFINED MAN_INSTALL_DIR)
    set(MAN_INSTALL_DIR "${DATA_INSTALL_DIR}/man")
endif(NOT DEFINED MAN_INSTALL_DIR)

find_package(PERL REQUIRED)
find_package(TCL REQUIRED)
find_package(TclStub REQUIRED)
pkg_check_modules(OTCL REQUIRED otcl)
pkg_check_modules(TCLCL REQUIRED tclcl)

INCLUDE (CheckFunctionExists)
INCLUDE (CheckIncludeFiles)
INCLUDE (CheckTypeSize)

CHECK_INCLUDE_FILES(stdlib.h STDC_HEADERS)
CHECK_INCLUDE_FILES(string.h HAVE_STRING_H)
CHECK_INCLUDE_FILES(strings.h STRINGS_H)
CHECK_INCLUDE_FILES(arpa/inet.h HAVE_ARPA_INET_H)
CHECK_INCLUDE_FILES(netinet/in.h HAVE_NETINET_IN_H)
CHECK_INCLUDE_FILES(net/ethernet.h HAVE_NET_ETHERNET_H)
CHECK_INCLUDE_FILES(fenv.h HAVE_FENV_H)

CHECK_TYPE_SIZE("long" SIZEOF_LONG)
CHECK_TYPE_SIZE("socklen_t" SOCKLEN_T)

CHECK_FUNCTION_EXISTS(bcopy HAVE_BCOPY)
CHECK_FUNCTION_EXISTS(bzero HAVE_BZERO)
CHECK_FUNCTION_EXISTS(getrusage HAVE_GETRUSAGE)
CHECK_FUNCTION_EXISTS(sbrk HAVE_SBRK)
CHECK_FUNCTION_EXISTS(snprintf HAVE_SNPRINTF)
CHECK_FUNCTION_EXISTS(strtoll HAVE_STRTOLL)
CHECK_FUNCTION_EXISTS(strtoq HAVE_STRTOQ)
CHECK_FUNCTION_EXISTS(addr2ascii HAVE_ADDR2ASCII)
CHECK_FUNCTION_EXISTS(feenableexcept HAVE_FEENABLEEXCEPT)

CHECK_TYPE_SIZE("struct ether_header" HAVE_ETHER_HEADER_STRUCT)
CHECK_TYPE_SIZE("struct ether_addr" HAVE_ETHER_ADDRESS_STRUCT)

CHECK_SYMBOL_EXISTS("SIOCGIFHWADDR" net/ethernet.h HAVE_SIOCGIFHWADDR)

configure_file(config-nam.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/autoconf.h)

#######################################################################
## common/ptypes2tcl
include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/common/
)

set(ptypes2tcl_SRC
    common/ptypes2tcl.cc
)

add_executable(ptypes2tcl ${ptypes2tcl_SRC})
target_link_libraries(ptypes2tcl)

#######################################################################
### source code files
include(SourceFiles)

################################################################
### ns 
include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${TCL_INCLUDE_PATH}
    ${TK_INCLUDE_PATH}
    ${OTCL_INCLUDE_DIRS}
    ${TCLCL_INCLUDE_DIRS}
    ${INCLUDE_SUB_DIR}
)

set(ns_SRC
    common/tclAppInit.cc
    common/main-monolithic.cc
    ${OBJ}
)

add_executable(ns ${ns_SRC})
target_link_libraries(ns ${TCL_LIBRARY} ${TCL_STUB_LIBRARY} ${TK_LIBRARY} ${TK_STUB_LIBRARY} ${OTCL_LIBRARIES} ${TCLCL_LIBRARIES})
install(TARGETS ns RUNTIME DESTINATION ${BIN_INSTALL_DIR})

install(FILES ns.1 DESTINATION ${MAN_INSTALL_DIR}/man1)


#######################################################################################
### nse
include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${TCL_INCLUDE_PATH}
    ${TK_INCLUDE_PATH}
    ${OTCL_INCLUDE_DIRS}
    ${TCLCL_INCLUDE_DIRS}
    ${INCLUDE_SUB_DIR}
)
set(nse_SRC
    common/tclAppInit.cc
    common/main-monolithic.cc
    ${OBJ}
    ${OBJ_EMULATE_CC}
    ${OBJ_EMULATE_C}
)
add_executable(nse ${nse_SRC})
target_link_libraries(nse ${TCL_LIBRARY} ${TCL_STUB_LIBRARY} ${TK_LIBRARY} ${TK_STUB_LIBRARY} ${OTCL_LIBRARIES} ${TCLCL_LIBRARIES})
install(TARGETS nse RUNTIME DESTINATION ${BIN_INSTALL_DIR})

#######################################################################################
### nstk
include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${TCL_INCLUDE_PATH}
    ${TK_INCLUDE_PATH}
    ${OTCL_INCLUDE_DIRS}
    ${TCLCL_INCLUDE_DIRS}
    ${INCLUDE_SUB_DIR}
)
set(nstk_SRC
    common/tkAppInit.cc
    ${OBJ}
)
add_executable(nstk ${nstk_SRC})
target_link_libraries(nstk ${TCL_LIBRARY} ${TCL_STUB_LIBRARY} ${TK_LIBRARY} ${TK_STUB_LIBRARY} ${OTCL_LIBRARIES} ${TCLCL_LIBRARIES})
install(TARGETS nstk RUNTIME DESTINATION ${BIN_INSTALL_DIR})

#########################################################################################
####  indep-utils
add_subdirectory(indep-utils/cmu-scen-gen/setdest)
add_subdirectory(indep-utils/webtrace-conv/dec)
add_subdirectory(indep-utils/webtrace-conv/epa)
add_subdirectory(indep-utils/webtrace-conv/nlanr)
add_subdirectory(indep-utils/webtrace-conv/ucb)
#=========================================================================================
### test
enable_testing()
add_test(NAME ns_TEST COMMAND ./validate)
