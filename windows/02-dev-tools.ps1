# Dev Tools
choco upgrade scoop
choco upgrade gzip
choco upgrade git -y
choco upgrade starship
choco upgrade nvm

if (-not(Get-Command node -ErrorAction Ignore)) {
    C:\ProgramData\nvm\nvm.exe install lts
    C:\ProgramData\nvm\nvm.exe use lts
}

choco upgrade jq

choco upgrade zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

choco upgrade python
choco upgrade rustup.intall
choco upgrade tree-sitter -y
choco upgrade lazygit
choco upgrade ripgrep
choco upgrade fd
choco upgrade fzf
choco upgrade bat
choco upgrade cmake --installargs 'ADD_CMAKE_TO_PATH=System'
choco upgrade zig
choco upgrade sqlite
choco upgrade make
choco upgrade mingw
choco upgrade llvm
choco upgrade neovim --pre

scoop bucket add main
scoop install main/luarocks
