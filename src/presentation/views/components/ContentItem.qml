// Compact content row with an icon, name, and hidden description.
import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property string icon: ""
    property string name: ""
    property string description: ""

    implicitHeight: content.implicitHeight
    Layout.fillWidth: true
    Layout.preferredHeight: implicitHeight

    ColumnLayout {
        id: content
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 0

        RowLayout {
            spacing: 6
            Layout.fillWidth: true

            Icon {
                icon: root.icon
                size: 14
                active: true
                activeTextColor: "#ffffff"
                imageColor: "#ffffff"
            }

            Text {
                text: root.name
                color: "#B8C0DC"
                font.pixelSize: 13
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
        }

        Text {
            text: root.description
            visible: false
            color: "#9ca3af"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
    }
}
