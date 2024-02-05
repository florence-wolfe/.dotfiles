{ lib, config, ... }: {
  programs = {
    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "5m";
        sync_address = "https://api.atuin.sh";
        key_path = "${config.home.homeDirectory}/secrets/ATUIN_KEY";
      };
    };
  };
}

