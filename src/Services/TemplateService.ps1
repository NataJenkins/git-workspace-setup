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


<#
.SYNOPSIS
Resolves template variables.
#>

function Resolve-Template {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Template,

        [Parameter(Mandatory)]
        [hashtable]$Variables
    )

    $result = $Template

    foreach ($variableName in $Variables.Keys) {

        $placeholder = "{{{{{0}}}}}" -f $variableName

        $result = $result.Replace(
            $placeholder,
            [string]$Variables[$variableName]
        )
    }

    $unresolvedVariables = [regex]::Matches(
        $result,
        "{{(.*?)}}"
    )

    if ($unresolvedVariables.Count -gt 0) {
        $missingVariables = $unresolvedVariables |
        ForEach-Object { $_.Groups[1].Value } |
        Sort-Object -Unique

        throw @"
Failed to resolve template.

Missing variables:
- $($missingVariables -join "`n- ")
"@
    }



    return $result
}
