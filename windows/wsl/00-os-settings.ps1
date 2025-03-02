# Attempt to set execution policy but catch and ignore errors
try {
    Set-ExecutionPolicy Unrestricted -Force -ErrorAction SilentlyContinue
} catch {
    Write-Host "Bypassing execution policy error and continuing..." -ForegroundColor Yellow
}

# Alternative approach to bypass execution policy issues
$SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Download and execute Boxstarter bootstrapper with error handling
try {
    # First method - using Invoke-WebRequest (iwr)
    Write-Host "Attempting to install Boxstarter..." -ForegroundColor Cyan
    . { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
} catch {
    Write-Host "First method failed, trying alternative approach..." -ForegroundColor Yellow
    
    # Alternative method - using .NET WebClient
    try {
        $installer = New-Object System.Net.WebClient
        $installer.DownloadString('https://boxstarter.org/bootstrapper.ps1') | iex
        Get-Boxstarter -Force
    } catch {
        Write-Host "Error installing Boxstarter: $_" -ForegroundColor Red
    }
}

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
