<#
.SYNOPSIS
Installs the Git configuration for a profile.
#>

Set-StrictMode -Version Latest

function Install-GitConfiguration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Profile
    )

    Test-Profile -Profile $Profile

    Write-Verbose "Installing Git configuration..."

    Write-Host "Git configuration"
    Write-Host "-----------------"
    Write-Host "User Name      : $($Profile.Git.UserName)"
    Write-Host "Email          : $($Profile.Git.Email)"
    Write-Host "Default Branch : $($Profile.Git.DefaultBranch)"
}