import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    visible: true
    color: "transparent"
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
        color: "#0E1015"
        radius: 12
        border.color: "#1f2937"
        border.width: 1

        HeaderSection {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            anchors.topMargin: 1
            z: 1
            onSearchChanged: function(text) { console.log("Search:", text) }
            onAskAiClicked: console.log("Ask AI clicked")
        }

        NavigationView {
            anchors.top: parent.top
            anchors.topMargin: 45
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            anchors.bottomMargin: 1
            onItemClicked: function(item) {
                console.log("Navigation item clicked:", item)
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: parent.radius
            border.color: "#1f2937"
            border.width: 1
            z: 2
        }
    }
}
