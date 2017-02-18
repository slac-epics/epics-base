#!$$IOCTOP/bin/linux-x86_64/unixCam$$PDV_VERSION

epicsEnvSet("IOCNAME", "$$IOCNAME")
epicsEnvSet("ENGINEER", "$$ENGINEER" )
epicsEnvSet("LOCATION", "$$LOCATION" )
epicsEnvSet("IOCSH_PS1", "$(IOCNAME)> " )
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "$$IF(MAX_ARRAY,$$MAX_ARRAY,8000000)" )
epicsEnvSet("STREAM_PROTOCOL_PATH", "db" )
epicsEnvSet("IOC_PV", "$$IOC_PV")
epicsEnvSet("IOCTOP", "$$IOCTOP")

< $(IOCTOP)/iocBoot/ioc/cameraDefs
< $(IOCTOP)/iocBoot/ioc/envPaths
< envPaths
epicsEnvSet("TOP", "$$TOP")
cd( "$(IOCTOP)" )

# Run common startup commands for linux soft IOC's
< /reg/d/iocCommon/All/pre_linux.cmd

# Load EPICS database definition
dbLoadDatabase("dbd/unixCam.dbd",0,0)

# Register all support components
unixCam_registerRecordDeviceDriver(pdbbase)

# Initialize debug variables
var IMAGE_REDUCE_DEBUG $$IF(IMAGE_REDUCE_DEBUG,$$IMAGE_REDUCE_DEBUG,0)
var EDT_UNIX_DEV_DEBUG $$IF(EDT_UNIX_DEV_DEBUG,$$EDT_UNIX_DEV_DEBUG,0)
var DEBUG_HI_RES_TIME 0
ErDebugLevel( 0 )

$$LOOP(EXTRA)
$$IF(INITTIME)
$$INCLUDE(NAME)
$$ENDIF(INITTIME)
$$ENDLOOP(EXTRA)

## Load EPICS records
$$LOOP(EVR)
dbLoadRecords( $(EVRDB_$$TYPE), "IOC=$(IOC_PV),EVR=$$(NAME)$$LOOP(CAMERA),CAM$$INDEX=$$NAME$$IF(TRIG),TU$$INDEX=$$NAME:TRIGGER_DELAY,IP$$(TRIG)E=Enabled$$ENDIF(TRIG)$$ENDLOOP(CAMERA)" )
$$ENDLOOP(EVR)

$$LOOP(CAMERA)
$$IF(TRIG)
dbLoadRecords( "db/camdelay.db", "CAM=$$NAME,EVR=$$EVRNAME,TRIGGER=$$TRIG,BAUDRATE=$(CAMERA_BAUD_$$TYPE)")
$$ENDIF(TRIG)
$$IF(DROPLET)
dbLoadRecords( "db/droplet.db", "CAM=$$NAME,N=$$DROPLET")
$$ENDIF(DROPLET)
$$ENDLOOP(CAMERA)

# Initialize the cameras
$$LOOP(CAMERA)
$$IF(NOINIT)
$$ELSE(NOINIT)
$$IF(TRIG)
epicsCamInit( "$$NAME", $$BOARD, $$CHAN, "$(EDT_UNIX)/camera_config/$(CAMERA_CFG_$$IF(CFG,$$CFG,$$TYPE))", "$$EVRNAME:Triggers.$$TRANSLATE(TRIG,"0123456789AB","ABCDEFGHIJKL")", $(CAMERA_SKIP_$$TYPE), "$$NAME:TRIGGER_DELAY" )
$$ELSE(TRIG)
epicsCamInit( "$$NAME", $$BOARD, $$CHAN, "$(EDT_UNIX)/camera_config/$(CAMERA_CFG_$$IF(CFG,$$CFG,$$TYPE))")
$$ENDIF(TRIG)
$$ENDIF(NOINIT)
$$ENDLOOP(CAMERA)

# Enable sleep() calls as needed to diagnose startup errors
epicsThreadSleep( 5.0 )

$$LOOP(EVR)
# Initialize EVR
ErConfigure( 0, 0, 0, 0, $(EVRID_$$TYPE) )
$$ENDLOOP(EVR)

## Load EPICS records
dbLoadRecords( "db/iocAdmin.db",		   "IOC=$(IOC_PV)" )
dbLoadRecords( "db/save_restoreStatus.db", "IOC=$(IOC_PV)" )

$$LOOP(CAMERA)
$$IF(ASYNTRACE)
asynSetTraceIOMask(	"$$NAME", 0, 2 )
asynSetTraceMask(	"$$NAME", 0, 9 )
$$ENDIF(ASYNTRACE)
$$IF(TRIG)
dbLoadRecords( $(CAMERA_DB_$$TYPE),	 "CAM=$$NAME,TS_EVENT=$$EVRNAME:Triggers.$$TRANSLATE(TRIG,"0123456789AB","ABCDEFGHIJKL")$$IF(FAST_FLNK),FAST_FLNK=$$FAST_FLNK$$ELSE(FAST_FLNK)$$IF(DOPRJ),FAST_FLNK=$$NAME:IMAGE:DoPrj$$ENDIF(DOPRJ)$$ENDIF(FAST_FLNK),BOARD=$$BOARD,CHAN=$$CHAN,TRIG=$$TRIG,EVR=$$EVRNAME" )
$$IF(DOPRJ)
dbLoadRecords( "db/doprj.db"		"CAM=$$NAME")
$$IF(BLDID)
dbLoadRecords( "db/bldSettings.db", "IOC=$(IOC_PV):B$$INDEX,BLDNO=$$INDEX" )
$$ENDIF(BLDID)
$$ENDIF(DOPRJ)
$$ELSE(TRIG)
dbLoadRecords( $(CAMERA_DB_$$TYPE),      "CAM=$$NAME,TS_EVENT=140" )
$$ENDIF(TRIG)
$$ENDLOOP(CAMERA)

$$LOOP(EXTRA)
$$IF(LOADTIME)
$$INCLUDE(NAME)
$$ENDIF(LOADTIME)
$$ENDLOOP(EXTRA)

# Setup autosave
set_savefile_path( "$(IOC_DATA)/$(IOC)/autosave" )
set_requestfile_path( "$(TOP)/autosave" )
save_restoreSet_status_prefix( "$(IOC_PV):" )

save_restoreSet_IncompleteSetsOk( 1 )
save_restoreSet_DatedBackupFiles( 1 )

set_pass0_restoreFile( "$(IOCNAME).sav" )
set_pass1_restoreFile( "$(IOCNAME).sav" )

# Initialize the IOC and start processing records
iocInit()

# Start autosave backups
create_monitor_set( "$(IOCNAME).req", 5, "IOC=$(IOC_PV),EVR=$$EVRNAME0" )

$$LOOP(CAMERA)
$$IF(DOPRJ)
dbpf $$NAME:CMPX_COL.PROC 1
dbpf $$NAME:CMPX_ROW.PROC 1

$$IF(BLDID)
SpectroBLD($$BLDID, 72)
BldSetID($$INDEX)
BldConfig( "239.255.24.$$BLDID", 10148, 8192, 0, $$BLDID, 72, "$$NAME:CURRENTFID", "$$NAME:BLDNEXT", "$$NAME:CURRENTFID", "$$NAME:IMAGE_CMPX:HPrj,$$NAME:IMAGE_CMPX:VPrj" )
BldSetDebugLevel(1)
# Uncomment the next line for BLD generation.
$$(NOBLD)BldStart()
BldShowConfig()
$$ENDIF(BLDID)
$$ENDIF(DOPRJ)
$$ENDLOOP(CAMERA)

$$LOOP(EXTRA)
$$IF(FINISHTIME)
$$INCLUDE(NAME)
$$ENDIF(FINISHTIME)
$$ENDLOOP(EXTRA)

# Run the post startup script
< /reg/d/iocCommon/All/post_linux.cmd
