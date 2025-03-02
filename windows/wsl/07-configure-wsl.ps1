Write-Host "Configuring WSL..."

wsl -d Ubuntu bash -c "bash /mnt/c/Users/flo/.dotfiles/windows/wsl/symlink.sh"

Write-Host "WSL configuration completed."