{ ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "IntoneMono Nerd Font Mono";
      size = 20;
    };
    shellIntegration.enableZshIntegration = true;
    theme = "Catppuccin-Mocha";
    settings = { macos_option_as_alt = "left"; };
  };
}

