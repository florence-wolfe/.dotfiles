# Dev Tools
# install scoop
Install-Scoop-Modules
choco upgrade git -y
choco upgrade gzip
choco upgrade starship
Set-Profile-Command -Tag "starship" -Command "Invoke-Expression (&starship init powershell)"
choco upgrade nvm
Install-Node-LTS

choco upgrade jq

choco upgrade zoxide
Set-Profile-Command -Tag "zoxide" -Command "$(zoxide init powershell | Out-String)"

choco upgrade uv
choco upgrade python
# choco install rustup.intall
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

