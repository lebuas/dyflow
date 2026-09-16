import QtQuick 2.15
import "../components" as Components

Column {
    id: root

    property var items: []

    signal itemClicked(string name)

    spacing: 2

    Components.SectionLabel {
        label: "SUPPORT"
        topPadding: 8
    }

    Repeater {
        model: root.items

        Components.SidebarItem {
            width: root.width
            icon: modelData.icon
            label: modelData.name
            onClicked: root.itemClicked(modelData.name.toLowerCase())
        }
    }
}
