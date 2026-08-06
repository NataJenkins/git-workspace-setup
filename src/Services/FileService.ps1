<#
.SYNOPSIS
Reads the contents of a file.

.DESCRIPTION
Returns the file contents as a string.
#>

Set-StrictMode -Version Latest
function Get-FileContent {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    return Get-Content -Path $Path -Raw
}