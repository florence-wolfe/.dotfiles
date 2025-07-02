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
          success_symbol = "[🌸❥](bold #${config.colorScheme.palette.base0F})";
          error_symbol = "[x](bold #${config.colorScheme.palette.base08})";
        };
        username = {
          style_user = "bold #${config.colorScheme.palette.base0D}";
          show_always = false;
        };
        hostname = {
          ssh_only = true;
          format = "<$hostname>";
          trim_at = "-";
          style = "bold #${config.colorScheme.palette.base0F}";
          disabled = false;
        };
        continuation_prompt = "[▶](bold #${config.colorScheme.palette.base09}) ";
        cmake = {
          disabled = true;
        };
        aws = {
          disabled = true;
        };
        swift = {
          disabled = true;
        };
      };
    };
  };
}
