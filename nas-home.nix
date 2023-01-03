{ ... }:

{
  imports = [ ./common-home.nix ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "frank.robert";
    homeDirectory = "/volume1/homes/frank.robert";
  };
}