import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property string snippetTitle: ""
    property string snippetContent: ""

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
            text: root.snippetTitle.length > 0 ? root.snippetTitle : "Select a snippet"
            color: "#f3f4f6"
            font.pixelSize: 20
            font.bold: true
            Layout.fillWidth: true
        }

        Text {
            text: root.snippetContent.length > 0
                ? root.snippetContent
                : "Choose a snippet from the list to preview its content."
            color: "#9ca3af"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            Layout.fillHeight: true
            verticalAlignment: Text.AlignTop
        }
    }
}
