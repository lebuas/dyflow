from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QLabel,
    QLineEdit, QPushButton, QTextEdit, QScrollArea
)
from PySide6.QtCore import Qt, Signal


DARK_BG = "#1e1e2e"
CARD_BG = "#313244"
HOVER_BG = "#45475a"
TEXT_PRIMARY = "#cdd6f4"
TEXT_SECONDARY = "#a6adc8"
ACCENT_BLUE = "#89b4fa"
BORDER_COLOR = "#45475a"


class NotesWidget(QWidget):
    note_selected = Signal(dict)

    def __init__(self, parent=None):
        super().__init__(parent)
        self._setup_ui()

    def _setup_ui(self):
        layout = QVBoxLayout(self)
        layout.setContentsMargins(24, 24, 24, 24)
        layout.setSpacing(16)

        header = QHBoxLayout()
        title = QLabel("Notes")
        title.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 28px; font-weight: bold;")
        header.addWidget(title)
        header.addStretch()

        add_btn = QPushButton("+ New Note")
        add_btn.setStyleSheet(f"""
            QPushButton {{
                background-color: {ACCENT_BLUE};
                color: #1e1e2e;
                border: none;
                border-radius: 8px;
                padding: 8px 16px;
                font-weight: bold;
                font-size: 13px;
            }}
            QPushButton:hover {{ background-color: #b4d0fb; }}
        """)
        header.addWidget(add_btn)
        layout.addLayout(header)

        search = QLineEdit()
        search.setPlaceholderText("Search notes...")
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

        self.notes_list = QWidget()
        self.notes_layout = QVBoxLayout(self.notes_list)
        self.notes_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        scroll.setWidget(self.notes_list)
        layout.addWidget(scroll)

    def add_note_card(self, title: str, preview: str):
        card = QPushButton()
        card.setFixedHeight(80)
        card.setCursor(Qt.CursorShape.PointingHandCursor)
        card.setStyleSheet(f"""
            QPushButton {{
                background-color: {CARD_BG};
                border: 1px solid {BORDER_COLOR};
                border-radius: 8px;
                text-align: left;
                padding: 12px 16px;
            }}
            QPushButton:hover {{ background-color: {HOVER_BG}; }}
        """)

        layout = QVBoxLayout(card)
        layout.setContentsMargins(0, 0, 0, 0)

        title_label = QLabel(title)
        title_label.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 14px; font-weight: bold; border: none;")
        layout.addWidget(title_label)

        preview_label = QLabel(preview)
        preview_label.setStyleSheet(f"color: {TEXT_SECONDARY}; font-size: 12px; border: none;")
        preview_label.setWordWrap(True)
        layout.addWidget(preview_label)

        self.notes_layout.addWidget(card)
