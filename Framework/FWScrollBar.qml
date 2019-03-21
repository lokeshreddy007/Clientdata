import QtQuick 2.9

Item {
    id: placeholder
    anchors {
        top: flickable.top
        bottom: flickable.bottom
    }
    property int borderWidth: 0
    property color borderColor: "black"
    property color scrollerColor: FWTheme.slider.scrollerColor
    property color scrollerColorGrabbed: FWTheme.slider.scrollerColorGrabbed

    visible: flickable.visibleArea.heightRatio < 1.0

    property Flickable flickable: null
    property var style

    Image{
        id: upArrow
        width: 10
        height: 14
        anchors.top: placeholder.top
        source: "qrc:/Images/ico-sort-asc.png"
        visible: placeholder.visible
    }

    Rectangle {
        id: slider
        anchors {
            top: placeholder.top
            topMargin: 14
            bottom: placeholder.bottom
            bottomMargin: 14
        }
        width: FWTheme.slider.width

        radius: FWTheme.slider.radius
        antialiasing: true
        color: FWTheme.slider.backgroundColor
        clip: true


        MouseArea {
            anchors.fill: parent
            onClicked: { } // click preventer
        }

        Binding {
            target: handle
            property: "y"
            value: flickable.contentY * clicker.drag.maximumY / (flickable.contentHeight - flickable.height)
            when: !clicker.drag.active
        }

        Binding {
            target: flickable
            property: "contentY"
            value: handle.y * (flickable.contentHeight - flickable.height) / clicker.drag.maximumY
            when: clicker.drag.active || clicker.pressed
        }

        Rectangle {
            id: handle
            height: Math.max (FWTheme.slider.minimumHandleSize, (flickable.visibleArea.heightRatio * parent.height))

            anchors {
                left: parent.left
                right: parent.right
            }

            border {
                width: placeholder.borderWidth
                color: placeholder.borderColor
            }

            radius: slider.radius

            color: clicker.pressed ? scrollerColorGrabbed : scrollerColor

            MouseArea {
                id: clicker
                anchors.fill: parent

                drag {
                    target: handle
                    minimumY: 0
                    maximumY: slider.height - handle.height
                    axis: Drag.YAxis
                }

                onClicked: {
                    flickable.contentY = mouse.y / slider.height * (flickable.contentHeight - flickable.height)
                }
            }
        }
    }

    Image{
        id: downArrow
        width: 10
        height: 14
        anchors.top: slider.bottom
        source: "qrc:/Images/ico-sort-asc.png"
        visible: placeholder.visible
    }
}
