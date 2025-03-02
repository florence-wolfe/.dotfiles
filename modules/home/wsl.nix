{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [ ../linux ];
  home = rec {
    username = "flo";
    homeDirectory = "/home/${username}";
    packages = [
      # https://github.com/microsoft/WSL/issues/8892#issuecomment-1428022076
      # Deprecated as of March 1, 2025 https://github.com/wslutilities/wslu
      pkgs.wslu
    ];
  };
  programs.zsh.initExtra = ''
    ${builtins.readFile ../../system/extras.rc}
    export BROWSER='/mnt/c/Windows/explorer.exe'
    # Ensure ~/bin exists
    [ -d "$HOME/bin" ] || mkdir "$HOME/bin"

    # Add ~/bin to PATH if it's not already included
    case ":$PATH:" in
        *":$HOME/bin:"*) ;;
        *) export PATH="$HOME/bin:$PATH" ;;
    esac

    # Ensure xdg-open symlink exists and points to wslview
    if [ ! -e "$HOME/bin/xdg-open" ] || [ "$(readlink -f "$HOME/bin/xdg-open")" != "$(which wslview)" ]; then
        ln -sf "$(which wslview)" "$HOME/bin/xdg-open"
    fi
  '';
}
