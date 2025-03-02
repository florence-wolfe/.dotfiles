# Path to the temporary directory
$tempDir = $env:TEMP

# Install Intel One Mono Nerd Font
$fontRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
$fontName = "IntoneMono Nerd Font Mono"
if (!(Get-ItemProperty -Path $fontRegistryPath -Name $fontName -ErrorAction SilentlyContinue)) {
    # Download the Zip File to the temporary directory
    $zipPath = Join-Path $tempDir "IntelOneMono.zip"
    Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/IntelOneMono.zip" -OutFile $zipPath

    # Unzip the File
    $fontFolderPath = Join-Path $tempDir "fonts"
    Expand-Archive -Path $zipPath -DestinationPath $fontFolderPath

    # Install the Fonts
    Get-ChildItem "$fontFolderPath\*.ttf" | ForEach-Object {
        $fontPath = $_.FullName
        $fontsFolderPath = "C:\Windows\Fonts"
        
        # Copy font to Windows Fonts folder
        Copy-Item $fontPath $fontsFolderPath

        # Add font to registry
        $fontFileName = [System.IO.Path]::GetFileName($fontPath)
        Set-ItemProperty -Path "$fontRegistryPath" -Name $fontName -Value $fontFileName
    }
}

# Path to the wt settings.json file
$jsonPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
# Read the JSON from the file
$settings = Get-Content -Path $jsonPath | ConvertFrom-Json

if (-not $settings.profiles.defaults.PSObject.Properties['font']) {
    # Create the font property without modifying colorScheme
    $settings.profiles.defaults | Add-Member -MemberType NoteProperty -Name 'font' -Value ([PSCustomObject]@{
        face = $fontName
    })
    Write-Host "$($fontName) font installed and set as the default."
}
# Check if font exists but face property doesn't exist
elseif (-not $settings.profiles.defaults.font.PSObject.Properties['face']) {
    # Add the face property to the existing font object
    Write-Host "$($fontName) font installed and set as the default."
    $settings.profiles.defaults.font | Add-Member -MemberType NoteProperty -Name 'face' -Value $fontName
}
# Check if font and face exist but face isn't the correct value
elseif ($settings.profiles.defaults.font.face -ne $fontName) {
    # Update just the face value
    Write-Host "$($fontName) font installed and set as the default."
    $settings.profiles.defaults.font.face = $fontName
} else {
    Write-Host "$($fontName) is already the default font."
}
$settings | ConvertTo-Json -Depth 100 | Set-Content -Path $jsonPath