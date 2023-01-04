{ pkgs, ... }:

{
  imports = [ ./common-home.nix ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "frank.robert";
    homeDirectory = "/volume1/homes/frank.robert";

    packages = [
      pkgs.glibcLocalesUtf8
    ];
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
