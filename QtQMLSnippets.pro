#=============================================================================#
# File:          QtQMLSnippets.pro                                            #
# Description:   Qt QML Snippets                                              #
#=============================================================================#

#---------------------------------------------------------------
# Name of QMake project
#
QMAKE_PROJECT_NAME = "Qt QML Snippets"

#---------------------------------------------------------------
# template type: run qmake projects in sub-directories
#
TEMPLATE = subdirs

#---------------------------------------------------------------
# list of sub directories
# The order in which the directories are specified is also the order in
# which the corresponding projects are created.
#
SUBDIRS  = ./QmlCppDataExchange
