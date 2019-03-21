pragma Singleton
import QtQuick 2.9

QtObject {

    /**************************************************************************/
    /*! \brief  Default font family.
     **************************************************************************/
    property string fontFamily: "Segoe UI"

    /**************************************************************************/
    /*! \brief  Default highlight color.
     **************************************************************************/
    property color highlightColor : "steelblue"

    /**************************************************************************/
    /*! \brief  Default highlight font color.
     **************************************************************************/
    property color highlightFontColor: "white"

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Button default properties.
     **************************************************************************/
    property var button: {
        "height": 30,
        "fontSize": 16,
        "backgroundColorNormal": "#eff3f4",
        "borderWidth": 1,
        "borderCornerRadius": 3,
        "borderColorNormal": "#c0c0c0",
        "borderColorFocused": "#23a0e9",
        "fontColorNormal": "#4C4C4C",
        "backgroundColorPressed": "#ffffff",
        "backgroundColorMouseOver": "#f2f6f7",
        "borderColorDefault": "#97cde8",
        "opacityInactive": 0.5,
        "opacityActive": 1,
        "fontWeight": Font.Light,
        "iconSize": 16 //16x16
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  inputField default properties.
     **************************************************************************/
    property var inputText: {
        "height": 32,
        "fontSize": 16,
        "backgroundColor": "#ffffff",
        "borderWidth": 1,
        "borderColorError": "#ff645e",
        "borderRadius": 3,
        "borderColorDefault": "#c0c0c0",
        "borderColorFocused": "#23a0e9",
        "fontColorNormal": "#4C4C4C",
        "opacityInactive": 0.5,
        "opacityActive": 1,
        "fontWeight": Font.Normal,
        "labelFontSize": 14,
        "labelColor": "#828790",
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  alertPopup default properties.
     **************************************************************************/
    property var alertPopup: {
        "fontSize": 16,
        "fontColor": "#4C4C4C",
    }
    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of the navigationArea.
     **************************************************************************/
    property var navigationArea: {
        "minimumWidth": 280,
        "backgroundColor": "#e2e6e8",
        "backgroundSelected": "#ffffff",
        "fontSize": 16,
        "itemHeight": 52,
        "borderLeftSelectedWidth": 6,
        "borderLeftSelected": "#23a0e9",
        "borderLeftUnSelected": "#e2e6e8",
        "iconSize": 24, //24x24
        "borderUp": 1,
        "borderDown": 1,
        "borderUpDownSelected": "#aaaaaa",
        "borderUpDownUnselected": "#e2e6e8",
        "borderUpDownWidth": 1,
        "borderRightWidth": 1,
        "borderRightColor": "#aaaaaa",
        "fontColorSelected": "#23a0e9",
        "fontColorUnselected": "#4c4c4c",
        "fontSize": 16,
        "notificationValueColor": "#ffffff",
        "notificationBackgroundColor": "#828790",
        "notificationColorSelected": "#23a0e9",
        "notificationRadius": 12,
        "titleTextColor": "#828790"
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of thesearchArea.
     **************************************************************************/
    property var searchArea: {
        "backgroundColorDefault": "lightgray",
        "backgroundColorSearch": "lightblue",
        "iconSize": 16,//16x16
        "fontSize": 16,
        "fontColorNormal": "#4C4C4C",
        "opacityInactive": 0.5,
        "opacityActive": 1,
        "fontWeight": Font.Light,
        "fontColor": "#4C4C4C"
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of userArea.
     **************************************************************************/
    property var userArea: {
        "fontSize": 16,
        "itemHeight": 52,
        "filterIconSize": 16, //24x24
        "border": 1,
        "borderColor": "#c0c0c0",
        "fontColor": "#4c4c4c",
        "itemIconSize": 24,//24x24
        "itembordercolor": "#eff2f4",
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of infoArea.
     **************************************************************************/
    property var infoArea: {
        "backgroundColor": "#eff3f4",
        "fontSize": 16,
        "fontWeightBold": Font.DemiBold,
        "fontWeightLight": Font.Light,
        "fontColorBold": "#4c4c4c",
        "fontColorLight": "#828790",
        "itemHeight": 52,
        "border": 1,
        "borderColor": "#c0c0c0",
        "textDescriptionColor": "#828790",
        "labelFontSize": 14,
        "groupIconBorderColor": "#c0c0c0",
        "groupIconBackgroundColor": "#EFF3F4",
        "groupIconBorderWidth": 1,
        "groupIconBorderRadius": 3
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of infoOverlay.
     **************************************************************************/
    property var infoOverlay: {
        "transparentColor": "black",
        "transparentOpacity": 0.5,
        "backgroundColor": "#eff3f4",
        "border": 1,
        "borderColor": "#c0c0c0",
        "fontSize": 16,
        "fontColor": "#4c4c4c",
        "checkBoxFontSize": 12,
        "labelFontWeight": Font.DemiBold,
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of footer.
     **************************************************************************/
    property var footer: {
        "border": 1,
        "borderColor": "#c0c0c0",
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of radioButton.
     **************************************************************************/
    property var radioButton: {
        "borderColorChecked": "#23a0e9",
        "borderColorUnChecked": "gray",
        "indicatorColor": "#23a0e9",
        "size": 16,
        "borderWidth": 1,
        "radius": 9
    }

    /**************************************************************************/
    /*! type:variantmap
     *
     *  \brief  Default properties of the slider.
     **************************************************************************/
    property var slider: {
        "width": 10,
        "radius" : 0,
        "backgroundColor": "#e7e7e7",
        "scrollerColor": "gray",
        "scrollerColorGrabbed": "steelblue",
        "minimumHandleSize": 20
    }
}
