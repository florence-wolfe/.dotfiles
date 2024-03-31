{ config, pkgs, ... }: {
  imports = [ ../home/common.nix ../custom/homebrew.nix ];
  homebrew = {
    enable = true;
    taps = [{ name = "hashicorp/tap"; }];
    brews = [
      {
        name = "neovim";
        args = [ "HEAD" ];
      }
      { name = "terraform"; }
      { name = "vault"; }
    ];
  };

  home.file = {
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.dotfiles/nvim";
      recursive = true;
    };
    ".vault.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.dotfiles/system/vault.yml";
    };
  };
  services = {
    home-manager = {
      autoUpgrade = {
        enable = true;
        frequency = "weekly";
      };
    };

    spotifyd = { enable = true; };
  };
}
