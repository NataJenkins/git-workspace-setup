<#
.SYNOPSIS
Creates a new workspace object.

.DESCRIPTION
Returns an empty workspace model used throughout the application.
#>

function New-Workspace {
    [CmdletBinding()]
    param()

    return [PSCustomObject]@{
        Path = ""
    }
}