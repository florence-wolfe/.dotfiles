local utils = require("utils")
return {
  {
    "folke/which-key.nvim",
    init = function()
      utils.create_keymap_group("<leader>gh", "+hunks")
    end,
    opts = {
      operators = { gc = "Comments", m = "Marks" },
      window = {
        border = "rounded",
      },
    },
  },
}
