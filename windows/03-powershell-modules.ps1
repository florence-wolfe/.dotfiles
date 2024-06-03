# Windows PowerShell modules
if (-not (Get-InstalledModule -Name Terminal-Icons -ErrorAction SilentlyContinue)) {
    Write-Host "Install-Module Terminal-Icons"
    Install-Module -Name "Terminal-Icons" -AllowClobber -Force -Scope AllUsers -y
}
