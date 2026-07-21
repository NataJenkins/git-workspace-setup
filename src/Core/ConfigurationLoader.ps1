<#
.SYNOPSIS
Loads a configuration from a JSON file.

.DESCRIPTION
Reads a configuration file and returns a configuration object.
#>

Set-StrictMode -Version Latest

function Get-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )
}