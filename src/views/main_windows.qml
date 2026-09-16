import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: mainWindow
    visible: true

    width: 660
    height: 460
    maximumWidth: 800
    minimumWidth: 660
    maximumHeight: 460
    minimumHeight: 460

    x: Screen.width - width - 40
    y: (Screen.height - height) / 2

    flags: Qt.Tool | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    Rectangle {
        anchors.fill: parent
        color: "#141519"
        radius: 12
        border.color: "#2a2b36"
        border.width: 1

        LauncherView {
            anchors.fill: parent
            anchors.margins: 8
            onSectionClicked: function(name) {
                console.log("Section:", name)
            }
        }
    }
}
