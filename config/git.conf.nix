{ config, ... }:
{
  programs = {
    git = {
      enable = false;
      delta = {
        enable = true;
        options = {
          navigate = true;
          line-numbers = true;
          syntax-theme = "${config.colorScheme.name}";
        };
      };
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
    gh = {
      enable = true;
      enableGitCredentialHelper = true;
    };
  };
}
