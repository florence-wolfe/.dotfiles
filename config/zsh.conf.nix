{ config, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      shellAliases = {
        "get-profile" = ''echo "$(whoami)@$(hostname)"'';
        "hm-build" = "nix build --no-link \"$HOME/.dotfiles#homeConfigurations.\"$(get-profile)\".activationPackage\"";
        # "$(nix path-info <flake-uri>#homeConfigurations.jdoe.activationPackage)"/activate
        #  "hm-activate" = "(nix path-info \"$HOME/.dotfiles#homeConfigurations.\"$(get-profile)\".activationPackage)/activate\")";
        "hm-update" = "home-manager switch --flake \"$HOME/.dotfiles\"";
      };
      oh-my-zsh = {
        enable = true;
      };
    };
  };
}
