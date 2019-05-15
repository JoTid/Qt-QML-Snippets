//====================================================================================================================//
// File:          application.hpp                                                                                     //
// Description:   C++ application                                                                                     //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
//                                                                                                                    //
//====================================================================================================================//


#ifndef APPLICATION_HPP_
#define APPLICATION_HPP_


/*--------------------------------------------------------------------------------------------------------------------*\
** Include files                                                                                                      **
**                                                                                                                    **
\*--------------------------------------------------------------------------------------------------------------------*/
#include <QtCore/QObject>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlApplicationEngine>
#include <QtCore/QTimer>


//--------------------------------------------------------------------------------------------------------------------//
//                                                                                                                    //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------//
class CppApplication : public QObject
{
   Q_OBJECT

private:
   /*!
    * \brief pclViewP
    * This pointer references to the QML view provided by application
    */
   QQuickView *pclViewP;

   /*!
    * \brief pclViewRootP
    * This pointer is used to access objects of QML view by object name
    */
   QObject *pclViewRootP;

   /*!
    * \brief clRectangelColorP holds actual color of rectangle
    */
   QString clRectangelColorP;

public:
   /*!
    * \brief CppApplication
    */
   CppApplication();



signals:

public slots:
   /*!
    * \brief cppApplicationSlot is used as Cpp SLOT for connection with signal from QML view.
    * \param vtValueV - state of the check box
    */
   void cppApplicationSlot(bool btValueV);

   /*!
    * \brief colorOfRectangle is called as a function from QML file an returns a value
    * \return String value that describes actual color
    */
   QString colorOfRectangle(void);

   /*!
    * \brief cppApplicationFunction is called from QML and updates QML parameters from C++
    * \param btStateV - state of the check box
    */
   void cppApplicationFunction(QString clStringV);

   void msleep(quint16 ms);
};

#endif   // APPLICATION_HPP_
