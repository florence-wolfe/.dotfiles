{ pkgs, ... }:
{
  imports = [ ./common-linux.nix ];
  home = {
    username = "frank";
    homeDirectory = "/home/${username}";
  };
}
