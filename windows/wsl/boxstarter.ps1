# https://boxstarter.org/
# main.ps1

# Get the directory where this script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Path to the functions script
$functionsScript = Join-Path -Path $scriptDir -ChildPath "_functions.ps1"

# Import the functions script
. "$functionsScript"

# Get the list of script files in the correct order, excluding this script
$scripts = Get-ChildItem -Path $scriptDir -Filter "*.ps1" | 
    Where-Object { $_.Name -match '^\d{2}' } | 
    Sort-Object Name

# Execute each script in order
foreach ($script in $scripts)
{
    Write-Host "Executing $($script.Name)"
    . "$($script.FullName)"
}
