{ config, ... }:
{
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      # Configuration written to ~/.config/starship.toml
      settings = {
        character = {
          success_symbol = "[➜](bold #${config.colorScheme.colors.base0B})";
          error_symbol = "[x](bold #${config.colorScheme.colors.base08})";
        };
        username = {
          style_user = "bold #${config.colorScheme.colors.base0D}";
          show_always = false;
        };
        hostname = {
          ssh_only = false;
          format = "<$hostname>";
          trim_at = "-";
          style = "bold #${config.colorScheme.colors.base0F}";
          disabled = true;
        };
      };
    };
  };
}
