use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Workflow {
    pub id: Uuid,
    pub name: String,
    pub description: Option<String>,
    pub steps: Vec<WorkflowStep>,
    pub active: bool,
    pub created_at: DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WorkflowStep {
    pub name: String,
    pub action: String,
    pub order: u32,
}

impl Workflow {
    pub fn new(name: String, description: Option<String>, steps: Vec<WorkflowStep>) -> Self {
        Self {
            id: Uuid::new_v4(),
            name,
            description,
            steps,
            active: true,
            created_at: Utc::now(),
        }
    }
}
