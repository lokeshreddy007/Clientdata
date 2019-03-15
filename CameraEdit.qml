import QtQuick 2.5
import QtMultimedia 5.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.0
import "componentCreation.js" as MyScript


Item {
    id: name
    signal clicked
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
        id: root
        width: parent.width
        height: parent.height
        color: "black"

        MouseArea {
            anchors.fill: parent
            onMouseXChanged: {
                MyScript.createSpriteObjects(root,mouseX,mouseY,colorDialogid.color,linewidth.text,lineradius.text)
            }
        }
        VideoOutput {
            anchors.fill: parent
            source: camera
        }
        Camera {
            id: camera
        }
        ListModel {
            id: imagePaths
        }
        ListView {
            id: listView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            height: 100
            orientation: ListView.Horizontal
            spacing: 10
            model: imagePaths
            delegate: Image {
                height: 100
                source: path
                fillMode: Image.PreserveAspectFit
            }
            Rectangle {
                anchors.fill: parent
                anchors.topMargin: -10
                color: "black"
                opacity: 0.5
            }
        }
        Image {
            id: image
            anchors.fill: parent
        }
        Connections {
            target: camera.imageCapture
            onImageSaved: {
                imagePaths.append({"path": "file:///"+path})
                listView.positionViewAtEnd();
            }
        }
        Button {
            id:btnClear
            anchors.top:parent.top
            anchors.margins: 5
            anchors.right: parent.right
            text: "Clear"
            onClicked: {
                contentFrame.replace("qrc:/CameraEdit.qml")
                //                contentFrame.replace("qrc:/ObjectTracking.qml")
            }
        }
        Button {
            id:btnSave
            anchors.top: btnClear.bottom
            anchors.margins: 5
            anchors.right: parent.right
            text : "Save"
            onClicked: {
                camera.imageCapture.capture();
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
