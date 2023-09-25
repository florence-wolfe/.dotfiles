{ pkgs, lib, ... }: rec {
  users.users.frank.home = "/Users/frank";
  environment = {
    loginShell = "zsh";
    systemPath = [ "${users.users.frank.home}/" ];
  };
  security.pam.enableSudoTouchIdAuth = true;
  homebrew = {
    enable = true;
    taps = [
      { name = "homebrew/cask-versions"; }
    ];
    casks = [
      { name = "keycastr"; }
      { name = "wezterm-nightly"; }
      { name = "MonitorControl"; }
      { name = "flameshot"; }
    ];
    brews = [
      { name = "nvm"; }
      { name = "neovim"; args = [ "HEAD" ]; }
      { name = "xz"; }
      { name = "pyenv"; }
    ];
  };
  services = {
    nix-daemon.enable = true;
    # spotifyd.enable = true;
    karabiner-elements.enable = true;
  };
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    ShowPathbar = true;
    ShowStatusBar = true;
  };
  system.keyboard = { enableKeyMapping = true; };
}
