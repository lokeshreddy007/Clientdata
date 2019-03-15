import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.0

import "componentCreation.js" as MyScript
Item {
    ColorDialog {
        id: colorDialogid
        title: "Please choose a color"
        onAccepted: {
            console.log("You chose: " + colorDialogid.color)
            var colorval =colorDialogid.color
        }
        onRejected: {
            console.log("Canceled")

        }
    }
    Rectangle {
        id: appWindow
        width: parent.width
        height: parent.height
        MouseArea {
            anchors.fill: parent
            onMouseXChanged: {
                MyScript.createSpriteObjects(appWindow,mouseX,mouseY,colorDialogid.color,linewidth.text,lineradius.width)
            }
        }
        Button {
            id:btnClear
            anchors.top:parent.top
            anchors.margins: 5
            anchors.right: parent.right
            text: "Clear"
            onClicked: {
                contentFrame.replace("qrc:/AddAnimation.qml")
            }
        }
        Button {
            id:btnSave
            anchors.top: btnClear.bottom
            anchors.margins: 5
            anchors.right: parent.right
            text : "Save"
            onClicked: {
                console.log("btn clicked")
            }
        }
        Button {
            id:btnColor
            anchors.top: btnSave.bottom
            anchors.margins: 5
            anchors.right: parent.right
            text: "Color"
            onClicked: {
                colorDialogid.open()
            }
        }
        Row {
            id:widthrow
            anchors.top: btnColor.bottom
            anchors.margins: 5
            anchors.right: parent.right
            Button {
                text: "width"
                width: 50
            }
            TextField {
                id: linewidth
                width: 50
                text: "10"

            }
        }
        Row {
            id:radiusrow
            anchors.top: widthrow.bottom
            anchors.margins: 5
            anchors.right: parent.right
            Button {
                text: "radius"
                width: 50
            }
            TextField {
                id: lineradius
                width: 50
                text: "5"

            }
        }
    }

}

