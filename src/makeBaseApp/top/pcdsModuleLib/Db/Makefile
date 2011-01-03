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
# REQ += autosave__APPNAME_.req
REQ += autosave__APPNAME_.template
REQ += autosave__APPNAME_.substitutions

#----------------------------------------------------
# Create and install (or just install)
# Archive files, templates, substitutions like this
# ARCHIVE += archive__APPNAME_.archive
ARCHIVE += archive__APPNAME_.template
ARCHIVE += archive__APPNAME_.substitutions

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

