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
        initialItem:"qrc:/SplashView.qml"
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
            ListElement {name: "DashBorad"; value: "qrc:/DashboardView.qml" }
            ListElement {name: "Add Client"; value: "qrc:/CreateClientView.qml" }
            ListElement {name: "Edit Client"; value: "qrc:/ClientList.qml" }
            ListElement {name: "Find CLient"; value: "qrc:/FindClientView.qml" }
            ListElement {name: "Login"; value: "qrc:/Login.qml" }
            ListElement {name: "Design"; value: "qrc:/Desgin.qml" }
            ListElement {name: "MouseTracking"; value: "qrc:/MouseTracking.qml" }
            ListElement {name: "AddAnimation"; value: "qrc:/AddAnimation.qml" }
            ListElement {name: "Network info"; value: "qrc:/Network.qml" }
            ListElement {name: "Camera Edit"; value: "qrc:/CameraEdit.qml" }
            ListElement {name: "Login"; value: "qrc:/About.qml" }
            ListElement {name: "Photo Editing"; value: "qrc:/PhotoEditing.qml" }
            ListElement {name: "UI"; value: "qrc:/UI.qml" }
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
    Component.onCompleted: contentFrame.replace("qrc:/DashboardView.qml");
}





