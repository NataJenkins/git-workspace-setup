#src\Services\FileService.ps1

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


function Set-FileContent {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$Content
    )

    $directory = Split-Path `
        -Path $Path `
        -Parent

    if (
        -not [string]::IsNullOrWhiteSpace($directory) -and
        -not (Test-Path $directory)
    ) {
        New-Item `
            -ItemType Directory `
            -Path $directory `
            -ErrorAction Stop | Out-Null
    }

    Set-Content `
        -Path $Path `
        -Value $Content `
        -ErrorAction Stop
}
