{ pkgs, lib, ... }:
rec {
  users.users.jroberfr.home = "/Users/jroberfr";
  environment = {
    loginShell = "zsh";
    systemPath = [ "${users.users.jroberfr.home}/.toolbox/bin" ];
  };
  security.pam.enableSudoTouchIdAuth = true;
  homebrew = {
    enable = true;
    casks = [
      { name = "keycastr"; }
    ];
  };
  services = {
    nix-daemon.enable = true;
    /* spotifyd.enable = true; */
    karabiner-elements.enable = true;
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
}
