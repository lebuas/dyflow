import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components" as Components

Rectangle {
    id: root

    property string icon: ""
    property string label: ""
    property string count: ""

    signal clicked()

    height: 36
    radius: 6
    color: mouseArea.containsMouse ? "#252630" : "transparent"

    Row {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10

        Components.Icon {
            source: root.icon
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            text: root.label
            color: "#e5e7eb"
            font.pixelSize: 13
            anchors.verticalCenter: parent.verticalCenter
        }

        Item { Layout.fillWidth: true }

        Row {
            spacing: 6
            anchors.verticalCenter: parent.verticalCenter

            Text {
                text: root.count
                color: "#6b7280"
                font.pixelSize: 12
                visible: root.count !== ""
            }

            Text {
                text: ">"
                color: "#6b7280"
                font.pixelSize: 12
                visible: root.count !== ""
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
