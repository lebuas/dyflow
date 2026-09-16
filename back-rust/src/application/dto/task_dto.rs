use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize)]
pub struct CreateTaskDto {
    pub title: String,
    pub description: Option<String>,
    pub priority: Option<String>,
}

#[derive(Debug, Serialize)]
pub struct TaskDto {
    pub id: String,
    pub title: String,
    pub description: Option<String>,
    pub status: String,
    pub priority: String,
    pub created_at: String,
}
