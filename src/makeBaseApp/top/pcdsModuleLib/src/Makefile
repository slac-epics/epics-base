TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build a module library
# Use LIBRARY_IOC_RTEMS for RTEMS only
# Use LIBRARY_IOC_Linux for Linux only
LIBRARY_IOC = _APPNAME_

# _APPNAME_.dbd will be made up from these files:
DBD += _APPNAME_.dbd

# Add any header files here which should be installed
INC	+=	_APPNAME_.h

# Add any html documentation here
# HTMLS	+=	index.html
# HTMLS +=	_APPNAME_.html
HTMLS_DIR	= .

# Add any source files here
# Note: No lib will be built if no sources are listed here
LIBSRCS += _APPNAME_.cpp

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

