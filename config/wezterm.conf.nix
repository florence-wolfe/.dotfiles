{ lib, config, pkgs, ... }:
{
  weztermConfig =
    with config.lib.utils;
    let
      FONT_DIRS = replacementStruct ''"$FONT_DIRS"'' ''
        '${config.home.homeDirectory}/.nix-profile/share/fonts/truetype',
        '${config.home.homeDirectory}/.nix-profile/share/fonts/truetype/NerdFonts',
        '${config.home.homeDirectory}/.nix-profile/share/fonts/opentype/NerdFonts'
      '';
      COLOR = replacementStruct "$COLOR" "${config.colorScheme.name}";
      FONTS = replacementStruct ''"$FONTS"'' ''
        'IntelOne Mono',
        'JetBrains Mono',
        'Fira Code',
        'Anonymous Pro' 
      '';
      lists = generateReplacementLists [
        FONT_DIRS
        COLOR
        FONTS
      ];
      weztermConfig = builtins.readFile ../system/wezterm-config.lua;
      extraConfig = builtins.replaceStrings lists.variables lists.replacements weztermConfig;
    in
    ''
      local wezterm = require 'wezterm'
      ${extraConfig}
    '';
}

