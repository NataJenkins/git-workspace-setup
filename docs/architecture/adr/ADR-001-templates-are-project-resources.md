# ADR-001: Templates are Project Resources

- **Status:** Accepted
- **Date:** 2026-07-14

---

## Context

Git Workspace Setup generates multiple configuration files during installation, including:

- `.gitconfig`
- `.gitconfig-personal`
- `.gitconfig-work`
- `config`
- `pre-commit`

These files are static templates consumed by the application at runtime.

During the initial project design, we needed to decide whether these files should live alongside the PowerShell source code or be treated as independent project resources.

---

## Decision

Template files will be stored in a dedicated top-level `templates/` directory.

Example:

```text
templates/
├── gitconfig.template
├── gitconfig-personal.template
├── gitconfig-work.template
├── pre-commit.template
└── ssh-config.template
```

PowerShell code responsible for reading these templates will reside under `src/`, but the templates themselves will remain outside the source tree.

---

## Rationale

Templates are data, not executable source code.

Keeping them separate provides a clearer separation of concerns between application logic and static resources.

This organization is also consistent with many modern software projects, where executable code and application assets are stored independently.

---

## Consequences

### Positive

- Clear separation between source code and resources.
- Easier to locate all template files.
- Simplifies future packaging and distribution.
- Makes it easier to support additional templates over time.
- Reduces coupling between the application logic and file resources.

### Negative

- Services that consume templates must resolve paths outside of `src/`.
- Template loading requires centralized path management.

---

## Alternatives Considered

### Store templates inside `src/Templates`

**Rejected**

Although it keeps all project files under a single directory, templates are not source code and would mix executable logic with static assets.

### Generate files directly from PowerShell strings

**Rejected**

Embedding long template strings inside scripts reduces readability, complicates maintenance, and makes template evolution more difficult.

---

## Related Decisions

- ADR-002 — Use PSCustomObject for configuration (planned)
- ADR-003 — Layered architecture (planned)
