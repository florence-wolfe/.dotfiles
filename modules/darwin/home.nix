{ config, pkgs, lib, ... }:

let
  username = "frank";
  homeDirectory = "/Users/${username}";
in
{
  imports = [ ../home/common.nix ];
  home = {
    inherit username;
    packages = [
      pkgs.act
      # pkgs.spotifyd
    ];
    sessionVariables = { TMPDIR = "/tmp"; };
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
      source = config.lib.file.mkOutOfStoreSymlink
        "${homeDirectory}/.dotfiles/system/karabiner/spotify.json";
    };
    # file.".workrc" = { source = ../../system/work.rc; };

    file.".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
      recursive = true;
    };
    file.".config/wezterm/wezterm.lua" = {
      text = config.lib.weztermConfig.weztermConfig;
    };
  };
  targets.darwin = {
    currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
  };
  # homeage = {
  # identityPaths = [ "~/.ssh/id_rsa_hm" ];
  # file = {
  # "spotifyd-mac" = {
  # source = "${homeDirectory}/.dotfiles/secrets/spotifyd-mac.age";
  # symlinks = [ "${homeDirectory}/.config/spotifyd/spotifyd.conf" ];
  # };
  # };
  # installationType = "activation";
  # mount = "${homeDirectory}/secrets";
  # };
  programs = {
    vscode.enable = true;
    zsh.initExtra = ''
      if [[ $(uname -m) == 'arm64' ]]; then
       eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
      export PATH=$PATH:/run/current-system/sw/bin
      export PATH=$PATH:/etc/profiles/per-user/frank/bin
      export PATH=$PATH:/usr/local/bin
      # extras.rc
      ${builtins.readFile ../../system/extras.rc};
      # work.rc
      ${builtins.readFile ../../system/work.rc};
    '';
    git = {
      userEmail = lib.mkForce "frobert@rippling.com";
    };
  };

}
