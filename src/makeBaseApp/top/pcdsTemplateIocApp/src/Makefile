TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build an ioc application
# Use PROD_IOC_RTEMS for RTEMS only
# Use PROD_IOC_Linux for Linux only
PROD_IOC = _APPNAME_

# _APPNAME_.dbd will be created and installed
DBD += _APPNAME_.dbd

# _APPNAME_.dbd will be made up from these files:
_APPNAME__DBD += base.dbd
_APPNAME__DBD += iocAdmin.dbd
_APPNAME__DBD += autosaveSupport.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
_APPNAME__SRCS += _APPNAME__registerRecordDeviceDriver.cpp
_APPNAME__SRCS_DEFAULT += _APPNAME_Main.cpp

# Add locally compiled object code
#_APPNAME__SRCS += dbSubExample.c

_APPNAME__LIBS += devIocStats
_APPNAME__LIBS += autosave
_APPNAME__LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

