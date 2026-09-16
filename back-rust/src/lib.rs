mod mod_domain;
mod mod_application;
mod mod_infrastructure;

use pyo3::prelude::*;
use mod_domain::domain::entities::{Note, Snippet, Task, TaskPriority, Script};
use mod_infrastructure::infrastructure::storage::json_store::JsonStorage;

#[pyfunction]
fn greet(name: &str) -> String {
    format!("¡Hola, {}! Soy DyFlow.", name)
}

#[pyfunction]
fn create_note(title: String, content: String) -> String {
    let note = Note::new(title, content, vec![]);
    serde_json::to_string(&note).unwrap_or_default()
}

#[pyfunction]
fn create_task(title: String, priority: String) -> String {
    let p = match priority.as_str() {
        "high" => TaskPriority::High,
        "low" => TaskPriority::Low,
        _ => TaskPriority::Medium,
    };
    let task = Task::new(title, None, p);
    serde_json::to_string(&task).unwrap_or_default()
}

#[pyfunction]
fn create_snippet(title: String, content: String) -> String {
    let snippet = Snippet::new(title, content, None, vec![]);
    serde_json::to_string(&snippet).unwrap_or_default()
}

#[pyfunction]
fn create_script(name: String, command: String) -> String {
    let script = Script::new(name, command, None, None);
    serde_json::to_string(&script).unwrap_or_default()
}

#[pyfunction]
fn ai_search(query: String, context: String) -> String {
    format!("Resultados IA para '{}' en '{}'", query, context)
}

#[pymodule]
fn _core(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(greet, m)?)?;
    m.add_function(wrap_pyfunction!(create_note, m)?)?;
    m.add_function(wrap_pyfunction!(create_task, m)?)?;
    m.add_function(wrap_pyfunction!(create_snippet, m)?)?;
    m.add_function(wrap_pyfunction!(create_script, m)?)?;
    m.add_function(wrap_pyfunction!(ai_search, m)?)?;
    Ok(())
}
