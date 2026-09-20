import QtQuick 2.15
import QtQuick.Layouts 1.15
import "components" as Components

Item {
    id: root

    property string recentTitle: "RECENTLY VIEWED"
    property string workspaceTitle: "PROJECTS"
    property string settingsTitle: "SUPPORT"
    property string activeItem: ""

    signal itemClicked(string item)

    function selectItem(item) {
        root.activeItem = item
        root.itemClicked(item)
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        anchors.topMargin: 16
        anchors.bottomMargin: 16
        spacing: 18

        Section {
            title: root.recentTitle

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                Components.NavigationItem {
                    id: recentItem
                    itemId: "recent"
                    icon: "recents"
                    text: "Recent"
                    active: root.activeItem === "recent"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }
            }
        }

        Section {
            title: root.workspaceTitle

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                Components.NavigationItem {
                    id: notesItem
                    itemId: "notes"
                    icon: "notes"
                    text: "Notes"
                    active: root.activeItem === "notes"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }

                Components.NavigationItem {
                    id: snippetsItem
                    itemId: "snippets"
                    icon: "snippets"
                    text: "Snippets"
                    active: root.activeItem === "snippets"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }

                Components.NavigationItem {
                    id: taskItem
                    itemId: "tasks"
                    icon: "task"
                    text: "Tasks"
                    active: root.activeItem === "tasks"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }

                Components.NavigationItem {
                    id: workflowItem
                    itemId: "workflow"
                    icon: "workflow"
                    text: "Workflows"
                    active: root.activeItem === "workflow"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }

                Components.NavigationItem {
                    id: scriptItem
                    itemId: "scripts"
                    icon: "scrip"
                    text: "Scripts"
                    active: root.activeItem === "scripts"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }
            }
        }

        Section {
            title: root.settingsTitle

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                Components.NavigationItem {
                    id: settingItem
                    itemId: "setting"
                    icon: "setting"
                    text: "Settings"
                    active: root.activeItem === "setting"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }

                Components.NavigationItem {
                    id: suggestionsItem
                    itemId: "seggestions"
                    icon: "seggestions"
                    text: "Suggestions"
                    active: root.activeItem === "seggestions"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }

                Components.NavigationItem {
                    id: problemItem
                    itemId: "problem"
                    icon: "problem"
                    text: "Report a problem"
                    active: root.activeItem === "problem"
                    Layout.fillWidth: true
                    onClicked: root.selectItem(itemId)
                }
            }
        }
    }

    component Section: ColumnLayout {
        id: section
        required property string title
        Layout.fillWidth: true
        spacing: 8

        Text {
            text: section.title
            color: "#6b7280"
            font.pixelSize: 11
            font.bold: true
            Layout.fillWidth: true
        }

        default property alias content: contentLayout.children

        ColumnLayout {
            id: contentLayout
            Layout.fillWidth: true
        }
    }
}
