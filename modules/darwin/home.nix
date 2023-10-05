{ config, pkgs, ... }:

let
  username = "frank";
in
{
  imports = [ ../home/common.nix ];
  home = {
    inherit username;
    packages = [
      pkgs.act
      pkgs.docker
    ];
    sessionVariables = { TMPDIR = "/tmp"; };
    file."Applications/Home Manager Apps".source =
      let
        apps = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };
      in
      "${apps}/Applications";
    file.".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
      recursive = true;
    };
    file.".config/wezterm/wezterm.lua" = {
      text = config.lib.weztermConfig.weztermConfig;
    };
  };
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
      # extras.rc
      ${builtins.readFile ../../system/extras.rc};
      # work.rc
      ${builtins.readFile ../../system/work.rc};
    '';
    # https://seansantry.com/development/2022/12/14/split-git-nix/
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
      };
      extraConfig = ''
        Include ~/.ssh/external_config
      '';
    };
    git = {
      extraConfig = {
        core = { sshCommand = "ssh -i ~/.ssh/id_ed25519_personal"; };
      };
      includes = [
        {
          contents = {
            user = {
              email = "frobert@rippling.com";
            };

            core = {
              sshCommand = "ssh -i ~/.ssh/id_ed25519_work";
            };
          };

          condition = "hasconfig:remote.*.url:git@github.com:Rippling/*";
        }
      ];
    };
  };
}
