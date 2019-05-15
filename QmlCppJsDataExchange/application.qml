import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.2
import QtQuick.Extras 1.4

// import qualifier ID has to begin with upper case
import "qrc:/QmlCppJsDataExchange/file_include.js" as LoadedJavaScript

Rectangle {
    id: window
    visible: true
    width: 640
    height: 480

    // setup default parameter
    Component.onCompleted: {
        sliderTimeInterval.value = 0.5
        sliderRuns.value = 5
    }

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

        // Signal handler for rectangleColor change event
        onRectangleColorChanged: {
           console.log("New color of rectangle has been set from C++ application")
        }
    }


    //---------------------------------------------------------------------------------------------------
    //
    //
    ToolSeparator {
        id: toolSeparator
        x: 312
        y: -40
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
        y: 306
        width: 624
        height: 14
        text: qsTr("Elements, that are modified/set by Java Script application:")
        font.pixelSize: 12
    }

    //---------------------------------------------------------------------------------------------------
    //
    //
    Text {
        id: titel1Text
        x: 8
        y: 8
        width: 624
        height: 14
        text: qsTr("Select Java Script file, which should be processd by this application")
        font.pixelSize: 12
    }

    //---------------------------------------------------------------------------------------------------
    // button to load a file
    //
    Button {
        id: buttonSelectJSFile
        x: 246
        y: 43
        text: qsTr("select JavaScript file to run")

        MouseArea {
           anchors.fill: parent
           onClicked: {
              fileDialog.visible = true;
           }
        }

        FileDialog {
            id: fileDialog
            title: "Please choose a file"
            folder: shortcuts.home
            nameFilters: "*.js"
            onAccepted: {
                console.log("You chose: " + fileDialog.fileUrl)
                labelSelectedFile.text = qsTr("selected file: ") + fileDialog.fileUrl;
                LoadedJavaScript.include(fileDialog.fileUrl) // Now you can access the content of the script at path1 via `Script1.functionFromPath1...`

                //-----------------------------------------------------------------------------------
                // hide all figures
                //
                myRectangle1.visible = false
                myRectangle2.visible = false
                myRectangle3.visible = false
                myCircle1.visible = false
                myCircle2.visible = false
                myCircle3.visible = false
            }

            onRejected: {
                console.log("Loading file canceled")
            }

            // hide file dialog
            Component.onCompleted: visible = false
        }
    }

    DelayButton {
        id: delayButtonRunJSFile
        x: 513
        y: 141
        text: qsTr("RUN<br>JS file")

        MouseArea {
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
           onClicked: {
               console.log("Run previously loaded script file...")
               LoadedJavaScript.myJsFunction(comboBoxFigure.currentText, (sliderTimeInterval.value*1000).toFixed(0), sliderRuns.value);
           }
        }
    }

    Label {
        id: labelSelectedFile
        x: 8
        y: 89
        width: 624
        height: 13
        text: qsTr("No *.js file has been selected!")
    }

    Rectangle {
        id: myRectangle1
        x: 166
        y: 364
        width: 40
        height: 40
        color: "#0000ff"
        objectName: "myRectangle1"
    }

    Rectangle {
        id: myRectangle2
        x: 300
        y: 364
        width: 40
        height: 40
        color: "#0000ff"
        objectName: "myRectangle2"
    }

    Rectangle {
        id: myRectangle3
        x: 432
        y: 364
        width: 40
        height: 40
        color: "#0000ff"
        objectName: "myRectangle3"
    }

    Rectangle {
        id: myCircle1
        x: 166
        y: 364
        width: 40
        height: 40
        color: "#ffd500"
        radius: 20
        objectName: "myCircle1"
    }

    Rectangle {
        id: myCircle2
        x: 300
        y: 364
        width: 40
        height: 40
        color: "#ffd500"
        radius: 20
        objectName: "myCircle2"
    }

    Rectangle {
        id: myCircle3
        x: 432
        y: 364
        width: 40
        height: 40
        color: "#ffd500"
        radius: 20
        objectName: "myCircle3"
    }

    Slider {
        id: sliderTimeInterval
        x: 195
        y: 140
        to: 1
        from: 0.1
        stepSize: 0.1
        value: 0.1
        onValueChanged: {
            textIntervalValue.text = value.toFixed(1) + " sec";
        }
    }

    ComboBox {
        id: comboBoxFigure
        x: 14
        y: 173
        width: 121
        height: 40
        currentIndex: 0
        textRole: "key"
        model: ListModel {
            ListElement { key: "Circle"; value: 0 }
            ListElement { key: "Rectangle"; value: 1 }
        }
    }

    Slider {
        id: sliderRuns
        x: 195
        y: 226
        from: 1
        stepSize: 1
        to: 10
        value: 1
        onValueChanged: {
            textRunsValue.text = value;
            console.log("value changed to " + value)
        }
    }

    Text {
        id: textIntervalValue
        x: 401
        y: 153
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Text {
        id: textRunsValue
        x: 401
        y: 239
        width: 23
        height: 14
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Text {
        id: element1
        x: 14
        y: 159
        width: 46
        height: 14
        text: qsTr("Figure")
        font.pixelSize: 12
    }

    Text {
        id: element2
        x: 195
        y: 122
        text: qsTr("Interval")
        font.pixelSize: 12
    }

    Text {
        id: element3
        x: 195
        y: 206
        text: qsTr("Number of runs")
        font.pixelSize: 12
    }

    Text {
        id: runInfo
        x: 554
        y: 306
        text: qsTr("")
        font.pixelSize: 12
    }
}



























