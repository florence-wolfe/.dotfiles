{ pkgs, lib, ... }:
rec {
  users.users.flo.home = "/Users/flo";
  environment = {
    systemPath = [ "${users.users.flo.home}/" ];
  };
  security.pam.services.sudo_local = {
    enable = true;
    touchIdAuth = true;
  };
  # Hardcoding for now since I only have 1 darwin device and this is the recommended approach;
  ids.gids.nixbld = 30000;
  homebrew = {
    enable = true;
    taps = [
      { name = "homebrew/cask-versions"; }
      { name = "hashicorp/tap"; }
    ];

    casks = [
      { name = "keycastr"; }
      # { name = "wezterm-nightly"; }
      { name = "MonitorControl"; }
      { name = "raycast"; }
      { name = "rectangle"; }
    ];
    brews = [
      { name = "nvm"; }
      {
        name = "neovim";
        args = [ "HEAD" ];
      }
      { name = "xz"; }
      { name = "pyenv"; }
      { name = "terraform"; }
      { name = "vault"; }
      { name = "spicetify-cli"; }
    ];
  };
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    ShowPathbar = true;
    ShowStatusBar = true;
  };
  system.keyboard = {
    enableKeyMapping = true;
  };
  system.stateVersion = 5;
}
