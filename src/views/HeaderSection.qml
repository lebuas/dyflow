import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "components" as Components

Item {
    id: root
    width: parent.width
    height: 44

    signal searchChanged(string text)
    signal askAiClicked()

    Rectangle {
        id: headerBackground
        anchors.fill: parent
        color: "#111827"
        radius: 11
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 11
        color: "#111827"
    }


    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        spacing: 12

        Components.Icon {
            icon: "search"
            size: 16
            opacity: 0.5
            Layout.alignment: Qt.AlignVCenter
        }

        TextField {
            id: searchField
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            placeholderText: "Search notes, snippets, tasks..."
            placeholderTextColor: "#6b7280"
            color: "#e5e7eb"
            font.pixelSize: 14
            leftPadding: 12
            rightPadding: 12

            background: Rectangle {
                radius: 8
                color: "transparent"
                border.width: 0 // Aseguramos que el fondo transparente no dibuje nada
            }

            onTextChanged: root.searchChanged(text)
        }

        Button {
            id: aiButton
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: contentItem.implicitWidth
            Layout.preferredHeight: contentItem.implicitHeight
            flat: true
            padding: 0

            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }

            background: Item {}

            contentItem: Components.Icon {
                icon: "ia"
                text: "Ask AI"
                size: 16
                textPixelSize: 13
                active: aiButton.hovered
                activeTextColor: "#ffffff"
                inactiveTextColor: "#9ca3af"
            }

            onClicked: root.askAiClicked()
        }

    }

    Rectangle {
        id: separator
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 1
        color: "#374151"
    }
}
