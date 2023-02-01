{ config, pkgs, ... }:

let
  username = "jroberfr";
  homeDirectory = "/Users/${username}";
in
{
  imports = [ ../home/common.nix ];
  home = {
    inherit username;
    packages = [
      pkgs.act
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
    file.".config/karabiner/assets/complex_modifications/spotify.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.dotfiles/system/karabiner/spotify.json";
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
  programs = {
    vscode.enable = true;
  };
}
