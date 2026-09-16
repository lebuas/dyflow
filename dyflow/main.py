import os
import sys
from pathlib import Path

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from dyflow.viewmodels.main_viewmodel import MainViewModel


def main():
    app = QGuiApplication(sys.argv)
    app.setApplicationName("DyFlow")
    app.setOrganizationName("lebuas")

    engine = QQmlApplicationEngine()

    vm = MainViewModel()
    engine.rootContext().setContextProperty("vm", vm)

    qml_path = Path(__file__).parent / "ui" / "main.qml"
    engine.load(QUrl.fromLocalFile(str(qml_path)))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == "__main__":
    main()
