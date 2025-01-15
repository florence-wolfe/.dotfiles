# OS Settings
Set-ExplorerOptions -showHiddenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
# Enable-RemoteDesktop

# Set environment variables
$dotfilesRepo = "https://github.com/florence-wolfe/.dotfiles"
$env:DOTFILES_REPO = $dotfilesRepo
setx DOTFILES_REPO $dotfilesRepo

# Set another example environment variable if needed
$dotfilesDir = "$env:USERPROFILE\.dotfiles"
$env:DOTFILES_DIR = $dotfilesDir
setx DOTFILES_DIR $dotfilesDir
