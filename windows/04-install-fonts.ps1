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
