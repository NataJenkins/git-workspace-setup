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
}