import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import "../Framework"

RadioButton {
    id: selectBtn
    width: FWTheme.radioButton.size
    height: FWTheme.radioButton.size
    style: RadioButtonStyle {
        indicator: Rectangle {
            implicitWidth: FWTheme.radioButton.size
            implicitHeight: FWTheme.radioButton.size
            radius: FWTheme.radioButton.radius
            border.color: control.checked ? FWTheme.radioButton.borderColorChecked : FWTheme.radioButton.borderColorUnChecked
            border.width: FWTheme.radioButton.borderWidth
            Rectangle {
                anchors.fill: parent
                visible: control.checked
                color: FWTheme.radioButton.indicatorColor
                radius: FWTheme.radioButton.radius
                anchors.margins: 4
            }
        }
    }
}
