{ config, pkgs, nix-colors, homeage, lib, ... }:
let
  utils = import ./utilities.nix { inherit config; };
in
{
  lib = {
    inherit utils;
  };
  nixpkgs.config = {
    allowUnfree = true;
  };
  imports = [
    nix-colors.homeManagerModule
    homeage.homeManagerModules.homeage
    ./config/atuin.conf.nix
    ./config/git.conf.nix
    # ./config/fish.conf.nix
    # ./neovim
    ./config/starship.conf.nix
    ./config/tools.conf.nix
    ./config/wezterm.conf.nix
    ./config/zsh.conf.nix
  ];
  colorScheme = nix-colors.colorSchemes.nord;

  home = {
    sessionVariables = {
      ACTIVE_SHELL = "zsh";
      # Home-Manager uses this for quite a few programs and services but it's not always defined on every machine.
    };
    stateVersion = "22.11";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    packages = [
      pkgs.nixpkgs-fmt
      pkgs.rnix-lsp
      pkgs.spotify-tui
      pkgs.nodejs
      pkgs.age
      pkgs.jetbrains-mono
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
    file = {
      ".profile" = {
        source = ./system/.profile;
      };
      "lunarvim-config" = {
        source = ./system/lvim-config.lua;
        # relative to $HOME
        target = ".config/lvim/config.lua";
      };
    };
    shellAliases = {
      # With line numbers
      ccat = "bat --paging=never";
      # Without line numbers
      cat = "bat --paging=never -pp";
    };
  };

  programs = {
    home-manager = {
      enable = true;
      path = "$HOME/.dotfiles";
    };
    vscode = {
      enable = true;
    };
    # lazyvim = {
    #   enable = false;
    # };

    pvim = {
      enable = true;
    };

    ### END OF PROGRAMS
    rbw = {
      enable = true;
      settings = {
        email = "frankie.robert@gmail.com";
        base_url = "https://bitwarden.simbojimbo.com";
      };
    };

    discocss = {
      enable = false;
      css = ''@import url("https://raw.githubusercontent.com/YottaGitHub/Nord-Glasscord/master/nord-glasscord.theme.css");'';
    };
  };
}
