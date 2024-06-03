# GET MY DOTFILES

# Check if the dotfiles directory exists
if (!(Test-Path -Path $env:DOTFILES_DIR)) {
    # If the directory doesn't exist, clone the repository
    Write-Host "Directory $dotfilesDir does not exist. Cloning repository..."
    git clone $env:DOTFILES_REPO $env:DOTFILES_DIR
    Write-Host "Cloning completed."
} else {
    Write-Host "Directory $env:DOTFILES_DIR already exists."
}
