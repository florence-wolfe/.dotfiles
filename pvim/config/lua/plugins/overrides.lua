return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "catppuccin",
      },
    },
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = true,
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        always_show_bufferline = true,
        show_tab_indicators = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
    },
  },
}
