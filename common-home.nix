{ config, pkgs, nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModule
  ];

  colorScheme = nix-colors.colorSchemes.nord;
  # :root {
  #   --base00: #2E3440;
  #   --base01: #3B4252;
  #   --base02: #434C5E;
  #   --base03: #4C566A;
  #   --base04: #D8DEE9;
  #   --base05: #E5E9F0;
  #   --base06: #ECEFF4;
  #   --base07: #8FBCBB;
  #   --base08: #BF616A;
  #   --base09: #D08770;
  #   --base0A: #EBCB8B;
  #   --base0B: #A3BE8C;
  #   --base0C: #88C0D0;
  #   --base0D: #81A1C1;
  #   --base0E: #B48EAD;
  #   --base0F: #5E81AC;
  # }

  home = {
    stateVersion = "22.11";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    packages = [
      pkgs.spotify-tui
    ];
    file.".profile".source = ./system/.profile;
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

    # zsh = {
    #   enable = true;
    #   enableAutosuggestions = true;
    #   enableCompletion = true;
    #   enableSyntaxHighlighting = true;
    #   shellAliases = {
    #     "hm-build-user" = "nix build --no-link ~/.dotfiles#homeConfigurations.$(whoami).activationPackage";
    #     "hm-build-host" = "nix build --no-link ~/.dotfiles#homeConfigurations.$(hostname).activationPackage";
    #     "hm-activate-user" = "$(nix path-info ~/.dotfiles#homeConfigurations.$(whoami).activationPackage)/activate";
    #     "hm-activate=host" = "$(nix path-info ~/.dotfiles#homeConfigurations.$(hostname).activationPackage)/activate";
    #     "hm-update-user" = "home-manager switch --flake ~/.dotfiles#$(whoami)";
    #     "hm-update-host" = "home-manager switch --flake ~/.dotfiles#$(hostname)";
    #     "hm-build" = "hm-build-host || hm-build-user";
    #     "hm-activate" = "hm-activate-host || hm-activate-user";
    #     "hm-update" = "hm-update-host || hm-update-user";
    #   };
    #   oh-my-zsh = {
    #     enable = true;
    #   };
    #   initExtra = "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#${config.colorScheme.colors.base04}'";
    # };

    fish = {
      enable = true;
      shellInit = "bass source ~/.profile";
      shellAliases = {
        "hm-build-user" = "nix build --no-link ~/.dotfiles#homeConfigurations.(whoami).activationPackage";
        "hm-build-host" = "nix build --no-link ~/.dotfiles#homeConfigurations.(hostname).activationPackage";
        "hm-activate-user" = "(nix path-info ~/.dotfiles#homeConfigurations.(whoami).activationPackage)/activate";
        "hm-activate=host" = "(nix path-info ~/.dotfiles#homeConfigurations.(hostname).activationPackage)/activate";
        "hm-update-user" = "home-manager switch --flake ~/.dotfiles#(whoami)";
        "hm-update-host" = "home-manager switch --flake ~/.dotfiles#(hostname)";
        "hm-build" = "hm-build-host || hm-build-user";
        "hm-activate" = "hm-activate-host || hm-activate-user";
        "hm-update" = "hm-update-host || hm-update-user";
      };
      plugins = [
        {
          name = "bass";
          src = pkgs.fetchFromGitHub {
            owner = "edc";
            repo = "bass";
            rev = "2fd3d2157d5271ca3575b13daec975ca4c10577a";
            sha256 = "fl4/Pgtkojk5AE52wpGDnuLajQxHoVqyphE90IIPYFU=";
          };
        }
      ];
    };

    starship = {
      enable = true;
      # enableZshIntegration = true;
      enableFishIntegration = true;
      # Configuration written to ~/.config/starship.toml
      settings = {
        character = {
          success_symbol = "[➜](bold #${config.colorScheme.colors.base0B})";
          error_symbol = "[✖](bold #${config.colorScheme.colors.base08})";
        };
        username = {
          style_user = "bold #${config.colorScheme.colors.base0D}";
          show_always = false;
        };
        hostname = {
          ssh_only = false;
          format = "<$hostname>";
          trim_at = "-";
          style = "bold #${config.colorScheme.colors.base0F}";
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
      # enableZshIntegration = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      # enableZshIntegration = true;
      enableFishIntegration = true;
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

    rbw = {
      enable = true;
      settings = {
        email = "frankie.robert@gmail.com";
        base_url = "https://bitwarden.simbojimbo.com";
      };
    };
    ### END OF PROGRAMS
  };
}
