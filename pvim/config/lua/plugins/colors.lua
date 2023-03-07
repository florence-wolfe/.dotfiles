return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    version = false,
    opts = {
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.sapphire },
        }
      end,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        illuminate = true,
        leap = true,
        mason = true,
        mini = true,
        noice = true,
        notify = true,
        neotree = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        ts_rainbow2 = true,
      },
    },
  },
  {
    "shaunsingh/nord.nvim",
    event = "VeryLazy",
  },
  {
    "morhetz/gruvbox",
    event = "VeryLazy",
  },
  {
    "RRethy/nvim-base16",
    event = "VeryLazy",
  },
}
