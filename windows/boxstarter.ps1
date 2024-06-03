# https://boxstarter.org/
# main.ps1

# Get the directory where this script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Get the list of script files in the correct order
$scripts = Get-ChildItem -Path $scriptDir -Filter "*.ps1" | Sort-Object Name

# Execute each script in order
foreach ($script in $scripts) {
    Write-Host "Executing $($script.Name)"
    . "$($script.FullName)"
}
