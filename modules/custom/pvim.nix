{ config
, pkgs
, lib
, ...
}:
with lib; let
  cfg = config.programs.pvim;
in
{
  options.programs.pvim = {
    enable = mkOption {
      default = false;
      description = "Enable PVim";
      type = types.bool;
    };

    userConfig = mkOption {
      default = null;
      description = "PVim User Config";
      type = with types; nullOr path;
    };
  };
  config = mkIf (cfg.enable) {
    home.file.".local/bin/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/pvim/pvim";
    };
  };
}
