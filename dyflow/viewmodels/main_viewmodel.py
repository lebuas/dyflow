from PySide6.QtCore import QObject, Slot


class MainViewModel(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)

    @Slot(str)
    def on_action(self, action: str):
        print(f"Action: {action}")
