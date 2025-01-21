{ ... }: {
  programs.kitty = {
    enable = false;
    font = {
      name = "IntoneMono Nerd Font Mono";
      size = 20;
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
    settings = { macos_option_as_alt = "left"; };
  };
}

