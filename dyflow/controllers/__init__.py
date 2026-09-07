from dyflow.views import Sidebar, ContentArea


class MainController:
    def __init__(self, sidebar: Sidebar, content_area: ContentArea):
        self.sidebar = sidebar
        self.content_area = content_area

        self.sidebar.section_changed.connect(self._on_section_changed)

    def _on_section_changed(self, section: str):
        self.content_area.show_section(section)
