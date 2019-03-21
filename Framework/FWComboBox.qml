import QtQuick 2.9
import "../Framework"

Rectangle {
    id:comboBox
    width: 51
    height: 32
    border.width: FWTheme.infoArea.groupIconBorderWidth
    border.color: FWTheme.infoArea.groupIconBorderColor
    radius: FWTheme.infoArea.groupIconBorderRadius
    color: FWTheme.infoArea.groupIconBackgroundColor
    property alias imgSource: main_img.source
    signal comboClicked;

        Image {
            id: main_img;
            width: 24
            height: 24
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/Images/ico-user-type-1.png";
        }

        Image {
            id: dropDownImg
            width: 16
            height: 16
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/Images/ico-triangle-open.png"
        }

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                comboClicked()
            }
        }

}
