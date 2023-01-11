{ pkgs, ... }:
{
  imports = [ ./common-home.nix ];
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
      pkgs.glibcLocalesUtf8
      pkgs.cargo
      pkgs.rustc
    ];
  };

  services = {
    home-manager = {
      autoUpgrade = {
        enable = true;
        frequency = "weekly";
      };
    };

    spotifyd = {
      enable = true;
    };
  };
  systemd = {
    tmpfiles = {
      rules = [
        "L+ /lib/${builtins.baseNameOf pkgs.stdenv.cc.bintools.dynamicLinker} - - - - ${pkgs.stdenv.cc.bintools.dynamicLinker}"
        "L+ /lib64 - - - - /lib"
      ];
    };
  };
}
