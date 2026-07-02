{ config, ... }:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
      };
      enableCompletion = true;
      syntaxHighlighting = {
        enable = true;
      };
      shellAliases = {
        # Claire ⚧ — trans-flag rebrand of the `claude` CLI (args pass through).
        "claire" = "claude";
        "dots" = "cd ~/.dotfiles";
        "edit-dots" = "nvim ~/.dotfiles/";
        "get-profile" = ''echo "$(whoami)@$(hostname)"'';
        "hm-build" =
          ''nix build --no-link "$HOME/.dotfiles#homeConfigurations."$(get-profile)".activationPackage"'';
        # "$(nix path-info <flake-uri>#homeConfigurations.jdoe.activationPackage)"/activate
        #  "hm-activate" = "(nix path-info \"$HOME/.dotfiles#homeConfigurations.\"$(get-profile)\".activationPackage)/activate\")";
        "hm-update" = ''home-manager switch --flake "$HOME/.dotfiles"'';
        "d-update" = ''darwin-rebuild switch --flake "$HOME/.dotfiles"'';
      };
      oh-my-zsh = {
        enable = true;
      };
      initExtra = ''
        # conditionally ues secrets
        [[ -f $HOME/.dotfiles/secrets/.env ]] && source $HOME/.dotfiles/secrets/.env

        # Claire ⚧ — mirror claude's completions onto the `claire` alias
        if command -v compdef >/dev/null 2>&1; then
          compdef claire=claude 2>/dev/null || true
        fi
      '';
    };
  };
}
