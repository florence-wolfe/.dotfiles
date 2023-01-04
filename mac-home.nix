{ config, pkgs, ... }:

let
  username = "jroberfr";
  homeDirectory = "/Users/${username}";
in
{
  imports = [ ./common-home.nix ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home = {
    inherit username homeDirectory;
    packages = [
      pkgs.spotifyd
    ];
    sessionVariables = {
      TMPDIR = "/tmp";
    };
    file."Applications/Home Manager Apps".source =
      let
        apps = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };
      in
      "${apps}/Applications";
  };

  launchd = {
    enable = true;
    agents = {
      spotifyd = {
        enable = true;
        config = {
          Label = "rustlang.spotifyd";
          ProgramArguments = [
            "${homeDirectory}/.nix-profile/bin/spotifyd"
            "--config-path=${homeDirectory}/.config/spotifyd/spotifyd.conf"
            "--no-daemon"
          ];
          UserName = username;
          KeepAlive = true;
          ThrottleInterval = 30;
          StandardErrorPath = "/tmp/rustlang.spotifyd.err";
          StandardOutPath = "/tmp/rustlang.spotifyd.out";
        };
      };
    };
  };
}
