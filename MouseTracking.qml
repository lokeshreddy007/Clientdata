import QtQuick 2.0

Item {
    id:allitem
    Rectangle{
        id:rect
        width: 10
        height: 10
        radius: rect.width *0.50
        color: "red"
    }
    MouseArea {
        anchors.fill: parent
        onMouseXChanged: {
            rect.x = mouseX
            rect.y = mouseY
        }
    }
}
