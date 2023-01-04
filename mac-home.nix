{ pkgs, ... }:

{
  imports = [ ./common-home.nix ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "jroberfr";
    homeDirectory = "/Users/jroberfr";
    packages = [
      pkgs.spotifyd
    ];
  };

  launchd = {
    enable = true;
    agents = {
      spotifyd = {
        enable = true;
        config = {
          Label = "rustlang.spotifyd";
          ProgramArguments = [
            "spotifyd"
            "--config-path=/Users/jroberfr/.config/spotifyd/spotifyd.conf"
            "--no-daemon"
          ];
          UserName = "jroberfr";
          KeepAlive = true;
          ThrottleInterval = 30;
        };
      };
    };
  };
}
