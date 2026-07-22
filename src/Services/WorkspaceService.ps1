<#
.SYNOPSIS
Gets a workspace from a profile by path.
#>

Set-StrictMode -Version Latest

function Get-Workspace {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Profile,

        [Parameter(Mandatory)]
        [string]$Path
    )
}