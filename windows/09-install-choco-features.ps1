# Features
choco upgrade Microsoft-Hyper-V-All -source windowsFeatures
choco upgrade Containers -source windowsfeatures
choco upgrade Microsoft-Windows-Subsystem-Linux -source windowsfeatures

# Avoid clash with builtin function
Boxstarter.WinConfig\Install-WindowsUpdate -getUpdatesFromMS -acceptEula
