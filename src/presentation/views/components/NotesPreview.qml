// Preview panel displaying the selected note title and content.
import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property string noteTitle: ""
    property string noteContent: ""

    Rectangle {
        anchors.fill: parent
        color: "#0e1015"
        radius: 6
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 14

        Text {
            text: root.noteTitle.length > 0 ? root.noteTitle : "Select a note"
            color: "#B8C0DC"
            font.pixelSize: 20
            font.bold: true
            Layout.fillWidth: true
        }

        Text {
            text: root.noteContent.length > 0
                ? root.noteContent
                : "Choose a note from the tree to preview its content."
            color: "#9ca3af"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            Layout.fillHeight: true
            verticalAlignment: Text.AlignTop
        }
    }
}
