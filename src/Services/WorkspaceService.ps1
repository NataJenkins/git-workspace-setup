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

    $workspace = $Profile.Workspaces |
        Where-Object { $_.Path -eq $Path } |
        Select-Object -First 1

    if ($null -eq $workspace) {
        throw "Workspace '$Path' was not found in the profile."
    }

    return $workspace
}