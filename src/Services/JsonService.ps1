<#
.SYNOPSIS
Converts a JSON string into a PowerShell object.
#>

Set-StrictMode -Version Latest
function ConvertFrom-JsonString {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Json
    )

    return $Json | ConvertFrom-Json
}