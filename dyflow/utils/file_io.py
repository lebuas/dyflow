import json
from pathlib import Path


DATA_DIR = Path.home() / ".dyflow"
DATA_DIR.mkdir(parents=True, exist_ok=True)


def load_json(filename: str) -> list:
    path = DATA_DIR / filename
    if not path.exists():
        return []
    with open(path, "r") as f:
        return json.load(f)


def save_json(filename: str, data: list):
    path = DATA_DIR / filename
    with open(path, "w") as f:
        json.dump(data, f, indent=2)
