import QtQuick 2.15
import QtQuick.Layouts 1.15
import "components" as Components

Item {
    id: root

    property string recentTitle: "RECENTLY VIEWED"
    property string workspaceTitle: "PROJECTS"
    property string settingsTitle: "SUPPORT"
    property string activeItem: ""
    property string recentCount: "18"
    property string notesCount: "12"
    property string snippetsCount: "8"
    property string tasksCount: "5"
    property string workflowCount: "3"
    property string scriptsCount: "4"

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

                Components.NavigationButton {
                    id: recentItem
                    itemId: "recent"
                    icon: "recents"
                    text: "Recent"
                    metadataCount: root.recentCount
                    showMetadata: true
                    active: root.activeItem === "recent"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }
            }
        }

        Section {
            title: root.workspaceTitle

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                Components.NavigationButton {
                    id: notesItem
                    itemId: "notes"
                    icon: "notes"
                    text: "Notes"
                    metadataCount: root.notesCount
                    showMetadata: true
                    active: root.activeItem === "notes"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }

                Components.NavigationButton {
                    id: snippetsItem
                    itemId: "snippets"
                    icon: "snippets"
                    text: "Snippets"
                    metadataCount: root.snippetsCount
                    showMetadata: true
                    active: root.activeItem === "snippets"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }

                Components.NavigationButton {
                    id: taskItem
                    itemId: "tasks"
                    icon: "task"
                    text: "Tasks"
                    metadataCount: root.tasksCount
                    showMetadata: true
                    active: root.activeItem === "tasks"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }

                Components.NavigationButton {
                    id: workflowItem
                    itemId: "workflow"
                    icon: "workflow"
                    text: "Workflows"
                    metadataCount: root.workflowCount
                    showMetadata: true
                    active: root.activeItem === "workflow"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }

                Components.NavigationButton {
                    id: scriptItem
                    itemId: "scripts"
                    icon: "scrip"
                    text: "Scripts"
                    metadataCount: root.scriptsCount
                    showMetadata: true
                    active: root.activeItem === "scripts"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }
            }
        }

        Section {
            title: root.settingsTitle

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                Components.NavigationButton {
                    id: settingItem
                    itemId: "setting"
                    icon: "setting"
                    text: "Settings"
                    active: root.activeItem === "setting"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }

                Components.NavigationButton {
                    id: keymapsItem
                    itemId: "keymaps"
                    icon: "keymaps"
                    text: "Keymaps"
                    active: root.activeItem === "keymaps"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
                }

                Components.NavigationButton {
                    id: problemItem
                    itemId: "problem"
                    icon: "problem"
                    text: "Report a problem"
                    active: root.activeItem === "problem"
                    Layout.fillWidth: true
                    onClicked: function(itemId) { root.selectItem(itemId) }
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
