<#
.SYNOPSIS
Loads all project modules into the current PowerShell session.

.DESCRIPTION
Dot-sources every project script required for local development and manual testing.
#>

Set-StrictMode -Version Latest

$projectRoot = Split-Path $PSScriptRoot -Parent

Write-Host "Loading project modules..."

# Models
. "$projectRoot/src/Models/Configuration.ps1"
. "$projectRoot/src/Models/Profile.ps1"
. "$projectRoot/src/Models/Workspace.ps1"

# Services
. "$projectRoot/src/Services/FileService.ps1"
. "$projectRoot/src/Services/JsonService.ps1"
. "$projectRoot/src/Services/TemplateService.ps1"
. "$projectRoot/src/Services/ProfileService.ps1"
. "$projectRoot/src/Services/WorkspaceService.ps1"

# Validators
. "$projectRoot/src/Validators/Test-Workspace.ps1"
. "$projectRoot/src/Validators/Test-Profile.ps1"
. "$projectRoot/src/Validators/Test-Configuration.ps1"

# Core
. "$projectRoot/src/Core/ConfigurationLoader.ps1"

# Bootstrappers
. "$projectRoot/src/Bootstrappers/GitBootstrapper.ps1"

Write-Host "[OK] Project modules loaded."
