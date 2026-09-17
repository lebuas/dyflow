import QtQuick 2.15

Image {
    id: root

    property int size: 18

    width: size
    height: size
    sourceSize: Qt.size(size, size)
    smooth: true
    mipmap: true
    antialiasing: true
}
