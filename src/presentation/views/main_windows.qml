// Main application window that switches between navigation, notes, and snippets.
import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    visible: true
    property string currentView: ""
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
            searchPlaceholder: mainWindow.currentView === "notes" ? "Search Notes"
                               : mainWindow.currentView === "snippets" ? "Search Snippets"
                               : "Search notes, snippets, tasks..."
            onSearchChanged: function(text) { console.log("Search:", text) }
            onAskAiClicked: console.log("Ask AI clicked")
        }

        NavigationView {
            visible: mainWindow.currentView === ""
            anchors.top: parent.top
            anchors.topMargin: 45
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            anchors.bottomMargin: 1
            onItemClicked: function(item) {
                mainWindow.currentView = item
            }
        }

        NotesManager {
            visible: mainWindow.currentView === "notes"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.topMargin: 45
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            anchors.bottomMargin: 1
        }

        SnippetsManager {
            visible: mainWindow.currentView === "snippets"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.topMargin: 45
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            anchors.bottomMargin: 1
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
