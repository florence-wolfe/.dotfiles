{ pkgs, config, lib, ... }:
{
  imports = [ ../linux ];
  home = rec {
    username = "flo";
    homeDirectory = "/home/${username}";
    packages = [
    ];
  };
  programs.zsh.initExtra = builtins.readFile ../../system/extras.rc;
}
