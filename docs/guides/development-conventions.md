# Development Conventions

## Branch Naming

- main
- develop
- feature/GW-XXX-description
- fix/GW-XXX-description
- docs/GW-XXX-description

---

## Commit Convention

The project follows the Conventional Commits specification.

Examples:

- feat:
- fix:
- docs:
- refactor:
- test:
- chore:

---

## Naming Convention

### Bootstrappers

PascalCase

Example:

GitBootstrapper.ps1

---

### Services

PascalCase

Example:

FileService.ps1

---

### Validators

Verb-Noun

Example:

Test-Git.ps1

---

### Templates

kebab-case

Example:

gitconfig-personal.template

---

### ADRs

ADR-XXX-description.md

Example:

ADR-001-templates-are-project-resources.md

---

## Design Principles

- Single Responsibility Principle
- Configuration over Hardcoding
- Idempotent Operations
- Safe by Default
- Modular Architecture
