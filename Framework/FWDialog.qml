pragma Singleton
import QtQuick 2.9

Rectangle {
    id: alert
    color: "#EFF3F4"
    height: 136
    y: -136
    property alias icon: alertImg.source
    property alias msg: alertmsg.text
    property alias borderbottom: border.color
    property bool noButtons: false

    function show() {
        alert.state = "show"
    }

    function close() {
        alert.state = "hide"
    }

    states: [
        State {
            name: "show"
            PropertyChanges {
                target: alert
                y: 0
            }
        },

        State {
            name: "hide"
            PropertyChanges {
                target: alert
                y: -136
            }
        }
    ]
    transitions: [
        Transition {
            from: "*"
            to: "*"
            NumberAnimation { properties: "y"; duration: 250 }
        }
    ]

    Image {
        id: alertImg
        width: 34
        height: 34
        anchors.left: parent.left
        anchors.leftMargin: 216
        anchors.top: parent.top
        anchors.topMargin: 26
        source: icon
    }

    Item {
        id: textContainer
        width: parent.width - 392
        height: parent.height
        anchors.left: alertImg.right
        anchors.leftMargin: 30
        Text {
            id: alertmsg
            width: textContainer.width
            anchors.top: parent.top
            anchors.topMargin: 34
            text: msg
            font.family: FWTheme.fontFamily
            font.pixelSize: FWTheme.alertPopup.fontSize
            color: FWTheme.alertPopup.fontColor
            wrapMode: Text.WordWrap
            elide: Text.ElideRight
        }

        FWButton {
            id: confirm
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            text: qsTr("Shift")
            img: "./Images/ico-confirm.png"
            visible: !noButtons
            onButtonClicked: showAlertPopup(0)
        }

        FWButton {
            id: cancel
            anchors.left: confirm.right
            anchors.top: confirm.top
            text: qsTr("Abort")
            img: "./Images/ico-cancel.png"
            visible: !noButtons
            onButtonClicked: showAlertPopup(0)
        }

    }

    Rectangle {
        id: border
        width: parent.width
        height: 8
        anchors.bottom: parent.bottom
        color: borderbottom
    }
}
