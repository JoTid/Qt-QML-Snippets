//====================================================================================================================//
// File:          application.cpp                                                                                     //
// Description:   C++ application                                                                                     //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
//                                                                                                                    //
//====================================================================================================================//


/*--------------------------------------------------------------------------------------------------------------------*\
** Include files                                                                                                      **
**                                                                                                                    **
\*--------------------------------------------------------------------------------------------------------------------*/
#include "application.hpp"


//--------------------------------------------------------------------------------------------------------------------//
//                                                                                                                    //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
CppApplication::CppApplication()
{
   //---------------------------------------------------------------------------------------------------
   // create new Quick View
   //
   pclViewP = new QQuickView();

   //---------------------------------------------------------------------------------------------------
   // 1) Provide the C++ class/object to the QML,
   //    That have to be done before assigning of QML file, so QML knows all slots of the class.
   //
   pclViewP->rootContext()->setContextProperty("CppApplication", this);

   //---------------------------------------------------------------------------------------------------
   // 2) assign QML file to the view
   //
   pclViewP->setSource(QUrl("qrc:/application.qml"));

   //---------------------------------------------------------------------------------------------------
   // 3) Get root object of QML file, that works only if the root object is an item, not a window
   //
   pclViewRootP = pclViewP->rootObject();


   //---------------------------------------------------------------------------------------------------
   // if root object is valid, than perform a connect
   //
   if (pclViewRootP != nullptr)
   {
      //-------------------------------------------------------------------------------------------
      // Connect the SIGNAL from QML application with the SLOT of the C++ application
      //
      connect(pclViewRootP,   SIGNAL(signalFromQmlApplication(bool)),
              this,           SLOT(cppApplicationSlot(bool)));
   } else
   {
      qWarning() << "Fail to get root Object of provided QML file!";
   }

   //---------------------------------------------------------------------------------------------------
   // show the loaded QML view
   //
   pclViewP->show();
}


//--------------------------------------------------------------------------------------------------------------------//
// This function is called from QML and updates QML parameters from C++                                               //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
void CppApplication::cppApplicationFunction(QString clStringV)
{
   //---------------------------------------------------------------------------------------------------
   // Simple print the string provided by QML
   //
   qDebug() << "QML provides new string to C++ application: " + clStringV;

}


//--------------------------------------------------------------------------------------------------------------------//
// This SLOT is connected to a QML SIGNAL                                                                             //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
void CppApplication::cppApplicationSlot(bool btStateV)
{
   //---------------------------------------------------------------------------------------------------
   // Evaluate provided data from QML and set new for QML, that will be provided a return in
   // colorOfRectangle().
   //
   if (btStateV == true)
   {
      clRectangelColorP = "green";
   } else {
      clRectangelColorP = "red";
   }

   //---------------------------------------------------------------------------------------------------
   // access parameter of an QML Item
   //
   QObject *pclViewParameterT = pclViewRootP->findChild<QObject*>("myParameter");
   if (pclViewParameterT != nullptr)
   {
      //-------------------------------------------------------------------------------------------
      // set new value to the 'rectangleColor' of 'myParameter' item
      //
      // Alternatively the 'color' parameter can be accessed directly via 'myRectangle' child!
      //
      pclViewParameterT->setProperty("rectangleColor", clRectangelColorP);
   } else
   {
      qDebug() << "Fail to get child 'myParameter' of QML root parameter";
   }
}

//--------------------------------------------------------------------------------------------------------------------//
//                                                                                                                    //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
QString CppApplication::colorOfRectangle()
{
   return clRectangelColorP;
}

