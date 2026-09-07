use crate::domain::entities::{Note, Snippet, Task, Script, Workflow};
use crate::domain::errors::Result;

pub trait NoteService {
    fn create(&self, title: String, content: String, tags: Vec<String>) -> Result<Note>;
    fn get_all(&self) -> Vec<Note>;
    fn search(&self, query: &str) -> Vec<Note>;
    fn delete(&self, id: &str) -> Result<()>;
}

pub trait SnippetService {
    fn create(&self, title: String, content: String, language: Option<String>, tags: Vec<String>) -> Result<Snippet>;
    fn get_all(&self) -> Vec<Snippet>;
    fn increment_copy(&self, id: &str) -> Result<()>;
}

pub trait TaskService {
    fn create(&self, title: String, description: Option<String>, priority: String) -> Result<Task>;
    fn get_pending(&self) -> Vec<Task>;
    fn complete(&self, id: &str) -> Result<()>;
}

pub trait ScriptService {
    fn create(&self, name: String, command: String, schedule: Option<String>) -> Result<Script>;
    fn get_all(&self) -> Vec<Script>;
}

pub trait AiSearchService {
    fn search(&self, query: &str, context: &str) -> Result<String>;
}
