<#
.SYNOPSIS
Reads template files and resolves template variables.
#>

Set-StrictMode -Version Latest

function Get-TemplateContent {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    return Get-FileContent -Path $Path
}

function Resolve-Template {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Template,

        [Parameter(Mandatory)]
        [hashtable]$Variables
    )
}