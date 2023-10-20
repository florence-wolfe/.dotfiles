local utils = require("utils")
return {
  {
    "akinsho/git-conflict.nvim",
    init = function()
      utils.create_keymap_group("<leader>gC", "+conflicts")
    end,
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
        "<leader>gCb",
        "<cmd>GitConflictChooseBoth<cr>",
        desc = "Choose both",
      },
      {
        "<leader>gC0",
        "<cmd>GitConflictChooseNone<cr>",
        desc = "Choose none",
      },
    },
    opts = {
      default_mappings = false,
    },
    config = function(_, opts)
      require("git-conflict").setup(opts)
    end,
  },
}
