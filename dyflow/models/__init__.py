from dataclasses import dataclass, field
from datetime import datetime
from typing import Optional


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
    language: Optional[str] = None
    tags: list[str] = field(default_factory=list)
    copy_count: int = 0
    created_at: str = ""


@dataclass
class Task:
    id: str = ""
    title: str = ""
    description: Optional[str] = None
    status: str = "pending"
    priority: str = "medium"
    created_at: str = ""


@dataclass
class Workflow:
    id: str = ""
    name: str = ""
    description: Optional[str] = None
    steps: list[dict] = field(default_factory=list)
    active: bool = True
    created_at: str = ""


@dataclass
class Script:
    id: str = ""
    name: str = ""
    command: str = ""
    schedule: Optional[str] = None
    description: Optional[str] = None
    active: bool = True
    created_at: str = ""
