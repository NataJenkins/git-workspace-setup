<#
.SYNOPSIS
Applies default values to a configuration object.
#>

Set-StrictMode -Version Latest

function Resolve-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$ConfigurationData
    )

    if (-not $ConfigurationData.PSObject.Properties["settings"]) {
        $ConfigurationData | Add-Member `
            -MemberType NoteProperty `
            -Name "settings" `
            -Value ([PSCustomObject]@{})
    }

    if (-not $ConfigurationData.settings.PSObject.Properties["execution"]) {
        $ConfigurationData.settings | Add-Member `
            -MemberType NoteProperty `
            -Name "execution" `
            -Value ([PSCustomObject]@{})
    }

    if (-not $ConfigurationData.settings.PSObject.Properties["installation"]) {
        $ConfigurationData.settings | Add-Member `
            -MemberType NoteProperty `
            -Name "installation" `
            -Value ([PSCustomObject]@{})
    }

    if (-not $ConfigurationData.settings.execution.PSObject.Properties["dryRun"]) {
        $ConfigurationData.settings.execution | Add-Member `
            -MemberType NoteProperty `
            -Name "dryRun" `
            -Value $false
    }

    if (-not $ConfigurationData.settings.execution.PSObject.Properties["verbose"]) {
        $ConfigurationData.settings.execution | Add-Member `
            -MemberType NoteProperty `
            -Name "verbose" `
            -Value $false
    }

    if (-not $ConfigurationData.settings.installation.PSObject.Properties["backupExistingFiles"]) {
        $ConfigurationData.settings.installation | Add-Member `
            -MemberType NoteProperty `
            -Name "backupExistingFiles" `
            -Value $true
    }

    if (-not $ConfigurationData.settings.installation.PSObject.Properties["overwriteExistingFiles"]) {
        $ConfigurationData.settings.installation | Add-Member `
            -MemberType NoteProperty `
            -Name "overwriteExistingFiles" `
            -Value $false
    }

    if (-not $ConfigurationData.PSObject.Properties["profiles"]) {
        $ConfigurationData | Add-Member `
            -MemberType NoteProperty `
            -Name "profiles" `
            -Value @()
    }

    return $ConfigurationData
}
