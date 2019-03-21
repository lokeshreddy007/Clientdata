import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
Item {
    Rectangle {
        anchors.fill: parent
        color: "#f4c842"
        FileDialog {
            id: fileDialog
            nameFilters: [ "Image files (*.png *.jpg)" ]
            selectedNameFilter: "All files (*)"
            onAccepted: {
                console.log("Accepted: " + fileUrls)
                imgpath.text = fileUrl
//                if (fileDialogOpenFiles.checked)
//                    for (var i = 0; i < fileUrls.length; ++i)
//                        Qt.openUrlExternally(fileUrls[i])
            }
            onRejected: { console.log("Rejected") }
        }
        Rectangle {
            id:insertrect
            x: parent.width/2-100
            color: "#FFFFFF"
//            y:10
            Column {
                spacing: 3

                Text {
                    text: "First Name"
                    font.pointSize: 10
                }
                TextField {
                    id: fname
                    x: insertrect.width -150
                    width: 400
                }
                Text {
                    text: "Last Name"
                    font.pointSize: 10
                }
                TextField {
                    id: lname
                    x: insertrect.width -150
                    width: 400
                }
                Text {
                    text: "Email"
                    font.pointSize: 10
                }
                TextField {
                    id: email
                    x: insertrect.width -150
                    width: 400
                }
                Text {
                    text: "Phone Number"
                    font.pointSize: 10
                }
                TextField {
                    id: pnum
                    x: insertrect.width -150
                    width: 400
                }
                Text {
                    text: "Officer"
                    font.pointSize: 10
                }
                TextField {
                    id: off
                    x: insertrect.width -150
                    width: 400
                }
                Text {
                    id: clientImage
                    font.pointSize: 10
                    text: qsTr("Please Select Your Image")
                }
                Row {
                    x: insertrect.width -150
                    width: 400
                    TextField {
                        id:imgpath
                        width: 300

                    }
                    Button {
                        text: "Select Image"
                        font.pointSize: 10
                        onClicked: fileDialog.open()
                    }
                }
                Text {
                    font.pointSize: 10
                    x: insertrect.width -150
                    width: 400
                    text: "Saving Client infromation in??"
                }
                ComboBox {
                    id:savaid
                    x: insertrect.width -150
                    width: 400
                    model: [ "Text", "Mysql"]
                }
                Button {
                    id:btn
                    width: 100
                    height: 35
                    text:"save"
                    onClicked:  {
                        var fileSave = savaid.currentText;
                        if (fileSave == "Mysql" ) {
                            //                        masterController.getui(fname.text,lname.text,email.text,pnum.text,off.text)
                            fname.text =lname.text=email.text=pnum.text=off.text ="";
                            console.log("Mysql");
                        } else {
                            masterController.getClientData(fname.text,lname.text,email.text,pnum.text,off.text,imgpath.text);
                            fname.text =lname.text=email.text=pnum.text=off.text=imgpath.text ="";
                        }
                    }
                }
            }
        }
    }
}


