import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4

Window {
    visible: true
    width: 800
    height: 560
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
        initialItem:"qrc:/Views/SplashView.qml"
    }
    Rectangle {
        id: navigationBar
        width: 100
        color: "#ffffff"
        anchors.top: parent.top
        anchors.topMargin: -30
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        ListModel {
            id: classModel
            ListElement {name: "FW Elements"; value: "qrc:/Views/FWElements.qml" }
            ListElement {name: "DashBorad"; value: "qrc:/Views/DashboardView.qml" }
            ListElement {name: "Add Client"; value: "qrc:/Views/CreateClientView.qml" }
            ListElement {name: "Edit Client"; value: "qrc:/Views/ClientList.qml" }
            ListElement {name: "Find CLient"; value: "qrc:/Views/FindClientView.qml" }
            ListElement {name: "Login"; value: "qrc:/Views/Login.qml" }
            ListElement {name: "Design"; value: "qrc:/Views/Desgin.qml" }
            ListElement {name: "MouseTracking"; value: "qrc:/Views/MouseTracking.qml" }
            ListElement {name: "AddAnimation"; value: "qrc:/Views/AddAnimation.qml" }
            ListElement {name: "Network info"; value: "qrc:/Views/Network.qml" }
            ListElement {name: "Camera Edit"; value: "qrc:/Views/CameraEdit.qml" }
            ListElement {name: "Login"; value: "qrc:/Views/About.qml" }
            ListElement {name: "Photo Editing"; value: "qrc:/Views/PhotoEditing.qml" }
            ListElement {name: "UI"; value: "qrc:/Views/UI.qml" }
            ListElement {name: "Quit"; value: "Qt.quit()" }
        }

        Component {
            id: myDelegate
            Button {
                id: btndelegate
                text: model.name
                onClicked: {
                    if(model.value === "Qt.quit()") {
                        Qt.quit()
                    }
                    else {
                        contentFrame.replace(model.value)
                    }
                }
            }
        }
        ListView {
            anchors.fill: parent
            anchors.topMargin: 30
            model: classModel
            delegate: myDelegate
        }
    }
    Component.onCompleted: contentFrame.replace("qrc:/Views/DashboardView.qml");
}





