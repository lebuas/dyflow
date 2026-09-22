import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "components" as Components

Item {
    id: root

    property bool previewVisible: true
    property string selectedNoteId: ""
    property string selectedNoteTitle: ""
    property string selectedNoteContent: ""

    signal noteSelected(string noteId)

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.bottomMargin: 0
        spacing: 12

        ColumnLayout {
            Layout.preferredWidth: 190
            Layout.fillWidth: !root.previewVisible
            Layout.fillHeight: true
            spacing: 0

            Components.NotesTreeView {
                id: notesTree
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.topMargin: 8
                selectedNoteId: root.selectedNoteId

                onNoteSelected: function(noteId, title, content) {
                    root.selectedNoteId = noteId
                    root.selectedNoteTitle = title
                    root.selectedNoteContent = content
                    root.noteSelected(noteId)
                }
            }
        }

        Rectangle {
            visible: root.previewVisible
            Layout.preferredWidth: 1
            Layout.fillHeight: true
            color: "#374151"
        }

        ColumnLayout {
            visible: root.previewVisible
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            Components.NotesPreview {
                id: notesPreview
                Layout.fillWidth: true
                Layout.fillHeight: true
                noteTitle: root.selectedNoteTitle
                noteContent: root.selectedNoteContent
            }
        }
    }

    ToolButton {
        anchors.top: parent.top
        anchors.right: parent.right
        text: root.previewVisible ? "Hide preview" : "Show preview"
        z: 1
        onClicked: root.togglePreview()
    }

    function togglePreview() {
        root.previewVisible = !root.previewVisible
    }
}
