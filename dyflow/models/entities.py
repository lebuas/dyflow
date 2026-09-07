from dataclasses import dataclass, field


@dataclass
class Note:
    id: str = ""
    title: str = ""
    content: str = ""
    tags: list[str] = field(default_factory=list)
    created_at: str = ""
    updated_at: str = ""


@dataclass
class Snippet:
    id: str = ""
    title: str = ""
    content: str = ""
    language: str = ""
    tags: list[str] = field(default_factory=list)
    copy_count: int = 0
    created_at: str = ""


@dataclass
class Task:
    id: str = ""
    title: str = ""
    description: str = ""
    status: str = "pending"
    priority: str = "medium"
    created_at: str = ""


@dataclass
class Workflow:
    id: str = ""
    name: str = ""
    description: str = ""
    steps: list[dict] = field(default_factory=list)
    active: bool = True
    created_at: str = ""


@dataclass
class Script:
    id: str = ""
    name: str = ""
    command: str = ""
    schedule: str = ""
    description: str = ""
    active: bool = True
    created_at: str = ""
