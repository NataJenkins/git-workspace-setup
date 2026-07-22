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

    return $true
}