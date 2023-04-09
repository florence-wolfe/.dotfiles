{ pkgs, ... }:
{
  imports = [ ../home/common.nix ../custom/homebrew.nix ];
  homebrew = {
    enable = true;
    brews = [{ name = "neovim"; }];
  };
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
