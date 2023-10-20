return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>gH",
        "<cmd>DiffviewFileHistory<cr>",
        desc = "DiffviewFileHistory",
      },
    },
  },
}
