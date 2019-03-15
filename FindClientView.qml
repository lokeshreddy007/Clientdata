import QtQuick 2.9
import QtQuick.Controls 2.4
Item {
    Rectangle {
        anchors.fill: parent
        color: "#f4c842"
        Text {
            text: "Search the Register client Detail"
        }
        Row {
            x:20
            y:50
            spacing: 5
            TextField {
                id: fname
            }
            Button {
                text: "Find"
                onClicked: {
                    var val =  masterController.findClientByName(fname.text)
                    console.log(val);
                }
            }
        }
    }
}
