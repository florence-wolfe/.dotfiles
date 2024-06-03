# OS Settings
Set-ExplorerOptions -showHiddenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Enable-RemoteDesktop

##### Packages

# Applications
choco install adobereader

# TODO: Figure out a way to pin this properly for future machines
choco install googlechrome

choco install zoom
choco install malwarebytes
choco install googledrive
choco install spotify
choco install messenger
choco install discord
choco install everything
choco install lenovo-thinkvantage-system-update
choco install steam
choco install bitwarden
choco install wezterm
choco install espanso

# Dev Tools
choco install git -y
choco install starship
choco install nvm

if (-not(Get-Command node -ErrorAction Ignore)) {
    C:\ProgramData\nvm\nvm.exe install lts
    C:\ProgramData\nvm\nvm.exe use lts
}

choco install jq
choco install zoxide
choco install tree-sitter -y
choco install lazygit
choco install ripgrep
choco install fd
choco install fzf
choco install bat
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System'
choco install zig
choco install sqlite
choco install make
choco install mingw
choco install llvm
choco install neovim --pre

# Windows PowerShell modules
if (-not (Get-InstalledModule -Name Terminal-Icons -ErrorAction SilentlyContinue)) {
    Write-Host "Install-Module Terminal-Icons"
    Install-Module -Name "Terminal-Icons" -AllowClobber -Force -Scope AllUsers -y
}

# Path to the temporary directory
$tempDir = $env:TEMP

# # Install Intel One Mono Nerd Font
$fontRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
$fontName = "IntoneMono Nerd Font Mono"
if (!(Get-ItemProperty -Path $fontRegistryPath -Name $fontName -ErrorAction SilentlyContinue)) {
    # Download the Zip File to the temporary directory
    $zipPath = Join-Path $tempDir "IntelOneMono.zip"
    Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/IntelOneMono.zip" -OutFile $zipPath

    # Unzip the File
    $fontFolderPath = Join-Path $tempDir "fonts"
    Expand-Archive -Path $zipPath -DestinationPath $fontFolderPath

    # Install the Fonts
    Get-ChildItem "$fontFolderPath\*.ttf" | ForEach-Object {
        $fontPath = $_.FullName
        $fontsFolderPath = "C:\Windows\Fonts"
        
        # Copy font to Windows Fonts folder
        Copy-Item $fontPath $fontsFolderPath

        # Add font to registry
        $fontFileName = [System.IO.Path]::GetFileName($fontPath)
        Set-ItemProperty -Path "$fontRegistryPath" -Name $fontName -Value $fontFileName
    }
}

# UPDATE WEZTERM
# Define the paths
$sourcePath = "$env:USERPROFILE\.dotfiles\system\wezterm-config.lua"
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

# GET MY DOTFILES
# Define the target directory
$dotfilesDir = "$env:USERPROFILE\.dotfiles"

# Check if the dotfiles directory exists
if (!(Test-Path -Path $dotfilesDir)) {
    # If the directory doesn't exist, clone the repository
    Write-Host "Directory $dotfilesDir does not exist. Cloning repository..."
    git clone https://github.com/francis-robert/.dotfiles $dotfilesDir
    Write-Host "Cloning completed."
} else {
    Write-Host "Directory $dotfilesDir already exists."
}

# Define the Neovim configuration paths
$sourceNvimConfig = "$dotfilesDir\nvim"
$targetNvimConfig = "$env:LOCALAPPDATA\nvim"

# Check if the source Neovim config directory exists
if (Test-Path -Path $sourceNvimConfig) {
    # Check if the target directory exists
    if (Test-Path -Path $targetNvimConfig) {
        # If it's a symlink, check if it already points to the source
        $targetItem = Get-Item -Path $targetNvimConfig
        if ($targetItem.LinkType -eq "SymbolicLink" -and $targetItem.Target -eq $sourceNvimConfig) {
            Write-Host "Symlink already exists."
            return
        } else {
            # If it exists and is not a symlink to the source, rename it
            Rename-Item -Path $targetNvimConfig -NewName "$targetNvimConfig.bak"
        }
    }

    # Create the symlink
    New-Item -ItemType SymbolicLink -Path $targetNvimConfig -Target $sourceNvimConfig
    Write-Host "Symlink created from $sourceNvimConfig to $targetNvimConfig."
} else {
    Write-Host "Source Neovim configuration not found at $sourceNvimConfig."
}

### INSTALL CATPPUCCIN THEMES FOR WINDOWS TERMINAL & POWERSHELL
# Check if Catppuccin is already installed
$catppuccinInstalled = Test-Path "$($env:PSModulePath.Split(';')[0])\Catppuccin"

if (-not $catppuccinInstalled) {
    # Clone the Catppuccin repository
    git clone https://github.com/catppuccin/powershell.git

    # Copy the contents to the PowerShell Module Path
    $destinationPath = "$($env:PSModulePath.Split(';')[0])\Catppuccin"
    New-Item -Path $destinationPath -ItemType Directory -Force
    Copy-Item -Path ".\powershell\*" -Destination $destinationPath -Recurse

    # Import the module
    Import-Module Catppuccin

    # Optional: Add the import command to the PowerShell profile
    Add-Content -Path $PROFILE -Value "`nImport-Module Catppuccin"
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
if ($settings.schemes.name -notcontains $mochaScheme.name) {

    # Add the mocha scheme and theme to the settings
    $settings.schemes += $mochaScheme
    $settings.themes += $mochaTheme

    # Set the mocha theme as the default for all profiles
    $settings.profiles.defaults.colorScheme = $mochaScheme.name

    # Write the modified JSON back to the file
    $settings | ConvertTo-Json -Depth 100 | Set-Content -Path $jsonPath

    Write-Host "$($mochaScheme.name) theme installed and set as the default."
} else {
    Write-Host "$($mochaScheme.name) is already installed."
}

# Features
choco install Microsoft-Hyper-V-All -source windowsFeatures
choco install Containers -source windowsfeatures
choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures

# Avoid clash with builtin function
Boxstarter.WinConfig\Install-WindowsUpdate -getUpdatesFromMS -acceptEula
