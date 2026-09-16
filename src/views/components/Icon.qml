import QtQuick 2.15

Image {
    id: root

    property int size: 18
    property color iconColor: "#e5e7eb"

    width: size
    height: size
    sourceSize: Qt.size(size, size)
    smooth: true
    mipmap: true
    antialiasing: true
}
