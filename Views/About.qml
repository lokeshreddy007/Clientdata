import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
Item {
    id:itemwrapper
    ListModel {
        id: libraryModel
        ListElement {
            fname: "Lok"
            sname: "reddy"
            email: "lok@gmail.com"
            pnum: "9809890889"
            off: "eee"
        }
        ListElement {
            fname: "Rajesh"
            sname: "reddy"
            email: "RajeshReddy@gmail.com,"
            pnum: "km"
            off: "klm"
        }
        ListElement {
            fname: "Kiran"
            sname: "reddy"
            email: "iopkoipko.com"
            pnum: "dfdfd"
            off: "eee"
        }
    }
    TableView {
        id: view
        anchors.fill: parent
        TableViewColumn {
            role: 'fname'
            title: "FirstName"
            width: 120
        }
        TableViewColumn {
            role: 'sname'
            title: "SecondName"
            width: 120
        }
        TableViewColumn {
            role: 'email'
            title: "Email"
            width: 80
        }
        TableViewColumn {
            role: 'pnum'
            title: "PhoneNumber"
            width: 100
        }
        TableViewColumn {
            role: 'off'
            title: "Officer"
            width: 80
        }
        model: libraryModel
    }
}
