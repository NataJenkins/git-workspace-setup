<#
.SYNOPSIS
Creates a new configuration object.

.DESCRIPTION
Returns an empty configuration model used throughout the application.
#>


Set-StrictMode -Version Latest
function New-Configuration {
    [CmdletBinding()]
    param()

    return [PSCustomObject]@{
        SchemaVersion = ""

        Settings = [PSCustomObject]@{
            Execution = [PSCustomObject]@{
                DryRun = $false
                Verbose = $false
            }

            Installation = [PSCustomObject]@{
                BackupExistingFiles = $true
                OverwriteExistingFiles = $false
            }
        }

        Profiles = @()
    }
}