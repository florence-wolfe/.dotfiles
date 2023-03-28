{ pkgs, ... }: {
  imports = [ ../linux ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "frank.robert";
    homeDirectory = "/volume1/homes/frank.robert";
    sessionVariables = {
      LC_ALL = "en_US.utf-8";
      LANG = "en_US.utf-8";
      LC_CTYPE = "en_US.utf-8";
      TMPDIR = "/tmp-nix";
    };
    packages = [
      pkgs.sumneko-lua-language-server
      pkgs.netcat
      pkgs.unzip
      pkgs.gcc12
      pkgs.cmake
      pkgs.luajitPackages.luarocks
      pkgs.glibcLocalesUtf8
      pkgs.cargo
      pkgs.rustc
      pkgs.nodejs
      pkgs.nodePackages.tsun
      pkgs.nodePackages.cspell
      pkgs.nodePackages.typescript
    ];
  };
  systemd = {
    user = {
      tmpfiles = {
        rules = [
          "L+ /lib/${builtins.baseNameOf pkgs.stdenv.cc.bintools.dynamicLinker} - - - - ${pkgs.stdenv.cc.bintools.dynamicLinker}"
          "L+ /lib64 - - - - /lib"
        ];
      };
    };
  };
}
