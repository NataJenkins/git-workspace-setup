# Manual Testing Guide

## Prerequisites

Open a new PowerShell session.

Go to the project root.

---

## Load project modules

Load all project modules using the project import helper:

```powershell
. .\tools\Import-Project.ps1
```

Expected output:

```text
Loading project modules...
[OK] Project modules loaded.
```

---

## Configuration

### Positive test

```powershell
$config = Get-Configuration -Path ".\examples\config.sample.json"
```

The command should complete without errors.

### Negative test template

#### 1. Create a backup

```powershell
Copy-Item ".\examples\config.sample.json" ".\examples\config.sample.backup.json"
```

#### 2. Modify the original file

Edit:

```text
examples/config.sample.json
```

Change only the field required by the current test.

#### 3. Execute

```powershell
$config = Get-Configuration -Path ".\examples\config.sample.json"
```

Expected:

A validation exception.

#### 4. Restore

```powershell
Move-Item ".\examples\config.sample.backup.json" ".\examples\config.sample.json" -Force
```

#### 5. Verify

```powershell
$config = Get-Configuration -Path ".\examples\config.sample.json"
```

The command should complete without errors.

---

## Logger Service

The logger service provides centralized and consistent console output for the application.

### Info logs

```powershell
Write-InfoLog -Message "Configuration loaded"
```

Expected output:

```text
[INFO] Configuration loaded
```

### Warning logs

```powershell
Write-WarningLog -Message "Configuration may be incomplete"
```

Expected output:

```text
WARNING: [WARNING] Configuration may be incomplete
```

### Error logs

```powershell
Write-ErrorLog -Message "Configuration failed"
```

The error output should contain:

```text
[ERROR] Configuration failed
```

PowerShell may include additional error metadata.

### Debug logs

With verbose mode enabled:

```powershell
Write-DebugLog `
    -Message "Debug information" `
    -VerboseEnabled $true
```

Expected output:

```text
[DEBUG] Debug information
```

With verbose mode disabled:

```powershell
Write-DebugLog `
    -Message "This should not be displayed" `
    -VerboseEnabled $false
```

No output should be produced.

### Debug logs using configuration

The logger can consume the verbose setting exposed by the configuration system:

```powershell
$config = Get-Configuration `
    -Path ".\examples\config.sample.json"

Write-DebugLog `
    -Message "Configuration debug information" `
    -VerboseEnabled $config.Settings.Execution.Verbose
```

Debug output is displayed only when `Settings.Execution.Verbose` is enabled in the configuration.
