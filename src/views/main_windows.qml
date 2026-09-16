import QtQuick 2.15
import QtQuick.Controls 2.15
import "sections"

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

        Column {
            anchors.fill: parent
            anchors.margins: 8
            spacing: 0

            HeaderSection {
                width: parent.width
                onSearchChanged: function(text) { console.log("Search:", text) }
                onAskAiClicked: console.log("Ask AI clicked")
            }

            ProjectsSection {
                width: parent.width
                items: [
                    { icon: "resorces/icons/notes.svg", name: "Notes", count: "13 notes" },
                    { icon: "resorces/icons/snippets.svg", name: "Snippets", count: "10 snippets" },
                    { icon: "resorces/icons/task.svg", name: "Tasks", count: "19 tasks" },
                    { icon: "resorces/icons/workflow.svg", name: "Workflows", count: "2 workflows" },
                    { icon: "resorces/icons/scrip.svg", name: "Scripts", count: "2 scripts" }
                ]
                onItemClicked: function(name) { console.log("Section:", name) }
            }

            SupportSection {
                width: parent.width
                topPadding: 8
                items: [
                    { icon: "resorces/icons/setting.svg", name: "Help" },
                    { icon: "resorces/icons/seggestions.svg", name: "Suggestions" },
                    { icon: "resorces/icons/problem.svg", name: "Report a problem" }
                ]
                onItemClicked: function(name) { console.log("Section:", name) }
            }
        }
    }
}
