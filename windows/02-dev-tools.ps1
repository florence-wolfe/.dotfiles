# Dev Tools
choco install git -y
choco install starship
choco install nvm

if (-not(Get-Command node -ErrorAction Ignore)) {
    C:\ProgramData\nvm\nvm.exe install lts
    C:\ProgramData\nvm\nvm.exe use lts
}

choco install jq
choco install zoxide
choco install tree-sitter -y
choco install lazygit
choco install ripgrep
choco install fd
choco install fzf
choco install bat
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System'
choco install zig
choco install sqlite
choco install make
choco install mingw
choco install llvm
choco install neovim --pre
