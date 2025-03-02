<#
.SYNOPSIS
  Sets the Windows Terminal default profile to the WSL2 terminal.

.DESCRIPTION
  This script locates the Windows Terminal settings.json file (for the packaged app), makes a backup,
  parses the settings JSON, then looks for a profile representing a WSL distribution (by checking if the
  "source" property equals "Windows.Terminal.Wsl" or if its "commandline" contains "wsl.exe").
  If found, it updates the "defaultProfile" property to that profile’s GUID and writes the modified
  settings back to disk.
  
  Note: Adjust the $SettingsPath if your settings file is in a different location.
#>

# Define the path to Windows Terminal settings.json (for the packaged version)
$jsonPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

$targetDistro = "ubuntu"
$detected_guid = (Get-ChildItem -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss" | ForEach-Object {
    $distroName = (Get-ItemProperty -Path $_.PsPath).DistributionName
    if ($distroName) {
        [PSCustomObject]@{
            GUID = $_.PSChildName
            Distribution = $distroName.ToLower()
        }
    }
} | Where-Object { $_.Distribution -eq $targetDistro }).GUID

if (-not (Test-Path $jsonPath)) {
    Write-Error "Windows Terminal settings file not found at: $jsonPath"
    exit 1
}

# Read the JSON from the file
$settings = Get-Content -Path $jsonPath | ConvertFrom-Json
$config = $settings.profiles.list | Where-Object { $_.name.ToLower() -eq $targetDistro }
if ($config)
{
  $guid = $config.guid
  $settings.defaultProfile = $guid
  # Write the modified JSON back to the file
  $settings | ConvertTo-Json -Depth 100 | Set-Content -Path $jsonPath
  Write-Host "$($targetDistro) set as the default Windows Terminal profile."
} else
{
  Write-Host "$($targetDistro) is already the default Windows Terminal profile."
}