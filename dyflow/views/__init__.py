from PySide6.QtWidgets import (
    QMainWindow, QWidget, QVBoxLayout, QHBoxLayout,
    QLabel, QLineEdit, QFrame, QPushButton, QScrollArea,
    QStackedWidget, QListWidget, QListWidgetItem
)
from PySide6.QtCore import Qt, Signal, QSize
from PySide6.QtGui import QFont, QIcon, QColor


DARK_BG = "#1e1e2e"
SIDEBAR_BG = "#181825"
CARD_BG = "#313244"
HOVER_BG = "#45475a"
TEXT_PRIMARY = "#cdd6f4"
TEXT_SECONDARY = "#a6adc8"
ACCENT_GREEN = "#a6e3a1"
ACCENT_BLUE = "#89b4fa"
ACCENT_MAUVE = "#cba6f7"
ACCENT_PEACH = "#fab387"
ACCENT_YELLOW = "#f9e2af"
ACCENT_RED = "#f38ba8"
ACCENT_TEAL = "#94e2d5"
BORDER_COLOR = "#45475a"


class SidebarSection(QLabel):
    def __init__(self, title: str, parent=None):
        super().__init__(title, parent)
        self.setStyleSheet(f"color: {TEXT_SECONDARY}; font-size: 11px; font-weight: bold; padding: 8px 16px 4px 16px;")


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
            QPushButton:hover {{
                background-color: {HOVER_BG};
            }}
        """)

    def mousePressEvent(self, event):
        self.clicked_data.emit(self.item_data)
        super().mousePressEvent(event)


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
            QLineEdit:focus {{
                border: 1px solid {ACCENT_BLUE};
            }}
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


class Sidebar(QWidget):
    section_changed = Signal(str)

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setFixedWidth(280)
        self.setStyleSheet(f"background-color: {SIDEBAR_BG}; border-right: 1px solid {BORDER_COLOR};")

        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 16, 0, 16)
        layout.setSpacing(0)

        search_layout = QHBoxLayout()
        search_layout.setContentsMargins(16, 0, 16, 12)
        self.search_bar = SearchBar()
        search_layout.addWidget(self.search_bar)
        self.ask_ai_btn = AskAIButton()
        search_layout.addWidget(self.ask_ai_btn)
        layout.addLayout(search_layout)

        layout.addWidget(SidebarSection("RECENTLY VIEWED"))
        self.recent_item = SidebarItem("🕐", "Recent Items", "6 recent")
        self.recent_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.recent_item)

        layout.addWidget(SidebarSection("PROJECTS"))

        self.notes_item = SidebarItem("📄", "Notes", "13 notes")
        self.notes_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.notes_item)

        self.snippets_item = SidebarItem("⟨/⟩", "Snippets", "10 snippets")
        self.snippets_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.snippets_item)

        self.tasks_item = SidebarItem("▦", "Tasks", "19 tasks")
        self.tasks_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.tasks_item)

        self.workflows_item = SidebarItem("📊", "Workflows", "2 workflows")
        self.workflows_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.workflows_item)

        self.scripts_item = SidebarItem("📂", "Scripts", "2 scripts")
        self.scripts_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.scripts_item)

        layout.addWidget(SidebarSection("SUPPORT"))

        self.help_item = SidebarItem("?", "Help")
        self.help_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.help_item)

        self.suggestions_item = SidebarItem("💡", "Suggestions")
        self.suggestions_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.suggestions_item)

        self.report_item = SidebarItem("⚠", "Report a problem")
        self.report_item.clicked_data.connect(self._on_item_clicked)
        layout.addWidget(self.report_item)

        layout.addStretch()

    def _on_item_clicked(self, section: str):
        self.section_changed.emit(section)


class ContentArea(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setStyleSheet(f"background-color: {DARK_BG};")

        layout = QVBoxLayout(self)
        layout.setContentsMargins(24, 24, 24, 24)

        self.stack = QStackedWidget()
        layout.addWidget(self.stack)

        self._create_pages()

    def _create_pages(self):
        pages = {
            "recent": self._create_placeholder("Recently Viewed", "6 recent items"),
            "notes": self._create_placeholder("Notes", "13 notes"),
            "snippets": self._create_placeholder("Snippets", "10 snippets"),
            "tasks": self._create_placeholder("Tasks", "19 tasks"),
            "workflows": self._create_placeholder("Workflows", "2 workflows"),
            "scripts": self._create_placeholder("Scripts", "2 scripts"),
            "help": self._create_placeholder("Help", "Centro de ayuda"),
            "suggestions": self._create_placeholder("Suggestions", "Sugerencias y feedback"),
            "report": self._create_placeholder("Report a problem", "Reportar un problema"),
        }

        self.pages = {}
        for key, widget in pages.items():
            self.stack.addWidget(widget)
            self.pages[key] = widget

    def _create_placeholder(self, title: str, subtitle: str) -> QWidget:
        widget = QWidget()
        layout = QVBoxLayout(widget)
        layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        title_label = QLabel(title)
        title_label.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 28px; font-weight: bold;")
        title_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title_label)

        subtitle_label = QLabel(subtitle)
        subtitle_label.setStyleSheet(f"color: {TEXT_SECONDARY}; font-size: 14px;")
        subtitle_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(subtitle_label)

        return widget

    def show_section(self, section: str):
        if section in self.pages:
            self.stack.setCurrentWidget(self.pages[section])
