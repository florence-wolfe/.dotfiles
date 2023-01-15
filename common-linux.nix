{ pkgs, ... }:
{
  imports = [ ./common-home.nix ];
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
