import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property string icon: ""
    property string itemId: ""
    property string text: ""
    property string metadataCount: ""
    property bool showMetadata: false
    property bool active: false
    property color activeColor: "#ffffff"
    property color inactiveColor: "#9ca3af"

    signal clicked(string itemId)

    implicitWidth: 160
    implicitHeight: contentRow.height + 10
    width: implicitWidth
    height: implicitHeight

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 6
        color: "transparent"
    }

    RowLayout {
        id: contentRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6

        Icon {
            icon: root.icon
            size: 16
            opacity: root.active ? 1 : 0.65
            Layout.alignment: Qt.AlignVCenter
        }

        Text {
            text: root.text
            color: root.active || mouseArea.containsMouse
                ? root.activeColor
                : root.inactiveColor
            font.pixelSize: 13
            elide: Text.ElideRight
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
        }

        MetadataView {
            count: root.metadataCount
            name: root.text
            visible: root.showMetadata
            active: root.active
            hovered: mouseArea.containsMouse
            activeColor: root.activeColor
            inactiveColor: root.inactiveColor
            Layout.alignment: Qt.AlignVCenter
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked(root.itemId)
    }
}
