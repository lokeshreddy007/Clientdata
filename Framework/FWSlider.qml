import QtQuick 2.9
import QtQuick.Controls 1.2

Item {
    id: accessimageholder
    width: 81
    height: 16
    property int viewindex: 0
    property string accessLevel: ""

    Image {
        id: positionGray50
        width: parent.width/2 - 2
        height: 3
        anchors.left: parent.left
        anchors.leftMargin: 2
        opacity: accessLevel === "readOnly" ? 0.5 : 1
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/slider-position-grey.png"
    }

    Image {
        id: positionGray100
        width: parent.width/2 - 2
        height: 3
        anchors.right: parent.right
        anchors.rightMargin: 2
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/slider-position-grey.png"
    }

    Button
    {
        width: 3
        height: 11
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.verticalCenter: parent.verticalCenter
        visible: !(accessLevel === "readOnly")
        onClicked: interactimg.x = 0
        enabled: !(accessLevel === "readOnly")
        Image {
            id: noAccess
            anchors.fill: parent
            source: accessLevel === "readOnly" ? "qrc:/Images/slider-position-grey.png" : "qrc:/Images/slider-position-blue.png"
        }
    }

    Button
    {
        width: 3
        height: 11
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onClicked: interactimg.x = 34
        Image {
            id: view
            anchors.fill: parent
            source: interactimg.x < 34 ? "qrc:/Images/slider-position-grey.png" : "qrc:/Images/slider-position-blue.png"
        }
    }

    Button
    {
        width: 3
        height: 11
        anchors.right: parent.right
        anchors.rightMargin: 2
        anchors.verticalCenter: parent.verticalCenter
        onClicked: interactimg.x = 68
        Image {
            id: interact
            anchors.fill: parent
            source: interactimg.x < 68 ? "qrc:/Images/slider-position-grey.png" : "qrc:/Images/slider-position-blue.png"
        }
    }


    Image {
        id: blueslider
        width: accessLevel === "readOnly" ? interactimg.x - 34 : interactimg.x + 3
        height: 3
        x: accessLevel === "readOnly" ? 41 : 3
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/slider-position-blue.png"
    }


    Image {
        id: interactimg
        width: 15
        height: 15
        anchors.top: parent.top
        x: accessLevel === "none" ? 0 : accessLevel === "readOnly" ? 34 : 68
        verticalAlignment: Image.AlignVCenter
        source: "qrc:/Images/slider-knob.png"
        MouseArea {
            id:dragArea
            anchors.fill:parent
            drag.target: interactimg
            drag.axis: Drag.XAxis
            drag.minimumX: accessLevel === "readOnly" ? 34 : 0
            drag.maximumX: 68
        }
    }

}

