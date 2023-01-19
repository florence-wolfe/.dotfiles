{ config
, pkgs
, lib
, ...
}:
with lib; let
  cfg = config.programs.lazyvim;
in
{
  options.programs.lazyvim = {
    enable = mkOption {
      default = false;
      description = "Enable LazyVim";
      type = types.bool;
    };

    userConfig = mkOption {
      default = null;
      description = "LazyVim User Config";
      type = with types; nullOr path;
    };
  };
  config = mkIf (cfg.enable) {
    xdg.configFile.nvim = {
      source = ../lazyvim;
      recursive = true;
    };
  };
}
