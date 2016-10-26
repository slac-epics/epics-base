TOP=../..

include $(TOP)/configure/CONFIG

TEMPLATES_DIR = makeBaseApp

TEMPLATES += top/Makefile
TEMPLATES += top/configure/CONFIG
TEMPLATES += top/configure/CONFIG_SITE
TEMPLATES += top/configure/Makefile
TEMPLATES += top/configure/RELEASE
TEMPLATES += top/configure/RULES
TEMPLATES += top/configure/RULES.ioc
TEMPLATES += top/configure/RULES_DIRS
TEMPLATES += top/configure/RULES_TOP

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
TEMPLATES += top/exampleBoot/ioc/Makefile@windows
TEMPLATES += top/exampleBoot/ioc/Makefile@cygwin
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
TEMPLATES += top/iocBoot/ioc/Makefile@windows
TEMPLATES += top/iocBoot/ioc/Makefile@cygwin
TEMPLATES += top/iocBoot/ioc/st.cmd@Common
TEMPLATES += top/iocBoot/ioc/st.cmd@Cross
TEMPLATES += top/iocBoot/ioc/st.cmd@vxWorks
TEMPLATES += top/iocBoot/ioc/st.cmd@RTEMS

######################################################################
# PCDS Additions
######################################################################

######################################################################
## Application TOP files
## ================================================
TEMPLATES += top/README
TEMPLATES += top/RELEASE_NOTES
TEMPLATES += top/RELEASE_SITE
TEMPLATES += top/edm-_IOC_.cmd
TEMPLATES += top/_APPNAME_Screens/_APPNAME_.edl

######################################################################
## Additional RULES
## ================================================
TEMPLATES += top/configure/RULES.archive
TEMPLATES += top/configure/RULES.autosave
TEMPLATES += top/configure/RULES.copy
TEMPLATES += top/configure/RULES.ioc-targets

######################################################################
# PCDS templates: 'pcdsDemoApp' and 'pcdsDemoBoot'.
# Author: Jason Tiller
######################################################################

## =================================================
# pcdsDemoApp - based on lclsApp.  Also includes a 'srcProtocol' directory
# for managing streamDevice's protocol files.

TEMPLATES += top/pcdsDemoApp/Makefile
TEMPLATES += top/pcdsDemoApp/Db/Makefile
TEMPLATES += top/pcdsDemoApp/Db/dbExample1.db
TEMPLATES += top/pcdsDemoApp/Db/dbExample2.db
TEMPLATES += top/pcdsDemoApp/Db/dbSubExample.db
TEMPLATES += top/pcdsDemoApp/src/Makefile
TEMPLATES += top/pcdsDemoApp/src/xxxRecord.dbd
TEMPLATES += top/pcdsDemoApp/src/xxxRecord.c
TEMPLATES += top/pcdsDemoApp/src/devXxxSoft.c
TEMPLATES += top/pcdsDemoApp/src/xxxSupport.dbd
TEMPLATES += top/pcdsDemoApp/src/sncExample.stt
TEMPLATES += top/pcdsDemoApp/src/sncProgram.st
TEMPLATES += top/pcdsDemoApp/src/sncExample.dbd
TEMPLATES += top/pcdsDemoApp/src/dbSubExample.c
TEMPLATES += top/pcdsDemoApp/src/dbSubExample.dbd
TEMPLATES += top/pcdsDemoApp/src/_APPNAME_Main.cpp
TEMPLATES += top/pcdsDemoApp/src/_APPNAME_Hello.c
TEMPLATES += top/pcdsDemoApp/src/_APPNAME_Hello.dbd

TEMPLATES += top/pcdsDemoApp/configure/RELEASE

TEMPLATES += top/pcdsDemoApp/srcDisplay/Makefile
TEMPLATES += top/pcdsDemoApp/srcDisplay/example.edl

TEMPLATES += top/pcdsDemoApp/srcProtocol/Makefile
TEMPLATES += top/pcdsDemoApp/srcProtocol/example.proto

# pcdsDemoBoot - based on lclsBoot.  Will copy 'iocBoot' (and st.cmd!)
# into INSTALL_LOCATION if you aren't building in your development
# directory.

TEMPLATES += top/pcdsDemoBoot/Makefile

TEMPLATES += top/pcdsDemoBoot/nfsCommands@vxWorks
TEMPLATES += top/pcdsDemoBoot/nfsCommands@vxWorks6

TEMPLATES += top/pcdsDemoBoot/nfsCommands@RTEMS
TEMPLATES += top/pcdsDemoBoot/ioc/Makefile@Common

TEMPLATES += top/pcdsDemoBoot/ioc/Makefile@vxWorks
TEMPLATES += top/pcdsDemoBoot/ioc/Makefile@vxWorks6

TEMPLATES += top/pcdsDemoBoot/ioc/st.cmd@Common
TEMPLATES += top/pcdsDemoBoot/ioc/st.cmd@Cross

TEMPLATES += top/pcdsDemoBoot/ioc/st.cmd@vxWorks
TEMPLATES += top/pcdsDemoBoot/ioc/st.cmd@vxWorks6

TEMPLATES += top/pcdsDemoBoot/ioc/st.cmd@RTEMS
TEMPLATES += top/pcdsDemoBoot/ioc/README@Common

TEMPLATES += top/pcdsDemoBoot/ioc/README@vxWorks
TEMPLATES += top/pcdsDemoBoot/ioc/README@vxWorks6

######################################################################
# PCDS templates: 'pcdsIocApp' and 'pcdsIocBoot'.
# Author: Bruce Hill
######################################################################

# pcdsIocApp - Basic pcds IOC including autosave and iocAdmin

TEMPLATES += top/pcdsIocApp/Makefile
TEMPLATES += top/pcdsIocApp/Db/Makefile
TEMPLATES += top/pcdsIocApp/Db/_APPNAME_-ioc.sub-req
TEMPLATES += top/pcdsIocApp/Db/_APPNAME_-ioc.sub-arch
TEMPLATES += top/pcdsIocApp/Db/iocAdmin.substitutions
TEMPLATES += top/pcdsIocApp/src/Makefile
TEMPLATES += top/pcdsIocApp/src/_APPNAME_Main.cpp

TEMPLATES += top/pcdsIocApp/configure/RELEASE

# pcdsIocBoot - based on lclsBoot.  Will copy 'iocBoot' (and st.cmd!)
# into INSTALL_LOCATION if you aren't building in your development
# directory.

TEMPLATES += top/pcdsIocBoot/Makefile

TEMPLATES += top/pcdsIocBoot/ioc/Makefile@Common

TEMPLATES += top/pcdsIocBoot/ioc/st.cmd@Common
TEMPLATES += top/pcdsIocBoot/ioc/st.cmd@RTEMS

TEMPLATES += top/pcdsIocBoot/ioc/startup.cmd@Common
TEMPLATES += top/pcdsIocBoot/ioc/startup.cmd@RTEMS

TEMPLATES += top/pcdsIocBoot/ioc/README@Common

TEMPLATES += top/pcdsIocBoot/ioc/_IOC_.sub-arch
TEMPLATES += top/pcdsIocBoot/ioc/_IOC_.sub-req


######################################################################
# PCDS templates: 'pcdsEvrApp' and 'pcdsEvrBoot'.
# Author: Bruce Hill
######################################################################

# pcdsEvrApp - Basic pcds IOC including autosave, iocAdmin, and EVR

TEMPLATES += top/pcdsEvrApp/Makefile

TEMPLATES += top/pcdsEvrApp/Db/Makefile
TEMPLATES += top/pcdsEvrApp/Db/_APPNAME_-ioc.sub-req
TEMPLATES += top/pcdsEvrApp/Db/_APPNAME_-ioc.sub-arch
TEMPLATES += top/pcdsEvrApp/Db/iocAdmin.substitutions
TEMPLATES += top/pcdsEvrApp/Db/evrPmc230.substitutions
TEMPLATES += top/pcdsEvrApp/Db/evrVme230.substitutions

TEMPLATES += top/pcdsEvrApp/src/Makefile
TEMPLATES += top/pcdsEvrApp/src/_APPNAME_Main.cpp

TEMPLATES += top/pcdsEvrApp/configure/RELEASE

# pcdsEvrBoot - based on lclsBoot.  Will copy 'iocBoot' (and st.cmd!)
# into INSTALL_LOCATION if you aren't building in your development
# directory.

TEMPLATES += top/pcdsEvrBoot/Makefile

TEMPLATES += top/pcdsEvrBoot/ioc/Makefile@Common

TEMPLATES += top/pcdsEvrBoot/ioc/st.cmd@Common
TEMPLATES += top/pcdsEvrBoot/ioc/st.cmd@RTEMS

TEMPLATES += top/pcdsEvrBoot/ioc/startup.cmd@Common
TEMPLATES += top/pcdsEvrBoot/ioc/startup.cmd@RTEMS

TEMPLATES += top/pcdsEvrBoot/ioc/README@Common

TEMPLATES += top/pcdsEvrBoot/ioc/_IOC_.sub-arch
TEMPLATES += top/pcdsEvrBoot/ioc/_IOC_.sub-req

######################################################################
# PCDS templates: 'pcdsMotorApp' and 'pcdsMotorBoot'.
# Author: Bruce Hill
######################################################################

# pcdsMotorApp - Basic pcds IOC including autosave, iocAdmin and motor
TEMPLATES += top/pcdsMotorApp/Makefile

TEMPLATES += top/pcdsMotorApp/Db/Makefile
TEMPLATES += top/pcdsMotorApp/Db/_APPNAME_-ioc.sub-arch
TEMPLATES += top/pcdsMotorApp/Db/_APPNAME_-ioc.sub-req
TEMPLATES += top/pcdsMotorApp/Db/iocAdmin.substitutions

TEMPLATES += top/pcdsMotorApp/_APPNAME_Screens/_APPNAME_.edl
TEMPLATES += top/pcdsMotorApp/_APPNAME_Screens/motor.edl
TEMPLATES += top/pcdsMotorApp/_APPNAME_Screens/motor_mcode.edl
TEMPLATES += top/pcdsMotorApp/_APPNAME_Screens/motor_setup.edl

TEMPLATES += top/pcdsMotorApp/configure/CONFIG_SITE
TEMPLATES += top/pcdsMotorApp/configure/RELEASE

TEMPLATES += top/pcdsMotorApp/src/Makefile
TEMPLATES += top/pcdsMotorApp/src/_APPNAME_Main.cpp

TEMPLATES += top/pcdsMotorApp/srcProtocol/Makefile

TEMPLATES += top/pcdsMotorBoot/Makefile
TEMPLATES += top/pcdsMotorBoot/nfsCommands@RTEMS

TEMPLATES += top/pcdsMotorBoot/ioc/Makefile@Common
TEMPLATES += top/pcdsMotorBoot/ioc/README@Common
TEMPLATES += top/pcdsMotorBoot/ioc/README@RTEMS
TEMPLATES += top/pcdsMotorBoot/ioc/_IOC_-motors.substitutions
TEMPLATES += top/pcdsMotorBoot/ioc/_IOC_.sub-arch
TEMPLATES += top/pcdsMotorBoot/ioc/_IOC_.sub-req
TEMPLATES += top/pcdsMotorBoot/ioc/_IOC_-positions.sub-req
TEMPLATES += top/pcdsMotorBoot/ioc/st.cmd@Common*
TEMPLATES += top/pcdsMotorBoot/ioc/st.cmd@RTEMS*
TEMPLATES += top/pcdsMotorBoot/ioc/startup.cmd@Common*
TEMPLATES += top/pcdsMotorBoot/ioc/startup.cmd@RTEMS*

######################################################################
# PCDS template: 'pcdsModuleLib'
# Author: Bruce Hill
######################################################################

# pcdsModuleLib - Basic pcds module including autosave and archive support

TEMPLATES += top/pcdsModuleLib/Makefile

TEMPLATES += top/pcdsModuleLib/Db/Makefile
TEMPLATES += top/pcdsModuleLib/Db/_APPNAME_.substitutions
TEMPLATES += top/pcdsModuleLib/Db/_APPNAME_.template
TEMPLATES += top/pcdsModuleLib/Db/_APPNAME_.tpl-arch
TEMPLATES += top/pcdsModuleLib/Db/_APPNAME_.tpl-req

TEMPLATES += top/pcdsModuleLib/configure/RELEASE

TEMPLATES += top/pcdsModuleLib/src/Makefile
TEMPLATES += top/pcdsModuleLib/src/_APPNAME_.cpp
TEMPLATES += top/pcdsModuleLib/src/_APPNAME_.dbd
TEMPLATES += top/pcdsModuleLib/src/_APPNAME_.h

######################################################################
# PCDS templates: 'pcdsBeckhoffApp' and 'pcdsBeckhoffBoot'.
# Author: Garth Brown
######################################################################

# pcdsBeckhoffApp - Mostly the same as pcdsEvr, but for Beckhoff instead of evr.

TEMPLATES += top/pcdsBeckhoffApp/Makefile

TEMPLATES += top/pcdsBeckhoffApp/Db/Makefile
TEMPLATES += top/pcdsBeckhoffApp/Db/_APPNAME_-ioc.sub-req
TEMPLATES += top/pcdsBeckhoffApp/Db/_APPNAME_-ioc.sub-arch
TEMPLATES += top/pcdsBeckhoffApp/Db/iocAdmin.substitutions
TEMPLATES += top/pcdsBeckhoffApp/Db/Bx9000.substitutions

TEMPLATES += top/pcdsBeckhoffApp/src/Makefile
TEMPLATES += top/pcdsBeckhoffApp/src/_APPNAME_Main.cpp

TEMPLATES += top/pcdsBeckhoffApp/configure/RELEASE

# pcdsBeckhoffBoot - based on lclsBoot.  Will copy 'iocBoot' (and st.cmd!)
# into INSTALL_LOCATION if you aren't building in your development
# directory.

TEMPLATES += top/pcdsBeckhoffBoot/Makefile

TEMPLATES += top/pcdsBeckhoffBoot/ioc/Makefile@Common

TEMPLATES += top/pcdsBeckhoffBoot/ioc/st.cmd@Common
TEMPLATES += top/pcdsBeckhoffBoot/ioc/st.cmd@RTEMS

TEMPLATES += top/pcdsBeckhoffBoot/ioc/startup.cmd@Common
TEMPLATES += top/pcdsBeckhoffBoot/ioc/startup.cmd@RTEMS

TEMPLATES += top/pcdsBeckhoffBoot/ioc/README@Common

TEMPLATES += top/pcdsBeckhoffBoot/ioc/_IOC_.sub-arch
TEMPLATES += top/pcdsBeckhoffBoot/ioc/_IOC_.sub-req

######################################################################
# PCDS templates: 'pcdsSerialApp' and 'pcdsSerialBoot'.
# Author: Bruce Hill
######################################################################

# pcdsSerialApp - Basic pcds IOC including autosave, iocAdmin, and EVR

TEMPLATES += top/pcdsSerialApp/Makefile

TEMPLATES += top/pcdsSerialApp/Db/Makefile
TEMPLATES += top/pcdsSerialApp/Db/_APPNAME_-ioc.sub-arch
TEMPLATES += top/pcdsSerialApp/Db/_APPNAME_-ioc.sub-req
TEMPLATES += top/pcdsSerialApp/Db/iocAdmin.substitutions
TEMPLATES += top/pcdsSerialApp/Db/exampleDevice.db
TEMPLATES += top/pcdsSerialApp/Db/exampleDevice.tpl-arch
TEMPLATES += top/pcdsSerialApp/Db/exampleDevice.tpl-req

TEMPLATES += top/pcdsSerialApp/src/Makefile
TEMPLATES += top/pcdsSerialApp/src/_APPNAME_Main.cpp

TEMPLATES += top/pcdsSerialApp/srcProtocol/Makefile
TEMPLATES += top/pcdsSerialApp/srcProtocol/example.proto

TEMPLATES += top/pcdsSerialApp/configure/RELEASE
TEMPLATES += top/pcdsSerialApp/configure/CONFIG_SITE

# pcdsSerialBoot - based on lclsBoot.  Will copy 'iocBoot' (and st.cmd!)
# into INSTALL_LOCATION if you aren't building in your development
# directory.

TEMPLATES += top/pcdsSerialBoot/Makefile

TEMPLATES += top/pcdsSerialBoot/ioc/Makefile@Common

TEMPLATES += top/pcdsSerialBoot/ioc/st.cmd@Common
TEMPLATES += top/pcdsSerialBoot/ioc/st.cmd@RTEMS

TEMPLATES += top/pcdsSerialBoot/ioc/startup.cmd@Common
TEMPLATES += top/pcdsSerialBoot/ioc/startup.cmd@RTEMS

TEMPLATES += top/pcdsSerialBoot/ioc/README@Common
TEMPLATES += top/pcdsSerialBoot/ioc/README@RTEMS

TEMPLATES += top/pcdsSerialBoot/ioc/_IOC_.sub-arch
TEMPLATES += top/pcdsSerialBoot/ioc/_IOC_.sub-req

######################################################################
# PCDS templates: 'pcdsTemplateIocApp' and 'pcdsIocTemplateBoot'.
# Author: Bruce Hill
######################################################################

# pcdsTemplateIocApp - Basic pcds IOC including autosave and iocAdmin

TEMPLATES += top/pcdsTemplateIocApp/Makefile
TEMPLATES += top/pcdsTemplateIocApp/Db/Makefile
TEMPLATES += top/pcdsTemplateIocApp/Db/_APPNAME_-ioc.sub-arch
TEMPLATES += top/pcdsTemplateIocApp/Db/_APPNAME_-ioc.sub-req
TEMPLATES += top/pcdsTemplateIocApp/Db/iocAdmin.substitutions
TEMPLATES += top/pcdsTemplateIocApp/configure/RELEASE
TEMPLATES += top/pcdsTemplateIocApp/src/Makefile
TEMPLATES += top/pcdsTemplateIocApp/src/_APPNAME_Main.cpp


# pcdsTemplateIocBoot - Generate a sample parent templated ioc

TEMPLATES += top/pcdsTemplateIocBoot/Makefile

TEMPLATES += top/pcdsTemplateIocBoot/ioc/Makefile@Common

TEMPLATES += top/pcdsTemplateIocBoot/ioc/st.cmd@Common
TEMPLATES += top/pcdsTemplateIocBoot/ioc/st.cmd@RTEMS

TEMPLATES += top/pcdsTemplateIocBoot/ioc/startup.cmd@Common
TEMPLATES += top/pcdsTemplateIocBoot/ioc/startup.cmd@RTEMS

TEMPLATES += top/pcdsTemplateIocBoot/ioc/README@Common

TEMPLATES += top/pcdsTemplateIocBoot/ioc/_IOC_.sub-arch
TEMPLATES += top/pcdsTemplateIocBoot/ioc/_IOC_.sub-req

TEMPLATES += top/pcdsTemplateIocBoot/templates/st.cmd
TEMPLATES += top/pcdsTemplateIocBoot/templates/Makefile
TEMPLATES += top/pcdsTemplateIocBoot/templates/ioc.sub-arch
TEMPLATES += top/pcdsTemplateIocBoot/templates/ioc.sub-req
TEMPLATES += top/pcdsTemplateIocBoot/templates/ioc-sample.cfg

######################################################################
# End of PCDS additions
######################################################################

SCRIPTS_HOST += makeBaseApp.pl

include $(TOP)/configure/RULES

