<#
.SYNOPSIS
Loads a configuration from a JSON file.

.DESCRIPTION
Reads a configuration file and returns a configuration model.
#>

Set-StrictMode -Version Latest

function Get-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $json = Get-FileContent -Path $Path

    $jsonConfiguration = ConvertFrom-JsonString -Json $json

    $jsonConfiguration = Resolve-Configuration `
        -ConfigurationData $jsonConfiguration

    $configuration = New-Configuration

    $configuration.SchemaVersion = $jsonConfiguration.schemaVersion

    $configuration.Settings.Execution.DryRun = $jsonConfiguration.settings.execution.dryRun
    $configuration.Settings.Execution.Verbose = $jsonConfiguration.settings.execution.verbose

    $configuration.Settings.Installation.BackupExistingFiles = $jsonConfiguration.settings.installation.backupExistingFiles
    $configuration.Settings.Installation.OverwriteExistingFiles = $jsonConfiguration.settings.installation.overwriteExistingFiles

    if ($jsonConfiguration.PSObject.Properties["profiles"]) {

        foreach ($profileData in $jsonConfiguration.profiles) {

            $profile = New-Profile

            $profile.Name = $profileData.name
            $profile.Description = $profileData.description

            foreach ($workspacePath in $profileData.workspaces) {

                $workspace = New-Workspace

                $workspace.Path = $workspacePath

                $profile.Workspaces += $workspace
            }

            $profile.Git.UserName = $profileData.git.userName
            $profile.Git.Email = $profileData.git.email
            $profile.Git.DefaultBranch = $profileData.git.defaultBranch

            $profile.SSH.Host = $profileData.ssh.host
            $profile.SSH.KeyFile = $profileData.ssh.keyFile

            $profile.Hooks.Enabled = $profileData.hooks.enabled

            $profile.VSCode.Profile = $profileData.vscode.profile
            $profile.VSCode.Extensions = $profileData.vscode.extensions

            $configuration.Profiles += $profile
        }
    }

    Test-Configuration -Configuration $configuration

    return $configuration
}
