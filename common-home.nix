{ config, pkgs, nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModule
  ];
  colorScheme = nix-colors.colorSchemes.nord;

  home = {
    stateVersion = "22.11";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    packages = [
      pkgs.spotify-tui
    ];

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
    gpg.enable = true;
    git = {
      enable = true;
      delta = {
        enable = true;
        options = {
          navigate = true;
          line-numbers = true;
          syntax-theme = "${config.colorScheme.name}";
        };
      };
      userEmail = "frankie.robert+github@gmail.com";
      userName = "Frank Robert";
      # signing = {
      # signByDefault = true;
      # };

      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        advice = {
          addIgnoredFile = false;
        };
      };
    };

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      shellAliases = {
        "hm-build-user" = "nix build --no-link ~/.dotfiles#homeConfigurations.$(whoami).activationPackage";
        "hm-build-host" = "nix build --no-link ~/.dotfiles#homeConfigurations.$(hostname).activationPackage";
        "hm-activate-user" = "$(nix path-info ~/.dotfiles#homeConfigurations.$(whoami).activationPackage)/activate";
        "hm-activate=host" = "$(nix path-info ~/.dotfiles#homeConfigurations.$(hostname).activationPackage)/activate";
        "hm-update-user" = "home-manager switch --flake ~/.dotfiles#$(whoami)";
        "hm-update-host" = "home-manager switch --flake ~/.dotfiles#$(hostname)";
        "hm-build" = "hm-build-host 2>/dev/null || hm-build-user 2>/dev/null";
        "hm-activate" = "hm-activate-host 2>/dev/null || hm-activate-user 2>/dev/null";
        "hm-update" = "hm-update-host 2>/dev/null || hm-update-user 2>/dev/null";
      };
      oh-my-zsh = {
        enable = true;
      };
      initExtra = "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#${config.colorScheme.colors.base04}'";
    };

    # fish = {
    #   enable = true;
    #   shellAliases = {
    #     "hm-build" = "nix build --no-link ~/.dotfiles#homeConfigurations.(hostname).activationPackage";
    #     "hm-activate" = "(nix path-info ~/.dotfiles#homeConfigurations.(hostname).activationPackage)/activate";
    #     "hm-update" = "home-manager switch --flake ~/.dotfiles#(hostname)";
    #   };
    #   plugins = [
    #     {
    #       name = "foreign-env";
    #       src = pkgs.fetchFromGitHub {
    #         owner = "oh-my-fish";
    #         repo = "plugin-foreign-env";
    #         rev = "b3dd471bcc885b597c3922e4de836e06415e52dd";
    #         sha256 = "3h03WQrBZmTXZLkQh1oVyhv6zlyYsSDS7HTHr+7WjY8=";
    #       };
    #     }
    #   ];
    # };

    starship = {
      enable = true;
      enableZshIntegration = true;
      # enableFishIntegration = true;
      # Configuration written to ~/.config/starship.toml
      settings = {
        character = {
          success_symbol = "[➜](bold #${config.colorScheme.colors.base0B})";
          error_symbol = "[✖](bold #${config.colorScheme.colors.base08})";
        };
        username = {
          style_user = "bold dimmed #${config.colorScheme.colors.base03}";
          show_always = false;
        };
        hostname = {
          ssh_only = false;
          format = "<$hostname>";
          trim_at = "-";
          style = "bold dimmed #${config.colorScheme.colors.base04}";
          disabled = true;
        };
      };
    };

    bat = {
      enable = true;
      config = {
        theme = "${config.colorScheme.name}";
        italic-text = "always";
      };
    };

    dircolors = {
      enable = true;
      enableZshIntegration = true;
      # enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      # enableFishIntegration = true;
    };

    jq = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    man = {
      enable = true;
      generateCaches = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    ### END OF PROGRAMS
  };
}
