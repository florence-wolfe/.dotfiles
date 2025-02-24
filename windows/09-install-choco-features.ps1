# Features
choco install Microsoft-Hyper-V-All -source windowsFeatures
choco install Containers -source windowsfeatures
choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures

# Avoid clash with builtin function
# Boxstarter.WinConfig\Install-WindowsUpdate -getUpdatesFromMS -acceptEula
