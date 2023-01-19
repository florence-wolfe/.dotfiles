{ pkgs, ... }:
{
  users.users.jroberfr.home = "/Users/jroberfr";
  environment.loginShell = "zsh";
  security.pam.enableSudoTouchIdAuth = true;
  homebrew = {
    enable = true;
    casks = [
      { name = "keycastr"; }
    ];
  };
  services = {
    nix-daemon.enable = true;
    spotifyd.enable = true;
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
