local utils = require("utils")
local colorscheme = require("utils.colorscheme")

return {
  {
    "akinsho/bufferline.nvim",
    init = function()
      utils.create_keymap_group("<leader>bm", "+Manage Buffers")
    end,
    keys = {
      {
        "<leader>bmh",
        "<cmd>BufferLineCloseLeft<cr>",
        desc = "close all buffers to the left",
      },
      {
        "<leader>bmr",
        "<cmd>BufferLineCloseRight<cr>",
        desc = "close all buffers to the (r)ight",
      },
      {
        "<leader>bms",
        "<cmd>BufferLinePick<cr>",
        desc = "(s)elect a buffer",
      },
      {
        "<leaderbmc>",
        "<cmd>BufferLinePickClose<cr>",
        desc = "pick a buffer and (c)lose it",
      },
      {
        "<leader>bmn",
        "<cmd>BufferLineMoveNext<cr>",
        desc = "move buffer to (n)ext position",
      },
      {
        "<leader>bmp",
        "<cmd>BufferLineMovePrev<cr>",
        desc = "move buffer to (p)revious position",
      },
      {
        "<leader>bmf",
        function()
          require("bufferline").move_to(1)
        end,
        desc = "move buffer to (f)irst position",
      },
      {
        "<leader>bml",
        function()
          require("bufferline").move_to(-1)
        end,
        desc = "move buffer to (l)ast position",
      },
    },
    ---@type BufferlineConfig
    opts = {
      highlights = colorscheme.get("bufferline"),
      --- The options table for configuring bufferline
      ---@type BufferlineOptions
      options = {
        themable = true,
        separator_style = "thick",
        show_tab_indicators = true,
        indicator = {
          style = "underline",
        },
      },
    },
  },
}
