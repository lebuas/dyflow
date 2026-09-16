import QtQuick 2.15
import "sections"

Column {
    id: root

    signal sectionClicked(string name)

    spacing: 0

    HeaderSection {
        width: parent.width
        onSearchChanged: function(text) { console.log("Search:", text) }
        onAskAiClicked: console.log("Ask AI clicked")
    }

    ProjectsSection {
        width: parent.width
        items: [
            { icon: "resorces/icons/notes.svg", name: "Notes", count: "13 notes" },
            { icon: "resorces/icons/snippets.svg", name: "Snippets", count: "10 snippets" },
            { icon: "resorces/icons/task.svg", name: "Tasks", count: "19 tasks" },
            { icon: "resorces/icons/workflow.svg", name: "Workflows", count: "2 workflows" },
            { icon: "resorces/icons/scrip.svg", name: "Scripts", count: "2 scripts" }
        ]
        onItemClicked: function(name) { root.sectionClicked(name) }
    }

    SupportSection {
        width: parent.width
        topPadding: 8
        items: [
            { icon: "resorces/icons/setting.svg", name: "Help" },
            { icon: "resorces/icons/seggestions.svg", name: "Suggestions" },
            { icon: "resorces/icons/problem.svg", name: "Report a problem" }
        ]
        onItemClicked: function(name) { root.sectionClicked(name) }
    }
}
