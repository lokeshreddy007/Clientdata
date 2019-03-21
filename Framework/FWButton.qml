import QtQuick 2.9
import "../Framework"

Rectangle {
    id: rectbox
    width: btnText.width + btnImg.width + 32
    height: FWTheme.button.height
    radius: FWTheme.button.borderCornerRadius
    color: FWTheme.button.backgroundColorNormal
    border.width: FWTheme.button.borderWidth
    border.color: FWTheme.button.borderColorNormal
    opacity: inActive ? FWTheme.button.opacityInactive : FWTheme.button.opacityActive
    property alias text: btnText.text
    property alias img: btnImg.source
    property bool inActive: false
    signal buttonClicked()

    Image {
        id: btnImg
        width: FWTheme.button.iconSize
        height: FWTheme.button.iconSize
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        source: img
        opacity: inActive ? FWTheme.button.opacityInactive : FWTheme.button.opacityActive
    }

    Text {
        id: btnText
        anchors.left: btnImg.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: text
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.button.fontSize
        font.weight: FWTheme.button.fontWeight
        color: FWTheme.button.fontColorNormal
        opacity: inActive ? FWTheme.button.opacityInactive : FWTheme.button.opacityActive
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: buttonClicked()
        onPressed: rectbox.color = FWTheme.button.backgroundColorPressed
        onReleased: rectbox.color = FWTheme.button.backgroundColorNormal
        enabled: !inActive
        onEntered: {
            rectbox.color = FWTheme.button.backgroundColorMouseOver
        }
        onExited: {
            rectbox.color = FWTheme.button.backgroundColorNormal
        }
    }

}

