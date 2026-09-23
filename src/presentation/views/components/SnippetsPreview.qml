// Preview panel displaying the selected snippet title and content.
import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    clip: true

    property string snippetTitle: ""
    property string snippetContent: ""

    ListModel {
        id: previewSnippets

        ListElement {
            snippetId: "ts-valueof"
            title: "TS Utility: ValueOf"
            description: "Extracts union of all property value types from an object."
            content: "type ValueOf<T> = T[keyof T];"
        }
        ListElement {
            snippetId: "fetch-timeout"
            title: "Fetch with Timeout & AbortController"
            description: "HTTP request that automatically aborts after N milliseconds."
            content: "async function fetchWithTimeout(url: string, ms = 5000) {\n    const controller = new AbortController();\n    const id = setTimeout(() => controller.abort(), ms);\n    const res = await fetch(url, {signal: controller.signal});\n    clearTimeout(id);\n    return res.json();\n}"
        }
        ListElement {
            snippetId: "async-tuple"
            title: "Async Try-Catch Tuple Wrapper"
            description: "Wrapper to avoid repetitive try/catch blocks in Go style."
            content: "const to = <T>(promise: Promise<T>): Promise<[Error | null, T | null]> =>\n    promise.then(data => [null, data] as [null, T])\n        .catch(err => [err, null]);"
        }
        ListElement {
            snippetId: "deep-partial"
            title: "TS Utility: DeepPartial"
            description: "Recursively makes all properties of an object optional."
            content: "type DeepPartial<T> = {\n    [P in keyof T]?: DeepPartial<T[P]>;\n};"
        }
        ListElement {
            snippetId: "debounce"
            title: "Debounce Function"
            description: "Delays execution until calls stop for a given interval."
            content: "function debounce<T extends (...args: any[]) => void>(fn: T, delay: number) {\n    let timer: ReturnType<typeof setTimeout>;\n    return (...args: Parameters<T>) => {\n        clearTimeout(timer);\n        timer = setTimeout(() => fn(...args), delay);\n    };\n}"
        }
        ListElement {
            snippetId: "format-date"
            title: "Format Date"
            description: "Formats a date using the current locale."
            content: "const formatDate = (date: Date) =>\n    new Intl.DateTimeFormat().format(date);"
        }
        ListElement {
            snippetId: "group-by"
            title: "Group By Property"
            description: "Groups an array of objects by one of their properties."
            content: "const groupBy = <T, K extends keyof T>(items: T[], key: K) =>\n    Object.groupBy(items, item => String(item[key]));"
        }
        ListElement {
            snippetId: "retry-request"
            title: "Retry Request"
            description: "Retries an asynchronous operation a fixed number of times."
            content: "async function retry<T>(operation: () => Promise<T>, attempts = 3) {\n    for (let i = 0; i < attempts; i++) {\n        try { return await operation(); } catch (error) {\n            if (i === attempts - 1) throw error;\n        }\n    }\n    throw new Error(\"Unreachable\");\n}"
        }
        ListElement {
            snippetId: "is-non-empty"
            title: "Is Non Empty"
            description: "Checks whether a string contains non-whitespace characters."
            content: "const isNonEmpty = (value: string) => value.trim().length > 0;"
        }
        ListElement {
            snippetId: "safe-json"
            title: "Safe JSON Parse"
            description: "Parses JSON without throwing on invalid input."
            content: "const safeJson = <T>(value: string): T | null => {\n    try { return JSON.parse(value) as T; }\n    catch { return null; }\n};"
        }
    }

    Rectangle {
        id: previewBackground
        anchors.fill: parent
        color: "#111319"
        z: 0
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        ListView {
            id: cardsList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: previewSnippets
            z: 1

            delegate: SnippetCard {
                width: cardsList.width
                snippetId: model.snippetId
                title: model.title
                description: model.description
                content: model.content
                showSeparator: index < previewSnippets.count - 1
            }
        }
    }
}
