import QtQuick 2.15

Item {
    id: root

    property string icon: ""
    property string itemId: ""
    property string value: ""
    property string text: ""
    property bool active: false
    property color activeColor: "#ffffff"
    property color inactiveColor: "#9ca3af"

    signal clicked(string itemId)

    implicitWidth: contentRow.width + 16
    implicitHeight: contentRow.height + 10
    width: implicitWidth
    height: implicitHeight

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 6
        color: "transparent"
    }

    Row {
        id: contentRow
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6

        Icon {
            icon: root.icon
            size: 16
            opacity: root.active ? 1 : 0.65
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            text: root.value + (root.text.length > 0 ? " " + root.text : "")
            color: root.active || mouseArea.containsMouse
                ? root.activeColor
                : root.inactiveColor
            font.pixelSize: 13
            anchors.verticalCenter: parent.verticalCenter
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
