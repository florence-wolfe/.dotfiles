{ pkgs, ... }:
{
  imports = [ ../linux ];
  home = rec {
    username = "frank";
    homeDirectory = "/home/${username}";
  };
}
