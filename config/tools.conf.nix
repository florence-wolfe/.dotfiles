{ config, ... }:
{
  programs = {
    gpg.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
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
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    jq = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };
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
