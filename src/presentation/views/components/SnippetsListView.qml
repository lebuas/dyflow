import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property string selectedSnippetId: ""
    signal snippetSelected(string snippetId, string title, string content)

    ListModel {
        id: snippetsModel

        ListElement {
            snippetId: "sql-select"
            title: "SQL Select"
            content: "SELECT * FROM users WHERE active = true;"
        }
        ListElement {
            snippetId: "git-branch"
            title: "Git Branch"
            content: "git checkout -b feature/new-snippet"
        }
        ListElement {
            snippetId: "python-function"
            title: "Python Function"
            content: "def build_message(value):\n    return f\"Value: {value}\""
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 8

        ListView {
            id: snippetsList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 0
            model: snippetsModel

            delegate: ItemDelegate {
                id: snippetDelegate
                required property string snippetId
                required property string title
                required property string content

                width: snippetsList.width
                height: 24
                padding: 0
                leftPadding: 0
                rightPadding: 4
                hoverEnabled: true
                highlighted: root.selectedSnippetId === snippetId

                background: Item {}

                contentItem: ContentItem {
                    icon: "snippets"
                    name: snippetDelegate.title
                    description: snippetDelegate.content
                    opacity: snippetDelegate.hovered || snippetDelegate.highlighted ? 1 : 0.75
                }

                onClicked: {
                    root.selectedSnippetId = snippetId
                    root.snippetSelected(snippetId, title, content)
                }
            }
        }
    }
}
