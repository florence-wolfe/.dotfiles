local Colors = require("utils.colors-conf")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = Colors.lazyvim,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = Colors.lualine,
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
    keys = {
      {
        "<leader>bl",
        "<cmd>BufferLineCloseLeft<cr>",
        desc = "close all buffers to the left",
      },
      {
        "<leader>br",
        "<cmd>BufferLineCloseRight<cr>",
        desc = "close all buffers to the right",
      },
      {
        "gb",
        "<cmd>BufferLinePick<cr>",
        desc = "pick a buffer",
      },
      {
        "gC",
        "<cmd>BufferLinePickClose<cr>",
        desc = "pick a buffer and close it",
      },
      {
        "<leader>bmn",
        "<cmd>BufferLineMoveNext<cr>",
        desc = "move buffer to next position",
      },
      {
        "<leader>bmp",
        "<cmd>BufferLineMovePrev<cr>",
        desc = "move buffer to previous position",
      },
      {
        "<leader>bmf",
        function()
          require("bufferline").move_to(1)
        end,
        desc = "move buffer to first position",
      },
      {
        "<leader>bml",
        function()
          require("bufferline").move_to(-1)
        end,
        desc = "move buffer to last position",
      },
    },
    ---@type BufferlineConfig
    opts = {
      highlights = Colors.bufferline(),
      --- The options table for configuring bufferline
      ---@type BufferlineOptions
      options = {
        separator_style = "thick",
        always_show_bufferline = true,
        show_tab_indicators = true,
        indicator = {
          style = "underline",
        },
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
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = { neotree = false, [""] = false },
    },
  },
}
