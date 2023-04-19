local utils = require("utils")
local colorscheme = require("utils.colorscheme")

return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    init = function()
      utils.create_keymap_group("<leader>t", "+terminal")
    end,
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      auto_scroll = true,
      shade_terminals = false,
      highlights = colorscheme.get("toggleterm"),
    },
    keys = {
      { "<leader>t\\", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Term (float)" },
      { "<leader>t-", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Term (horizontal)" },
      { "<leader>t|", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Term (vertical)" },
    },
  },
}
