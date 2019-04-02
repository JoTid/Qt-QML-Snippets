import QtQuick 2.9
import QtQuick.Controls 2.3

Rectangle {
    id: window
    visible: true
    width: 640
    height: 480

    //---------------------------------------------------------------------------------------------------
    // Declaration of a SIGNAL that can be connected within C++ application to a C++ SLOT.
    // Calling this function within QML causes a SIGNAL.
    //
    signal signalFromQmlApplication(bool btStateV)


    //---------------------------------------------------------------------------------------------------
    // this item holds use defined parameter 'rectangleColor' that is accessible from C++
    //
    Item {
        id: myParameter
        objectName: "myParameter"

        property string rectangleColor: ""

        onRectangleColorChanged: {
           console.log("New color of rectangle has been set from C++ application")
           myRectangle.color = rectangleColor;
        }
    }


    //---------------------------------------------------------------------------------------------------
    // rectangle demonstrates parameter changes from C++
    //
    Rectangle {
        id: myRectangle
        objectName: "myRectangle"

        x: 310
        y: 376
        width: 40
        height: 40
        color: "blue"
    }

    //---------------------------------------------------------------------------------------------------
    // text attribute of myLabel will be set by return value of a C++ function, at click on CheckBox
    //
    Label {
        id: mylabel
        x: 310
        y: 314
        width: 40
        height: 13
        text: "This label will be set by C++ function call from QML";
    }

    //---------------------------------------------------------------------------------------------------
    // use CheckBox to emit a SIGNAL
    //
    CheckBox {
        id: myCheckBox
        x: 246
        y: 109
        width: 215
        height: 40
        text: qsTr("Generate signal for C++")

        //-------------------------------------------------------------------------------------------
        // handle click event
        //
        onClicked:{
            // trigger SIGNAL, that is connected to a SLOT of C++ application,
            // connection is performed within CppApplication::CppApplication()
            window.signalFromQmlApplication(myCheckBox.checked)

            // provide a value to C++ application by calling its function
            CppApplication.cppApplicationFunction("chek state changes to " + myCheckBox.checked);

            // get return value from C++ application
            mylabel.text = "color provided by C++: " + CppApplication.colorOfRectangle();
        }
    }

    //---------------------------------------------------------------------------------------------------
    //
    //
    ToolSeparator {
        id: toolSeparator
        x: 312
        y: -80
        width: 16
        height: 640
        rotation: 90
    }

    //---------------------------------------------------------------------------------------------------
    //
    //
    Text {
        id: element
        x: 8
        y: 254
        width: 624
        height: 14
        text: qsTr("Elements, that set by the C++ for QML application:")
        font.pixelSize: 12
    }

    //---------------------------------------------------------------------------------------------------
    //
    //
    Text {
        id: element1
        x: 8
        y: 8
        width: 624
        height: 14
        text: qsTr("Elements, that provide signals and data from QML to the C++ application:")
        font.pixelSize: 12
    }
}

























