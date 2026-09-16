from dataclasses import dataclass
from sys import settrace


@dataclass
class Projects:
    notes: str = "Notes"
    snippet: str = "Snippet"
    task: str = "Task"
    workflow: str = "Workflow"
    script: str = "Script"

@dataclass
class Support:
    setting: str = "Setting"
    suggestion: str = "Suggestion"
    report: str = "Report"
