use std::fmt;

#[derive(Debug)]
pub enum DyFlowError {
    NotFound(String),
    Validation(String),
    Storage(String),
    Ai(String),
}

impl fmt::Display for DyFlowError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::NotFound(msg) => write!(f, "No encontrado: {}", msg),
            Self::Validation(msg) => write!(f, "Error de validación: {}", msg),
            Self::Storage(msg) => write!(f, "Error de almacenamiento: {}", msg),
            Self::Ai(msg) => write!(f, "Error de IA: {}", msg),
        }
    }
}

impl std::error::Error for DyFlowError {}

pub type Result<T> = std::result::Result<T, DyFlowError>;
