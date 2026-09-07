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
ACCENT_YELLOW = "#f9e2af"
BORDER_COLOR = "#45475a"


class WorkflowsWidget(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._setup_ui()

    def _setup_ui(self):
        layout = QVBoxLayout(self)
        layout.setContentsMargins(24, 24, 24, 24)
        layout.setSpacing(16)

        header = QHBoxLayout()
        title = QLabel("Workflows")
        title.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 28px; font-weight: bold;")
        header.addWidget(title)
        header.addStretch()

        add_btn = QPushButton("+ New Workflow")
        add_btn.setStyleSheet(f"""
            QPushButton {{
                background-color: {ACCENT_YELLOW};
                color: #1e1e2e;
                border: none;
                border-radius: 8px;
                padding: 8px 16px;
                font-weight: bold;
                font-size: 13px;
            }}
            QPushButton:hover {{ background-color: #fce8b8; }}
        """)
        header.addWidget(add_btn)
        layout.addLayout(header)

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setStyleSheet("border: none; background: transparent;")

        self.workflows_list = QWidget()
        self.workflows_layout = QVBoxLayout(self.workflows_list)
        self.workflows_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        scroll.setWidget(self.workflows_list)
        layout.addWidget(scroll)
