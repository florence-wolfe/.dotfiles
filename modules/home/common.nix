{
  config,
  pkgs,
  nix-colors,
  homeage,
  ghostty,
  lib,
  ...
}:
let
  utils = import ../../utilities.nix { inherit config; };
  weztermConfig = import ../../config/wezterm.conf.nix { inherit config pkgs lib; };
in
{
  lib = {
    inherit utils weztermConfig;
  };
  nixpkgs.config = {
    allowUnfree = true;
  };
  imports = [
    nix-colors.homeManagerModule
    homeage.homeManagerModules.homeage
    ../../config/atuin.conf.nix
    ../../config/git.conf.nix
    ../../config/kitty.conf.nix
    ../../config/direnv.conf.nix
    ../../config/starship.conf.nix
    ../../config/tools.conf.nix
    ../../config/zsh.conf.nix
  ];
  colorScheme = nix-colors.colorSchemes."catppuccin-mocha";

  home = {
    sessionVariables = {
      ACTIVE_SHELL = "zsh";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    stateVersion = "22.11";
    sessionPath = [ "$HOME/.local/bin" ];
    packages = [
      pkgs.go
      pkgs.nixpkgs-fmt
      pkgs.age
      pkgs.sops
      pkgs.jetbrains-mono
      pkgs.intel-one-mono
      pkgs.iosevka
      pkgs.nerd-fonts.intone-mono
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.droid-sans-mono
      pkgs.bun
      pkgs.nixfmt-rfc-style
      pkgs.deadnix
      pkgs.node2nix
      pkgs.ripgrep
      pkgs.fd
      pkgs.tree
      pkgs.ascii-image-converter
      pkgs.viu
      pkgs.lazydocker
      pkgs.ranger
      pkgs.uv
      pkgs.unzip
      pkgs.python314Full
      pkgs.rustup
      # Re-enable once we know how to install this for darwin
      # ghostty.packages."${pkgs.system}".default
    ];
    file = {
      ".local/bin/cb" = {
        source = ../../system/cb;
      };
      ".profile" = {
        source = ../../system/.profile;
      };
      # "secrets" = {
      #   source = config.lib.file.mkOutOfStoreSymlink
      #     "${config.home.homeDirectory}/.dotfiles/secrets";
      #   recursive = true;
      # };
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

    ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          extraOptions = {
            AddKeysToAgent = "yes";
            UseKeychain = "yes";
            IdentitiesOnly = "yes";
          };
        };
        "nas" = {
          hostname = "192.168.1.229";
          user = "flo.wolfe";
          port = 22210;
          extraOptions = {
            ForwardAgent = "yes";
          };
        };
      };
      extraConfig = ''
        Include ~/.ssh/external_config
      '';
    };

    rbw = {
      enable = true;
      settings = {
        email = "frankie.robert@gmail.com";
        base_url = "https://bitwarden.simbojimbo.com";
      };
    };
    zsh.initExtra = ''
      # extras.rc
      ${builtins.readFile ../../system/extras.rc};
      # vault.rc
      ${builtins.readFile ../../system/vault.rc};
    '';
    discocss = {
      enable = false;
      css = ''@import url("https://raw.githubusercontent.com/YottaGitHub/Nord-Glasscord/master/nord-glasscord.theme.css");'';
    };
  };
}
