import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Components

Item {
    id: root
    height: 53

    signal searchChanged(string text)
    signal askAiClicked()

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        spacing: 8

        Components.SearchBar {
            id: searchBar
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            onTextChanged: function(text) { root.searchChanged(text) }
        }

        Rectangle {
            Layout.alignment: Qt.AlignVCenter
            width: askAiLabel.implicitWidth + 24
            height: 40
            radius: 8
            color: "transparent"
            border.color: mouseArea.containsMouse ? "#a78bfa" : "#374151"
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

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 1
        color: "#2a2b36"
    }
}
