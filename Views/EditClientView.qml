import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
Item {
    Rectangle {
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: "#f4c842"
        Image {
            id: clientIamge
            source: masterController.imagePath
            x:300
            y:30
            width: 350
            height: 300
        }
        MessageDialog {
            id: messageDialog
            icon: StandardIcon.Information
            title: "Information"
            text: "Details Has Been Upadted."
            standardButtons: StandardButton.Ok
        }
        Text {
            id: name
            x:300
            y:10
            text: qsTr("Profile Pic")
        }
    }
    Column {
        spacing: 5

        Text {
            text: "First Name"
        }
        TextField {
            id: clientFirstName
            text: masterController.firstName
        }
        Text {
            text: "Last Name"
        }
        TextField {
            id: clientLastName
            text: masterController.secondName
        }
        Text {
            text: "Email"
        }
        TextField {
            id: email
            text: masterController.email
        }
        Text {
            text: "Phone Number"
        }
        TextField {
            id: pnum
            readOnly: true
            text: masterController.phoneNumber
        }
        Text {
            text: "Officer"
        }
        TextField {
            id: off
            text: masterController.officer
        }
        Row {
            spacing: 5
            Button {
                id:btn
                width: 100
                height: 50
                text:"Update"
                onClicked: {
                    masterController.updateClientData(clientFirstName.text,clientLastName.text,email.text,pnum.text,off.text,masterController.imagePath,masterController.index)
                    clientFirstName.text =clientLastName.text=email.text=pnum.text=off.text="";
                   contentFrame.replace("qrc:/ClientList.qml")
                    messageDialog.open()

                }
            }
            Button {
                id:btn2
                width: 100
                height: 50
                text:"Back"
                onClicked: {
                    contentFrame.replace("qrc:/ClientList.qml")
                    //                        console.log(masterController.imagePath);
                }
            }
        }
    }
}

