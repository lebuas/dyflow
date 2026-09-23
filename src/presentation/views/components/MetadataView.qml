// Navigation metadata label showing an item count and descriptor.
import QtQuick 2.15

Item {
    id: root

    property string count: ""
    property string name: ""
    property bool active: false
    property bool hovered: false
    property color activeColor: "#B8C0DC"
    property color inactiveColor: "#B8C0DC"

    implicitWidth: metadataText.implicitWidth
    implicitHeight: metadataText.implicitHeight

    Text {
        id: metadataText
        anchors.fill: parent
        text: root.count + (root.name.length > 0 ? " " + root.name : "")
        color: root.active || root.hovered
            ? root.activeColor
            : root.inactiveColor
        font.pixelSize: 13
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }
}
