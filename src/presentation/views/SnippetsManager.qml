import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "components" as Components

Item {
    id: root

    property bool previewVisible: true
    property string selectedSnippetId: ""
    property string selectedSnippetTitle: ""
    property string selectedSnippetContent: ""

    signal snippetSelected(string snippetId)

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.bottomMargin: 0
        spacing: 12

        Components.SnippetsListView {
            id: snippetsList
            Layout.preferredWidth: 190
            Layout.fillWidth: !root.previewVisible
            Layout.fillHeight: true
            Layout.topMargin: 8
            selectedSnippetId: root.selectedSnippetId

            onSnippetSelected: function(snippetId, title, content) {
                root.selectedSnippetId = snippetId
                root.selectedSnippetTitle = title
                root.selectedSnippetContent = content
                root.snippetSelected(snippetId)
            }
        }

        Rectangle {
            visible: root.previewVisible
            Layout.preferredWidth: 1
            Layout.fillHeight: true
            color: "#374151"
        }

        Components.SnippetsPreview {
            visible: root.previewVisible
            Layout.fillWidth: true
            Layout.fillHeight: true
            snippetTitle: root.selectedSnippetTitle
            snippetContent: root.selectedSnippetContent
        }
    }

    ToolButton {
        anchors.top: parent.top
        anchors.right: parent.right
        text: root.previewVisible ? "Hide preview" : "Show preview"
        z: 1
        onClicked: root.previewVisible = !root.previewVisible
    }
}
