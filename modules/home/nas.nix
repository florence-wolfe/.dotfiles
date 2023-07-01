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
      pkgs.netcat
      pkgs.unzip
      # pkgs.gcc12
      # pkgs.cmake
      # pkgs.glibcLocalesUtf8
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
