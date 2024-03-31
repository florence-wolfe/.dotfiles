{ config, pkgs, ... }:

let
  username = "frank";
  checkDirScript = pkgs.writeShellScript "check-ssh-dir" ''
    #!/usr/bin/env bash
    if [[ $(pwd) == *rippling* ]]; then
      echo "IdentityFile ~/.ssh/id_ed25519_work"
    else
      echo "IdentityFile ~/.ssh/id_ed25519_personal"
    fi
  '';
in {
  imports = [ ../home/common.nix ];
  home = {
    inherit username;
    packages = [ pkgs.act pkgs.docker pkgs.nerdfix ];
    sessionVariables = { TMPDIR = "/tmp"; };
    file."Applications/Home Manager Apps".source = let
      apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
    in "${apps}/Applications";
    file.".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.dotfiles/nvim";
      recursive = true;
    };
    file.".config/wezterm/wezterm.lua" = {
      text = config.lib.weztermConfig.weztermConfig;
    };
  };

  fonts.fontconfig.enable = true;
  targets.darwin = {
    currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
  };
  programs = {
    vscode.enable = true;
    zsh.initExtra = ''
      if [[ $(uname -m) == 'arm64' ]]; then
       eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
      export PATH=$PATH:/run/current-system/sw/bin
      export PATH=$PATH:/etc/profiles/per-user/frank/bin
      export PATH=$PATH:/usr/local/bin
      # work.rc
      ${builtins.readFile ../../system/work.rc};
    '';
    # https://seansantry.com/development/2022/12/14/split-git-nix/
    ssh = {
      enable = true;
      matchBlocks = {
        "rippling" = { match = ''exec "${checkDirScript}"''; };
        "*" = {
          extraOptions = {
            AddKeysToAgent = "yes";
            UseKeychain = "yes";
            IdentitiesOnly = "yes";
            IdentityFile = "~/.ssh/id_ed25519_personal";
          };
        };
      };
      extraConfig = ''
        Include ~/.ssh/external_config
      '';
    };
    git = {
      extraConfig = {
        core = { sshCommand = "ssh -i ~/.ssh/id_ed25519_personal"; };
      };
      includes = [{
        contents = {
          user = { email = "frobert@rippling.com"; };

          core = { sshCommand = "ssh -i ~/.ssh/id_ed25519_work"; };
        };

        condition = "hasconfig:remote.*.url:git@github.com:Rippling/*";
      }];
    };
  };
}
