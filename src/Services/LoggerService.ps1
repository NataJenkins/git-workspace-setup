<#
.SYNOPSIS
Provides centralized logging for the application.

.DESCRIPTION
Exposes reusable logging functions to provide consistent
console output across the application.
#>

Set-StrictMode -Version Latest

function Format-LogMessage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Message
    )

    return "[$Level] $Message"
}

function Write-InfoLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    $formattedMessage = Format-LogMessage `
        -Level "INFO" `
        -Message $Message

    Write-Host $formattedMessage
}

function Write-WarningLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    $formattedMessage = Format-LogMessage `
        -Level "WARNING" `
        -Message $Message

    Write-Warning $formattedMessage
}

function Write-ErrorLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    $formattedMessage = Format-LogMessage `
        -Level "ERROR" `
        -Message $Message

    Write-Error $formattedMessage
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

    $formattedMessage = Format-LogMessage `
        -Level "DEBUG" `
        -Message $Message

    Write-Host $formattedMessage
}
