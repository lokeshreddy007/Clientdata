import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
//import QtWebEngine 1.8

Window {
    visible: true
    width: 800
    height: 520
    title: qsTr("CM PRO")
    StackView {
        id: contentFrame
        clip: true
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: navigationBar.right
        }
        initialItem:"qrc:/SplashView.qml"
    }
    Rectangle {
        id: navigationBar
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        Component.onCompleted: contentFrame.replace("qrc:/DashboardView.qml");
        Item {
            id: name
            Column {
                Button {
                    text: "Dashboard"
                    width: 130
                    onClicked:
                        contentFrame.replace("qrc:/DashboardView.qml")
                }
                Button {
                    text:"Add Client"
                    width: 130
                    onClicked:contentFrame.replace("qrc:/CreateClientView.qml")
                }
                Button {
                    text: "Edit Client List"
                    width: 130
                    onClicked:contentFrame.replace("qrc:/ClientList.qml")
                }
                Button {
                    text: "Find Client"
                    width: 130
                    onClicked:contentFrame.replace("qrc:/FindClientView.qml")
                }
                Button {
                    text: "Client List"
                    width: 130
                    onClicked:contentFrame.replace("qrc:/About.qml")
                }
                Button {
                    text: "Login"
                    width: 130
                    onClicked:contentFrame.replace("qrc:/Login.qml")
                }
                Button {
                    text: "Design"
                    width: 130
                    onClicked:contentFrame.replace("qrc:/Desgin.qml")
                }
                Button {
                    text: "MouseTracking"
                    width: 130
                    onClicked: contentFrame.replace("qrc:/MouseTracking.qml")
                }
                Button {
                    text: "AddAnimation"
                    width: 130
                    onClicked: contentFrame.replace("qrc:/AddAnimation.qml")
                }
                Button {
                    text: "Network info"
                    width: 130
                    onClicked: contentFrame.replace("qrc:/Network.qml")
                }
                Button {
                    text: "Camera Edit"
                    width: 130
                    onClicked: contentFrame.replace("qrc:/CameraEdit.qml")
                }

                Button {
                    text: "Quit"
                    width: 130
                    onClicked: Qt.quit()
                }
            }
        }
        width: 100
        color: "#000000"
    }
}





