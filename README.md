# Git Workspace Setup

> Automate the setup of a professional Git workspace for managing multiple GitHub accounts.

## Overview

Git Workspace Setup is a PowerShell-based automation tool that configures a development environment for working with multiple Git identities.

The project aims to simplify the setup process by automating common tasks such as:

- Git configuration
- SSH configuration
- Repository workspace organization
- Global Git hooks
- Development environment setup

The project is designed to be:

- Modular
- Idempotent
- Safe by default
- Configuration-driven
- Open Source friendly
- Configuration-driven installation

---

## Features

- Multiple Git identities
- SSH key management
- Workspace organization
- Global Git Hooks
- Interactive setup wizard
- JSON configuration support

---

## Configuration

Git Workspace Setup is configuration-driven.

Project settings are defined in a JSON configuration file that acts as the single source of truth for the application.

The configuration system is responsible for:

- Loading the configuration from disk.
- Applying default values for optional settings.
- Validating the configuration structure.
- Exposing a strongly typed configuration object to the rest of the application.

Example configuration:

```json
{
  "schemaVersion": "1.0",
  "profiles": [
    {
      "name": "Personal"
    }
  ]
}
```

A complete configuration example is available at:

- `examples/config.sample.json`

---

## Documentation

- [Roadmap](ROADMAP.md)
- [Development Conventions](docs/guides/development-conventions.md)
- [Architecture](docs/architecture/README.md)

---

## License

This project is licensed under the MIT License.

## Project Conventions

### Branch Naming

The project follows a simplified Git Flow workflow.

| Type          | Pattern                       | Example                             |
| ------------- | ----------------------------- | ----------------------------------- |
| Main          | `main`                        | `main`                              |
| Development   | `develop`                     | `develop`                           |
| Feature       | `feature/gw-XXX-description`  | `feature/gw-001-project-foundation` |
| Fix           | `fix/gw-XXX-description`      | `fix/gw-032-hook-validation`        |
| Refactor      | `refactor/gw-XXX-description` | `refactor/gw-005-config-loader`     |
| Documentation | `docs/gw-XXX-description`     | `docs/gw-070-architecture`          |
| Testing       | `test/gw-XXX-description`     | `test/gw-073-unit-tests`            |
| Hotfix        | `hotfix/gw-XXX-description`   | `hotfix/gw-082-invalid-hook`        |

---

### Commit Convention

This project follows the **Conventional Commits** specification.

Examples:

```text
feat(git): add git configuration installer

fix(hooks): validate work email

docs(readme): update installation guide

refactor(core): simplify bootstrap pipeline

test(config): add configuration validation tests

chore(project): initialize project foundation
```

---

### Issue Naming

All work items use the following format:

```text
GW-001 — Project Foundation
GW-002 — Project Standards
GW-003 — Configuration Engine
```

---

### Pull Request Naming

Pull requests should reference the related work item.

Example:

```text
GW-001: Initialize project foundation

GW-002: Define project standards
```

---

### Architecture Decisions

Important architectural decisions are documented as ADRs (Architecture Decision Records).

Example:

```text
ADR-001 — Templates are Project Resources
ADR-002 — Use PSCustomObject for Configuration
```

See:

- [`docs/architecture`](docs/architecture/)
