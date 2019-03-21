import QtQuick 2.9
import QtQuick.Controls 2.4

Item {
    id:wrapper
    Rectangle {
        anchors.fill: parent
        color: "#f4c842"
        Column {
            id:clowrapper
            spacing: 5
            Repeater {
                model: masterController.clientsAll
                Text {
                    id:textall
                    font.pointSize: 20
                    text:  modelData/*+ ' index postion at  (' + index + ')'*/
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            // calling the c++ function to get particualr index row values

                            masterController.getOneClientData(index)
                            contentFrame.replace("qrc:/EditClientView.qml")
                        }
                    }
                }
            }
        }
    }
    Component.onCompleted: masterController.displayClientData()

}
