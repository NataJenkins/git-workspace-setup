# ADR-002 - Configuration Schema

- **Status:** Accepted
- **Date:** 2026-07-16

---

## Context

The project requires a configuration format that is easy to understand, extensible, and independent from the implementation details.

The configuration file acts as the primary interface between the user and the application. All modules should consume configuration through a common model rather than accessing configuration files directly.

The schema should support multiple development environments, users, and future project extensions without requiring changes to the application's core logic.

---

## Decision

The project adopts a JSON-based configuration file (`config.json`) as the single source of truth.

The schema is organized into two main sections:

- `settings`
- `profiles`

### Settings

Global application behavior is defined under the `settings` section.

Settings are grouped by responsibility:

- `execution`
- `installation`

This separation allows future settings to be added without impacting profile definitions.

### Profiles

A profile represents a development identity rather than a repository or workspace.

Each profile contains:

- Name
- Description
- Workspaces
- Git configuration
- SSH configuration
- Git Hooks configuration
- VS Code configuration

Profiles are stored as an array to support an arbitrary number of identities.

Examples include:

- Personal
- Work
- ClientA
- ClientB
- OpenSource

The application does not assume the existence of predefined profile names.

### Workspaces

Each profile owns one or more workspaces.

Workspaces are represented as an array rather than a single path to allow multiple repository locations to share the same configuration.

---

## Consequences

### Advantages

- Supports unlimited development profiles.
- Supports multiple workspaces per profile.
- Decouples configuration from implementation.
- Easily extensible for future features.
- Provides a stable contract between the user and the application.

### Trade-offs

- Slightly more verbose than a fixed Personal/Work configuration.
- Requires profile iteration during installation.

---

## Alternatives Considered

### Fixed Personal / Work configuration

```json
{
  "personal": {},
  "work": {}
}
```

Rejected because it limits scalability and assumes only two development identities.

---

### Workspace-first configuration

```json
{
  "workspaces": []
}
```

Rejected because multiple workspaces often belong to the same development identity and should share common settings.

---

## Rationale

The chosen schema models real-world development identities instead of repository locations.

This approach minimizes duplication, improves maintainability, and allows the application to evolve without introducing breaking changes to the configuration format.
