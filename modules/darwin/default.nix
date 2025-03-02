{ pkgs, lib, ... }: rec {
  users.users.flo.home = "/Users/flo";
  environment = {
    loginShell = "zsh";
    systemPath = [ "${users.users.flo.home}/" ];
  };
  security.pam.enableSudoTouchIdAuth = true;
  homebrew = {
    enable = true;
    taps = [ { name = "homebrew/cask-versions"; } { name = "hashicorp/tap"; } ];

    casks = [
      { name = "keycastr"; }
      # { name = "wezterm-nightly"; }
      { name = "MonitorControl"; }
      { name = "flameshot"; }
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
    ];
  };
  services = { nix-daemon.enable = true; };
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    ShowPathbar = true;
    ShowStatusBar = true;
  };
  system.keyboard = { enableKeyMapping = true; };
  system.stateVersion = 5;
}
