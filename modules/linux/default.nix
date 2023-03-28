{ pkgs, ... }:
{
  imports = [ ../home/common.nix ];
  services = {
    home-manager = {
      autoUpgrade = {
        enable = true;
        frequency = "weekly";
      };
    };

    spotifyd = {
      enable = true;
    };
  };
}
