function Get-ProfileFromConfiguration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ConfigurationPath,

        [Parameter(Mandatory)]
        [string]$ProfileName
    )

    $configuration = Get-Configuration `
        -Path $ConfigurationPath

    return Get-Profile `
        -Configuration $configuration `
        -Name $ProfileName
}
