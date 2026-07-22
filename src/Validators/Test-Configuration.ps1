<#
.SYNOPSIS
Validates a configuration model.
#>

Set-StrictMode -Version Latest

function Test-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Configuration
    )

    if ([string]::IsNullOrWhiteSpace($Configuration.SchemaVersion)) {
        throw "Configuration schema version is required."
    }

    if ($null -eq $Configuration.Profiles) {
        throw "Configuration profiles collection is required."
    }

    if ($Configuration.Profiles.Count -eq 0) {
        throw "Configuration must contain at least one profile."
    }
}