from PySide6.QtWidgets import (
    QMainWindow, QWidget, QHBoxLayout, QVBoxLayout,
    QLabel, QLineEdit, QPushButton, QStackedWidget
)
from PySide6.QtCore import Qt, Signal

from dyflow.ui.widgets.sidebar import SidebarItem, SearchBar, AskAIButton
from dyflow.ui.widgets.notes_widget import NotesWidget
from dyflow.ui.widgets.snippets_widget import SnippetsWidget
from dyflow.ui.widgets.tasks_widget import TasksWidget
from dyflow.ui.widgets.workflows_widget import WorkflowsWidget
from dyflow.ui.widgets.scripts_widget import ScriptsWidget


DARK_BG = "#1e1e2e"
SIDEBAR_BG = "#181825"
CARD_BG = "#313244"
HOVER_BG = "#45475a"
TEXT_PRIMARY = "#cdd6f4"
TEXT_SECONDARY = "#a6adc8"
BORDER_COLOR = "#45475a"


class SidebarSection(QLabel):
    def __init__(self, title: str, parent=None):
        super().__init__(title, parent)
        self.setStyleSheet(
            f"color: {TEXT_SECONDARY}; font-size: 11px; font-weight: bold; padding: 8px 16px 4px 16px;"
        )


class Sidebar(QWidget):
    section_changed = Signal(str)

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setFixedWidth(280)
        self.setStyleSheet(f"background-color: {SIDEBAR_BG}; border-right: 1px solid {BORDER_COLOR};")

        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 16, 0, 16)
        layout.setSpacing(0)

        search_row = QHBoxLayout()
        search_row.setContentsMargins(16, 0, 16, 12)
        search_row.addWidget(SearchBar())
        search_row.addWidget(AskAIButton())
        layout.addLayout(search_row)

        layout.addWidget(SidebarSection("RECENTLY VIEWED"))

        recent = SidebarItem("🕐", "Recent Items", "6 recent")
        recent.clicked_data.connect(self._emit)
        layout.addWidget(recent)

        layout.addWidget(SidebarSection("PROJECTS"))

        for icon, name, count in [
            ("📄", "Notes", "13 notes"),
            ("⟨/⟩", "Snippets", "10 snippets"),
            ("▦", "Tasks", "19 tasks"),
            ("📊", "Workflows", "2 workflows"),
            ("📂", "Scripts", "2 scripts"),
        ]:
            item = SidebarItem(icon, name, count)
            item.clicked_data.connect(self._emit)
            layout.addWidget(item)

        layout.addWidget(SidebarSection("SUPPORT"))

        for icon, name in [("?", "Help"), ("💡", "Suggestions"), ("⚠", "Report a problem")]:
            item = SidebarItem(icon, name)
            item.clicked_data.connect(self._emit)
            layout.addWidget(item)

        layout.addStretch()

    def _emit(self, section: str):
        self.section_changed.emit(section)


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("DyFlow")
        self.setMinimumSize(1000, 700)

        central = QWidget()
        self.setCentralWidget(central)

        main_layout = QHBoxLayout(central)
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(0)

        self.sidebar = Sidebar()
        self.sidebar.section_changed.connect(self._on_section_changed)
        main_layout.addWidget(self.sidebar)

        content = QWidget()
        content.setStyleSheet(f"background-color: {DARK_BG};")
        content_layout = QVBoxLayout(content)
        content_layout.setContentsMargins(0, 0, 0, 0)

        self.stack = QStackedWidget()

        self.notes_widget = NotesWidget()
        self.snippets_widget = SnippetsWidget()
        self.tasks_widget = TasksWidget()
        self.workflows_widget = WorkflowsWidget()
        self.scripts_widget = ScriptsWidget()

        placeholder = self._create_placeholder("DyFlow", "Select a section from the sidebar")

        self.stack.addWidget(placeholder)
        self.stack.addWidget(self.notes_widget)
        self.stack.addWidget(self.snippets_widget)
        self.stack.addWidget(self.tasks_widget)
        self.stack.addWidget(self.workflows_widget)
        self.stack.addWidget(self.scripts_widget)

        content_layout.addWidget(self.stack)
        main_layout.addWidget(content)

        self._apply_styles()

    def _create_placeholder(self, title: str, subtitle: str) -> QWidget:
        w = QWidget()
        layout = QVBoxLayout(w)
        layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        t = QLabel(title)
        t.setStyleSheet(f"color: {TEXT_PRIMARY}; font-size: 32px; font-weight: bold;")
        t.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(t)

        s = QLabel(subtitle)
        s.setStyleSheet(f"color: {TEXT_SECONDARY}; font-size: 14px;")
        s.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(s)

        return w

    def _on_section_changed(self, section: str):
        mapping = {
            "notes": 1,
            "snippets": 2,
            "tasks": 3,
            "workflows": 4,
            "scripts": 5,
        }
        index = mapping.get(section, 0)
        self.stack.setCurrentIndex(index)

    def _apply_styles(self):
        self.setStyleSheet(f"""
            QMainWindow {{ background-color: {DARK_BG}; }}
            QScrollBar:vertical {{
                background: {DARK_BG};
                width: 8px;
            }}
            QScrollBar::handle:vertical {{
                background: {HOVER_BG};
                border-radius: 4px;
                min-height: 20px;
            }}
            QScrollBar::add-line:vertical, QScrollBar::sub-line:vertical {{ height: 0px; }}
        """)
