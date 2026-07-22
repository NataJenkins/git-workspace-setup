<#
.SYNOPSIS
Gets a profile from the configuration by name.
#>

Set-StrictMode -Version Latest

function Get-Profile {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Configuration,

        [Parameter(Mandatory)]
        [string]$Name
    )

    $profile = $Configuration.Profiles |
        Where-Object { $_.Name -eq $Name } |
        Select-Object -First 1

    if ($null -eq $profile) {
        throw "Profile '$Name' was not found in the configuration."
    }

    return $profile
}