import QtQuick 2.15
import QtQuick.Controls 2.15
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
                    color: "transparent"
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
                    }

                    Text {
                        visible: kind === "folder"
                        text: title
                        color: "#9ca3af"
                        font.pixelSize: 13
                        elide: Text.ElideRight
                        Layout.fillWidth: true
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
