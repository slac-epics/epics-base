TOP=../..

include $(TOP)/configure/CONFIG

TEMPLATES_DIR = makeBaseApp

TEMPLATES += top/Makefile
## ================================================
## SLAC Installed Templates (Added by ELW)
## ================================================
TEMPLATES += top/README
TEMPLATES += top/RELEASE_NOTES
TEMPLATES += top/RELEASE_SITE
# =================================================
## End addition by ELW
## ================================================

TEMPLATES += top/configure/CONFIG
TEMPLATES += top/configure/CONFIG_SITE
TEMPLATES += top/configure/Makefile
TEMPLATES += top/configure/RELEASE
TEMPLATES += top/configure/RULES
TEMPLATES += top/configure/RULES.ioc
TEMPLATES += top/configure/RULES_DIRS
TEMPLATES += top/configure/RULES_TOP

## ================================================
## SLAC Installed Templates (Added by ELW)
## ================================================
TEMPLATES += top/configure/RULES.Restore

# =================================================
## End addition by ELW
## ================================================

TEMPLATES += top/supportApp/Makefile
TEMPLATES += top/supportApp/Db/Makefile
TEMPLATES += top/supportApp/src/Makefile
TEMPLATES += top/supportApp/src/_APPNAME_.dbd

TEMPLATES += top/iocApp/Makefile
TEMPLATES += top/iocApp/Db/Makefile
TEMPLATES += top/iocApp/src/Makefile
TEMPLATES += top/iocApp/src/_APPNAME_Main.cpp

TEMPLATES += top/exampleApp/Makefile
TEMPLATES += top/exampleApp/Db/Makefile
TEMPLATES += top/exampleApp/Db/dbExample1.db
TEMPLATES += top/exampleApp/Db/dbExample2.db
TEMPLATES += top/exampleApp/Db/dbSubExample.db
TEMPLATES += top/exampleApp/Db/user.substitutions
TEMPLATES += top/exampleApp/Db/userHost.substitutions
TEMPLATES += top/exampleApp/src/Makefile
TEMPLATES += top/exampleApp/src/xxxRecord.dbd
TEMPLATES += top/exampleApp/src/xxxRecord.c
TEMPLATES += top/exampleApp/src/devXxxSoft.c
TEMPLATES += top/exampleApp/src/xxxSupport.dbd
TEMPLATES += top/exampleApp/src/sncExample.stt
TEMPLATES += top/exampleApp/src/sncProgram.st
TEMPLATES += top/exampleApp/src/sncExample.dbd
TEMPLATES += top/exampleApp/src/dbSubExample.c
TEMPLATES += top/exampleApp/src/dbSubExample.dbd
TEMPLATES += top/exampleApp/src/_APPNAME_Main.cpp
TEMPLATES += top/exampleApp/src/_APPNAME_Hello.c
TEMPLATES += top/exampleApp/src/_APPNAME_Hello.dbd
TEMPLATES += top/exampleApp/src/initTrace.c
TEMPLATES += top/exampleApp/src/initTrace.dbd

TEMPLATES += top/exampleBoot/Makefile
TEMPLATES += top/exampleBoot/nfsCommands@vxWorks
TEMPLATES += top/exampleBoot/nfsCommands@RTEMS
TEMPLATES += top/exampleBoot/ioc/Makefile@Common
TEMPLATES += top/exampleBoot/ioc/Makefile@vxWorks
TEMPLATES += top/exampleBoot/ioc/Makefile@win32
TEMPLATES += top/exampleBoot/ioc/st.cmd@Common
TEMPLATES += top/exampleBoot/ioc/st.cmd@vxWorks
TEMPLATES += top/exampleBoot/ioc/st.cmd@RTEMS
TEMPLATES += top/exampleBoot/ioc/README@Common
TEMPLATES += top/exampleBoot/ioc/README@vxWorks

TEMPLATES += top/caClientApp/Makefile
TEMPLATES += top/caClientApp/caExample.c
TEMPLATES += top/caClientApp/caMonitor.c

TEMPLATES += top/caServerApp/Makefile
TEMPLATES += top/caServerApp/README
TEMPLATES += top/caServerApp/exAsyncPV.cc
TEMPLATES += top/caServerApp/exChannel.cc
TEMPLATES += top/caServerApp/exPV.cc
TEMPLATES += top/caServerApp/exScalarPV.cc
TEMPLATES += top/caServerApp/exServer.cc
TEMPLATES += top/caServerApp/exServer.h
TEMPLATES += top/caServerApp/exVectorPV.cc
TEMPLATES += top/caServerApp/main.cc
TEMPLATES += top/caServerApp/test.adl
TEMPLATES += top/caServerApp/vxEntry.cc

TEMPLATES += top/iocBoot/Makefile
TEMPLATES += top/iocBoot/nfsCommands@vxWorks
TEMPLATES += top/iocBoot/nfsCommands@RTEMS
TEMPLATES += top/iocBoot/ioc/Makefile@Common
TEMPLATES += top/iocBoot/ioc/Makefile@vxWorks
TEMPLATES += top/iocBoot/ioc/Makefile@win32
TEMPLATES += top/iocBoot/ioc/st.cmd@Common
TEMPLATES += top/iocBoot/ioc/st.cmd@Cross
TEMPLATES += top/iocBoot/ioc/st.cmd@vxWorks
TEMPLATES += top/iocBoot/ioc/st.cmd@RTEMS

## ============================================
## SLAC Style Templates (Added by ELW)
## ============================================
TEMPLATES += top/slacApp/Makefile
TEMPLATES += top/slacApp/Db/Makefile
TEMPLATES += top/slacApp/Db/dbExample.db

TEMPLATES += top/slacApp/src/Makefile
TEMPLATES += top/slacApp/src/sncExample.stt
TEMPLATES += top/slacApp/src/sncProgram.st
TEMPLATES += top/slacApp/src/sncExample.dbd
TEMPLATES += top/slacApp/src/_APPNAME_Main.cpp

TEMPLATES += top/slacApp/srcDisplay/Makefile
TEMPLATES += top/slacApp/srcDisplay/CONFIG_EDL
TEMPLATES += top/slacApp/srcDisplay/example.edl

TEMPLATES += top/slacApp/srcRestore/Makefile
TEMPLATES += top/slacApp/srcRestore/example.cwConfig

TEMPLATES += top/slacBoot/Makefile
TEMPLATES += top/slacBoot/ioc/Makefile@Common
TEMPLATES += top/slacBoot/ioc/Makefile@vxWorks
TEMPLATES += top/slacBoot/ioc/Makefile@RTEMS
TEMPLATES += top/slacBoot/ioc/st.cmd@Common
TEMPLATES += top/slacBoot/ioc/st.cmd@Cross
TEMPLATES += top/slacBoot/ioc/st.cmd@vxWorks
TEMPLATES += top/slacBoot/ioc/st.cmd@RTEMS
TEMPLATES += top/slacBoot/ioc/README@Common
TEMPLATES += top/slacBoot/ioc/README@vxWorks

## ==========================================
## End Changes needed for SLAC ==============
## ==========================================

SCRIPTS_HOST += makeBaseApp.pl

include $(TOP)/configure/RULES

