import QtQuick 2.15

Item {
    id: root
    property int size: 18
    property int textPixelSize: 14
    property string text: ""
    property string icon: ""
    property bool active: false
    property color activeTextColor: "#ffffff"
    property color inactiveTextColor: "#6b7280"

    property var icons: ({
            "search": Qt.resolvedUrl("../resorces/icons/search.svg"),
            "problem": Qt.resolvedUrl("../resorces/icons/problem.svg"),
            "scrip": Qt.resolvedUrl("../resorces/icons/scrip.svg"),
            "ia": Qt.resolvedUrl("../resorces/icons/ia.svg"),
            "notes": Qt.resolvedUrl("../resorces/icons/notes.svg"),
            "recents": Qt.resolvedUrl("../resorces/icons/recents.svg"),
            "snippets": Qt.resolvedUrl("../resorces/icons/snippets.svg"),
            "task": Qt.resolvedUrl("../resorces/icons/task.svg"),
            "seggestions": Qt.resolvedUrl("../resorces/icons/seggestions.svg"),
            "workflow": Qt.resolvedUrl("../resorces/icons/workflow.svg"),
            "setting": Qt.resolvedUrl("../resorces/icons/setting.svg")
        })

    property alias source: iconImage.source

    width: iconImage.width + (label.visible ? label.width + 6 : 0)
    height: size
    implicitWidth: width
    implicitHeight: height

    Image {
        id: iconImage
        width: root.size
        height: root.size
        source: root.icon ? root.icons[root.icon] : ""
        sourceSize: Qt.size(root.size, root.size)
        smooth: true
        mipmap: true
        antialiasing: true
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: label
        text: root.text
        font.pixelSize: root.textPixelSize
        color: root.active ? root.activeTextColor : root.inactiveTextColor
        visible: root.text.length > 0
        anchors.left: iconImage.right
        anchors.leftMargin: 6
        anchors.verticalCenter: parent.verticalCenter
    }
}
