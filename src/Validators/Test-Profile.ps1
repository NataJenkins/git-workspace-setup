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
}