{ lib, config, ... }:
{
  # homeage.file = {
  #   "atuin.key" = {
  #     source = "${config.home.homeDirectory}/.dotfiles/secrets/atuin.key.age";
  #   };
  # };
  programs = {
    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      settings =
        let
          keyName = "atuin.key";
        in
        {
          auto_sync = true;
          sync_frequency = "5m";
          sync_address = "https://api.atuin.sh";
          key_path = "${config.lib.utils.getPathFromSecret keyName}/${keyName}";
        };
    };
  };
}

