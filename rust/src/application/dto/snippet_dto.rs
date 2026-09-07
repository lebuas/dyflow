use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize)]
pub struct CreateSnippetDto {
    pub title: String,
    pub content: String,
    pub language: Option<String>,
    pub tags: Option<Vec<String>>,
}

#[derive(Debug, Serialize)]
pub struct SnippetDto {
    pub id: String,
    pub title: String,
    pub content: String,
    pub language: Option<String>,
    pub tags: Vec<String>,
    pub copy_count: u32,
    pub created_at: String,
}
