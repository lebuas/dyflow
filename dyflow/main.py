import sys
from PySide6.QtWidgets import QApplication
from dyflow.views.main_window import MainWindow
from dyflow.controllers import MainController


def main():
    app = QApplication(sys.argv)
    app.setApplicationName("DyFlow")
    app.setOrganizationName("lebuas")

    window = MainWindow()
    controller = MainController(window.sidebar, window.content_area)

    window.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
