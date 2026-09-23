// Selectable notes tree containing folders and note entries.
import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property string selectedNoteId: ""
    signal noteSelected(string noteId, string title, string content)

    ListModel {
        id: notesModel

        ListElement {
            kind: "folder"
            title: "Personal"
            noteId: ""
            content: ""
        }
        ListElement {
            kind: "note"
            title: "Ideas"
            noteId: "personal-ideas"
            content: "Ideas and notes for personal projects."
        }
        ListElement {
            kind: "note"
            title: "Daily journal"
            noteId: "personal-journal"
            content: "Write down the important events of the day."
        }
        ListElement {
            kind: "folder"
            title: "Projects"
            noteId: ""
            content: ""
        }
        ListElement {
            kind: "note"
            title: "DyFlow"
            noteId: "projects-dyflow"
            content: "Build the notes manager and connect it to the navigation."
        }
        ListElement {
            kind: "note"
            title: "Roadmap"
            noteId: "projects-roadmap"
            content: "Plan the next features and improvements."
        }
        ListElement {
            kind: "note"
            title: "Architecture"
            noteId: "projects-architecture"
            content: "Document the application layers and boundaries."
        }
        ListElement {
            kind: "note"
            title: "UI Ideas"
            noteId: "projects-ui-ideas"
            content: "Collect ideas for improving the interface."
        }
        ListElement {
            kind: "note"
            title: "Release Plan"
            noteId: "projects-release-plan"
            content: "Track the tasks needed for the next release."
        }
        ListElement {
            kind: "folder"
            title: "Learning"
            noteId: ""
            content: ""
        }
        ListElement {
            kind: "note"
            title: "QML Notes"
            noteId: "learning-qml"
            content: "Review layouts, delegates, and property bindings."
        }
        ListElement {
            kind: "note"
            title: "Rust Notes"
            noteId: "learning-rust"
            content: "Study ownership, traits, and error handling."
        }
        ListElement {
            kind: "note"
            title: "Python Notes"
            noteId: "learning-python"
            content: "Keep useful Python patterns and reminders."
        }
        ListElement {
            kind: "folder"
            title: "Archive"
            noteId: ""
            content: ""
        }
        ListElement {
            kind: "note"
            title: "Old Experiments"
            noteId: "archive-experiments"
            content: "Store experiments that are no longer active."
        }
        ListElement {
            kind: "note"
            title: "Research"
            noteId: "archive-research"
            content: "Save research references and technical findings."
        }
        ListElement {
            kind: "note"
            title: "Meeting Notes"
            noteId: "archive-meetings"
            content: "Summaries and decisions from previous meetings."
        }
        ListElement {
            kind: "note"
            title: "Bookmarks"
            noteId: "archive-bookmarks"
            content: "Useful links and documentation references."
        }
        ListElement {
            kind: "note"
            title: "Todos"
            noteId: "archive-todos"
            content: "Tasks that can be revisited later."
        }
        ListElement {
            kind: "note"
            title: "Changelog"
            noteId: "archive-changelog"
            content: "Record of notable project changes."
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 8

        ListView {
            id: treeList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 0
            model: notesModel

            delegate: Item {
                required property string kind
                required property string title
                required property string noteId
                required property string content

                width: treeList.width
                height: 24

                Rectangle {
                    anchors.fill: parent
                    radius: 4
                    color: noteMouse.containsMouse || (kind === "note" && root.selectedNoteId === noteId)
                        ? "#141820"
                        : "transparent"
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: kind === "folder" ? 0 : 0
                    anchors.rightMargin: 4
                    spacing: 6

                    Text {
                        text: kind === "folder" ? "▾" : "•"
                        color: "#9ca3af"
                        font.pixelSize: 12
                        visible: kind === "folder"
                    }

                    ContentItem {
                        visible: kind === "note"
                        icon: "notes"
                        name: title
                        description: content
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        visible: kind === "folder"
                        text: title
                        color: "#B8C0DC"
                        font.pixelSize: 13
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignVCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                MouseArea {
                    id: noteMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: kind === "note"
                        ? Qt.PointingHandCursor
                        : Qt.ArrowCursor
                    onClicked: {
                        if (kind === "note") {
                            root.selectedNoteId = noteId
                            root.noteSelected(noteId, title, content)
                        }
                    }
                }
            }
        }
    }
}
