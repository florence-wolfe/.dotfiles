{ pkgs, lib, ... }: rec {
  users.users.frankrobert.home = "/Users/frankrobert";
  environment = {
    loginShell = "zsh";
    systemPath = [ "${users.users.frankrobert.home}/" ];
  };
  security.pam.enableSudoTouchIdAuth = true;
  homebrew = {
    enable = true;
    taps = [
      { name = "homebrew/cask-versions"; }
      { name = "homebrew-ffmpeg/ffmpeg"; }
    ];
    casks = [
      { name = "keycastr"; }
      { name = "wezterm-nightly"; }
      { name = "MonitorControl"; }
      { name = "dbeaver-community"; }
      { name = "redisinsight"; }
    ];
    brews = [
      { name = "nvm"; }
      { name = "coreutils"; }
      { name = "neovim"; args = [ "HEAD" ]; }
      {
        name = "postgresql@14";
        start_service = true;
        restart_service = "changed";
      }
      {
        name = "redis";
        start_service = true;
        restart_service = "changed";
      }
      { name = "openssl"; }
      { name = "homebrew-ffmpeg/ffmpeg/ffmpeg"; }
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
