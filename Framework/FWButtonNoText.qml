import QtQuick 2.9
import "../Framework"

Rectangle {
    width: 34
    height: 34
    border.width: 1
    border.color: "#C0C0C0"
    radius: 3
    color: "#EFF3F4"
    property alias icon: iconImg.source
    property int iconLeftMargin: 0
    signal buttonClicked()

    Image {
        id: iconImg
        width: FWTheme.button.iconSize
        height: FWTheme.button.iconSize
        anchors.centerIn: parent
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.left: parent.left
//        anchors.leftMargin: iconLeftMargin
        source: icon
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: buttonClicked()
        onPressed: parent.color = FWTheme.button.backgroundColorPressed
        onReleased: parent.color = FWTheme.button.backgroundColorNormal
        onEntered: {
            parent.color = FWTheme.button.backgroundColorMouseOver
        }
        onExited: {
            parent.color = FWTheme.button.backgroundColorNormal
        }
    }
}

