# First things first, update choco and box-starter
choco upgrade chocolatey
choco upgrade boxstarter
# OS Settings
#
#
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
# Enable-RemoteDesktop

# Set environment variables
$dotfilesRepo = "https://github.com/florence-wolfe/.dotfiles"
$env:DOTFILES_REPO = $dotfilesRepo
setx DOTFILES_REPO $dotfilesRepo

# Set another example environment variable if needed
$dotfilesDir = "$env:USERPROFILE\.dotfiles"
$env:DOTFILES_DIR = $dotfilesDir
setx DOTFILES_DIR $dotfilesDir
