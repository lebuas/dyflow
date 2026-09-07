# DyFlow

> **⚠️ Este proyecto se encuentra en construcción. La funcionalidad y estructura pueden cambiar.**

## Descripción

**DyFlow** es una aplicación de escritorio para gestionar tu día a día. Administra notas rápidas, snippets de texto y código, tareas diarias, workflows y scripts con búsqueda inteligente potenciada por IA.

## Funcionalidades

- **Notes** — Notas rápidas con búsqueda
- **Snippets** — Fragmentos de texto o código reutilizables
- **Tasks** — Gestión de tareas diarias con prioridades
- **Workflows** — Secuencias de tareas automatizadas
- **Scripts** — Scripts con ejecución programada (cron jobs)
- **Búsqueda IA** — Búsqueda inteligente con IA

## Arquitectura

### Frontend (PySide6) — MVC
```
python/dyflow/
├── models/          # Modelos de datos (dataclasses)
├── views/           # Vistas PySide6 (UI)
└── controllers/     # Controladores (lógica de presentación)
```

### Backend (Rust) — Clean Architecture
```
rust/src/
├── domain/              # Entidades y reglas de negocio
│   ├── entities/
│   └── errors/
├── application/         # Servicios y DTOs
│   ├── services/
│   └── dto/
└── infrastructure/      # Almacenamiento y servicios externos
    ├── storage/
    └── ai/
```

## Tech Stack

- **Frontend**: PySide6 (Qt for Python)
- **Backend**: Rust + PyO3 + maturin
- **UI**: Dark theme estilo sidebar con secciones

## Instalación

```bash
git clone git@github.com:lebuas/dyflow.git
cd dyflow
python -m venv .venv
source .venv/bin/activate
pip install maturin
maturin develop
pip install PySide6
```

## Ejecución

```bash
python -m dyflow.main
```

## Licencia

MIT
