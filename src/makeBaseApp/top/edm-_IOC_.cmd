#! /bin/bash

# Setup edm environment
source /reg/g/pcds/setup/epicsenv-3.14.12.sh

edm -x -m "IOC=_IOCPVROOT_" -eolc _APPNAME_Screens/_APPNAME_.edl &
