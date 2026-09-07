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
ACCENT_PEACH = "#fab387"
BORDER_COLOR = "#45475a"


class TasksWidget(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._setup_ui()

    def _setup_ui(self):
        layout = QVBoxLayout(self)
        layout.setContentsMargins(24, 24, 24, 24)
        layout.setSpacing(16)

        header = QHBoxLayout()
        title = QLabel("Tasks")
        title.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 28px; font-weight: bold;")
        header.addWidget(title)
        header.addStretch()

        add_btn = QPushButton("+ New Task")
        add_btn.setStyleSheet(f"""
            QPushButton {{
                background-color: {ACCENT_PEACH};
                color: #1e1e2e;
                border: none;
                border-radius: 8px;
                padding: 8px 16px;
                font-weight: bold;
                font-size: 13px;
            }}
            QPushButton:hover {{ background-color: #fcc9a8; }}
        """)
        header.addWidget(add_btn)
        layout.addLayout(header)

        search = QLineEdit()
        search.setPlaceholderText("Search tasks...")
        search.setFixedHeight(36)
        search.setStyleSheet(f"""
            QLineEdit {{
                background-color: {CARD_BG};
                border: 1px solid {BORDER_COLOR};
                border-radius: 8px;
                padding: 0 12px;
                color: {TEXT_PRIMARY};
                font-size: 13px;
            }}
        """)
        layout.addWidget(search)

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setStyleSheet("border: none; background: transparent;")

        self.tasks_list = QWidget()
        self.tasks_layout = QVBoxLayout(self.tasks_list)
        self.tasks_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        scroll.setWidget(self.tasks_list)
        layout.addWidget(scroll)
