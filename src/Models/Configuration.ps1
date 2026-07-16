<#
.SYNOPSIS
Creates a new configuration object.

.DESCRIPTION
Returns an empty configuration model used throughout the application.
#>

function New-Configuration {
    [CmdletBinding()]
    param()

    return [PSCustomObject]@{

    }
}