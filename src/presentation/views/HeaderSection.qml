// Header with the global search field and the Ask AI action.
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "components" as Components

Item {
    id: root
    property string searchPlaceholder: "Search notes, snippets, tasks..."
    width: parent.width
    height: 44
    signal searchChanged(string text)
    signal askAiClicked()

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 12
        spacing: 4

        TextField {
            id: searchField
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            placeholderText: root.searchPlaceholder
            placeholderTextColor: "#6b7280"
            color: "#e5e7eb"
            font.pixelSize: 14
            leftPadding: 0
            rightPadding: 12

            background: Rectangle {
                color: "transparent"
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
