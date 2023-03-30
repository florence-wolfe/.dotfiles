{ pkgs, ... }:
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
      pkgs.luajitPackages.luarocks
      pkgs.ruby
      pkgs.php82
      pkgs.powershell
    ];
  };
  programs.zsh.initExtra = builtins.readFile ../../system/extras.rc;
}
