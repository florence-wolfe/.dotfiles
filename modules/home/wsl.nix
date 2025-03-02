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
      pkgs.wslu
    ];
  };
  programs.zsh.initExtra = builtins.readFile ../../system/extras.rc;
}
