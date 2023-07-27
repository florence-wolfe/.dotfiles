# .dotfiles/nvim

<a href="https://dotfyle.com/francis-robert/dotfiles-nvim"><img src="https://dotfyle.com/francis-robert/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/francis-robert/dotfiles-nvim"><img src="https://dotfyle.com/francis-robert/dotfiles-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/francis-robert/dotfiles-nvim"><img src="https://dotfyle.com/francis-robert/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:francis-robert/.dotfiles ~/.config/francis-robert/.dotfiles
NVIM_APPNAME=francis-robert/.dotfiles/nvim nvim --headless +Lazy! sync +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=francis-robert/.dotfiles/nvim nvim
```

## Plugins

### bars-and-lines

- [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim)
- [luukvbaal/statuscol.nvim](https://dotfyle.com/plugins/luukvbaal/statuscol.nvim)

### code-runner

- [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)

### color

- [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
- [winston0410/range-highlight.nvim](https://dotfyle.com/plugins/winston0410/range-highlight.nvim)

### colorscheme

- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
- [rose-pine/neovim](https://dotfyle.com/plugins/rose-pine/neovim)

### colorscheme-creation

- [echasnovski/mini.colors](https://dotfyle.com/plugins/echasnovski/mini.colors)

### comment

- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
- [danymat/neogen](https://dotfyle.com/plugins/danymat/neogen)
- [echasnovski/mini.comment](https://dotfyle.com/plugins/echasnovski/mini.comment)
- [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)
- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### cursorline

- [mawkler/modicator.nvim](https://dotfyle.com/plugins/mawkler/modicator.nvim)

### editing-support

- [monaqa/dial.nvim](https://dotfyle.com/plugins/monaqa/dial.nvim)
- [ckolkey/ts-node-action](https://dotfyle.com/plugins/ckolkey/ts-node-action)
- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
- [utilyre/sentiment.nvim](https://dotfyle.com/plugins/utilyre/sentiment.nvim)
- [echasnovski/mini.move](https://dotfyle.com/plugins/echasnovski/mini.move)
- [echasnovski/mini.pairs](https://dotfyle.com/plugins/echasnovski/mini.pairs)
- [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
- [echasnovski/mini.splitjoin](https://dotfyle.com/plugins/echasnovski/mini.splitjoin)
- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
- [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)
- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)

### indent

- [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)

### keybinding

- [anuvyklack/hydra.nvim](https://dotfyle.com/plugins/anuvyklack/hydra.nvim)
- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
- [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)
- [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [VidocqH/lsp-lens.nvim](https://dotfyle.com/plugins/VidocqH/lsp-lens.nvim)
- [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [jghauser/follow-md-links.nvim](https://dotfyle.com/plugins/jghauser/follow-md-links.nvim)
- [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)

### media

- [samodostal/image.nvim](https://dotfyle.com/plugins/samodostal/image.nvim)

### motion

- [chrisgrieser/nvim-spider](https://dotfyle.com/plugins/chrisgrieser/nvim-spider)
- [echasnovski/mini.bracketed](https://dotfyle.com/plugins/echasnovski/mini.bracketed)
- [ggandor/leap.nvim](https://dotfyle.com/plugins/ggandor/leap.nvim)

### nvim-dev

- [kkharji/sqlite.lua](https://dotfyle.com/plugins/kkharji/sqlite.lua)
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### preconfigured

- [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)

### scrollbar

- [lewis6991/satellite.nvim](https://dotfyle.com/plugins/lewis6991/satellite.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### split-and-window

- [nvim-zh/colorful-winsep.nvim](https://dotfyle.com/plugins/nvim-zh/colorful-winsep.nvim)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [echasnovski/mini.surround](https://dotfyle.com/plugins/echasnovski/mini.surround)
- [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### terminal-integration

- [m00qek/baleia.nvim](https://dotfyle.com/plugins/m00qek/baleia.nvim)

### utility

- [code-biscuits/nvim-biscuits](https://dotfyle.com/plugins/code-biscuits/nvim-biscuits)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [sitiom/nvim-numbertoggle](https://dotfyle.com/plugins/sitiom/nvim-numbertoggle)
- [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)

### workflow

- [m4xshen/hardtime.nvim](https://dotfyle.com/plugins/m4xshen/hardtime.nvim)

## Language Servers

- astro
- html

This readme was generated by [Dotfyle](https://dotfyle.com)
