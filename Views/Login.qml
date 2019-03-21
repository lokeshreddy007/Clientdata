import QtQuick 2.9
import QtQuick.Controls 2.4


Item {
    Rectangle{
        anchors.fill: parent
        color: "#f4c842"
        Rectangle{
            id:rectbyresponse
            x: parent.width/2 -100
            y: parent.height/2-100
            color: "#f4c842"
            Column {
                spacing: 5

                Text {
                    text: "UserName"
                }
                TextField {
                    id: fname
                    x: rectbyresponse.width -150
                    width: 400
                }
                Text {
                    text: "Password"
                }
                TextField {
                    id: lname
                    x: rectbyresponse.width -150
                    width: 400
                }
                Button {
                    id:loginbtn
                    text: {
                        text: "Login"
                    }

                    onClicked :  {
                        //                        masterController.login();
                        console.log("clicked!");
                    }
                }
            }
        }
    }
}
