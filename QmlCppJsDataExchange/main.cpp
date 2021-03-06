//====================================================================================================================//
// File:          main.cpp                                                                                            //
// Description:   C++ application                                                                                     //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
//                                                                                                                    //
//====================================================================================================================//


/*--------------------------------------------------------------------------------------------------------------------*\
** Include files                                                                                                      **
**                                                                                                                    **
\*--------------------------------------------------------------------------------------------------------------------*/
#include <QtWidgets/QApplication>
#include <QtWidgets/QMainWindow>

#include <application.hpp>


//--------------------------------------------------------------------------------------------------------------------//
//                                                                                                                    //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
int main(int argc, char *argv[])
{
   QApplication a(argc, argv);

   //---------------------------------------------------------------------------------------------------
   // This setup is requiered if QtQuick FileDialog should be used error free
   //
   a.setOrganizationName("Some Company");
   a.setOrganizationDomain("somecompany.com");
   a.setApplicationName("Amazing Application");

   //---------------------------------------------------------------------------------------------------
   // Create new C++ application
   //
   CppApplication clCppApplicationT;

   //---------------------------------------------------------------------------------------------------
   //
   //
   return a.exec();
}
