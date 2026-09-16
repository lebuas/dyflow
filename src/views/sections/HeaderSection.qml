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
            width: row.implicitWidth + 16
            height: 40
            color: "transparent"

            Row {
                id: row
                anchors.centerIn: parent
                spacing: 6

                Components.Icon {
                    source: "../resorces/icons/ia.svg"
                    size: 16
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    text: "Ask AI"
                    color: mouseArea.containsMouse ? "#ffffff" : "#a78bfa"
                    font.pixelSize: 13
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
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
