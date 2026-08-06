<#
.SYNOPSIS
Applies default values to a configuration object.
#>

Set-StrictMode -Version Latest

function Resolve-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Configuration
    )

    return $Configuration
}
