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
      pkgs.php82
      pkgs.powershell
    ];
  };
  programs.zsh.initExtra = builtins.readFile ../../system/extras.rc;
  home.activation.createWeztermConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -f "/mnt/c/Program Files/WezTerm/wezterm.lua" ]; then
      cp -f "${pkgs.writeText "wezterm.lua" config.lib.weztermConfig.weztermConfig}" "/mnt/c/Program Files/WezTerm/wezterm.lua"
    fi
  '';
}
