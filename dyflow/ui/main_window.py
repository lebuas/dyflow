from PySide6.QtWidgets import QWidget, QVBoxLayout, QLabel
from PySide6.QtCore import Qt


DARK_BG = "#1e1e2e"
TEXT_PRIMARY = "#cdd6f4"


class MainWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("DyFlow")
        self.setFixedSize(400, 300)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        layout = QVBoxLayout(self)
        layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        title = QLabel("DyFlow")
        title.setStyleSheet(f"""
            color: {TEXT_PRIMARY};
            font-size: 48px;
            font-weight: bold;
            background-color: {DARK_BG};
            border-radius: 16px;
        """)
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.setStyleSheet(f"background-color: transparent;")
