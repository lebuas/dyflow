from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QLabel,
    QLineEdit, QPushButton, QScrollArea
)
from PySide6.QtCore import Qt


DARK_BG = "#1e1e2e"
CARD_BG = "#313244"
HOVER_BG = "#45475a"
TEXT_PRIMARY = "#cdd6f4"
TEXT_SECONDARY = "#a6adc8"
ACCENT_TEAL = "#94e2d5"
BORDER_COLOR = "#45475a"


class ScriptsWidget(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._setup_ui()

    def _setup_ui(self):
        layout = QVBoxLayout(self)
        layout.setContentsMargins(24, 24, 24, 24)
        layout.setSpacing(16)

        header = QHBoxLayout()
        title = QLabel("Scripts")
        title.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 28px; font-weight: bold;")
        header.addWidget(title)
        header.addStretch()

        add_btn = QPushButton("+ New Script")
        add_btn.setStyleSheet(f"""
            QPushButton {{
                background-color: {ACCENT_TEAL};
                color: #1e1e2e;
                border: none;
                border-radius: 8px;
                padding: 8px 16px;
                font-weight: bold;
                font-size: 13px;
            }}
            QPushButton:hover {{ background-color: #b0ede0; }}
        """)
        header.addWidget(add_btn)
        layout.addLayout(header)

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setStyleSheet("border: none; background: transparent;")

        self.scripts_list = QWidget()
        self.scripts_layout = QVBoxLayout(self.scripts_list)
        self.scripts_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        scroll.setWidget(self.scripts_list)
        layout.addWidget(scroll)
