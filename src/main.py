import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


def main():
    app = QGuiApplication(sys.argv)
    app.setApplicationName("DyFlow")
    app.setOrganizationName("lebuas")

    engine = QQmlApplicationEngine()
    path_views = Path(__file__).parent / "views" / "main_windows.qml"
    engine.addImportPath(str(path_views))
    engine.load(str(path_views))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == "__main__":
    main()
