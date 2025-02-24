# .dotfiles/nvim

<a href="https://dotfyle.com/florence-wolfe/dotfiles-nvim"><img src="https://dotfyle.com/florence-wolfe/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/florence-wolfe/dotfiles-nvim"><img src="https://dotfyle.com/florence-wolfe/dotfiles-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/florence-wolfe/dotfiles-nvim"><img src="https://dotfyle.com/florence-wolfe/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:florence-wolfe/.dotfiles ~/.config/florence-wolfe/.dotfiles
NVIM_APPNAME=florence-wolfe/.dotfiles/nvim nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=florence-wolfe/.dotfiles/nvim nvim
```

## Plugins

### ai

- [Exafunction/codeium.nvim](https://dotfyle.com/plugins/Exafunction/codeium.nvim)

### bars-and-lines

- [luukvbaal/statuscol.nvim](https://dotfyle.com/plugins/luukvbaal/statuscol.nvim)
- [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim)

### color

- [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
- [winston0410/range-highlight.nvim](https://dotfyle.com/plugins/winston0410/range-highlight.nvim)
- [rasulomaroff/reactive.nvim](https://dotfyle.com/plugins/rasulomaroff/reactive.nvim)

### colorscheme

- [rose-pine/neovim](https://dotfyle.com/plugins/rose-pine/neovim)
- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
- [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
- [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)

### colorscheme-creation

- [echasnovski/mini.colors](https://dotfyle.com/plugins/echasnovski/mini.colors)

### comment

- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
- [danymat/neogen](https://dotfyle.com/plugins/danymat/neogen)
- [echasnovski/mini.comment](https://dotfyle.com/plugins/echasnovski/mini.comment)
- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### dependency-management

- [piersolenski/telescope-import.nvim](https://dotfyle.com/plugins/piersolenski/telescope-import.nvim)

### diagnostics

- [piersolenski/wtf.nvim](https://dotfyle.com/plugins/piersolenski/wtf.nvim)

### editing-support

- [smjonas/live-command.nvim](https://dotfyle.com/plugins/smjonas/live-command.nvim)
- [echasnovski/mini.operators](https://dotfyle.com/plugins/echasnovski/mini.operators)
- [echasnovski/mini.move](https://dotfyle.com/plugins/echasnovski/mini.move)
- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
- [utilyre/sentiment.nvim](https://dotfyle.com/plugins/utilyre/sentiment.nvim)
- [monaqa/dial.nvim](https://dotfyle.com/plugins/monaqa/dial.nvim)
- [gregorias/coerce.nvim](https://dotfyle.com/plugins/gregorias/coerce.nvim)
- [echasnovski/mini.pairs](https://dotfyle.com/plugins/echasnovski/mini.pairs)
- [chrisgrieser/nvim-various-textobjs](https://dotfyle.com/plugins/chrisgrieser/nvim-various-textobjs)
- [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)
- [altermo/ultimate-autopair.nvim](https://dotfyle.com/plugins/altermo/ultimate-autopair.nvim)
- [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
- [Wansmer/treesj](https://dotfyle.com/plugins/Wansmer/treesj)
- [echasnovski/mini.splitjoin](https://dotfyle.com/plugins/echasnovski/mini.splitjoin)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### formatting

- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [tsakirist/telescope-lazy.nvim](https://dotfyle.com/plugins/tsakirist/telescope-lazy.nvim)
- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
- [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)

### git

- [akinsho/git-conflict.nvim](https://dotfyle.com/plugins/akinsho/git-conflict.nvim)
- [NeogitOrg/neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)
- [f-person/git-blame.nvim](https://dotfyle.com/plugins/f-person/git-blame.nvim)
- [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)

### icon

- [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
- [echasnovski/mini.clue](https://dotfyle.com/plugins/echasnovski/mini.clue)

### lsp

- [VidocqH/lsp-lens.nvim](https://dotfyle.com/plugins/VidocqH/lsp-lens.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [hinell/lsp-timeout.nvim](https://dotfyle.com/plugins/hinell/lsp-timeout.nvim)
- [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
- [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [Fildo7525/pretty_hover](https://dotfyle.com/plugins/Fildo7525/pretty_hover)
- [scalameta/nvim-metals](https://dotfyle.com/plugins/scalameta/nvim-metals)
- [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)
- [aznhe21/actions-preview.nvim](https://dotfyle.com/plugins/aznhe21/actions-preview.nvim)
- [mfussenegger/nvim-jdtls](https://dotfyle.com/plugins/mfussenegger/nvim-jdtls)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)
- [jghauser/follow-md-links.nvim](https://dotfyle.com/plugins/jghauser/follow-md-links.nvim)

### marks

- [chentoast/marks.nvim](https://dotfyle.com/plugins/chentoast/marks.nvim)
- [otavioschwanck/arrow.nvim](https://dotfyle.com/plugins/otavioschwanck/arrow.nvim)

### media

- [samodostal/image.nvim](https://dotfyle.com/plugins/samodostal/image.nvim)

### motion

- [echasnovski/mini.bracketed](https://dotfyle.com/plugins/echasnovski/mini.bracketed)
- [chrisgrieser/nvim-spider](https://dotfyle.com/plugins/chrisgrieser/nvim-spider)

### nvim-dev

- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [kkharji/sqlite.lua](https://dotfyle.com/plugins/kkharji/sqlite.lua)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### preconfigured

- [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)

### scrollbar

- [lewis6991/satellite.nvim](https://dotfyle.com/plugins/lewis6991/satellite.nvim)

### search

- [AckslD/muren.nvim](https://dotfyle.com/plugins/AckslD/muren.nvim)

### session

- [folke/persistence.nvim](https://dotfyle.com/plugins/folke/persistence.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### split-and-window

- [nvim-zh/colorful-winsep.nvim](https://dotfyle.com/plugins/nvim-zh/colorful-winsep.nvim)

### startup

- [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [echasnovski/mini.surround](https://dotfyle.com/plugins/echasnovski/mini.surround)
- [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### terminal-integration

- [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
- [m00qek/baleia.nvim](https://dotfyle.com/plugins/m00qek/baleia.nvim)

### utility

- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [sitiom/nvim-numbertoggle](https://dotfyle.com/plugins/sitiom/nvim-numbertoggle)
- [echasnovski/mini.animate](https://dotfyle.com/plugins/echasnovski/mini.animate)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
- [code-biscuits/nvim-biscuits](https://dotfyle.com/plugins/code-biscuits/nvim-biscuits)

### workflow

- [m4xshen/hardtime.nvim](https://dotfyle.com/plugins/m4xshen/hardtime.nvim)

## Language Servers

- astro
- html
- metals

This readme was generated by [Dotfyle](https://dotfyle.com)
