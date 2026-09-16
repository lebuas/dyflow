import QtQuick
import QtQuick.Layouts
import "../components" as Components

Rectangle {
    id: root
    height: 52
    color: "transparent"

    signal searchChanged(string text)
    signal askAiClicked()

    Row {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        spacing: 8

        Components.SearchBar {
            id: searchBar
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            onTextChanged: root.searchChanged(text)
        }

        Rectangle {
            width: askAiLabel.implicitWidth + 24
            height: 40
            radius: 8
            color: mouseArea.containsMouse ? "#252630" : "#1f2937"
            border.color: "#374151"
            border.width: 1

            Row {
                anchors.centerIn: parent
                spacing: 6

                Text {
                    text: "✨"
                    font.pixelSize: 14
                }

                Text {
                    id: askAiLabel
                    text: "Ask AI"
                    color: "#a78bfa"
                    font.pixelSize: 13
                    font.bold: true
                }
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.askAiClicked()
            }
        }
    }
}
