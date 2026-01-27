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
      { name = "hashicorp/tap"; }
    ];

    casks = [
      { name = "keycastr"; }
      { name = "MonitorControl"; }
      { name = "raycast"; }
      { name = "rectangle"; }
      { name = "claude-code@latest"; }
      { name = "ghostty"; }
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
