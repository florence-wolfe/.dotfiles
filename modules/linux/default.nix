{ config, pkgs, ... }:
{
  imports = [ ../home/common.nix ../custom/homebrew.nix ];
  homebrew = {
    enable = true;
    brews = [{ name = "neovim"; args = [ "HEAD" ]; }];
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
    recursive = true;
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
}
