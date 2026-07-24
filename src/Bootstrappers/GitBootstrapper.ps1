<#
.SYNOPSIS
Installs the Git configuration for a profile.
#>

Set-StrictMode -Version Latest

function Install-GitConfiguration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Profile
    )
}