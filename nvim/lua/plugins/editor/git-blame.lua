return {
  {
    "f-person/git-blame.nvim",
    opts = {
      enabled = false,
    },
    keys = {
      { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle git blame" },
    },
    config = function(_, opts)
      require("gitblame").setup(opts)
    end,
  },
}
