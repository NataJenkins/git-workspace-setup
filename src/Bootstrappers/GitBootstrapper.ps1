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

    $template = Get-TemplateContent `
        -Path ".\templates\gitconfig.template"

    $content = Resolve-Template `
        -Template $template `
        -Variables @{
        UserName      = $Profile.Git.UserName
        Email         = $Profile.Git.Email
        DefaultBranch = $Profile.Git.DefaultBranch
    }

    Write-Host $content
}
