#ifndef _CONFIG_H_
#define _CONFIG_H_
#cmakedefine PACKAGE_BUGREPORT "${PACKAGE_BUGREPORT}"
#cmakedefine PACKAGE_NAME "${PACKAGE_NAME}"
#cmakedefine PACKAGE_STRING "${PACKAGE_STRING}"
#cmakedefine PACKAGE_TARNAME "${PACKAGE_TARNAME}"
#cmakedefine PACKAGE_VERSION "${PACKAGE_VERSION}"
#cmakedefine NSPERL_PATH "${PERL_EXECUTABLE}"
#cmakedefine NSTCLSH_PATH "${TCL_TCLSH}"

#ifndef _XOPEN_SOURCE_EXTENDED
#define _XOPEN_SOURCE_EXTENDED
#endif

#define RANDOM_RETURN_TYPE long int
#cmakedefine SIZEOF_LONG ${SIZEOF_LONG}
#cmakedefine HAVE_SOCKLEN_T 1
#cmakedefine HAVE_BCOPY 1
#cmakedefine HAVE_BZERO 1
#cmakedefine HAVE_GETRUSAGE 1
#cmakedefine HAVE_SBRK 1
#cmakedefine HAVE_SNPRINTF 1
#cmakedefine HAVE_STRTOLL 1
#cmakedefine HAVE_STRTOQ 1
#cmakedefine HAVE_ADDR2ASCII 1
#cmakedefine HAVE_FEENABLEEXCEPT 1

#cmakedefine STDC_HEADERS 1
#cmakedefine HAVE_STRING_H 1
#cmakedefine HAVE_STRINGS_H 1
#cmakedefine HAVE_ARPA_INET_H 1
#cmakedefine HAVE_NETINET_IN_H 1
#cmakedefine HAVE_NET_ETHERNET_H 1
#cmakedefine HAVE_FENV_H 1

#cmakedefine HAVE_ETHER_HEADER_STRUCT 1
#cmakedefine HAVE_ETHER_ADDRESS_STRUCT 1

#define TCP_DELAY_BIND_ALL
#define NO_TK
#define NS_DIFFUSION
#define SMAC_NO_SYNC
#define USE_SINGLE_ADDRESS_SPACE
#define rng_test

/* stl */
#ifdef __cplusplus
#define HAVE_STL

#undef CPP_REQUIRES_NAMESPACE
#ifdef CPP_REQUIRES_NAMESPACE

#ifndef CPP_NAMESPACE
#define CPP_NAMESPACE std
#endif

using namespace CPP_NAMESPACE;
#endif /* CPP_NAMESPACE */
#endif /* __cplusplus */

#endif //_CONFIG_H_
