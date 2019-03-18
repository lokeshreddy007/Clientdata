import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item {
    id: itemparent
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
        id:rootwidth
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
        Colorize {
            anchors.fill: getimage
            source: getimage
            hue: idsliderhue.value
            saturation: idslidersaturation.value
            lightness: idsliderlightness.value
        }
    }
    Row {
        id: roe
        anchors.bottom:  parent.bottom
        anchors.left:  parent.left
        spacing: 20
        Rectangle {
            width: itemparent.width/3
            height: 100
            Column {
                Text {
                    id: huetext
                    color: "plum"
                    text: "hue value : " + idsliderhue.value
                    font.pointSize: 10
                }

                Slider {
                    id: idsliderhue
                    from: -1
                    value: 0
                    stepSize: 0.1
                    to: 1
                    onValueChanged: console.log(idsliderhue.value)
                }
            }
        }

        Rectangle {
            width: itemparent.width/3
            height: 100
            Column {
                Text {
                    id: lightnesstext
                    color: "red"
                    text: "lightness value : " + idsliderlightness.value
                    font.pointSize: 10
                }
                Slider {
                    id: idsliderlightness
                    from: -1
                    value: 0
                    stepSize: 0.1
                    to: 1
                    onValueChanged: console.log(idsliderlightness.value)
                }
            }
        }

        Rectangle{
            width: itemparent.width/3
            height: 100
            Column {
                Text {
                    id: saturationtext
                    color: "blue"
                    text: "saturation value : " + idslidersaturation.value
                    font.pointSize: 10
                }

                Slider {
                    id: idslidersaturation
                    from: -1
                    value: 0
                    stepSize: 0.1
                    to: 1
                    onValueChanged: console.log(idslidersaturation.value)
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
