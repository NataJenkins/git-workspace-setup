# src\Core\WorkspaceLoader.ps1


<#
.SYNOPSIS
Loads a workspace from a configuration file.
#>

Set-StrictMode -Version Latest
function Get-WorkspaceFromConfiguration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ConfigurationPath,

        [Parameter(Mandatory)]
        [string]$ProfileName,

        [Parameter(Mandatory)]
        [string]$WorkspacePath
    )

    $profile = Get-ProfileFromConfiguration `
        -ConfigurationPath $ConfigurationPath `
        -ProfileName $ProfileName

    return Get-Workspace `
        -Profile $profile `
        -Path $WorkspacePath
}
