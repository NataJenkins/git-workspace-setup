<#
.SYNOPSIS
Provides centralized logging for the application.

.DESCRIPTION
Exposes reusable logging functions to provide consistent
console output across the application.
#>

Set-StrictMode -Version Latest

function Write-InfoLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    Write-Host "[INFO] $Message"
}

function Write-WarningLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    Write-Warning "[WARNING] $Message"
}

function Write-ErrorLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    Write-Error "[ERROR] $Message"
}

function Write-DebugLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message,

        [Parameter(Mandatory)]
        [bool]$VerboseEnabled
    )

    if (-not $VerboseEnabled) {
        return
    }

    Write-Host "[DEBUG] $Message"
}
