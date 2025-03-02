### INSTALL CATPPUCCIN THEMES FOR WINDOWS TERMINAL & POWERSHELL
# Check if Catppuccin is already installed
$catppuccinInstalled = Test-Path "$($env:PSModulePath.Split(';')[0])\Catppuccin"

if (-not $catppuccinInstalled)
{
  # Clone the Catppuccin repository
  git clone https://github.com/catppuccin/powershell.git

  # Copy the contents to the PowerShell Module Path
  $destinationPath = "$($env:PSModulePath.Split(';')[0])\Catppuccin"
  New-Item -Path $destinationPath -ItemType Directory -Force
  Copy-Item -Path ".\powershell\*" -Destination $destinationPath -Recurse

  # Import the module
  Import-Module Catppuccin

  Set-Profile-Command -Tag "catppuccin" -Command "$(Import-Module Catppuccin)"
}

# Path to the settings.json file
$jsonPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# URLs for the mocha theme files
$mochaSchemeUrl = "https://raw.githubusercontent.com/catppuccin/windows-terminal/main/mocha.json"
$mochaThemeUrl = "https://raw.githubusercontent.com/catppuccin/windows-terminal/main/mochaTheme.json"

# Read the JSON from the file
$settings = Get-Content -Path $jsonPath | ConvertFrom-Json

# Download the mocha scheme and theme
$mochaScheme = Invoke-RestMethod -Uri $mochaSchemeUrl
$mochaTheme = Invoke-RestMethod -Uri $mochaThemeUrl


# Check if the theme is already installed
if ($settings.schemes.name -notcontains $mochaScheme.name)
{

  # Add the mocha scheme and theme to the settings
  $settings.schemes += $mochaScheme
  Write-Host "$($mochaScheme.name) theme installed and set as the default."
} else
{
  Write-Host "$($mochaScheme.name) is already in the schemes."
}

if ($settings.themes.name -notcontains $mochaScheme.name)
{
  # Add the mocha theme to the list of profiles
  $settings.themes += $mochaTheme
  Write-Host "$($mochaScheme.name) theme added to the list of profiles."
} else
{
  Write-Host "$($mochaScheme.name) is already in the list of profiles."
}

# Check if theme is already the default
if ($settings.profiles.defaults.colorScheme -eq $mochaScheme.name)
{
  Write-Host "$($mochaScheme.name) is already the default theme."
} else
{
  # Set the mocha theme as the default for all profiles
  $settings.profiles.defaults.colorScheme = $mochaScheme.name
  Write-Host "$($mochaScheme.name) set as the default theme."
}

# Write the modified JSON back to the file
$settings | ConvertTo-Json -Depth 100 | Set-Content -Path $jsonPath