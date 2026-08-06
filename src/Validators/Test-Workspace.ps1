<#
.SYNOPSIS
Validates a workspace model.
#>

Set-StrictMode -Version Latest

function Test-Workspace {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Workspace
    )

    if ([string]::IsNullOrWhiteSpace($Workspace.Path)) {
        throw "Configuration validation failed: Workspace path is required."
    }
}