{ config, pkgs, ... }:

let
  username = "jroberfr";
  homeDirectory = "/Users/${username}";
in
{
  imports = [ ./common-home.nix ];
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
    programs = {
      vscode = {
        enable = true;
      };
    };
  };
  targets.darwin = {
    currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
  };
  homeage = {
    identityPaths = [ "~/.ssh/id_rsa_hm" ];
    file = {
      "spotifyd-mac" = {
        source = "${homeDirectory}/.dotfiles/secrets/spotifyd-mac.age";
        symlinks = [ "${homeDirectory}/.config/spotifyd/spotifyd.conf" ];
      };
    };
    installationType = "activation";
    mount = "${homeDirectory}/secrets";
  };
  launchd = {
    enable = false;
    agents = {
      spotifyd = {
        enable = false;
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
