# Define the Neovim configuration paths
$sourceNvimConfig = "$env:DOTFILES_DIR\nvim"
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
