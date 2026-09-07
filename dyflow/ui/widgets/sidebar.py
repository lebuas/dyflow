from PySide6.QtWidgets import (
    QLineEdit, QPushButton, QVBoxLayout, QHBoxLayout,
    QLabel, QFrame, QWidget, QScrollArea
)
from PySide6.QtCore import Qt, Signal

DARK_BG = "#1e1e2e"
SIDEBAR_BG = "#181825"
CARD_BG = "#313244"
HOVER_BG = "#45475a"
TEXT_PRIMARY = "#cdd6f4"
TEXT_SECONDARY = "#a6adc8"
ACCENT_MAUVE = "#cba6f7"
BORDER_COLOR = "#45475a"


class SearchBar(QLineEdit):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setPlaceholderText("Search in docs")
        self.setFixedHeight(36)
        self.setStyleSheet(f"""
            QLineEdit {{
                background-color: {CARD_BG};
                border: 1px solid {BORDER_COLOR};
                border-radius: 8px;
                padding: 0 12px;
                color: {TEXT_PRIMARY};
                font-size: 13px;
            }}
            QLineEdit:focus {{ border: 1px solid #89b4fa; }}
        """)


class AskAIButton(QPushButton):
    def __init__(self, parent=None):
        super().__init__("✨ Ask AI", parent)
        self.setFixedHeight(36)
        self.setCursor(Qt.CursorShape.PointingHandCursor)
        self.setStyleSheet(f"""
            QPushButton {{
                background-color: {CARD_BG};
                border: 1px solid {BORDER_COLOR};
                border-radius: 8px;
                padding: 0 16px;
                color: {ACCENT_MAUVE};
                font-size: 13px;
                font-weight: bold;
            }}
            QPushButton:hover {{
                background-color: {HOVER_BG};
                border: 1px solid {ACCENT_MAUVE};
            }}
        """)


class SidebarItem(QPushButton):
    clicked_data = Signal(str)

    def __init__(self, icon: str, title: str, count: str = "", parent=None):
        super().__init__(parent)
        self.item_data = title.lower()
        self.setFixedHeight(40)
        self.setCursor(Qt.CursorShape.PointingHandCursor)

        layout = QHBoxLayout(self)
        layout.setContentsMargins(16, 0, 16, 0)

        icon_label = QLabel(icon)
        icon_label.setFixedWidth(24)
        icon_label.setStyleSheet("font-size: 16px;")
        layout.addWidget(icon_label)

        title_label = QLabel(title)
        title_label.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 13px;")
        layout.addWidget(title_label)

        layout.addStretch()

        if count:
            count_label = QLabel(count)
            count_label.setStyleSheet(f"color: {TEXT_SECONDARY}; font-size: 11px;")
            layout.addWidget(count_label)
            arrow = QLabel("▶")
            arrow.setStyleSheet(f"color: {TEXT_SECONDARY}; font-size: 10px;")
            layout.addWidget(arrow)

        self.setStyleSheet(f"""
            QPushButton {{
                background-color: transparent;
                border: none;
                border-radius: 6px;
                text-align: left;
            }}
            QPushButton:hover {{ background-color: {HOVER_BG}; }}
        """)

    def mousePressEvent(self, event):
        self.clicked_data.emit(self.item_data)
        super().mousePressEvent(event)
