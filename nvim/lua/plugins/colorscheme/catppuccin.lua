return {
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
        alpha = true,
        barbecue = {
          dim_dirname = true,
        },
        dropbar = {
          enabled = true,
          color_mode = true, -- enable color for kind's texts, not just kind's icons
        },
        cmp = true,
        fidget = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        leap = true,
        lsp_trouble = true,
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
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          inlay_hints = {
            background = true,
          },
        },
        navic = {
          enabled = false,
          custom_bg = "NONE",
        },
        overseer = true,
        rainbow_delimiters = true,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow2 = true,
        which_key = true,
      },
    },
  },
}
