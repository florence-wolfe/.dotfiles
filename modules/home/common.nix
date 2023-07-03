{ config, pkgs, nix-colors, homeage, lib, ... }:
let
  utils = import ../../utilities.nix { inherit config; };
  weztermConfig = import ../../config/wezterm.conf.nix { inherit config pkgs lib; };
in
{
  lib = { inherit utils weztermConfig; };
  nixpkgs.config = { allowUnfree = true; };
  imports = [
    nix-colors.homeManagerModule
    homeage.homeManagerModules.homeage
    # ../../config/atuin.conf.nix
    ../../config/git.conf.nix
    ../../config/starship.conf.nix
    ../../config/tools.conf.nix
    ../../config/zsh.conf.nix
  ];
  colorScheme = nix-colors.colorSchemes."catppuccin-mocha";

  home = {
    sessionVariables = {
      ACTIVE_SHELL = "zsh";
    };
    stateVersion = "22.11";
    sessionPath = [ "$HOME/.local/bin" ];
    packages = [
      pkgs.go
      pkgs.nixpkgs-fmt
      pkgs.rnix-lsp
      pkgs.spotify-tui
      pkgs.age
      pkgs.jetbrains-mono
      pkgs.intel-one-mono
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
      pkgs.bun
      pkgs.nixfmt
      pkgs.deadnix
      pkgs.node2nix
      pkgs.ripgrep
      pkgs.fd
      pkgs.tree
      pkgs.ascii-image-converter
      pkgs.viu
      pkgs.lazydocker
    ];
    file = {
      ".local/bin/cb" = { source = ../../system/cb; };
      ".profile" = { source = ../../system/.profile; };
    };
    shellAliases = {
      # With line numbers
      cat = "bat --paging=never";
      # Without line numbers
      ccat = "bat --paging=never -pp";
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };

    rbw = {
      enable = true;
      settings = {
        email = "frankie.robert@gmail.com";
        base_url = "https://bitwarden.simbojimbo.com";
      };
    };

    discocss = {
      enable = false;
      css = ''
        @import url("https://raw.githubusercontent.com/YottaGitHub/Nord-Glasscord/master/nord-glasscord.theme.css");'';
    };
  };
}
