local Utils = require("utils")
return {
  -- git conflict
  {
    "akinsho/git-conflict.nvim",
    event = "BufReadPre",
    init = function()
      Utils.create_keymap_group("<leader>gC", "+conflicts")
    end,
    opts = {
      default_mappings = false,
    },
    keys = {
      {
        "<leader>gCo",
        "<cmd>GitConflictChooseOurs<cr>",
        desc = "Choose ours",
      },
      {
        "<leader>gCt",
        "<cmd>GitConflictChooseTheirs<cr>",
        desc = "Choose theirs",
      },
      {
        "<leader>gCn",
        "<cmd>GitConflictChooseNone<cr>",
        desc = "Choose none",
      },
      {
        "<leader>gCb",
        "<cmd>GitConflictChooseBoth<cr>",
        desc = "Choose both",
      },
      {
        "<leader>gCl",
        "<cmd>GitConflictListQf<cr>",
        desc = "List all conflicts in quickfix",
      },
      {
        "]x",
        "<cmd>GitConflictNextConflict<cr>",
        desc = "Next conflict",
      },
      {
        "[x",
        "<cmd>GitConflictPrevConflict<cr>",
        desc = "Previous conflict",
      },
    },
  },
}
