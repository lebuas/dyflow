import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: root
    placeholderText: "Search notes, snippets, tasks..."
    placeholderTextColor: "#6b7280"
    color: "#e5e7eb"
    font.pixelSize: 14

    leftPadding: 36
    rightPadding: 12
    height: 40

    background: Rectangle {
        radius: 8
        color: "#1f2937"
        border.color: root.activeFocus ? "#6366f1" : "#374151"
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
}
