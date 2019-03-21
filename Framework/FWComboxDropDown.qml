import QtQuick 2.9
import "../Framework"

Rectangle {
    id: root
    height:0;
    clip:true;
    anchors.margins: 2
    border.width: FWTheme.infoArea.groupIconBorderWidth
    border.color: FWTheme.infoArea.groupIconBorderColor
    radius: FWTheme.infoArea.groupIconBorderRadius
    color: FWTheme.infoArea.groupIconBackgroundColor
    property string selectedItem: listView.model[listView.currentIndex].img
    property alias viewModel: listView.model

    ListView {
        id: listView
        height:32 * viewModel.length
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        currentIndex: 0;


        delegate: Item{
            width: root.width;
            height: 32
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: modelData.img
            }

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    root.state = ""
                    listView.currentIndex = index;
                }
            }
        }
    }
    states: State {
        name: "show";
        PropertyChanges { target: root; height:32 * viewModel.length }
    }

    transitions: Transition {
        NumberAnimation { target: root; properties: "height"; easing.type: Easing.OutExpo; duration: 250 }
    }
}


