<#
.SYNOPSIS
Validates a profile model.
#>

Set-StrictMode -Version Latest

function Test-Profile {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Profile
    )

    if ([string]::IsNullOrWhiteSpace($Profile.Name)) {
        throw "Configuration validation failed: Profile name is required."
    }

    if ($null -eq $Profile.Workspaces) {
        throw "Configuration validation failed: Profile workspaces collection is required."
    }

    if ($Profile.Workspaces.Count -eq 0) {
        throw "Configuration validation failed: Profile must define at least one workspace."
    }
}