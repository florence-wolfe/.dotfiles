{ pkgs, config, lib, ... }:
{
  imports = [ ../linux ];
  home = rec {
    username = "frank";
    homeDirectory = "/home/${username}";
    packages = [
      pkgs.gnumake
      pkgs.zig
      pkgs.gcc-unwrapped
      pkgs.unzip
      pkgs.zip
      pkgs.luajitPackages.luarocks
      pkgs.ruby
      pkgs.rbenv
      pkgs.php82
      pkgs.powershell
    ];
  };
  programs.zsh.initExtra = builtins.readFile ../../system/extras.rc;
  home.activation.createWeztermConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -f "/mnt/c/Users/frank/.config/wezterm/wezterm.lua" ]; then
      rm -f "/mnt/c/Users/frank/.config/wezterm/wezterm.lua"
      cp -f "${pkgs.writeText "wezterm.lua" config.lib.weztermConfig.weztermConfig}" "/mnt/c/Users/frank/.config/wezterm/wezterm.lua"
      sync
    fi
  '';
  /* home.activation.copyFonts = lib.hm.dag.entryBefore [ "writeBoundary" ] ''
    find ${config.home.homeDirectory}/.nix-profile/share/fonts/ \
    -type f -exec sudo ${pkgs.coreutils}/bin/cp -f {} \
    '/mnt/c/Windows/Fonts/' \;
    ''; */
}
