{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      shellAliases = {
        "fsource" = "bass source";
      };
      functions = {
        "hm-build-user" = "nix build --no-link \"$HOME/.dotfiles#homeConfigurations.$(whoami).activationPackage\"";
        "hm-build-host" = "nix build --no-link \"$HOME/.dotfiles#homeConfigurations.$(hostname).activationPackage\"";
        "hm-activate-user" = "(nix path-info \"$HOME/.dotfiles#homeConfigurations.$(whoami).activationPackage)/activate\")";
        "hm-activate-host" = "(nix path-info \"$HOME/.dotfiles#homeConfigurations.$(hostname).activationPackage)/activate\")";
        "hm-update-user" = "home-manager switch --flake \"$HOME/.dotfiles#$(whoami)\"";
        "hm-update-host" = "home-manager switch --flake \"$HOME/.dotfiles#$(hostname)\"";
        "hm-build" = "(cd ~/.dotfiles && hm-build-host || hm-build-user)";
        "hm-activate" = "(cd ~/.dotfiles && hm-activate-host || hm-activate-user)";
        "hm-update" = "(cd ~/.dotfiles && hm-update-host || hm-update-user)";
      };

      plugins = [
        {
          name = "bass";
          src = pkgs.fetchFromGitHub {
            owner = "edc";
            repo = "bass";
            rev = "2fd3d2157d5271ca3575b13daec975ca4c10577a";
            sha256 = "fl4/Pgtkojk5AE52wpGDnuLajQxHoVqyphE90IIPYFU=";
          };
        }
        {
          name = "fish-docker-compose";
          src = pkgs.fetchFromGitHub {
            owner = "brgmnn";
            repo = "fish-docker-compose";
            rev = "44a9a5ad593f05ac77e4c5024cfe4a8c55db31e3";
            sha256 = "VMBVLWCwW7/eXEedJrbcby0PjNWYe7MORR7hj+ZEmWg=";
          };
        }
      ];
    };
  }
    }
