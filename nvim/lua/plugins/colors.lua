return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
      modules = {
        alpha = true,
        cmp = true,
        diagnsotic = {
          enable = true,
        },
        fidget = true,
        gitsigns = true,
        illumination = true,
        leap = {
          enable = true,
          harsh = true,
        },
        lsp_trouble = {
          enable = true,
        },
        mini = true,
        modes = true,
        native_lsp = true,
        navic = true,
        neotree = true,
        notify = true,
        symbol_outline = true,
        telescope = true,
        treesitter = true,
        tsrainbow2 = true,
        whichkey = true,
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    version = false,
    priority = 1000,
    branch = "main",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.sapphire },
          CmpItemAbbrMatchFuzzy = { fg = colors.mauve },
          CmpItemAbbrMatch = { fg = colors.mauve },
        }
      end,
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      term_colors = true,
      integrations = {
        barbecue = {
          dim_dirname = true,
        },
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
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
        navic = {
          enabled = false,
          custom_bg = "NONE",
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
    "rebelot/kanagawa.nvim",
    event = "VeryLazy",
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
