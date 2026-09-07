use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Script {
    pub id: Uuid,
    pub name: String,
    pub command: String,
    pub schedule: Option<String>,
    pub description: Option<String>,
    pub last_run: Option<DateTime<Utc>>,
    pub active: bool,
    pub created_at: DateTime<Utc>,
}

impl Script {
    pub fn new(name: String, command: String, schedule: Option<String>, description: Option<String>) -> Self {
        Self {
            id: Uuid::new_v4(),
            name,
            command,
            schedule,
            description,
            last_run: None,
            active: true,
            created_at: Utc::now(),
        }
    }
}
