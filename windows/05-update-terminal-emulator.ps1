# UPDATE WEZTERM
# Define the paths
$sourcePath = "$env:DOTFILES_DIR\system\wezterm-config.lua"
$targetPath = "$env:USERPROFILE\.wezterm.lua"

# Check if the source file exists
if (Test-Path -Path $sourcePath) {
    # Read the original file content
    $content = Get-Content $sourcePath

    # Copy the original content to a new file
    Copy-Item $sourcePath -Destination $targetPath

    # Make the necessary modifications
    $newContent = @("local wezterm = require('wezterm')")
    $newContent += "" # Adding a new line
    foreach ($line in $content) {
        if ($line -notmatch "font_dirs") {
            if ($line -match 'default_domain') {
                $newContent += '        default_prog = {"pwsh.exe"},'
            }
            elseif ($line -match '\$COLOR') {
                $newContent += "        color_scheme = ""Catppuccin Mocha"","
            }
            elseif ($line -match '\$FONTS') {
                $newContent += "        font = wezterm.font_with_fallback({ ""IntoneMono Nerd Font Mono"" }),"
            }
            else {
                $newContent += $line
            }
        }
    }

    # Write the modified content to the new file
    $newContent | Out-File -FilePath $targetPath -Encoding UTF8
    Write-Host "Wezterm configuration has been copied and updated successfully."
} else {
    Write-Host "Wezterm configuration file not found at $sourcePath."
}
