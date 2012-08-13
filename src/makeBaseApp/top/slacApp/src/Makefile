TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#========================================

# ================================================
# Build the IOC application
# ================================================
# This will attempt to build an IOC application 
# for every target including the host computer.
PROD_IOC = _APPNAME_

# Use the following for RTEMS Only IOCs
#PROD_IOC_RTEMS = _APPNAME_

# _APPNAME_.dbd will be created and installed
DBD += _APPNAME_.dbd

# _APPNAME_.dbd will be made up from these files:
_APPNAME__DBD += base.dbd
_APPNAME__DBD += devIocStats.dbd
_APPNAME__DBD += autosave.dbd
_APPNAME__DBD += caPutLog.dbd

# If you have an EVR uncomment the following two lines:
# _APPNAME__DBD += evrSupport.dbd
# _APPNAME__DBD += devMrfEr.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
_APPNAME__SRCS += _APPNAME__registerRecordDeviceDriver.cpp
_APPNAME__SRCS_DEFAULT += _APPNAME_Main.cpp
_APPNAME__SRCS_vxWorks += -nil-

# Add locally compiled object code
# For example, subroutines
# _APPNAME__SRCS += file1.c
# _APPNAME__SRCS += file2.c

# The following adds support from base/src/vxWorks
# _APPNAME__OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# =====================================================
# Link in the code from other libraries
# =====================================================
# Needed to link in iocAdmin support
_APPNAME__LIBS += devIocStats

# Needed to link in autosave support
_APPNAME__LIBS += autosave

# Needed to link caPutLog support
_APPNAME__LIBS += caPutLog

# Needed to link in the EVR support
# _APPNAME__LIBS += evrSupport
# _APPNAME__LIBS += devMrfEr
# _APPNAME__LIBS += mrfVme64x

# =====================================================

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # This builds sncExample as a component of _APPNAME_
    _APPNAME__SNCFLAGS += +r
    _APPNAME__DBD += sncExample.dbd
    _APPNAME__SRCS += sncExample.stt
    _APPNAME__LIBS += seq pv

    # The following builds sncProgram as a standalone application
  ifneq ($(T_A),linuxRT-x86)
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
  endif
endif

_APPNAME__LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

