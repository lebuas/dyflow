import sys
from PySide6.QtWidgets import QApplication
from dyflow.ui.main_window import MainWindow


def main():
    app = QApplication(sys.argv)
    app.setApplicationName("DyFlow")
    app.setOrganizationName("lebuas")

    window = MainWindow()
    window.show()

    sys.exit(app.exec())


if __name__ == "__main__":
    main()
