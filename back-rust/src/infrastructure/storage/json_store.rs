use std::fs;
use std::path::PathBuf;
use crate::domain::entities::{Note, Snippet, Task, Script};
use crate::domain::errors::{DyFlowError, Result};

pub struct JsonStorage {
    data_dir: PathBuf,
}

impl JsonStorage {
    pub fn new() -> Self {
        let data_dir = dirs().unwrap_or_else(|| PathBuf::from(".dyflow"));
        fs::create_dir_all(&data_dir).ok();
        Self { data_dir }
    }

    fn file_path(&self, name: &str) -> PathBuf {
        self.data_dir.join(format!("{}.json", name))
    }

    pub fn load_notes(&self) -> Result<Vec<Note>> {
        let path = self.file_path("notes");
        if !path.exists() {
            return Ok(Vec::new());
        }
        let data = fs::read_to_string(&path).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        serde_json::from_str(&data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }

    pub fn save_notes(&self, notes: &[Note]) -> Result<()> {
        let data = serde_json::to_string_pretty(notes).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        fs::write(self.file_path("notes"), data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }

    pub fn load_snippets(&self) -> Result<Vec<Snippet>> {
        let path = self.file_path("snippets");
        if !path.exists() {
            return Ok(Vec::new());
        }
        let data = fs::read_to_string(&path).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        serde_json::from_str(&data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }

    pub fn save_snippets(&self, snippets: &[Snippet]) -> Result<()> {
        let data = serde_json::to_string_pretty(snippets).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        fs::write(self.file_path("snippets"), data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }

    pub fn load_tasks(&self) -> Result<Vec<Task>> {
        let path = self.file_path("tasks");
        if !path.exists() {
            return Ok(Vec::new());
        }
        let data = fs::read_to_string(&path).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        serde_json::from_str(&data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }

    pub fn save_tasks(&self, tasks: &[Task]) -> Result<()> {
        let data = serde_json::to_string_pretty(tasks).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        fs::write(self.file_path("tasks"), data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }

    pub fn load_scripts(&self) -> Result<Vec<Script>> {
        let path = self.file_path("scripts");
        if !path.exists() {
            return Ok(Vec::new());
        }
        let data = fs::read_to_string(&path).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        serde_json::from_str(&data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }

    pub fn save_scripts(&self, scripts: &[Script]) -> Result<()> {
        let data = serde_json::to_string_pretty(scripts).map_err(|e| DyFlowError::Storage(e.to_string()))?;
        fs::write(self.file_path("scripts"), data).map_err(|e| DyFlowError::Storage(e.to_string()))
    }
}

fn dirs() -> Option<PathBuf> {
    dirs_next::data_dir().map(|d| d.join("dyflow"))
}
