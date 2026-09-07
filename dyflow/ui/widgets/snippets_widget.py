from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QLabel,
    QLineEdit, QPushButton, QScrollArea, QFrame
)
from PySide6.QtCore import Qt


DARK_BG = "#1e1e2e"
CARD_BG = "#313244"
HOVER_BG = "#45475a"
TEXT_PRIMARY = "#cdd6f4"
TEXT_SECONDARY = "#a6adc8"
ACCENT_GREEN = "#a6e3a1"
BORDER_COLOR = "#45475a"


class SnippetsWidget(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._setup_ui()

    def _setup_ui(self):
        layout = QVBoxLayout(self)
        layout.setContentsMargins(24, 24, 24, 24)
        layout.setSpacing(16)

        header = QHBoxLayout()
        title = QLabel("Snippets")
        title.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 28px; font-weight: bold;")
        header.addWidget(title)
        header.addStretch()

        add_btn = QPushButton("+ New Snippet")
        add_btn.setStyleSheet(f"""
            QPushButton {{
                background-color: {ACCENT_GREEN};
                color: #1e1e2e;
                border: none;
                border-radius: 8px;
                padding: 8px 16px;
                font-weight: bold;
                font-size: 13px;
            }}
            QPushButton:hover {{ background-color: #c1f0c1; }}
        """)
        header.addWidget(add_btn)
        layout.addLayout(header)

        search = QLineEdit()
        search.setPlaceholderText("Search snippets...")
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

        self.snippets_list = QWidget()
        self.snippets_layout = QVBoxLayout(self.snippets_list)
        self.snippets_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        scroll.setWidget(self.snippets_list)
        layout.addWidget(scroll)
