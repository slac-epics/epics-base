TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install)
# databases, templates, substitutions like this
# DB += _APPNAME_.db
DB += _APPNAME_.template
DB += _APPNAME_.substitutions

#----------------------------------------------------
# Create and install (or just install)
# Autosave request files, templates, substitutions like this
# REQ += autosave_APPNAME_.req
REQ += _APPNAME_.tpl-req

#----------------------------------------------------
# Create and install (or just install)
# Archive files, templates, substitutions like this
# ARCHIVE += archive_APPNAME_.archive
ARCHIVE += _APPNAME_.tpl-arch

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

