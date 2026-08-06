# Manual Testing Guide

## Prerequisites

Open a new PowerShell session.

Go to the project root.

```powershell
cd C:\Users\NataJ\Documents\GitHub\personal\git-workspace-setup
```

---

## Load project modules

```powershell
# Models
. .\src\Models\Configuration.ps1
. .\src\Models\Profile.ps1
. .\src\Models\Workspace.ps1

# Services
. .\src\Services\FileService.ps1
. .\src\Services\JsonService.ps1
. .\src\Services\ProfileService.ps1
. .\src\Services\WorkspaceService.ps1

# Validators
. .\src\Validators\Test-Workspace.ps1
. .\src\Validators\Test-Profile.ps1
. .\src\Validators\Test-Configuration.ps1

# Bootstrappers
. .\src\Bootstrappers\GitBootstrapper.ps1

# Core
. .\src\Core\ConfigurationLoader.ps1
. .\src\Core\ProfileLoader.ps1
. .\src\Core\WorkspaceLoader.ps1
. .\src\Core\ConfigurationResolver.ps1

```

---

## Positive test

```powershell
$config = Get-Configuration -Path ".\examples\config.sample.json"
```

The command should complete without errors.

---

## Negative test template

### 1. Create a backup

```powershell
Copy-Item ".\examples\config.sample.json" ".\examples\config.sample.backup.json"
```

### 2. Modify the original file

Edit:

```
examples/config.sample.json
```

Change only the field required by the current test.

### 3. Execute

```powershell
$config = Get-Configuration -Path ".\examples\config.sample.json"
```

Expected:

A validation exception.

### 4. Restore

```powershell
Move-Item ".\examples\config.sample.backup.json" ".\examples\config.sample.json" -Force
```

### 5. Verify

```powershell
$config = Get-Configuration -Path ".\examples\config.sample.json"
```

The command should complete without errors.
