{ config, pkgs, ... }: {
  programs = {
    git = {
      enable = true;
      aliases = {
        diff-clean = "-c pager.diff='less -R' diff";
        pullhead = "!git pull origin $(git branch --show-current)";
        pushf =
          "!git push origin $(git branch --show-current) --force-with-lease";
      };
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
      userEmail = "florencejrrobert+github@gmail.com";
      userName = "Flo Robert";
      extraConfig = {
        core = { editor = "nvr --remote-wait-silent"; };
        init = { defaultBranch = "main"; };
        advice = { addIgnoredFile = false; };
        push = { default = "current"; };
        pull = { rebase = true; };
        rebase = { autostash = true; };
        rerere = { enabled = true; };
        transfer = { fsckobjects = true; };
        fetch = { fsckobjects = true; };
        receive = { fsckobjects = true; };
      };
      ignores = [ "*.envrc" ];
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
      gitCredentialHelper = { enable = true; };
    };
  };
}
