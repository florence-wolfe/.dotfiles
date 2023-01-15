{ config, ... }:
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
    gh = {
      enable = true;
      enableGitCredentialHelper = true;
    };
  };
}
