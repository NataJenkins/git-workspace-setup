<#
.SYNOPSIS
Creates a new profile object.

.DESCRIPTION
Returns an empty profile model used throughout the application.
#>

function New-Profile {
    [CmdletBinding()]
    param()

    return [PSCustomObject]@{
        Name = ""
        Description = ""

        Workspaces = @()

        Git = [PSCustomObject]@{
            UserName      = ""
            Email         = ""
            DefaultBranch = ""
        }

        SSH = [PSCustomObject]@{
            Host    = ""
            KeyFile = ""
        }

        Hooks = [PSCustomObject]@{
            Enabled = $true
        }

        VSCode = [PSCustomObject]@{
            Profile    = ""
            Extensions = @()
        }
    }
}