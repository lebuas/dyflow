import uuid
from dataclasses import dataclass


@dataclass
class Snippet:
    id: uuid.UUID
    name: str
    description: str
    category: str


@dataclass
class ListSnippet:
    snippets: list[Snippet]
