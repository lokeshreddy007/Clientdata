import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    width: 300
    height: 400

    ListModel {
        id: model
    }

    ListView {
        id: listview
        anchors.fill: parent
        model: model
        delegate: Text {
            text: listdata
        }
    }

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "https://hacker-news.firebaseio.com/v0/newstories.json";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
                myFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function myFunction(response) {
        var arr = JSON.parse(response);
        console.log(arr)
    }

    Button {
        anchors.bottom: parent.bottom
        width: parent.width
        text: "Get Data"
        onClicked: getData()
    }
}
