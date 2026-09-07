from PySide6.QtWidgets import QMainWindow
from dyflow.views import Sidebar, ContentArea


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("DyFlow")
        self.setMinimumSize(1000, 700)

        central = self._create_central_widget()
        self.setCentralWidget(central)

        self.sidebar.section_changed.connect(self.content_area.show_section)

        self._apply_global_styles()

    def _create_central_widget(self):
        from PySide6.QtWidgets import QWidget, QHBoxLayout

        widget = QWidget()
        layout = QHBoxLayout(widget)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        self.sidebar = Sidebar()
        layout.addWidget(self.sidebar)

        self.content_area = ContentArea()
        layout.addWidget(self.content_area)

        return widget

    def _apply_global_styles(self):
        self.setStyleSheet(f"""
            QMainWindow {{
                background-color: #1e1e2e;
            }}
            QScrollBar:vertical {{
                background: #1e1e2e;
                width: 8px;
            }}
            QScrollBar::handle:vertical {{
                background: #45475a;
                border-radius: 4px;
                min-height: 20px;
            }}
            QScrollBar::handle:vertical:hover {{
                background: #585b70;
            }}
            QScrollBar::add-line:vertical, QScrollBar::sub-line:vertical {{
                height: 0px;
            }}
        """)
