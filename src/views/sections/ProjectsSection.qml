import QtQuick
import "../components" as Components

Column {
    id: root

    property var items: []

    signal itemClicked(string name)

    spacing: 2

    Components.SectionLabel {
        label: "RECENTLY VIEWED"
    }

    Components.SidebarItem {
        width: parent.width
        icon: "../resorces/icons/recents.svg"
        label: "Recent Items"
        count: "6 recent"
        onClicked: root.itemClicked("recent")
    }

    Components.SectionLabel {
        label: "PROJECTS"
        topPadding: 8
    }

    Repeater {
        model: root.items

        Components.SidebarItem {
            width: root.width
            icon: modelData.icon
            label: modelData.name
            count: modelData.count
            onClicked: root.itemClicked(modelData.name.toLowerCase())
        }
    }
}
