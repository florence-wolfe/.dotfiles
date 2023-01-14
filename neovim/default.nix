{ lib, pkgs, ... }:
{
  home.packages = [
    # pkgs.tree-sitter
    # pkgs.code-minimap
    # pkgs.luaPackages.lua-lsp
    # pkgs.nodePackages.pyright
    # pkgs.nodePackages.vim-language-server
    # pkgs.nodePackages.yaml-language-server
    # pkgs.nodePackages.bash-language-server
    # pkgs.nodePackages.vscode-json-languageserver-bin
    # pkgs.nodePackages.vscode-html-languageserver-bin
    # pkgs.nodePackages.vscode-css-languageserver-bin
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    # Python and Ruby are default true but leaving this in for posterity
    withPython3 = true;
    withRuby = true;
    coc = {
      enable = true;
    };
    extraConfig = ''
      lua <<EOF
      ${builtins.readFile ./init.lua}
      EOF
    '';
    plugins = [
      pkgs.vimPlugins.vim-nix
      pkgs.vimPlugins.mini-nvim
      {
        plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
        config = builtins.readFile ./plugins/treesitter.conf.lua;
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.neo-tree-nvim;
      }
      {
        plugin = pkgs.vimPlugins.nvim-notify;
      }
      {
        plugin = pkgs.vimPlugins.trouble-nvim;
      }
      {
        plugin = pkgs.vimPlugins.symbols-outline-nvim;
      }
      {
        plugin = pkgs.vimPlugins.nvim-cmp;
      }
      {
        plugin = pkgs.vimPlugins.toggleterm-nvim;
        config = builtins.readFile ./plugins/terminal.conf.lua;
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.lualine-nvim;
      }
    ];
  };
}

