# Development Conventions

## Purpose

This document defines the development standards used throughout the Git Workspace Setup project.

Following these conventions ensures consistency, maintainability, and readability across the codebase.

---

# Branch Naming

The project follows a simplified Git Flow workflow.

| Type          | Pattern                       |
| ------------- | ----------------------------- |
| Main          | `main`                        |
| Development   | `develop`                     |
| Feature       | `feature/gw-XXX-description`  |
| Fix           | `fix/gw-XXX-description`      |
| Refactor      | `refactor/gw-XXX-description` |
| Documentation | `docs/gw-XXX-description`     |
| Testing       | `test/gw-XXX-description`     |
| Hotfix        | `hotfix/gw-XXX-description`   |

Examples:

```text
feature/gw-001-project-foundation
feature/gw-002-project-standards
fix/gw-015-hook-validation
docs/gw-020-readme-improvements
```

---

# Commit Convention

The project follows the Conventional Commits specification.

| Type     | Purpose                                    |
| -------- | ------------------------------------------ |
| feat     | New functionality                          |
| fix      | Bug fixes                                  |
| docs     | Documentation                              |
| refactor | Code improvements without behavior changes |
| test     | Tests                                      |
| chore    | Maintenance tasks                          |

Examples:

```text
feat(git): install git configuration

fix(hooks): validate work email

docs(readme): update installation guide

refactor(core): simplify configuration loader

test(config): validate configuration parser

chore(project): initialize project foundation
```

---

# Project Structure

```text
src/
├── Bootstrappers/
├── Core/
├── Services/
├── Utils/
└── Validators/

templates/
docs/
examples/
tests/
```

Each directory has a single responsibility.

---

# Naming Convention

## Bootstrappers

**Convention**

PascalCase ending with `Bootstrapper`.

Examples:

```text
GitBootstrapper.ps1
SSHBootstrapper.ps1
HooksBootstrapper.ps1
```

---

## Services

**Convention**

PascalCase ending with `Service`.

Examples:

```text
FileService.ps1
TemplateService.ps1
ConfigurationService.ps1
```

---

## Validators

**Convention**

Approved PowerShell Verb-Noun format.

Examples:

```text
Test-GitConfiguration.ps1
Test-Workspace.ps1
Test-Template.ps1
```

---

## Templates

**Convention**

kebab-case with the `.template` extension.

Examples:

```text
gitconfig.template
gitconfig-personal.template
pre-commit.template
ssh-config.template
```

---

## ADRs

**Convention**

`ADR-XXX-description.md`

Examples:

```text
ADR-001-templates-are-project-resources.md
ADR-002-configuration-engine.md
```

---

## Functions

Use approved PowerShell verbs with PascalCase.

Examples:

```powershell
Install-GitConfiguration
Get-Configuration
Copy-Template
Test-GitConfiguration
```

---

## Variables

Use camelCase.

Examples:

```powershell
$config
$templatePath
$userEmail
$workspaceRoot
```

---

## Folders

Use PascalCase for source code folders.

Examples:

```text
Bootstrappers
Core
Services
Utils
Validators
```

Use lowercase for project resource folders.

Examples:

```text
docs
templates
examples
tests
```

---

# PowerShell Style Guide

## Functions

- Use approved PowerShell verbs.
- Keep functions focused on a single responsibility.
- Prefer small, composable functions.

Example:

```powershell
function Install-GitConfiguration {
    param ()

    # Implementation
}
```

---

## Parameters

- Use PascalCase for parameter names.
- Prefer strongly typed parameters whenever possible.
- Validate input using PowerShell validation attributes.

Example:

```powershell
param(
    [Parameter(Mandatory)]
    [string]$WorkspaceRoot
)
```

---

## Variables

- Use camelCase.
- Prefer descriptive names over abbreviations.

Good:

```powershell
$templatePath
$workspaceRoot
```

Avoid:

```powershell
$tmp
$cfg
```

---

## Objects

Prefer `PSCustomObject` for structured data.

```powershell
$config = [PSCustomObject]@{
    UserName = ""
    Email = ""
    WorkspaceRoot = ""
}
```

Avoid nested hashtables unless dictionary behavior is required.

---

## Formatting

- Use four spaces for indentation.
- One statement per line.
- Add blank lines between logical sections.
- Keep line length reasonable.

---

## Comments

Explain **why**, not **what**.

Good:

```powershell
# GitHub requires a trailing slash for includeIf paths.
```

Avoid:

```powershell
# Increment counter
$counter++
```

---

## Error Handling

- Throw meaningful exceptions.
- Never suppress unexpected errors.
- Validate inputs before performing operations.

---

## Output

Functions should return objects whenever possible.

Avoid writing directly to the console unless displaying progress or user-facing messages.

Prefer:

```powershell
return $config
```

Instead of:

```powershell
Write-Host $config
```

---

# Design Principles

The project follows these core principles:

- Single Responsibility Principle
- Configuration over Hardcoding
- Idempotent Operations
- Safe by Default
- Modular Architecture
- Readability over Cleverness
- Explicit over Implicit

---

# Error Handling

- Never silently ignore errors.
- Validate inputs before execution.
- Throw meaningful exceptions.
- Fail fast whenever possible.

---

# Logging

Scripts should provide clear, user-friendly progress messages.

Examples:

```text
Installing Git configuration...

Copying templates...

Validating workspace...

Installation completed successfully.
```

Avoid unnecessary verbose output unless explicitly requested.

---

# Documentation

- Public modules should be documented.
- Significant architectural decisions must be recorded as ADRs.
- Development guides belong in `docs/guides`.
- Keep documentation synchronized with implementation.

---

# Future Automation

These conventions are intended to become enforceable through automated validation.

Planned validations include:

- File naming conventions
- Folder structure validation
- Template naming validation
- Configuration schema validation
- Project structure validation
