{ config, ... }: {
  programs = {
    zsh = {
      enable = true;
      autosuggestion = { enable = true; };
      enableCompletion = true;
      syntaxHighlighting = { enable = true; };
      shellAliases = {
        "dots" = "cd ~/.dotfiles";
        "edit-dots" = "nvim ~/.dotfiles/";
        "get-profile" = ''echo "$(whoami)@$(hostname)"'';
        "hm-build" = ''
          nix build --no-link "$HOME/.dotfiles#homeConfigurations."$(get-profile)".activationPackage"'';
        # "$(nix path-info <flake-uri>#homeConfigurations.jdoe.activationPackage)"/activate
        #  "hm-activate" = "(nix path-info \"$HOME/.dotfiles#homeConfigurations.\"$(get-profile)\".activationPackage)/activate\")";
        "hm-update" = ''home-manager switch --flake "$HOME/.dotfiles"'';
        "d-update" = ''
          darwin-rebuild switch --flake "$HOME/.dotfiles#\"$(get-profile)\""'';
      };
      oh-my-zsh = { enable = true; };
      initExtra = ''
        # secrets
        source $HOME/.dotfiles/secrets/.env
      '';
    };
  };
}
