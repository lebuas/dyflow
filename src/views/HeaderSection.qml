import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

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

        TextField {
            id: searchField
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            placeholderText: "Search notes, snippets, tasks..."
            placeholderTextColor: "#6b7280"
            color: "#e5e7eb"
            font.pixelSize: 14
            leftPadding: 36
            height: 40

            background: Rectangle {
                radius: 8
                color: "#1f2937"
                border.color: searchField.activeFocus ? "#6366f1" : "#374151"
                border.width: 1

                Image {
                    source: "../resorces/icons/search.svg"
                    width: 16
                    height: 16
                    anchors.left: parent.left
                    anchors.leftMargin: 12
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: 0.5
                }
            }

            onTextChanged: root.searchChanged(text)
        }

        Item {
            Layout.alignment: Qt.AlignVCenter
            width: aiRow.implicitWidth + 16
            height: 40

            Row {
                id: aiRow
                anchors.centerIn: parent
                spacing: 6

                Image {
                    source: "../resorces/icons/ia.svg"
                    width: 16
                    height: 16
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    text: "Ask AI"
                    color: aiMouse.containsMouse ? "#ffffff" : "#a78bfa"
                    font.pixelSize: 13
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            MouseArea {
                id: aiMouse
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
