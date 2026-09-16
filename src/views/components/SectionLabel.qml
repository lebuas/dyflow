import QtQuick 2.15

Text {
    id: root

    property string label: ""

    text: root.label.toUpperCase()
    color: "#6b7280"
    font.pixelSize: 11
    font.bold: true
    font.letterSpacing: 0.5
    leftPadding: 12
    height: 28
    verticalAlignment: Text.AlignVCenter
}
