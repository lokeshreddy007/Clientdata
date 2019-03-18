import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item {
    id:itemparent
    FileDialog {
        id: fileDialog
        nameFilters: [ "Image files (*.png *.jpg)" ]
        onAccepted: {
            console.log("Accepted: " + fileUrls)
            getimage.source = fileUrl
        }
        onRejected: { console.log("Rejected") }
    }
    Rectangle {
        id: rootwidth
        width: parent.width
        height: parent.height

        Image {
            id: getimage
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: itemparent.width
            height: itemparent.height-200
        }
        BrightnessContrast {
            anchors.fill: getimage
            source: getimage
            brightness: idsliderbrightness.value
            contrast: idslidercontrast.value
        }
    }
    Row {
        id: roe
        anchors.bottom:  parent.bottom
        anchors.left:  parent.left
        spacing: 20

        Rectangle {
            width: itemparent.width/2
            height: 100
            border.color: "red"
            border.width: 4
            Column {
                Text {
                    id: brightnesstext
                    color: "plum"
                    text: "brightness value : " + idsliderbrightness.value
                    font.pointSize: 20
                }

                Slider {
                    id: idsliderbrightness
                    width: itemparent.width/2
                    from: -1
                    value: 0
                    stepSize: 0.1
                    to: 1
                    onValueChanged: console.log(idsliderbrightness.value + "the width" + itemparent.width)
                }
            }
        }
        Rectangle {
            width:  itemparent.width/2
            height: 100
            border.color: "red"
            border.width: 4
            Column {
                Text {
                    id: contrasttext
                    color: "plum"
                    text: "Contrast value : " + idslidercontrast.value
                    font.pointSize: 20
                }

                Slider {
                    id: idslidercontrast
                    width: itemparent.width/2
                    from: -1
                    value: 0
                    stepSize: 0.1
                    to: 1
                    onValueChanged: console.log(idslidercontrast.value)
                }
            }
        }
    }

    Button {
        id: imageopen
        text: "open Image"
        anchors.top: parent.top
        anchors.right: parent.right
        onClicked: {
            fileDialog.open()
        }
    }
    Button {
        text: "Save"
        anchors.top: imageopen.bottom
        anchors.topMargin: 5
        anchors.right: parent.right
        onClicked: {
            console.log("click...")
        }
    }
}


