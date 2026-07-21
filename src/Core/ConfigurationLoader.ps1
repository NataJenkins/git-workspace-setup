<#
.SYNOPSIS
Loads a configuration from a JSON file.

.DESCRIPTION
Reads a configuration file and returns a PowerShell object.
#>

Set-StrictMode -Version Latest

function Get-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $json = Get-FileContent -Path $Path

    return ConvertFrom-JsonString -Json $json
}