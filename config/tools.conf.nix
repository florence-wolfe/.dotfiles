{ config, pkgs, ... }: {
  programs = {
    gpg.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
      themes = {
        Catppuccin-mocha = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
            sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
          };
          file = "Catppuccin-mocha.tmTheme";
        };
      };
      config = {
        theme = "Catppuccin-mocha";
        italic-text = "always";
      };
    };

    dircolors = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    jq = { enable = true; };

    lsd = {
      enable = true;
      # ls = "${pkgs.lsd}/bin/lsd";
      # ll = "${pkgs.lsd}/bin/lsd -l";
      # la = "${pkgs.lsd}/bin/lsd -a";
      # lt = "${pkgs.lsd}/bin/lsd --tree";
      # lla = "${pkgs.lsd}/bin/lsd -la";
      enableAliases = true;
    };

    man = {
      enable = true;
      generateCaches = true;
    };
  };
}
