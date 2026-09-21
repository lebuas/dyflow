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

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        spacing: 12

        TextField {
            id: searchField
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            placeholderText: "Search notes, snippets, tasks..."
            placeholderTextColor: "#6b7280"
            color: "#e5e7eb"
            font.pixelSize: 14
            rightPadding: 12

            background: Rectangle {
                radius: 8
                color: "transparent"
                border.width: 0 // Aseguramos que el fondo transparente no dibuje nada
            }

            onTextChanged: root.searchChanged(text)
        }

        Components.NavigationButton {
            id: aiButton
            itemId: "ask-ai"
            icon: "ia"
            text: "Ask AI"
            activeColor: "#ffffff"
            inactiveColor: "#9ca3af"
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: 84
            Layout.preferredHeight: 30
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
