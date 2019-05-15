#=============================================================================#
# File:          QmlCppJsDataExchange.pro                                     #
# Description:   This project shows data exchange between QML and Cpp and JS  #
#=============================================================================#


#---------------------------------------------------------------
# Name of QMake project
#
QMAKE_PROJECT_NAME = "QML Cpp JS Data Exchange"

#---------------------------------------------------------------
# template type
# app   if you want run plugin standalone in a QWidget
# lib   final library, which have to be loaded by an app
#
TEMPLATE = app

#---------------------------------------------------------------
# Qt modules used
#
QT      += core widgets quick

#---------------------------------------------------------------
# version of the application
#
VERSION_MAJOR = 0
VERSION_MINOR = 80
VERSION_BUILD = 0

#---------------------------------------------------------------
# Target version
#
VERSION = $${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_BUILD}


#---------------------------------------------------------------
# definitions for preprocessor
#
DEFINES += "VERSION_MAJOR=$$VERSION_MAJOR"\
           "VERSION_MINOR=$$VERSION_MINOR"\
           "VERSION_BUILD=$$VERSION_BUILD"

#---------------------------------------------------------------
# target file name
#
TARGET      = QmlCppJsDataExchange

#---------------------------------------------------------------
# root directory corresponding to this project
#
ROOT_DIR    = ./..

#---------------------------------------------------------------
# directory for target file
#
DESTDIR     = $${ROOT_DIR}/bin

#---------------------------------------------------------------
# Objects directory
#
OBJECTS_DIR = $${ROOT_DIR}/objs/QmlCppJsDataExchange
MOC_DIR     = $${ROOT_DIR}/objs/QmlCppJsDataExchange
UI_DIR      = $${ROOT_DIR}/objs/QmlCppJsDataExchange

#---------------------------------------------------------------
# project configuration and compiler options
#
CONFIG += debug_and_release
CONFIG += plugin
CONFIG += warn_on
CONFIG += C++17
CONFIG += silent

#---------------------------------------------------------------
# UI files
#
FORMS   =

#---------------------------------------------------------------
# resource collection files
#
RESOURCES = application.qrc

#---------------------------------------------------------------
# include directory search path
#
INCLUDEPATH  = .

#---------------------------------------------------------------
# search path for source files
#
VPATH  = .

#---------------------------------------------------------------
# header files of project
#
HEADERS =   application.hpp

#---------------------------------------------------------------
# source files of project
#
SOURCES +=  application.cpp \
            main.cpp


#OTHER_FILES  =  application.qml
#OTHER_FILES +=  file_include.js

#---------------------------------------------------------------
# OS specific settings
#
macx {
   message("Building '$$QMAKE_PROJECT_NAME' for Mac OS X ...")
   QMAKE_MAC_SDK = macosx10.12
   QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.9
}

win32 {
   CONFIG(debug, debug|release) {
      message("Building '$$QMAKE_PROJECT_NAME' DEBUG version $$VERSION for Windows ...")
   } else {
      message("Building '$$QMAKE_PROJECT_NAME' RELEASE version $$VERSION for Windows ...")
      #DEFINES += QT_NO_WARNING_OUTPUT
      #DEFINES += QT_NO_DEBUG_OUTPUT
   }
}


