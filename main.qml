import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    id: root
    visible: true
    width: Screen.width / 2
    height: Screen.height / 2
    color: "#c7c7c7"

Component.onCompleted: rootLoader.source = "Welcome.qml"
    Loader{
        id: rootLoader
        width: root.width
        height:root.height
    }




}

