{ config, pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      delta = {
        enable = true;
        options = {
          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-decoration-style = "none";
            file-style = "bold yellow ul";
          };
          features = "decorations line-numbers";
          whitespace-error-style = "22 reverse";
          navigate = true;
          syntax-theme = "Catppuccin-mocha";
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
    lazygit = {
      enable = true;
      settings = {
        git = {
          paging = {
            colorArg = "always";
            pager = "${pkgs.delta}/bin/delta --paging=never";
            useConfig = false;
          };
        };
      };
    };
    gh = {
      enable = true;
      enableGitCredentialHelper = true;
    };
  };
}
