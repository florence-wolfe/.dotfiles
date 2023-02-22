{ config, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      shellAliases = {
        "dots" = "cd ~/.dotfiles";
        "edit-dots" = "nvim ~/.dotfiles/";
        "get-profile" = ''echo "$(whoami)@$(hostname)"'';
        "hm-build" = "nix build --no-link \"$HOME/.dotfiles#homeConfigurations.\"$(get-profile)\".activationPackage\"";
        # "$(nix path-info <flake-uri>#homeConfigurations.jdoe.activationPackage)"/activate
        #  "hm-activate" = "(nix path-info \"$HOME/.dotfiles#homeConfigurations.\"$(get-profile)\".activationPackage)/activate\")";
        "hm-update" = "home-manager switch --flake \"$HOME/.dotfiles\"";
        "d-update" = "darwin-rebuild switch --flake \"$HOME/.dotfiles#\\\"$(get-profile)\\\"\"";
        "nvim-config" = "nvim ~/.dotfiles/pvim";
      };
      oh-my-zsh = {
        enable = true;
      };
    };
  };
}
