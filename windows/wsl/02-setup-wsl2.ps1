<#
.SYNOPSIS
  Automates enabling WSL2 and installing Ubuntu using Boxstarter without forcing an immediate reboot.

.DESCRIPTION
  This script conditionally enables the Windows Subsystem for Linux and Virtual Machine Platform features
  only if they are not already enabled. It then checks if a reboot is pending. If so, it prints out the
  command needed to restart and exits—leaving the reboot decision to the user. Finally, it sets the default
  WSL version to 2 and installs Ubuntu if it’s not already installed.

  Note: Ubuntu’s initial user setup still occurs on first launch.
#>

function Test-PendingReboot {
    # Checks common registry locations for pending reboot flags.
    $pending = $false
    $registryPaths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
    )
    foreach ($regPath in $registryPaths) {
        if (Test-Path $regPath) {
            $pending = $true
            break
        }
    }
    return $pending
}

# Ensure the script runs in an elevated (administrator) context
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as Administrator."
    exit
}

# Check and enable the Windows Subsystem for Linux if needed
$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
if ($wslFeature.State -ne "Enabled") {
    Write-Host "Enabling Windows Subsystem for Linux..."
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
} else {
    Write-Host "WSL feature is already enabled."
}

# Check and enable the Virtual Machine Platform feature if needed
$vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
if ($vmPlatformFeature.State -ne "Enabled") {
    Write-Host "Enabling Virtual Machine Platform..."
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
} else {
    Write-Host "Virtual Machine Platform is already enabled."
}

# If any feature was enabled, a reboot is likely required.
if (Test-PendingReboot) {
    Write-Host "`nA system restart is required to complete the feature installation."
    Write-Host "Please restart your computer by running:"
    Write-Host "    Restart-Computer -Force"
    Write-Host "Exiting script now..."
    exit
}

# Set the default WSL version to 2
$wslVersion = wsl --version |
    Out-String |
    ForEach-Object { ($_ -split ":")[1].Split('.')[0].Trim() } |
    Select-String -Pattern "\d+" |
    ForEach-Object { $_.Matches.Value }

Write-Host "Current WSL version: $($wslVersion.GetType().FullName)"
if ($wslVersion -eq 2) {
    Write-Host "WSL version is already set to 2."
} else {
    Write-Host "Setting default WSL version to 2..."
    wsl --set-default-version 2
}

# Check if Ubuntu is already installed (using 'wsl --list --quiet')
$installedDistros = wsl --list --quiet
if ($installedDistros -contains "Ubuntu") {
    Write-Host "Ubuntu is already installed for WSL."
} else {
    Write-Host "Installing Ubuntu distribution for WSL..."
    wsl --install -d Ubuntu
}

# Ensure Windows Terminal profile is created for Ubuntu
Write-Host "Ensuring Windows Terminal profile is created..."
try {
    # Wait a moment for installation to complete
    Start-Sleep -Seconds 5
    
    # Check if Windows Terminal is installed
    if (Get-Command wt.exe -ErrorAction SilentlyContinue) {
        # Launch and immediately close Windows Terminal to trigger profile creation
        Start-Process "wt.exe" -ArgumentList '-p "Command Prompt" cmd /c "timeout /t 3 & exit"' -Wait
        Write-Host "Windows Terminal profile creation triggered."
    } else {
        Write-Host "Windows Terminal not found. Profiles will be created when you launch Windows Terminal manually."
    }
} catch {
    Write-Host "Could not automatically create Windows Terminal profile: $_"
}

Write-Host "`nAll installation steps have been executed."
Write-Host "After a restart (if required) and Ubuntu's first-run setup, launch Ubuntu from the Start Menu to complete configuration."
